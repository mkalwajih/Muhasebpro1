import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/branch_entity.dart';
import '../providers/branches_providers.dart';

class AddEditBranchDialog extends ConsumerStatefulWidget {
  final BranchEntity? branch;

  const AddEditBranchDialog({super.key, this.branch});

  @override
  ConsumerState<AddEditBranchDialog> createState() => _AddEditBranchDialogState();
}

class _AddEditBranchDialogState extends ConsumerState<AddEditBranchDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _branchCodeController;
  late TextEditingController _nameArController;
  late TextEditingController _nameEnController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _remarksController;
  late bool _branchStatus;

  // These would typically be populated from other providers
  int _companyId = 1; // Placeholder
  String? _branchGroup;
  String? _defaultWarehouseId;
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
      _companyId = branch.companyId;
      _branchGroup = branch.branchGroup;
      _defaultWarehouseId = branch.defaultWarehouseId;
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

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final branchEntity = BranchEntity(
        branchCode: _branchCodeController.text,
        nameAr: _nameArController.text,
        nameEn: _nameEnController.text,
        companyId: _companyId,
        branchGroup: _branchGroup,
        address: _addressController.text,
        phone: _phoneController.text,
        defaultWarehouseId: _defaultWarehouseId,
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
    return AlertDialog(
      title: Text(widget.branch == null ? 'Add Branch' : 'Edit Branch'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _branchCodeController,
                decoration: const InputDecoration(labelText: 'Branch Code*'),
                validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
              ),
              TextFormField(
                controller: _nameEnController,
                decoration: const InputDecoration(labelText: 'Name (English)*'),
                 validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
              ),
              TextFormField(
                controller: _nameArController,
                decoration: const InputDecoration(labelText: 'Name (Arabic)*'),
                 validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
               SwitchListTile(
                title: const Text('Active'),
                value: _branchStatus,
                onChanged: (value) {
                  setState(() {
                    _branchStatus = value;
                  });
                },
              ),
              TextFormField(
                controller: _remarksController,
                decoration: const InputDecoration(labelText: 'Remarks'),
              ),
              // TODO: Add Dropdowns for Company, Branch Group, Warehouse
              // TODO: Add Image picker for Logo
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
