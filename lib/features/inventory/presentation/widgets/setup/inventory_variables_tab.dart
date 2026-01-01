import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../../shared/presentation/widgets/loading_widget.dart';
import '../../../domain/entities/inventory_config_entity.dart';
import '../../providers/inventory_setup_providers.dart';

class InventoryVariablesTab extends ConsumerStatefulWidget {
  const InventoryVariablesTab({super.key});

  @override
  ConsumerState<InventoryVariablesTab> createState() =>
      _InventoryVariablesTabState();
}

class _InventoryVariablesTabState
    extends ConsumerState<InventoryVariablesTab> {
  CostingMethod? _selectedCostingMethod;
  bool _allowItemLevelOverride = true;
  bool _enableMultipleWarehouses = true;
  bool _enableExpiryDateTracking = false;
  bool _enableBatchTracking = false;
  String? _transfersIntermediaryAccountId;
  String? _openingBalanceEquityAccountId;
  String? _stockReceivedClearingAccountId;
  String? _inventoryShortageExpenseAccountId;
  String? _inventorySurplusRevenueAccountId;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);
    final configAsync = ref.watch(inventoryConfigProvider);

    return configAsync.when(
      data: (config) {
        if (_selectedCostingMethod == null) {
          _initializeFromConfig(config);
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.inventoryVariables,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Default Costing Method
                  DropdownButtonFormField<CostingMethod>(
                    initialValue: _selectedCostingMethod,
                    decoration: InputDecoration(
                      labelText: l10n.defaultCostingMethod,
                      border: const OutlineInputBorder(),
                    ),
                    items: CostingMethod.values.map((method) {
                      return DropdownMenuItem(
                        value: method,
                        child: Text(method.value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCostingMethod = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  // Allow Item Level Override
                  SwitchListTile(
                    title: Text(l10n.allowItemLevelOverride),
                    subtitle: Text(l10n.allowItemLevelOverrideDesc),
                    value: _allowItemLevelOverride,
                    onChanged: (value) {
                      setState(() {
                        _allowItemLevelOverride = value;
                      });
                    },
                  ),
                  const Divider(),

                  // Enable Multiple Warehouses
                  SwitchListTile(
                    title: Text(l10n.enableMultipleWarehouses),
                    subtitle: Text(l10n.enableMultipleWarehousesDesc),
                    value: _enableMultipleWarehouses,
                    onChanged: (value) {
                      setState(() {
                        _enableMultipleWarehouses = value;
                      });
                    },
                  ),
                  const Divider(),

                  // Enable Expiry Date Tracking
                  SwitchListTile(
                    title: Text(l10n.enableExpiryDateTracking),
                    subtitle: Text(l10n.enableExpiryDateTrackingDesc),
                    value: _enableExpiryDateTracking,
                    onChanged: (value) {
                      setState(() {
                        _enableExpiryDateTracking = value;
                      });
                    },
                  ),
                  const Divider(),

                  // Enable Batch Tracking
                  SwitchListTile(
                    title: Text(l10n.enableBatchTracking),
                    subtitle: Text(l10n.enableBatchTrackingDesc),
                    value: _enableBatchTracking,
                    onChanged: (value) {
                      setState(() {
                        _enableBatchTracking = value;
                      });
                    },
                  ),
                  const SizedBox(height: 24),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : () => _saveConfig(config),
                      icon: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.save),
                      label: Text(l10n.saveSettings),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }

  void _initializeFromConfig(InventoryConfigEntity config) {
    _selectedCostingMethod = config.defaultCostingMethod;
    _allowItemLevelOverride = config.allowItemLevelOverride;
    _enableMultipleWarehouses = config.enableMultipleWarehouses;
    _enableExpiryDateTracking = config.enableExpiryDateTracking;
    _enableBatchTracking = config.enableBatchTracking;
    _transfersIntermediaryAccountId = config.transfersIntermediaryAccountId;
    _openingBalanceEquityAccountId = config.openingBalanceEquityAccountId;
    _stockReceivedClearingAccountId = config.stockReceivedClearingAccountId;
    _inventoryShortageExpenseAccountId =
        config.inventoryShortageExpenseAccountId;
    _inventorySurplusRevenueAccountId =
        config.inventorySurplusRevenueAccountId;
  }

  Future<void> _saveConfig(InventoryConfigEntity currentConfig) async {
    if (_selectedCostingMethod == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final updatedConfig = currentConfig.copyWith(
        defaultCostingMethod: _selectedCostingMethod,
        allowItemLevelOverride: _allowItemLevelOverride,
        enableMultipleWarehouses: _enableMultipleWarehouses,
        enableExpiryDateTracking: _enableExpiryDateTracking,
        enableBatchTracking: _enableBatchTracking,
        updatedAt: DateTime.now(),
      );

      final saveConfig = ref.read(saveInventoryConfigProvider);
      await saveConfig(updatedConfig);

      if (mounted) {
        final l10n = Translations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.saveSuccess)),
        );
      }
    } catch (e) {
      if (mounted) {
        final l10n = Translations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.saveFailed}: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
