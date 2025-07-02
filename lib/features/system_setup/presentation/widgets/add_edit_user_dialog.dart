import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/user_management_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class AddEditUserDialog extends ConsumerStatefulWidget {
  final UserEntity? userToEdit;
  const AddEditUserDialog({super.key, this.userToEdit});

  @override
  ConsumerState<AddEditUserDialog> createState() => _AddEditUserDialogState();
}

class _AddEditUserDialogState extends ConsumerState<AddEditUserDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;
  late TextEditingController _nameArController;
  late TextEditingController _nameEnController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    final user = widget.userToEdit;
    _usernameController = TextEditingController(text: user?.username ?? '');
    _nameArController = TextEditingController(text: user?.fullNameAr ?? '');
    _nameEnController = TextEditingController(text: user?.fullNameEn ?? '');
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _isActive = user?.isActive ?? true;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _nameArController.dispose();
    _nameEnController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(userManagementProvider.notifier);
      final user = UserEntity(
        userId: widget.userToEdit?.userId ?? 0,
        username: _usernameController.text,
        fullNameAr: _nameArController.text,
        fullNameEn: _nameEnController.text,
        isActive: _isActive,
      );

      final password = _passwordController.text;

      if (widget.userToEdit == null) {
        notifier.addUser(user, password);
      } else {
        notifier.updateUser(user, newPassword: password.isNotEmpty ? password : null);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isEditing = widget.userToEdit != null;

    return AlertDialog(
      title: Text(isEditing ? l10n.editUser : l10n.addNewUser),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: l10n.username),
                validator: (v) => v!.isEmpty ? l10n.usernameRequired : null,
              ),
              TextFormField(
                controller: _nameEnController,
                decoration: InputDecoration(labelText: l10n.fullNameEn),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _nameArController,
                decoration: InputDecoration(labelText: l10n.fullNameAr),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: l10n.password, hintText: isEditing ? 'Leave blank to keep unchanged' : null),
                obscureText: true,
                validator: (v) {
                  if (!isEditing && (v == null || v.isEmpty)) {
                    return l10n.passwordRequired;
                  }
                  if (v != null && v.isNotEmpty && v.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  if (v != _confirmPasswordController.text) {
                     return l10n.passwordMismatch;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: l10n.confirmPassword),
                obscureText: true,
                 validator: (v) {
                  if (v != _passwordController.text) {
                     return l10n.passwordMismatch;
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: Text(l10n.status),
                subtitle: Text(_isActive ? l10n.userIsActive : l10n.userIsInactive),
                value: _isActive,
                onChanged: (val) => setState(() => _isActive = val),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
        ElevatedButton(onPressed: _onSave, child: Text(l10n.save)),
      ],
    );
  }
}
