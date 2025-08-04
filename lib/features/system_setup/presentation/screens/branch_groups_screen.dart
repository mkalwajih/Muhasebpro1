import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_group_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/branch_groups_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class BranchGroupsScreen extends ConsumerWidget {
  const BranchGroupsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupsAsync = ref.watch(branchGroupsProvider);
    final l10n = AppLocalizations.of(context)!;

    ref.listen<AsyncValue>(branchGroupsProvider, (_, state) {
      if (state is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error.toString()), backgroundColor: Theme.of(context).colorScheme.error),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.branchGroups),
      ),
      body: groupsAsync.when(
        data: (groups) => ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            final group = groups[index];
            return ListTile(
              title: Text(l10n.localeName == 'ar' ? group.nameAr : group.nameEn),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _showAddEditGroupDialog(context, ref, groupToEdit: group),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
                    onPressed: () => _confirmDelete(context, ref, group),
                  ),
                ],
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(e.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEditGroupDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddEditGroupDialog(BuildContext context, WidgetRef ref, {BranchGroupEntity? groupToEdit}) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final nameArController = TextEditingController(text: groupToEdit?.nameAr ?? '');
    final nameEnController = TextEditingController(text: groupToEdit?.nameEn ?? '');
    bool isActive = groupToEdit?.isActive ?? true;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(groupToEdit == null ? l10n.addNewBranchGroup : l10n.editBranchGroup),
          content: StatefulBuilder(builder: (context, setState) {
            return Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameEnController,
                    decoration: InputDecoration(labelText: l10n.nameEn),
                    validator: (v) => v!.isEmpty ? l10n.requiredField : null,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: nameArController,
                    decoration: InputDecoration(labelText: l10n.nameAr),
                    validator: (v) => v!.isEmpty ? l10n.requiredField : null,
                  ),
                  SwitchListTile(
                    title: Text(l10n.active),
                    value: isActive,
                    onChanged: (val) => setState(() => isActive = val),
                  )
                ],
              ),
            );
          }),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final group = BranchGroupEntity(
                    id: groupToEdit?.id ?? 0,
                    nameAr: nameArController.text,
                    nameEn: nameEnController.text,
                    isActive: isActive,
                  );
                  final notifier = ref.read(branchGroupsProvider.notifier);
                  if (groupToEdit == null) {
                    notifier.addBranchGroup(group);
                  } else {
                    notifier.updateBranchGroup(group);
                  }
                  Navigator.of(context).pop();
                }
              },
              child: Text(l10n.save),
            ),
          ],
        );
      },
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, BranchGroupEntity group) async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmDeletion),
        content: Text('${l10n.areYouSureYouWantToDelete} "${l10n.localeName == 'ar' ? group.nameAr : group.nameEn}"?'),
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
      await ref.read(branchGroupsProvider.notifier).deleteBranchGroup(group.id);
    }
  }
}
