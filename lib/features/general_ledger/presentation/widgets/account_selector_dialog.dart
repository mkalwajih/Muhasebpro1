import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/presentation/widgets/custom_search_field.dart';
import '../../../../shared/presentation/widgets/loading_widget.dart';
import '../../../system_setup/domain/entities/account_entity.dart';
import '../../../system_setup/presentation/providers/coa_providers.dart';

class AccountSelectorDialog extends ConsumerStatefulWidget {
  final String? selectedAccountId;
  final Function(AccountEntity) onAccountSelected;

  const AccountSelectorDialog({
    super.key,
    this.selectedAccountId,
    required this.onAccountSelected,
  });

  @override
  ConsumerState<AccountSelectorDialog> createState() => _AccountSelectorDialogState();
}

class _AccountSelectorDialogState extends ConsumerState<AccountSelectorDialog> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final accountsAsync = ref.watch(coaProvider);

    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Text(
                  l10n.selectAccount,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Search Field
            CustomSearchField(
              value: _searchQuery,
              hintText: l10n.searchAccounts,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Accounts List
            Expanded(
              child: accountsAsync.when(
                data: (accounts) {
                  final filteredAccounts = _filterAccounts(accounts);
                  
                  if (filteredAccounts.isEmpty) {
                    return Center(
                      child: Text(
                        _searchQuery.isEmpty 
                            ? l10n.noAccountsYet 
                            : l10n.noAccountsFound,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredAccounts.length,
                    itemBuilder: (context, index) {
                      final account = filteredAccounts[index];
                      final isSelected = account.id.toString() == widget.selectedAccountId;
                      
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        color: isSelected 
                            ? theme.colorScheme.primaryContainer
                            : null,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: account.isActive
                                ? theme.colorScheme.primary.withOpacity(0.1)
                                : theme.colorScheme.error.withOpacity(0.1),
                            child: Icon(
                              account.isParent ? Icons.folder : Icons.account_balance,
                              color: account.isActive
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.error,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            '${account.accountCode} - ${account.getLocalizedName(Localizations.localeOf(context).languageCode)}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isSelected 
                                  ? theme.colorScheme.onPrimaryContainer
                                  : null,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${l10n.level}: ${account.level} | ${l10n.nature}: ${account.nature}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: isSelected 
                                      ? theme.colorScheme.onPrimaryContainer.withOpacity(0.7)
                                      : theme.colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                '${l10n.type}: ${account.detailAccountType}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: isSelected 
                                      ? theme.colorScheme.onPrimaryContainer.withOpacity(0.7)
                                      : theme.colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          trailing: isSelected 
                              ? Icon(
                                  Icons.check_circle,
                                  color: theme.colorScheme.primary,
                                )
                              : null,
                          onTap: account.isActive && !account.isParent
                              ? () {
                                  widget.onAccountSelected(account);
                                  Navigator.of(context).pop();
                                }
                              : null,
                          enabled: account.isActive && !account.isParent,
                        ),
                      );
                    },
                  );
                },
                loading: () => const LoadingWidget(),
                error: (error, stack) => ErrorWidget(
                  error.toString(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<AccountEntity> _filterAccounts(List<AccountEntity> accounts) {
    if (_searchQuery.isEmpty) {
      return accounts.where((account) => !account.isParent && account.isActive).toList();
    }

    final searchLower = _searchQuery.toLowerCase();
    List<AccountEntity> results = [];
    for (var account in accounts) {
        if (account.accountCode.toLowerCase().contains(searchLower) ||
            account.nameAr.toLowerCase().contains(searchLower) ||
            account.nameEn.toLowerCase().contains(searchLower)) {
            if (!account.isParent && account.isActive) {
              results.add(account);
            }
        }
    }
    return results.toList();

  }
}
