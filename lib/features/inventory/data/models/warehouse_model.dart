import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/warehouse_entity.dart';

class WarehouseModel extends WarehouseEntity {
  const WarehouseModel({
    super.id,
    required super.warehouseCode,
    required super.nameAr,
    required super.nameEn,
    required super.branchId,
    required super.inventoryAccountId,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory WarehouseModel.fromDrift(Warehouse data) {
    return WarehouseModel(
      id: data.id,
      warehouseCode: data.warehouseCode,
      nameAr: data.nameAr,
      nameEn: data.nameEn,
      branchId: data.branchId,
      inventoryAccountId: data.inventoryAccountId,
      isActive: data.isActive,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt * 1000),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt * 1000),
    );
  }

  static WarehouseModel fromEntity(WarehouseEntity entity) {
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

  WarehousesCompanion toDrift() {
    return WarehousesCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      warehouseCode: Value(warehouseCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      branchId: Value(branchId),
      inventoryAccountId: Value(inventoryAccountId),
      isActive: Value(isActive),
      createdAt: Value(createdAt.millisecondsSinceEpoch ~/ 1000),
      updatedAt: Value(updatedAt.millisecondsSinceEpoch ~/ 1000),
    );
  }
}