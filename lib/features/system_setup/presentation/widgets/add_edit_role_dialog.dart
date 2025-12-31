import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/role_management_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class AddEditRoleDialog extends ConsumerStatefulWidget {
  final RoleEntity? roleToEdit;
  const AddEditRoleDialog({super.key, this.roleToEdit});

  @override
  ConsumerState<AddEditRoleDialog> createState() => _AddEditRoleDialogState();
}

class _AddEditRoleDialogState extends ConsumerState<AddEditRoleDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameArController;
  late TextEditingController _nameEnController;
  late TextEditingController _descriptionController;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    final role = widget.roleToEdit;
    _nameArController = TextEditingController(text: role?.nameAr ?? '');
    _nameEnController = TextEditingController(text: role?.nameEn ?? '');
    _descriptionController = TextEditingController(text: role?.description ?? '');
    _isActive = role?.isActive ?? true;
  }

  @override
  void dispose() {
    _nameArController.dispose();
    _nameEnController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(roleManagementProvider.notifier);
      final role = RoleEntity(
        id: widget.roleToEdit?.id ?? 0,
        nameAr: _nameArController.text,
        nameEn: _nameEnController.text,
        description: _descriptionController.text,
        isActive: _isActive,
      );

      if (widget.roleToEdit == null) {
        notifier.addRole(role);
      } else {
        notifier.updateRole(role);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);

    return AlertDialog(
      title: Text(widget.roleToEdit == null ? l10n.addNewRole : l10n.editRole),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameEnController,
                decoration: InputDecoration(labelText: l10n.roleNameEn),
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameArController,
                decoration: InputDecoration(labelText: l10n.roleNameAr),
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: l10n.description),
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                title: Text(l10n.status),
                subtitle: Text(_isActive ? l10n.userIsActive : l10n.userIsInactive),
                value: _isActive,
                onChanged: (val) => setState(() => _isActive = val),
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
        ElevatedButton(onPressed: _onSave, child: Text(l10n.save)),
      ],
    );
  }
}
