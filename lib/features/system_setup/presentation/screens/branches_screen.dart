import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/branches_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/add_edit_branch_dialog.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class BranchesScreen extends ConsumerStatefulWidget {
  const BranchesScreen({super.key});

  @override
  ConsumerState<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends ConsumerState<BranchesScreen> {
  BranchEntity? _selectedBranch;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.listen<AsyncValue<List<BranchEntity>>>(branchesProvider, (previous, next) {
      next.whenData((branches) {
        if (branches.isNotEmpty && _selectedBranch == null) {
          _selectBranch(branches.first);
        } else if (branches.isEmpty) {
          setState(() => _selectedBranch = null);
        } else if (_selectedBranch != null) {
          // Update selected branch if it changed in the list (e.g., after save/delete)
          final updatedBranch = branches.firstWhere(
            (b) => b.id == _selectedBranch!.id,
            orElse: () => branches.isNotEmpty ? branches.first : _selectedBranch!, // Fallback
          );
          if (updatedBranch != _selectedBranch) {
            _selectBranch(updatedBranch);
          }
        }
      });
    });
  }

  void _selectBranch(BranchEntity branch) {
    setState(() {
      _selectedBranch = branch;
    });
  }

  void _showAddEditBranchDialog({BranchEntity? branchToEdit}) {
    showDialog(
      context: context,
      builder: (context) => AddEditBranchDialog(branch: branchToEdit),
    );
  }

  void _showDeactivateConfirmation(BuildContext context, WidgetRef ref, BranchEntity branch) {
    final l10n = AppLocalizations.of(context)!;
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
            onPressed: () async {
              Navigator.of(context).pop();
              final result = await ref.read(branchesProvider.notifier).deactivateBranch(branch.branchCode);
              result.fold(
                (failure) => _showErrorSnackbar(l10n, failure.properties.first as String? ?? l10n.saveFailed),
                (_) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.branchStatusUpdated), backgroundColor: Colors.green)),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
            child: Text(branch.branchStatus ? l10n.deactivate : l10n.activate),
          ),
        ],
      ),
    );
  }

  Future<void> _onDelete(AppLocalizations l10n, BranchEntity branch) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmDeletion),
        content: Text(l10n.confirmDeleteMessage),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        final result = await ref.read(branchesProvider.notifier).deleteBranch(branch.id!); // Assuming ID is not null for existing
        result.fold(
          (failure) => _showErrorSnackbar(l10n, failure.properties.first as String? ?? l10n.deleteFailed),
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.branchDeletedSuccessfully(l10n.localeName == 'ar' ? branch.nameAr : branch.nameEn)), backgroundColor: Colors.green));
            setState(() => _selectedBranch = null);
          },
        );
      } catch (e) {
        _showErrorSnackbar(l10n, '${l10n.deleteFailed}: ${e.toString()}');
      }
    }
  }

  void _showErrorSnackbar(AppLocalizations l10n, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Theme.of(context).colorScheme.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final branchesAsyncValue = ref.watch(branchesProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.branches),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_business_outlined),
            tooltip: l10n.addNewBranch,
            onPressed: () => _showAddEditBranchDialog(),
          ),
        ],
      ),
      body: Row(
        children: [
          // Left Panel: List of Branches
          Expanded(
            flex: 1,
            child: branchesAsyncValue.when(
              data: (branches) {
                if (branches.isEmpty) {
                  return Center(child: Text(l10n.noBranchesYet));
                }
                return ListView.builder(
                  itemCount: branches.length,
                  itemBuilder: (context, index) {
                    final branch = branches[index];
                    final isSelected = _selectedBranch?.id == branch.id;
                    return ListTile(
                      title: Text(l10n.localeName == 'ar' ? branch.nameAr : branch.nameEn),
                      subtitle: Text(branch.branchCode),
                      selected: isSelected,
                      onTap: () => _selectBranch(branch),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           IconButton(
                            icon: const Icon(Iconsax.edit),
                            tooltip: l10n.editBranch,
                            onPressed: () => _showAddEditBranchDialog(branchToEdit: branch),
                          ),
                           IconButton(
                            icon: Icon(
                              branch.branchStatus ? Iconsax.pause_circle : Iconsax.play_circle,
                              color: branch.branchStatus ? Theme.of(context).colorScheme.error : Colors.green,
                            ),
                            tooltip: branch.branchStatus ? l10n.deactivate : l10n.activate,
                            onPressed: () => _showDeactivateConfirmation(context, ref, branch),
                          ),
                          IconButton(
                            icon: Icon(Iconsax.trash, color: Theme.of(context).colorScheme.error),
                            tooltip: l10n.delete,
                            onPressed: () => _onDelete(l10n, branch),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Error loading branches: $err')),
            ),
          ),
          const VerticalDivider(width: 1),
          // Right Panel: Branch Details Display
          Expanded(
            flex: 2,
            child: _selectedBranch == null
                ? Center(child: Text(l10n.selectBranchPrompt))
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.branchCode, style: Theme.of(context).textTheme.titleMedium),
                          Text(_selectedBranch!.branchCode, style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 16),
                          Text(l10n.branchNameEn, style: Theme.of(context).textTheme.titleMedium),
                          Text(_selectedBranch!.nameEn, style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 16),
                          Text(l10n.branchNameAr, style: Theme.of(context).textTheme.titleMedium),
                          Text(_selectedBranch!.nameAr, style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 16),
                          Text(l10n.company, style: Theme.of(context).textTheme.titleMedium),
                          Text(_selectedBranch!.companyId.toString(), style: Theme.of(context).textTheme.bodyLarge), // TODO: Resolve company name
                          const SizedBox(height: 16),
                          Text(l10n.branchGroup, style: Theme.of(context).textTheme.titleMedium),
                          Text(_selectedBranch!.branchGroupId?.toString() ?? l10n.notProvided, style: Theme.of(context).textTheme.bodyLarge), // TODO: Resolve branch group name
                          const SizedBox(height: 16),
                          Text(l10n.address, style: Theme.of(context).textTheme.titleMedium),
                          Text(_selectedBranch!.address ?? l10n.notProvided, style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 16),
                          Text(l10n.phone, style: Theme.of(context).textTheme.titleMedium),
                          Text(_selectedBranch!.phone ?? l10n.notProvided, style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 16),
                          Text(l10n.defaultWarehouse, style: Theme.of(context).textTheme.titleMedium),
                          Text(_selectedBranch!.defaultWarehouseId ?? l10n.notProvided, style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 16),
                          Text(l10n.status, style: Theme.of(context).textTheme.titleMedium),
                          Text(_selectedBranch!.branchStatus ? l10n.active : l10n.inactive, style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 16),
                          Text(l10n.remarks, style: Theme.of(context).textTheme.titleMedium),
                          Text(_selectedBranch!.remarks ?? l10n.notProvided, style: Theme.of(context).textTheme.bodyLarge),
                          // TODO: Display logo if available
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
