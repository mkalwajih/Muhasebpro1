import 'package:drift/drift.dart' as drift;
import '../../../../core/db/app_database.dart';
import '../../domain/entities/inventory_config_entity.dart';

class InventoryConfigModel extends InventoryConfigEntity {
  const InventoryConfigModel({
    super.id,
    required super.defaultCostingMethod,
    super.allowItemLevelOverride,
    super.enableMultipleWarehouses,
    super.transfersIntermediaryAccountId,
    super.enableExpiryDateTracking,
    super.enableBatchTracking,
    super.openingBalanceEquityAccountId,
    super.stockReceivedClearingAccountId,
    super.inventoryShortageExpenseAccountId,
    super.inventorySurplusRevenueAccountId,
    required super.updatedAt,
  });

  factory InventoryConfigModel.fromEntity(InventoryConfigEntity entity) {
    return InventoryConfigModel(
      id: entity.id,
      defaultCostingMethod: entity.defaultCostingMethod,
      allowItemLevelOverride: entity.allowItemLevelOverride,
      enableMultipleWarehouses: entity.enableMultipleWarehouses,
      transfersIntermediaryAccountId: entity.transfersIntermediaryAccountId,
      enableExpiryDateTracking: entity.enableExpiryDateTracking,
      enableBatchTracking: entity.enableBatchTracking,
      openingBalanceEquityAccountId: entity.openingBalanceEquityAccountId,
      stockReceivedClearingAccountId: entity.stockReceivedClearingAccountId,
      inventoryShortageExpenseAccountId: entity.inventoryShortageExpenseAccountId,
      inventorySurplusRevenueAccountId: entity.inventorySurplusRevenueAccountId,
      updatedAt: entity.updatedAt,
    );
  }

  factory InventoryConfigModel.fromDrift(InventoryConfigData data) {
    return InventoryConfigModel(
      id: data.id,
      defaultCostingMethod: CostingMethod.fromString(data.defaultCostingMethod),
      allowItemLevelOverride: data.allowItemLevelOverride,
      enableMultipleWarehouses: data.enableMultipleWarehouses,
      transfersIntermediaryAccountId: data.transfersIntermediaryAccountId,
      enableExpiryDateTracking: data.enableExpiryDateTracking,
      enableBatchTracking: data.enableBatchTracking,
      openingBalanceEquityAccountId: data.openingBalanceEquityAccountId,
      stockReceivedClearingAccountId: data.stockReceivedClearingAccountId,
      inventoryShortageExpenseAccountId: data.inventoryShortageExpenseAccountId,
      inventorySurplusRevenueAccountId: data.inventorySurplusRevenueAccountId,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  InventoryConfigCompanion toDrift() {
    return InventoryConfigCompanion(
      id: id != null ? drift.Value(id!) : const drift.Value.absent(),
      defaultCostingMethod: drift.Value(defaultCostingMethod.value),
      allowItemLevelOverride: drift.Value(allowItemLevelOverride),
      enableMultipleWarehouses: drift.Value(enableMultipleWarehouses),
      transfersIntermediaryAccountId: drift.Value(transfersIntermediaryAccountId),
      enableExpiryDateTracking: drift.Value(enableExpiryDateTracking),
      enableBatchTracking: drift.Value(enableBatchTracking),
      openingBalanceEquityAccountId: drift.Value(openingBalanceEquityAccountId),
      stockReceivedClearingAccountId: drift.Value(stockReceivedClearingAccountId),
      inventoryShortageExpenseAccountId: drift.Value(inventoryShortageExpenseAccountId),
      inventorySurplusRevenueAccountId: drift.Value(inventorySurplusRevenueAccountId),
      updatedAt: drift.Value(updatedAt.millisecondsSinceEpoch),
    );
  }
}
