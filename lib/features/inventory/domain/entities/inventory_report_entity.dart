import 'package:equatable/equatable.dart';

enum ReportType {
  inventoryBalances,
  itemTransactions,
  inventoryValuation,
  staleInventory,
  lowStock,
}

// Inventory Balance Report
class InventoryBalanceEntity extends Equatable {
  final String itemCode;
  final String itemNameAr;
  final String itemNameEn;
  final String warehouseCode;
  final String warehouseNameAr;
  final String warehouseNameEn;
  final double quantityOnHand;
  final double reservedQuantity;
  final double availableQuantity;
  final double unitCost;
  final double totalValue;

  const InventoryBalanceEntity({
    required this.itemCode,
    required this.itemNameAr,
    required this.itemNameEn,
    required this.warehouseCode,
    required this.warehouseNameAr,
    required this.warehouseNameEn,
    required this.quantityOnHand,
    required this.reservedQuantity,
    required this.availableQuantity,
    required this.unitCost,
    required this.totalValue,
  });

  @override
  List<Object?> get props => [
        itemCode,
        itemNameAr,
        itemNameEn,
        warehouseCode,
        warehouseNameAr,
        warehouseNameEn,
        quantityOnHand,
        reservedQuantity,
        availableQuantity,
        unitCost,
        totalValue,
      ];
}

// Item Transaction Report (Stock Card)
class ItemTransactionEntity extends Equatable {
  final DateTime date;
  final String transactionType;
  final String docNo;
  final String warehouseCode;
  final String warehouseName;
  final double quantityIn;
  final double quantityOut;
  final double runningBalance;
  final double unitCost;
  final String? notes;

  const ItemTransactionEntity({
    required this.date,
    required this.transactionType,
    required this.docNo,
    required this.warehouseCode,
    required this.warehouseName,
    required this.quantityIn,
    required this.quantityOut,
    required this.runningBalance,
    required this.unitCost,
    this.notes,
  });

  @override
  List<Object?> get props => [
        date,
        transactionType,
        docNo,
        warehouseCode,
        warehouseName,
        quantityIn,
        quantityOut,
        runningBalance,
        unitCost,
        notes,
      ];
}

// Inventory Valuation Report
class InventoryValuationEntity extends Equatable {
  final String itemGroupCode;
  final String itemGroupNameAr;
  final String itemGroupNameEn;
  final String? warehouseCode;
  final String? warehouseNameAr;
  final String? warehouseNameEn;
  final double totalQuantity;
  final double totalValue;
  final int itemCount;

  const InventoryValuationEntity({
    required this.itemGroupCode,
    required this.itemGroupNameAr,
    required this.itemGroupNameEn,
    this.warehouseCode,
    this.warehouseNameAr,
    this.warehouseNameEn,
    required this.totalQuantity,
    required this.totalValue,
    required this.itemCount,
  });

  @override
  List<Object?> get props => [
        itemGroupCode,
        itemGroupNameAr,
        itemGroupNameEn,
        warehouseCode,
        warehouseNameAr,
        warehouseNameEn,
        totalQuantity,
        totalValue,
        itemCount,
      ];
}

// Stale Inventory Report
class StaleInventoryEntity extends Equatable {
  final String itemCode;
  final String itemNameAr;
  final String itemNameEn;
  final String warehouseCode;
  final String warehouseNameAr;
  final String warehouseNameEn;
  final DateTime? lastTransactionDate;
  final int daysIdle;
  final double quantity;
  final double value;

  const StaleInventoryEntity({
    required this.itemCode,
    required this.itemNameAr,
    required this.itemNameEn,
    required this.warehouseCode,
    required this.warehouseNameAr,
    required this.warehouseNameEn,
    this.lastTransactionDate,
    required this.daysIdle,
    required this.quantity,
    required this.value,
  });

  @override
  List<Object?> get props => [
        itemCode,
        itemNameAr,
        itemNameEn,
        warehouseCode,
        warehouseNameAr,
        warehouseNameEn,
        lastTransactionDate,
        daysIdle,
        quantity,
        value,
      ];
}

// Low Stock Report
class LowStockEntity extends Equatable {
  final String itemCode;
  final String itemNameAr;
  final String itemNameEn;
  final String warehouseCode;
  final String warehouseNameAr;
  final String warehouseNameEn;
  final double currentQuantity;
  final double reorderLevel;
  final double suggestedOrderQty;
  final double maxStockLevel;

  const LowStockEntity({
    required this.itemCode,
    required this.itemNameAr,
    required this.itemNameEn,
    required this.warehouseCode,
    required this.warehouseNameAr,
    required this.warehouseNameEn,
    required this.currentQuantity,
    required this.reorderLevel,
    required this.suggestedOrderQty,
    required this.maxStockLevel,
  });

  bool get isBelowReorderLevel => currentQuantity < reorderLevel;

  @override
  List<Object?> get props => [
        itemCode,
        itemNameAr,
        itemNameEn,
        warehouseCode,
        warehouseNameAr,
        warehouseNameEn,
        currentQuantity,
        reorderLevel,
        suggestedOrderQty,
        maxStockLevel,
      ];
}

// Report Filter
class ReportFilterEntity extends Equatable {
  final DateTime? asOfDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? warehouseId;
  final int? itemGroupId;
  final int? itemId;
  final int? staleSinceDays;

  const ReportFilterEntity({
    this.asOfDate,
    this.startDate,
    this.endDate,
    this.warehouseId,
    this.itemGroupId,
    this.itemId,
    this.staleSinceDays,
  });

  @override
  List<Object?> get props => [
        asOfDate,
        startDate,
        endDate,
        warehouseId,
        itemGroupId,
        itemId,
        staleSinceDays,
      ];
}
