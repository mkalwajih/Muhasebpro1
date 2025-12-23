import 'package:drift/drift.dart' as drift;
import '../../../../core/db/app_database.dart';
import '../../domain/entities/warehouse_entity.dart';

class WarehouseModel extends WarehouseEntity {
  const WarehouseModel({
    super.id,
    required super.warehouseCode,
    required super.nameAr,
    required super.nameEn,
    required super.branchId,
    required super.inventoryAccountId,
    super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory WarehouseModel.fromEntity(WarehouseEntity entity) {
    return WarehouseModel(
      id: entity.id,
      warehouseCode: entity.warehouseCode,
      nameAr: entity.nameAr,
      nameEn: entity.nameEn,
      branchId: entity.branchId,
      inventoryAccountId: entity.inventoryAccountId,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory WarehouseModel.fromDrift(WarehouseData data) {
    return WarehouseModel(
      id: data.id,
      warehouseCode: data.warehouseCode,
      nameAr: data.nameAr,
      nameEn: data.nameEn,
      branchId: data.branchId,
      inventoryAccountId: data.inventoryAccountId,
      isActive: data.isActive,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  WarehousesCompanion toDrift() {
    return WarehousesCompanion(
      id: id != null ? drift.Value(id!) : const drift.Value.absent(),
      warehouseCode: drift.Value(warehouseCode),
      nameAr: drift.Value(nameAr),
      nameEn: drift.Value(nameEn),
      branchId: drift.Value(branchId),
      inventoryAccountId: drift.Value(inventoryAccountId),
      isActive: drift.Value(isActive),
      createdAt: drift.Value(createdAt.millisecondsSinceEpoch),
      updatedAt: drift.Value(updatedAt.millisecondsSinceEpoch),
    );
  }
}
