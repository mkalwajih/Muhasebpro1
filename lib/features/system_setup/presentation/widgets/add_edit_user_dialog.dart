import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/branches_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/role_management_providers.dart';
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
  bool _isBiometricEnabled = false;
  bool _isDeviceLinked = false;
  int? _selectedBranchId;
  Set<int> _selectedRoleIds = {};

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
    _isBiometricEnabled = user?.isBiometricEnabled ?? false;
    _isDeviceLinked = user?.isDeviceLinked ?? false;
    _selectedBranchId = user?.branchId;
    _selectedRoleIds = user?.roles.map((r) => r.id).toSet() ?? {};
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

  void _onSave(List<RoleEntity> allRoles) {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(userManagementProvider.notifier);
      final users = ref.read(userManagementProvider).value ?? [];
      final l10n = AppLocalizations.of(context)!;

      final isDuplicateUsername = users.any((user) => 
          user.username.toLowerCase() == _usernameController.text.toLowerCase() && 
          user.userId != widget.userToEdit?.userId);

      if (isDuplicateUsername) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.usernameExists), backgroundColor: Theme.of(context).colorScheme.error),
        );
        return;
      }

      final selectedRoles = allRoles.where((role) => _selectedRoleIds.contains(role.id)).toList();

      final user = UserEntity(
        userId: widget.userToEdit?.userId ?? 0,
        username: _usernameController.text,
        fullNameAr: _nameArController.text,
        fullNameEn: _nameEnController.text,
        isActive: _isActive,
        branchId: _selectedBranchId,
        isBiometricEnabled: _isBiometricEnabled,
        isDeviceLinked: _isDeviceLinked,
        roles: selectedRoles,
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
    final rolesAsync = ref.watch(roleManagementProvider);
    final branchesAsync = ref.watch(branchesProvider);

    return AlertDialog(
      title: Text(isEditing ? l10n.editUser : l10n.addNewUser),
      content: rolesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Text('${l10n.error}: $err'),
        data: (allRoles) => Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(controller: _usernameController, decoration: InputDecoration(labelText: l10n.username), validator: (v) => v!.isEmpty ? l10n.usernameRequired : null),
                const SizedBox(height: 8),
                TextFormField(controller: _nameEnController, decoration: InputDecoration(labelText: l10n.fullNameEn), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                const SizedBox(height: 8),
                TextFormField(controller: _nameArController, decoration: InputDecoration(labelText: l10n.fullNameAr), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                const SizedBox(height: 8),
                TextFormField(controller: _passwordController, decoration: InputDecoration(labelText: l10n.password, hintText: isEditing ? l10n.leaveBlankToKeepUnchanged : null), obscureText: true, validator: (v) {
                  if (!isEditing && (v == null || v.isEmpty)) return l10n.passwordRequired;
                  if (v != null && v.isNotEmpty) {
                    if (v.length < 6) return l10n.passwordLengthError;
                    if (!v.contains(RegExp(r'[0-9]'))) return l10n.passwordNumberError;
                  }
                  if (v != _confirmPasswordController.text) return l10n.passwordMismatch;
                  return null;
                }),
                const SizedBox(height: 8),
                TextFormField(controller: _confirmPasswordController, decoration: InputDecoration(labelText: l10n.confirmPassword), obscureText: true, validator: (v) {
                  if (v != _passwordController.text) return l10n.passwordMismatch;
                  return null;
                }),
                const SizedBox(height: 8),
                branchesAsync.when(
                  data: (branches) => DropdownButtonFormField<int>(
                    value: _selectedBranchId,
                    decoration: InputDecoration(labelText: l10n.branch),
                    items: branches.map((branch) => DropdownMenuItem(value: branch.id, child: Text(l10n.localeName == 'ar' ? branch.nameAr : branch.nameEn))).toList(),
                    onChanged: (val) => setState(() => _selectedBranchId = val),
                  ),
                  loading: () => const SizedBox(),
                  error: (e, st) => Text('${l10n.error}: $e'),
                ),
                const Divider(height: 24),
                SwitchListTile(title: Text(l10n.status), subtitle: Text(_isActive ? l10n.userIsActive : l10n.userIsInactive), value: _isActive, onChanged: (val) => setState(() => _isActive = val)),
                SwitchListTile(title: Text(l10n.enableBiometric), value: _isBiometricEnabled, onChanged: (val) => setState(() => _isBiometricEnabled = val)),
                SwitchListTile(title: Text(l10n.linkToDevice), value: _isDeviceLinked, onChanged: (val) => setState(() => _isDeviceLinked = val)),
                const Divider(height: 24),
                Text(l10n.roleManagement, style: Theme.of(context).textTheme.titleMedium),
                ...allRoles.map((role) {
                  return CheckboxListTile(
                    title: Text(l10n.localeName == 'ar' ? role.nameAr : role.nameEn),
                    value: _selectedRoleIds.contains(role.id),
                    onChanged: (bool? selected) {
                      setState(() {
                        if (selected == true) {
                          _selectedRoleIds.add(role.id);
                        } else {
                          _selectedRoleIds.remove(role.id);
                        }
                      });
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
        ElevatedButton(onPressed: () => rolesAsync.whenData((roles) => _onSave(roles)), child: Text(l10n.save)),
      ],
    );
  }
}
