import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/user_management_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/add_edit_user_dialog.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class UserManagementScreen extends ConsumerWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userManagementProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.userManagement),
      ),
      body: usersAsync.when(
        data: (users) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.username),
                subtitle: Text(user.fullNameEn),
                trailing: Chip(
                  label: Text(user.isActive ? l10n.userIsActive : l10n.userIsInactive),
                  backgroundColor: user.isActive ? Colors.green.shade100 : Colors.red.shade100,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AddEditUserDialog(userToEdit: user),
                  );
                },
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
            builder: (_) => const AddEditUserDialog(),
          );
        },
        tooltip: l10n.addNewUser,
        child: const Icon(Icons.add),
      ),
    );
  }
}
