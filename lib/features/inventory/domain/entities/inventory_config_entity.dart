import 'package:equatable/equatable.dart';

enum CostingMethod {
  weightedAverage('Weighted Average'),
  fifo('FIFO'),
  lifo('LIFO');

  final String value;
  const CostingMethod(this.value);

  static CostingMethod fromString(String value) {
    return CostingMethod.values.firstWhere(
      (e) => e.value == value,
      orElse: () => CostingMethod.weightedAverage,
    );
  }
}

class InventoryConfigEntity extends Equatable {
  final int? id;
  final CostingMethod defaultCostingMethod;
  final bool allowItemLevelOverride;
  final bool enableMultipleWarehouses;
  final String? transfersIntermediaryAccountId;
  final bool enableExpiryDateTracking;
  final bool enableBatchTracking;
  final String? openingBalanceEquityAccountId;
  final String? stockReceivedClearingAccountId;
  final String? inventoryShortageExpenseAccountId;
  final String? inventorySurplusRevenueAccountId;
  final DateTime updatedAt;

  const InventoryConfigEntity({
    this.id,
    required this.defaultCostingMethod,
    this.allowItemLevelOverride = true,
    this.enableMultipleWarehouses = true,
    this.transfersIntermediaryAccountId,
    this.enableExpiryDateTracking = false,
    this.enableBatchTracking = false,
    this.openingBalanceEquityAccountId,
    this.stockReceivedClearingAccountId,
    this.inventoryShortageExpenseAccountId,
    this.inventorySurplusRevenueAccountId,
    required this.updatedAt,
  });

  InventoryConfigEntity copyWith({
    int? id,
    CostingMethod? defaultCostingMethod,
    bool? allowItemLevelOverride,
    bool? enableMultipleWarehouses,
    String? transfersIntermediaryAccountId,
    bool? enableExpiryDateTracking,
    bool? enableBatchTracking,
    String? openingBalanceEquityAccountId,
    String? stockReceivedClearingAccountId,
    String? inventoryShortageExpenseAccountId,
    String? inventorySurplusRevenueAccountId,
    DateTime? updatedAt,
  }) {
    return InventoryConfigEntity(
      id: id ?? this.id,
      defaultCostingMethod: defaultCostingMethod ?? this.defaultCostingMethod,
      allowItemLevelOverride: allowItemLevelOverride ?? this.allowItemLevelOverride,
      enableMultipleWarehouses: enableMultipleWarehouses ?? this.enableMultipleWarehouses,
      transfersIntermediaryAccountId: transfersIntermediaryAccountId ?? this.transfersIntermediaryAccountId,
      enableExpiryDateTracking: enableExpiryDateTracking ?? this.enableExpiryDateTracking,
      enableBatchTracking: enableBatchTracking ?? this.enableBatchTracking,
      openingBalanceEquityAccountId: openingBalanceEquityAccountId ?? this.openingBalanceEquityAccountId,
      stockReceivedClearingAccountId: stockReceivedClearingAccountId ?? this.stockReceivedClearingAccountId,
      inventoryShortageExpenseAccountId: inventoryShortageExpenseAccountId ?? this.inventoryShortageExpenseAccountId,
      inventorySurplusRevenueAccountId: inventorySurplusRevenueAccountId ?? this.inventorySurplusRevenueAccountId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        defaultCostingMethod,
        allowItemLevelOverride,
        enableMultipleWarehouses,
        transfersIntermediaryAccountId,
        enableExpiryDateTracking,
        enableBatchTracking,
        openingBalanceEquityAccountId,
        stockReceivedClearingAccountId,
        inventoryShortageExpenseAccountId,
        inventorySurplusRevenueAccountId,
        updatedAt,
      ];
}
