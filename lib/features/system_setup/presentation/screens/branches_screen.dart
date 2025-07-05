import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/branches_providers.dart';
import '../widgets/add_edit_branch_dialog.dart';
import '../../domain/entities/branch_entity.dart';

class BranchesScreen extends ConsumerWidget {
  const BranchesScreen({super.key});

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, String branchCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Branch'),
        content: const Text('Are you sure you want to delete this branch?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(branchesProvider.notifier).deleteBranch(branchCode);
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branchesAsyncValue = ref.watch(branchesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Branches'),
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
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _showDeleteConfirmation(context, ref, branch.branchCode),
                  ),
                ],
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
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
