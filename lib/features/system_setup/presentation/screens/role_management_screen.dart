import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/role_management_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/add_edit_role_dialog.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class RoleManagementScreen extends ConsumerWidget {
  const RoleManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rolesAsync = ref.watch(roleManagementProvider);
    final l10n = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.roleManagement),
      ),
      body: rolesAsync.when(
        data: (roles) {
          return ListView.builder(
            itemCount: roles.length,
            itemBuilder: (context, index) {
              final role = roles[index];
              return ListTile(
                title: Text(l10n.localeName == 'ar' ? role.nameAr : role.nameEn),
                subtitle: Text(role.description ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Iconsax.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AddEditRoleDialog(roleToEdit: role),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Iconsax.security_safe),
                      tooltip: 'Manage Permissions',
                      onPressed: () {
                        context.go('/dashboard/system_setup/role_permissions', extra: role);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const AddEditRoleDialog(),
          );
        },
        tooltip: l10n.addNewRole,
        child: const Icon(Icons.add),
      ),
    );
  }
}
