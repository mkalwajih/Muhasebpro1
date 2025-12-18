import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/role_management_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class RolePermissionsScreen extends ConsumerStatefulWidget {
  final RoleEntity role;
  const RolePermissionsScreen({super.key, required this.role});

  @override
  ConsumerState<RolePermissionsScreen> createState() => _RolePermissionsScreenState();
}

class _RolePermissionsScreenState extends ConsumerState<RolePermissionsScreen> {
  late Set<AppPermission> _selectedPermissions;

  @override
  void initState() {
    super.initState();
    _selectedPermissions = widget.role.permissions.toSet();
  }

  void _onSave() {
    ref
        .read(roleManagementProvider.notifier)
        .updatePermissions(widget.role.id, _selectedPermissions.toList());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const allPermissions = AppPermission.values;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.localeName == 'ar' ? widget.role.nameAr : widget.role.nameEn),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _onSave,
            tooltip: l10n.save,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: allPermissions.length,
        itemBuilder: (context, index) {
          final permission = allPermissions[index];
          return CheckboxListTile(
            title: Text(permission.name),
            initialValue: _selectedPermissions.contains(permission),
            onChanged: (selected) {
              setState(() {
                if (selected == true) {
                  _selectedPermissions.add(permission);
                } else {
                  _selectedPermissions.remove(permission);
                }
              });
            },
          );
        },
      ),
    );
  }
}
