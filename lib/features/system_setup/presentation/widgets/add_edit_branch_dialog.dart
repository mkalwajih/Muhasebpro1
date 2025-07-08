import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
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

  // TODO: Replace with actual data from providers
  final List<Map<String, dynamic>> _dummyBranchGroups = [
    {'id': 1, 'name': 'Group 1'},
    {'id': 2, 'name': 'Group 2'},
  ];
  final List<Map<String, dynamic>> _warehouses = [
    {'id': 1, 'name': 'WH 1'},
    {'id': 2, 'name': 'WH 2'}
  ];

  int? _selectedCompanyId;
  int? _selectedBranchGroupId;
  int? _selectedWarehouseId; 
  Uint8List? _logo;

  @override
  void initState() {
    super.initState();
    final branch = widget.branch;
    if (branch != null) {
      _branchCodeController = TextEditingController(text: branch.branchCode);
      _nameArController = TextEditingController(text: branch.nameAr);
      _nameEnController = TextEditingController(text: branch.nameEn);
      _addressController = TextEditingController(text: branch.address);
      _phoneController = TextEditingController(text: branch.phone);
      _remarksController = TextEditingController(text: branch.remarks);
      _branchStatus = branch.branchStatus;
      _selectedCompanyId = branch.companyId; // Company ID is now int
      _selectedBranchGroupId = branch.branchGroupId;
      _selectedWarehouseId = int.tryParse(branch.defaultWarehouseId ?? '');
      _logo = branch.logo;
    } else {
      _branchCodeController = TextEditingController();
      _nameArController = TextEditingController();
      _nameEnController = TextEditingController();
      _addressController = TextEditingController();
      _phoneController = TextEditingController();
      _remarksController = TextEditingController();
      _branchStatus = true;
    }
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

      final branchEntity = BranchEntity(
        id: widget.branch?.id,
        branchCode: _branchCodeController.text,
        nameAr: _nameArController.text,
        nameEn: _nameEnController.text,
        companyId: _selectedCompanyId!,
        branchGroupId: _selectedBranchGroupId,
        address: _addressController.text,
        phone: _phoneController.text,
        defaultWarehouseId: _selectedWarehouseId?.toString(),
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
    final l10n = AppLocalizations.of(context)!;
    final companiesAsyncValue = ref.watch(companiesListProvider);

    return AlertDialog(
      title: Text(widget.branch == null ? l10n.addNewBranch : l10n.editBranch),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _branchCodeController,
                decoration: InputDecoration(labelText: l10n.branchCode),
                validator: (value) =>
                    (value == null || value.isEmpty) ? l10n.requiredField : null,
              ),
              TextFormField(
                controller: _nameEnController,
                decoration: InputDecoration(labelText: l10n.branchNameEn),
                validator: (value) =>
                    (value == null || value.isEmpty) ? l10n.requiredField : null,
              ),
              TextFormField(
                controller: _nameArController,
                decoration: InputDecoration(labelText: l10n.branchNameAr),
                validator: (value) =>
                    (value == null || value.isEmpty) ? l10n.requiredField : null,
              ),
              companiesAsyncValue.when(
                data: (companies) => DropdownButtonFormField<int>(
                  value: _selectedCompanyId,
                  decoration: InputDecoration(labelText: l10n.companyNameEn ),
                  items: companies.map((CompanyEntity company) {
                    return DropdownMenuItem<int>(
                      value: company.id,
                      child: Text(company.nameEn),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _selectedCompanyId = value),
                  validator: (value) =>
                      (value == null) ? l10n.requiredField : null,
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Text('${l10n.error}: $error'),
              ),
              DropdownButtonFormField<int>(
                value:_selectedBranchGroupId,
                decoration: InputDecoration(labelText: l10n.branchGroup),
                items: _dummyBranchGroups
                    .map((group) => DropdownMenuItem<int>(
                        value: group['id'], child: Text(group['name'] as String)))
                    .toList(),
                onChanged: (value) =>
                    setState(() => _selectedBranchGroupId = value),
              ),
              DropdownButtonFormField<int>(
                value: _selectedWarehouseId,
                decoration: InputDecoration(labelText: l10n.defaultWarehouse),
                items: _warehouses
                    .map((c) =>
                        DropdownMenuItem<int>(value: c['id'], child: Text(c['name'] as String)))
                    .toList(),
                onChanged: (value) => setState(() => _selectedWarehouseId = value),
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: l10n.address),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: l10n.phone),
                keyboardType: TextInputType.phone,
              ),
              SwitchListTile(
                title: Text(l10n.active),
                value: _branchStatus,
                onChanged: (value) {
                  setState(() {
                    _branchStatus = value;
                  });
                },
              ),
              Row(
                children: [
                  Text(l10n.logo),
                  const Spacer(),
                  if (_logo != null) Image.memory(_logo!, height: 40, width: 40),
                  IconButton(
                      icon: const Icon(Icons.upload_file),
                      onPressed: _pickImage),
                ],
              ),
              TextFormField(
                controller: _remarksController,
                decoration: InputDecoration(labelText: l10n.remarks),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text(l10n.save),
        ),
      ],
    );
  }
}
