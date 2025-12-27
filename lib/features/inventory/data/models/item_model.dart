import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/inventory_config_entity.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({
    super.id,
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
    required super.createdAt,
    required super.updatedAt,
  });

  factory ItemModel.fromDrift(Item data) {
    return ItemModel(
      id: data.id,
      itemCode: data.itemCode,
      nameAr: data.nameAr,
      nameEn: data.nameEn,
      barcode: data.barcode,
      description: data.description,
      itemType: ItemType.fromString(data.itemType),
      itemGroupId: data.itemGroupId,
      baseUnit: data.baseUnit,
      costingMethod: data.costingMethod == null ? null : CostingMethod.fromString(data.costingMethod!),
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
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt * 1000),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt * 1000),
    );
  }

  static ItemModel fromEntity(ItemEntity entity) {
    return ItemModel(
      id: entity.id,
      itemCode: entity.itemCode,
      nameAr: entity.nameAr,
      nameEn: entity.nameEn,
      barcode: entity.barcode,
      description: entity.description,
      itemType: entity.itemType,
      itemGroupId: entity.itemGroupId,
      baseUnit: entity.baseUnit,
      costingMethod: entity.costingMethod,
      costPrice: entity.costPrice,
      reorderLevel: entity.reorderLevel,
      maxStockLevel: entity.maxStockLevel,
      minStockLevel: entity.minStockLevel,
      trackExpiryDate: entity.trackExpiryDate,
      trackBatchNumber: entity.trackBatchNumber,
      inventoryAccountId: entity.inventoryAccountId,
      salesRevenueAccountId: entity.salesRevenueAccountId,
      cogsAccountId: entity.cogsAccountId,
      stockDiscrepancyAccountId: entity.stockDiscrepancyAccountId,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  ItemsCompanion toDrift() {
    return ItemsCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      itemCode: Value(itemCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      barcode: Value(barcode),
      description: Value(description),
      itemType: Value(itemType.value),
      itemGroupId: Value(itemGroupId),
      baseUnit: Value(baseUnit),
      costingMethod: Value(costingMethod?.value),
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
      createdAt: Value(createdAt.millisecondsSinceEpoch ~/ 1000),
      updatedAt: Value(updatedAt.millisecondsSinceEpoch ~/ 1000),
    );
  }
}
