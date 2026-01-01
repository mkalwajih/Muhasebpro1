import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/branches_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/user_management_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/add_edit_user_dialog.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';

class UserManagementScreen extends ConsumerWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userManagementProvider);
    final branchesAsync = ref.watch(branchesProvider);
    final l10n = Translations.of(context);
    final locale = TranslationProvider.of(context).flutterLocale.languageCode;

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
              final branch = branchesAsync.asData?.value.firstWhere(
                (b) => b.id == user.branchId,
                orElse: () => const BranchEntity(
                  id: -1,
                  branchCode: 'N/A',
                  nameAr: 'غير متوفر',
                  nameEn: 'N/A',
                  companyId: 0,
                  branchStatus: false,
                ),
              );
              
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text(user.username),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(locale == 'ar' ? user.fullNameAr : user.fullNameEn),
                       if (branch != null && branch.id != -1)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            '${l10n.branch}: ${locale == 'ar' ? branch.nameAr : branch.nameEn}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      if (user.roles.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Wrap(
                            spacing: 4.0,
                            runSpacing: 4.0,
                            children: user.roles
                                .map((role) => Chip(
                                      label: Text(locale == 'ar' ? role.nameAr : role.nameEn),
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                    ))
                                .toList(),
                          ),
                        ),
                    ],
                  ),
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
            builder: (_) => const AddEditUserDialog(),
          );
        },
        tooltip: l10n.addNewUser,
        child: const Icon(Icons.add),
      ),
    );
  }
}
