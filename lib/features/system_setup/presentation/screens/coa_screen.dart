import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/account_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/coa_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/add_edit_account_dialog.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class CoaScreen extends ConsumerWidget {
  const CoaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coaAsync = ref.watch(coaProvider);
    final l10n = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.chartOfAccounts),
      ),
      body: coaAsync.when(
        data: (accounts) {
          if (accounts.isEmpty) {
            return const Center(child: Text('No accounts found.'));
          }
          List<AccountEntity> flattenedList = [];
          void flattenTree(List<AccountEntity> accs) {
            for (var acc in accs) {
              flattenedList.add(acc);
              flattenTree(acc.children);
            }
          }
          flattenTree(accounts);
          
          return ListView.builder(
            itemCount: flattenedList.length,
            itemBuilder: (context, index) {
              final account = flattenedList[index];
              return ListTile(
                contentPadding: EdgeInsets.only(left: 16.0 + (account.level * 16.0), right: 16.0),
                title: Text(account.getLocalizedName(l10n.localeName)),
                subtitle: Text(account.accountCode),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AddEditAccountDialog(accountToEdit: account),
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
            builder: (_) => const AddEditAccountDialog(),
          );
        },
        tooltip: l10n.addNewAccount,
        child: const Icon(Icons.add),
      ),
    );
  }
}
