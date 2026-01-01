import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/branch_groups_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/branches_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/company_info_providers.dart';

class AddEditBranchDialog extends ConsumerStatefulWidget {
  final BranchEntity? branch;

  const AddEditBranchDialog({super.key, this.branch});

  @override
  ConsumerState<AddEditBranchDialog> createState() => _AddEditBranchDialogState();
}

class _AddEditBranchDialogState extends ConsumerState<AddEditBranchDialog> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  late TextEditingController _branchCodeController;
  late TextEditingController _nameArController;
  late TextEditingController _nameEnController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _remarksController;
  late bool _branchStatus;

  int? _selectedCompanyId;
  int? _selectedBranchGroupId;
  Uint8List? _logo;

  @override
  void initState() {
    super.initState();
    final branch = widget.branch;
    _branchCodeController = TextEditingController(text: branch?.branchCode ?? '');
    _nameArController = TextEditingController(text: branch?.nameAr ?? '');
    _nameEnController = TextEditingController(text: branch?.nameEn ?? '');
    _addressController = TextEditingController(text: branch?.address ?? '');
    _phoneController = TextEditingController(text: branch?.phone ?? '');
    _remarksController = TextEditingController(text: branch?.remarks ?? '');
    _branchStatus = branch?.branchStatus ?? true;
    _selectedCompanyId = branch?.companyId;
    _selectedBranchGroupId = branch?.branchGroupId;
    _logo = branch?.logo;
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

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _logo = bytes;
      });
    }
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final t = Translations.of(context);

      if (_selectedCompanyId == null) {
        // Handle case where no company is selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.dashboard.inventory.master.setup.branch.selectCompanyPrompt), backgroundColor: Theme.of(context).colorScheme.error),
        );
        return;
      }

      final branchEntity = BranchEntity(
        id: widget.branch?.id,
        branchCode: _branchCodeController.text,
        nameAr: _nameArController.text,
        nameEn: _nameEnController.text,
        companyId: _selectedCompanyId!,
        branchGroupId: _selectedBranchGroupId,
        address: _addressController.text,
        phone: _phoneController.text,
        defaultWarehouseId: null, // Warehouse not implemented yet
        branchStatus: _branchStatus,
        logo: _logo,
        remarks: _remarksController.text,
      );

      final notifier = ref.read(branchesProvider.notifier);
      if (widget.branch == null) {
        await notifier.addBranch(branchEntity);
      } else {
        await notifier.updateBranch(branchEntity);
      }

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final companiesAsyncValue = ref.watch(companiesProvider);
    final branchGroupsAsyncValue = ref.watch(branchGroupsProvider);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return AlertDialog(
      title: Text(widget.branch == null ? t.dashboard.inventory.master.setup.branch.addNew : t.dashboard.inventory.master.setup.branch.editTitle),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _branchCodeController,
                decoration: InputDecoration(labelText: t.dashboard.inventory.master.setup.branch.code),
                validator: (value) =>
                    (value == null || value.isEmpty) ? t.common.requiredField : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameEnController,
                decoration: InputDecoration(labelText: t.dashboard.inventory.master.setup.branch.nameEn),
                validator: (value) =>
                    (value == null || value.isEmpty) ? t.common.requiredField : null,
              ),
               const SizedBox(height: 8),
              TextFormField(
                controller: _nameArController,
                decoration: InputDecoration(labelText: t.dashboard.inventory.master.setup.branch.nameAr),
                validator: (value) =>
                    (value == null || value.isEmpty) ? t.common.requiredField : null,
              ),
               const SizedBox(height: 8),
              companiesAsyncValue.when(
                data: (companies) => DropdownButtonFormField<int>(
                  value: _selectedCompanyId,
                  decoration: InputDecoration(labelText: t.dashboard.inventory.master.setup.company.title),
                  items: companies.map((CompanyEntity company) {
                    return DropdownMenuItem<int>(
                      value: company.id,
                      child: Text(isRtl ? company.nameAr : company.nameEn),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _selectedCompanyId = value),
                  validator: (value) =>
                      (value == null) ? t.common.requiredField : null,
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Text('${t.common.error}: $error'),
              ),
               const SizedBox(height: 8),
              branchGroupsAsyncValue.when(
                data: (groups) => DropdownButtonFormField<int>(
                  value:_selectedBranchGroupId,
                  decoration: InputDecoration(labelText: t.dashboard.inventory.master.setup.branch.group),
                  items: groups
                    .map((group) => DropdownMenuItem<int>(
                        value: group.id, child: Text(isRtl ? group.nameAr : group.nameEn)))
                    .toList(),
                  onChanged: (value) =>
                      setState(() => _selectedBranchGroupId = value),
                ),
                 loading: () => const Center(child: CircularProgressIndicator()),
                 error: (error, stack) => Text('${t.common.error}: $error'),
              ),
               const SizedBox(height: 8),
              Tooltip(
                message: t.dashboard.inventory.master.setup.branch.warehouseTooltip,
                child: DropdownButtonFormField<int>(
                  value: null,
                  decoration: InputDecoration(
                    labelText: t.dashboard.inventory.master.setup.branch.defaultWarehouse,
                    enabled: false, // Disabled
                  ),
                  items: const [],
                  onChanged: null,
                ),
              ),
               const SizedBox(height: 8),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: t.common.address),
              ),
               const SizedBox(height: 8),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: t.common.phone),
                keyboardType: TextInputType.phone,
              ),
               const SizedBox(height: 8),
              SwitchListTile(
                title: Text(t.common.active),
                value: _branchStatus,
                onChanged: (value) {
                  setState(() {
                    _branchStatus = value;
                  });
                },
              ),
               const SizedBox(height: 8),
              Row(
                children: [
                  Text(t.dashboard.inventory.master.setup.company.logo),
                  const Spacer(),
                  if (_logo != null) Image.memory(_logo!, height: 40, width: 40),
                  IconButton(
                      icon: const Icon(Icons.upload_file),
                      onPressed: _pickImage),
                ],
              ),
               const SizedBox(height: 8),
              TextFormField(
                controller: _remarksController,
                decoration: InputDecoration(labelText: t.common.remarks),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(t.common.cancel),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text(t.common.save),
        ),
      ],
    );
  }
}
