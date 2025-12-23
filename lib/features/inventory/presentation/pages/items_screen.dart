import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/presentation/widgets/loading_widget.dart';
import '../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../providers/item_management_providers.dart';
import '../widgets/items/item_card_dialog.dart';

class ItemsScreen extends ConsumerWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final itemsAsync = ref.watch(itemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.items),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.search_normal),
            onPressed: () {},
          ),
        ],
      ),
      body: itemsAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return EmptyStateWidget(
              icon: Iconsax.box,
              title: l10n.noItemsFound,
              subtitle: l10n.addItemToGetStarted,
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: item.isActive
                        ? Colors.blue.shade100
                        : Colors.grey.shade300,
                    child: Icon(
                      Iconsax.box,
                      color: item.isActive ? Colors.blue : Colors.grey,
                    ),
                  ),
                  title: Text(
                    Localizations.localeOf(context).languageCode == 'ar'
                        ? item.nameAr
                        : item.nameEn,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('${l10n.code}: ${item.itemCode}'),
                      if (item.barcode != null)
                        Text('${l10n.barcode}: ${item.barcode}'),
                      Text('${l10n.type}: ${item.itemType.value}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Iconsax.edit),
                        onPressed: () => _showItemDialog(context, item: item),
                      ),
                      IconButton(
                        icon: const Icon(Iconsax.trash, color: Colors.red),
                        onPressed: () => _deleteItem(context, ref, item.id!),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  onTap: () => _showItemDialog(context, item: item),
                ),
              );
            },
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showItemDialog(context),
        icon: const Icon(Iconsax.add),
        label: Text(l10n.addItem),
      ),
    );
  }

  void _showItemDialog(BuildContext context, {item}) {
    showDialog(
      context: context,
      builder: (context) => ItemCardDialog(item: item),
    );
  }

  Future<void> _deleteItem(BuildContext context, WidgetRef ref, int id) async {
    final l10n = AppLocalizations.of(context)!;
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
        final deleteItem = ref.read(deleteItemProvider);
        await deleteItem(id);
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
