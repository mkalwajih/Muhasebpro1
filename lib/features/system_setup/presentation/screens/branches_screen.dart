import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart'; // Import for l10n
import '../providers/branches_providers.dart';
import '../widgets/add_edit_branch_dialog.dart';

class BranchesScreen extends ConsumerWidget {
  const BranchesScreen({super.key});

  void _showDeactivateConfirmation(BuildContext context, WidgetRef ref, String branchCode) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deactivateBranchConfirmationTitle),
        content: Text(l10n.deactivateBranchConfirmationMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              ref.read(branchesProvider.notifier).deactivateBranch(branchCode);
              Navigator.of(context).pop();
            },
            child: Text(l10n.deactivate),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branchesAsyncValue = ref.watch(branchesProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.branches),
      ),
      body: branchesAsyncValue.when(
        data: (branches) => ListView.builder(
          itemCount: branches.length,
          itemBuilder: (context, index) {
            final branch = branches[index];
            return ListTile(
              title: Text(branch.nameEn),
              subtitle: Text(branch.nameAr),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddEditBranchDialog(branch: branch),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red), // Use delete icon for deactivate for now
                    onPressed: () => _showDeactivateConfirmation(context, ref, branch.branchCode),
                  ),
                ],
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('${l10n.error}: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddEditBranchDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
