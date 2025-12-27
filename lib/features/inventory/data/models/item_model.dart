import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({
    required super.id,
    required super.itemCode,
    required super.nameAr,
    required super.nameEn,
    super.barcode,
    super.description,
    required super.itemType,
    required super.itemGroupId,
    required super.baseUnit,
    super.costingMethod,
    required super.costPrice,
    super.reorderLevel,
    super.maxStockLevel,
    super.minStockLevel,
    required super.trackExpiryDate,
    required super.trackBatchNumber,
    super.inventoryAccountId,
    super.salesRevenueAccountId,
    super.cogsAccountId,
    super.stockDiscrepancyAccountId,
    required super.isActive,
  });

  // Fixed: Changed ItemData to Item
  factory ItemModel.fromDrift(Item data) {
    return ItemModel(
      id: data.id,
      itemCode: data.itemCode,
      nameAr: data.nameAr,
      nameEn: data.nameEn,
      barcode: data.barcode,
      description: data.description,
      itemType: data.itemType,
      itemGroupId: data.itemGroupId,
      baseUnit: data.baseUnit,
      costingMethod: data.costingMethod,
      costPrice: data.costPrice,
      reorderLevel: data.reorderLevel,
      maxStockLevel: data.maxStockLevel,
      minStockLevel: data.minStockLevel,
      trackExpiryDate: data.trackExpiryDate,
      trackBatchNumber: data.trackBatchNumber,
      inventoryAccountId: data.inventoryAccountId,
      salesRevenueAccountId: data.salesRevenueAccountId,
      cogsAccountId: data.cogsAccountId,
      stockDiscrepancyAccountId: data.stockDiscrepancyAccountId,
      isActive: data.isActive,
    );
  }

  ItemsCompanion toCompanion() {
    return ItemsCompanion(
      itemCode: Value(itemCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      barcode: Value(barcode),
      description: Value(description),
      itemType: Value(itemType),
      itemGroupId: Value(itemGroupId),
      baseUnit: Value(baseUnit),
      costingMethod: Value(costingMethod),
      costPrice: Value(costPrice),
      reorderLevel: Value(reorderLevel),
      maxStockLevel: Value(maxStockLevel),
      minStockLevel: Value(minStockLevel),
      trackExpiryDate: Value(trackExpiryDate),
      trackBatchNumber: Value(trackBatchNumber),
      inventoryAccountId: Value(inventoryAccountId),
      salesRevenueAccountId: Value(salesRevenueAccountId),
      cogsAccountId: Value(cogsAccountId),
      stockDiscrepancyAccountId: Value(stockDiscrepancyAccountId),
      isActive: Value(isActive),
    );
  }
}
