import 'package:drift/drift.dart' as drift;
import '../../../../core/db/app_database.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/entities/inventory_config_entity.dart';

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
    super.costPrice,
    super.reorderLevel,
    super.maxStockLevel,
    super.minStockLevel,
    super.trackExpiryDate,
    super.trackBatchNumber,
    super.inventoryAccountId,
    super.salesRevenueAccountId,
    super.cogsAccountId,
    super.stockDiscrepancyAccountId,
    super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ItemModel.fromEntity(ItemEntity entity) {
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

  factory ItemModel.fromDrift(ItemData data) {
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
      costingMethod: data.costingMethod != null ? CostingMethod.fromString(data.costingMethod!) : null,
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
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  ItemsCompanion toDrift() {
    return ItemsCompanion(
      id: id != null ? drift.Value(id!) : const drift.Value.absent(),
      itemCode: drift.Value(itemCode),
      nameAr: drift.Value(nameAr),
      nameEn: drift.Value(nameEn),
      barcode: drift.Value(barcode),
      description: drift.Value(description),
      itemType: drift.Value(itemType.value),
      itemGroupId: drift.Value(itemGroupId),
      baseUnit: drift.Value(baseUnit),
      costingMethod: drift.Value(costingMethod?.value),
      costPrice: drift.Value(costPrice),
      reorderLevel: drift.Value(reorderLevel),
      maxStockLevel: drift.Value(maxStockLevel),
      minStockLevel: drift.Value(minStockLevel),
      trackExpiryDate: drift.Value(trackExpiryDate),
      trackBatchNumber: drift.Value(trackBatchNumber),
      inventoryAccountId: drift.Value(inventoryAccountId),
      salesRevenueAccountId: drift.Value(salesRevenueAccountId),
      cogsAccountId: drift.Value(cogsAccountId),
      stockDiscrepancyAccountId: drift.Value(stockDiscrepancyAccountId),
      isActive: drift.Value(isActive),
      createdAt: drift.Value(createdAt.millisecondsSinceEpoch),
      updatedAt: drift.Value(updatedAt.millisecondsSinceEpoch),
    );
  }
}
