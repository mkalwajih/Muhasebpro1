import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/presentation/widgets/loading_widget.dart';
import '../../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../providers/inventory_setup_providers.dart';
import 'warehouse_form_dialog.dart';

class WarehousesTab extends ConsumerWidget {
  const WarehousesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final warehousesAsync = ref.watch(warehousesProvider);

    return Scaffold(
      body: warehousesAsync.when(
        data: (warehouses) {
          if (warehouses.isEmpty) {
            return EmptyStateWidget(
              icon: Iconsax.building,
              title: l10n.noWarehousesFound,
              subtitle: l10n.addWarehouseToGetStarted,
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: warehouses.length,
            itemBuilder: (context, index) {
              final warehouse = warehouses[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: warehouse.isActive
                        ? Colors.green.shade100
                        : Colors.grey.shade300,
                    child: Icon(
                      Iconsax.building,
                      color: warehouse.isActive ? Colors.green : Colors.grey,
                    ),
                  ),
                  title: Text(
                    Localizations.localeOf(context).languageCode == 'ar'
                        ? warehouse.nameAr
                        : warehouse.nameEn,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('${l10n.code}: ${warehouse.warehouseCode}'),
                      Text('${l10n.account}: ${warehouse.inventoryAccountId}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Iconsax.edit),
                        onPressed: () => _showWarehouseDialog(
                          context,
                          ref,
                          warehouse: warehouse,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Iconsax.trash, color: Colors.red),
                        onPressed: () => _deleteWarehouse(context, ref, warehouse.id!),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showWarehouseDialog(context, ref),
        icon: const Icon(Iconsax.add),
        label: Text(l10n.addWarehouse),
      ),
    );
  }

  void _showWarehouseDialog(BuildContext context, WidgetRef ref,
      {warehouse}) {
    showDialog(
      context: context,
      builder: (context) => WarehouseFormDialog(warehouse: warehouse),
    );
  }

  Future<void> _deleteWarehouse(
      BuildContext context, WidgetRef ref, int id) async {
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
        final deleteWarehouse = ref.read(deleteWarehouseProvider);
        await deleteWarehouse(id);
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
