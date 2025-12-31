import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_group_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/branch_groups_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/branches_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/company_info_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/shared/utils/validation_utils.dart';

class BranchesScreen extends ConsumerStatefulWidget {
  const BranchesScreen({super.key});

  @override
  ConsumerState<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends ConsumerState<BranchesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  bool _isLoading = false;

  BranchEntity? _selectedBranch;

  late final TextEditingController _branchCodeController;
  late final TextEditingController _nameArController;
  late final TextEditingController _nameEnController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneController;
  late final TextEditingController _remarksController;

  int? _companyId;
  int? _branchGroupId;
  String? _defaultWarehouseId;
  bool _branchStatus = true;
  Uint8List? _logo;

  @override
  void initState() {
    super.initState();
    _branchCodeController = TextEditingController();
    _nameArController = TextEditingController();
    _nameEnController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    _remarksController = TextEditingController();
  }

  @override
  void dispose() {
    _branchCodeController.dispose();
    _nameArController.dispose();
    _nameEnController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  void _selectBranch(BranchEntity? branch) {
    setState(() {
      _selectedBranch = branch;
      _updateControllers(branch);
    });
  }

  void _updateControllers(BranchEntity? branch) {
    if (branch != null) {
      _branchCodeController.text = branch.branchCode;
      _nameArController.text = branch.nameAr;
      _nameEnController.text = branch.nameEn;
      _addressController.text = branch.address ?? '';
      _phoneController.text = branch.phone ?? '';
      _remarksController.text = branch.remarks ?? '';
      setState(() {
        _companyId = branch.companyId;
        _branchGroupId = branch.branchGroupId;
        _defaultWarehouseId = branch.defaultWarehouseId;
        _branchStatus = branch.branchStatus;
        _logo = branch.logo;
      });
    } else {
      _clearForm();
    }
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    _branchCodeController.clear();
    _nameArController.clear();
    _nameEnController.clear();
    _addressController.clear();
    _phoneController.clear();
    _remarksController.clear();
    setState(() {
      _selectedBranch = null;
      _companyId = null;
      _branchGroupId = null;
      _defaultWarehouseId = null;
      _branchStatus = true;
      _logo = null;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxWidth: 512);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _logo = bytes;
      });
    }
  }

  Future<void> _onSave(AppLocalizations l10n) async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        final branchToSave = BranchEntity(
          id: _selectedBranch?.id,
          branchCode: _branchCodeController.text,
          nameAr: _nameArController.text,
          nameEn: _nameEnController.text,
          companyId: _companyId!,
          branchGroupId: _branchGroupId,
          address: _addressController.text,
          phone: _phoneController.text,
          defaultWarehouseId: _defaultWarehouseId,
          branchStatus: _branchStatus,
          logo: _logo,
          remarks: _remarksController.text,
        );

        final result = _selectedBranch == null
            ? await ref.read(branchesProvider.notifier).addBranch(branchToSave)
            : await ref.read(branchesProvider.notifier).updateBranch(branchToSave);

        result.fold(
          (failure) => _showErrorSnackbar(l10n, failure.properties.first as String? ?? l10n.saveFailed),
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.saveSuccess), backgroundColor: Colors.green));
            _clearForm();
          },
        );
      } catch (e) {
        _showErrorSnackbar(l10n, '${l10n.saveFailed}: ${e.toString()}');
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }


  Future<void> _onDelete(AppLocalizations l10n, BranchEntity branch) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmDeletion),
        content: Text(l10n.confirmDeleteMessage),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => _isLoading = true);
      try {
        final result = await ref.read(branchesProvider.notifier).deleteBranch(branch.id!);
        result.fold(
          (failure) => _showErrorSnackbar(l10n, failure.properties.first as String? ?? l10n.deleteFailed),
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.branchDeletedSuccessfully(l10n.localeName == 'ar' ? branch.nameAr : branch.nameEn)), backgroundColor: Colors.green));
            _clearForm();
          },
        );
      } catch (e) {
        _showErrorSnackbar(l10n, '${l10n.deleteFailed}: ${e.toString()}');
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  void _showErrorSnackbar(AppLocalizations l10n, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Theme.of(context).colorScheme.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final branchesAsync = ref.watch(branchesProvider);
    final companiesAsync = ref.watch(companiesProvider);
    final branchGroupsAsync = ref.watch(branchGroupsProvider);

    ref.listen<AsyncValue<List<BranchEntity>>>(branchesProvider, (_, next) {
      next.whenData((branches) {
        final selectedExists = _selectedBranch != null && branches.any((b) => b.id == _selectedBranch!.id);

        if (!selectedExists) {
           _selectBranch(branches.isNotEmpty ? branches.first : null);
        } else {
             final updatedBranch = branches.firstWhere((b) => b.id == _selectedBranch!.id);
              if(updatedBranch != _selectedBranch) {
                 _updateControllers(updatedBranch);
              }
        }

        if (branches.isEmpty) {
          _clearForm();
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.branches),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.add),
            tooltip: l10n.addNewBranch,
            onPressed: _clearForm,
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: branchesAsync.when(
              data: (branches) => ListView.builder(
                itemCount: branches.length,
                itemBuilder: (context, index) {
                  final branch = branches[index];
                  return ListTile(
                    title: Text(l10n.localeName == 'ar' ? branch.nameAr : branch.nameEn),
                    subtitle: Text(branch.branchCode),
                    selected: _selectedBranch?.id == branch.id,
                    onTap: () => _selectBranch(branch),
                    trailing: IconButton(
                      icon: Icon(Iconsax.trash, color: Theme.of(context).colorScheme.error),
                      tooltip: l10n.delete,
                      onPressed: () => _onDelete(l10n, branch),
                    ),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            flex: 2,
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  if (_selectedBranch == null && _logo == null)
                    Center(child: Text(l10n.selectOrCreateBranch))
                  else
                  Column(
                    children: [
                         CircleAvatar(
                          radius: 40,
                          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                          backgroundImage: _logo != null ? MemoryImage(_logo!) : null,
                          child: _logo == null ? const Icon(Iconsax.shop, size: 40) : null,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: _pickImage,
                          icon: const Icon(Iconsax.image),
                          label: Text(l10n.uploadLogo),
                        ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _branchCodeController,
                    decoration: InputDecoration(labelText: l10n.branchCode),
                    validator: (value) {
                      if (value == null || value.isEmpty) return l10n.requiredField;
                      final isDuplicate = ref.read(branchesProvider).value?.any((branch) => branch.branchCode == value && branch.id != _selectedBranch?.id) ?? false;
                      if (isDuplicate) return l10n.branchCodeExists;
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameEnController,
                    decoration: InputDecoration(labelText: l10n.branchNameEn),
                     validator: (v) => v!.isEmpty ? l10n.requiredField : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameArController,
                    decoration: InputDecoration(labelText: l10n.branchNameAr),
                     validator: (v) => v!.isEmpty ? l10n.requiredField : null,
                  ),
                  const SizedBox(height: 16),
                  companiesAsync.when(
                    data: (companies) => DropdownButtonFormField<int>(
                      decoration: InputDecoration(labelText: l10n.company),
                      items: companies.map((CompanyEntity company) {
                        return DropdownMenuItem<int>(
                          value: company.id,
                          child: Text(l10n.localeName == 'ar' ? company.nameAr : company.nameEn),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => _companyId = value),
                      validator: (v) => v == null ? l10n.requiredField : null,
                    ),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, st) => Text('Failed to load companies: $e'),
                  ),
                  const SizedBox(height: 16),
                  branchGroupsAsync.when(
                    data: (branchGroups) => DropdownButtonFormField<int>(
                      decoration: InputDecoration(labelText: l10n.branchGroup),
                      items: branchGroups.map((BranchGroupEntity group) {
                        return DropdownMenuItem<int>(
                          value: group.id,
                          child: Text(l10n.localeName == 'ar' ? group.nameAr : group.nameEn),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => _branchGroupId = value),
                    ),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, st) => Text('Failed to load branch groups: $e'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(labelText: l10n.address),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: l10n.phone),
                     validator: (value) => validatePhoneNumber(value, l10n),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _remarksController,
                    decoration: InputDecoration(labelText: l10n.remarks),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: Text(l10n.branchStatus),
                    value: _branchStatus,
                    onChanged: (value) => setState(() => _branchStatus = value),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => _updateControllers(_selectedBranch),
                        child: Text(l10n.reset),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _isLoading ? null : () => _onSave(l10n),
                        child: _isLoading ? const CircularProgressIndicator(strokeWidth: 2) : Text(l10n.save),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
