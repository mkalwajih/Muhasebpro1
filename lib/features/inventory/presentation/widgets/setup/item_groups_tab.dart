import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/item_group_entity.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/presentation/widgets/loading_widget.dart';
import '../../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../providers/inventory_setup_providers.dart';
import 'item_group_form_dialog.dart';

class ItemGroupsTab extends ConsumerWidget {
  const ItemGroupsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = Translations.of(context);
    final itemGroupsAsync = ref.watch(itemGroupsProvider);

    return Scaffold(
      body: itemGroupsAsync.when(
        data: (itemGroupsEither) {
          return itemGroupsEither.fold(
            (failure) => Center(child: Text(failure.toString())),
            (itemGroups) {
              if (itemGroups.isEmpty) {
                return EmptyStateWidget(
                  icon: Iconsax.category,
                  title: l10n.noItemGroupsFound,
                  subtitle: l10n.addItemGroupToGetStarted,
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: itemGroups.length,
                itemBuilder: (context, index) {
                  final group = itemGroups[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: const Icon(Iconsax.category, color: Colors.blue),
                      ),
                      title: Text(
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? group.nameAr
                            : group.nameEn,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${l10n.code}: ${group.groupCode}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Iconsax.edit),
                            onPressed: () => _showItemGroupDialog(
                              context,
                              ref,
                              itemGroup: group,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Iconsax.trash, color: Colors.red),
                            onPressed: () => _deleteItemGroup(context, ref, group.id!),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showItemGroupDialog(context, ref),
        icon: const Icon(Iconsax.add),
        label: Text(l10n.addItemGroup),
      ),
    );
  }

  void _showItemGroupDialog(BuildContext context, WidgetRef ref,
      {ItemGroupEntity? itemGroup}) {
    showDialog(
      context: context,
      builder: (context) => ItemGroupFormDialog(itemGroup: itemGroup),
    );
  }

  Future<void> _deleteItemGroup(
      BuildContext context, WidgetRef ref, int id) async {
    final l10n = Translations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmDelete),
        content: Text(l10n.areYouSureYouWantToDelete),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await ref.read(deleteItemGroupProvider(id).future);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.deleteSuccess)),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${l10n.deleteFailed}: $e')),
          );
        }
      }
    }
  }
}
