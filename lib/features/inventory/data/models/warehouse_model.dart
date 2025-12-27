import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/warehouse_entity.dart';

class WarehouseModel extends WarehouseEntity {
  const WarehouseModel({
    required super.id,
    required super.warehouseCode,
    required super.nameAr,
    required super.nameEn,
    required super.branchId,
    required super.inventoryAccountId,
    required super.isActive,
  });

  // Fixed: Changed WarehouseData to Warehouse
  factory WarehouseModel.fromDrift(Warehouse data) {
    return WarehouseModel(
      id: data.id,
      warehouseCode: data.warehouseCode,
      nameAr: data.nameAr,
      nameEn: data.nameEn,
      branchId: data.branchId,
      inventoryAccountId: data.inventoryAccountId,
      isActive: data.isActive,
    );
  }

  WarehousesCompanion toCompanion() {
    return WarehousesCompanion(
      warehouseCode: Value(warehouseCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      branchId: Value(branchId),
      inventoryAccountId: Value(inventoryAccountId),
      isActive: Value(isActive),
    );
  }
}
