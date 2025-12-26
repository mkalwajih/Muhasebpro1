import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/item_entity.dart';
import '../providers/item_management_providers.dart';
import '../providers/inventory_setup_providers.dart';

class OpeningStockScreen extends ConsumerStatefulWidget {
  const OpeningStockScreen({super.key});

  @override
  ConsumerState<OpeningStockScreen> createState() => _OpeningStockScreenState();
}

class _OpeningStockScreenState extends ConsumerState<OpeningStockScreen> {
  final List<OpeningStockEntity> _openingStocks = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.openingStock),
        backgroundColor: theme.colorScheme.inversePrimary,
        actions: [
          if (_openingStocks.isNotEmpty)
            IconButton(
              icon: const Icon(Iconsax.save_2),
              onPressed: _isLoading ? null : _saveOpeningStock,
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Iconsax.info_circle, color: Colors.blue.shade700),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.openingStockInfo,
                        style: TextStyle(color: Colors.blue.shade900),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: _openingStocks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconsax.box, size: 64, color: Colors.grey.shade400),
                        const SizedBox(height: 16),
                        Text(
                          l10n.noOpeningStockEntries,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.clickAddToStart,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _openingStocks.length,
                    itemBuilder: (context, index) {
                      final stock = _openingStocks[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green.shade100,
                            child: const Icon(Iconsax.box, color: Colors.green),
                          ),
                          title: Text('${l10n.item} ID: ${stock.itemId}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${l10n.warehouse} ID: ${stock.warehouseId}'),
                              Text('${l10n.quantity}: ${stock.quantity}'),
                              Text('${l10n.unitCost}: ${stock.unitCost}'),
                              Text('${l10n.totalCost}: ${stock.totalCost}'),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Iconsax.trash, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                _openingStocks.removeAt(index);
                              });
                            },
                          ),
                          isThreeLine: true,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddOpeningStockDialog(),
        icon: const Icon(Iconsax.add),
        label: Text(l10n.addEntry),
      ),
    );
  }

  void _showAddOpeningStockDialog() {
    final l10n = AppLocalizations.of(context)!;
    final itemsAsync = ref.read(itemsProvider);
    final warehousesAsync = ref.read(warehousesProvider);

    int? selectedItemId;
    int? selectedWarehouseId;
    final quantityController = TextEditingController();
    final unitCostController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.addOpeningStock),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              itemsAsync.when(
                data: (items) {
                  return DropdownButtonFormField<int>(
                    decoration: InputDecoration(labelText: l10n.item),
                    items: items.map((item) {
                      return DropdownMenuItem(
                        value: item.id,
                        child: Text(
                          Localizations.localeOf(context).languageCode == 'ar'
                              ? item.nameAr
                              : item.nameEn,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) => selectedItemId = value,
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
              const SizedBox(height: 16),
              warehousesAsync.when(
                data: (warehouses) {
                  return DropdownButtonFormField<int>(
                    decoration: InputDecoration(labelText: l10n.warehouse),
                    items: warehouses.map((warehouse) {
                      return DropdownMenuItem(
                        value: warehouse.id,
                        child: Text(
                          Localizations.localeOf(context).languageCode == 'ar'
                              ? warehouse.nameAr
                              : warehouse.nameEn,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) => selectedWarehouseId = value,
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: l10n.quantity),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: unitCostController,
                decoration: InputDecoration(labelText: l10n.unitCost),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedItemId != null &&
                  selectedWarehouseId != null &&
                  quantityController.text.isNotEmpty &&
                  unitCostController.text.isNotEmpty) {
                setState(() {
                  _openingStocks.add(
                    OpeningStockEntity(
                      warehouseId: selectedWarehouseId!,
                      itemId: selectedItemId!,
                      quantity: double.parse(quantityController.text),
                      unitCost: double.parse(unitCostController.text),
                    ),
                  );
                });
                Navigator.pop(context);
              }
            },
            child: Text(l10n.add),
          ),
        ],
      ),
    );
  }

  Future<void> _saveOpeningStock() async {
    if (_openingStocks.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      final saveOpeningStock = ref.read(saveOpeningStockProvider);
      await saveOpeningStock(_openingStocks);

      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.openingStockSaved)),
        );
        setState(() {
          _openingStocks.clear();
        });
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.saveFailed}: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
