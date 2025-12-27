import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/item_group_entity.dart';

class ItemGroupModel extends ItemGroupEntity {
  const ItemGroupModel({
    super.id,
    required super.groupCode,
    required super.nameAr,
    required super.nameEn,
    super.parentGroupId,
    required super.inventoryAccountId,
    required super.salesRevenueAccountId,
    required super.cogsAccountId,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ItemGroupModel.fromDrift(ItemGroup data) {
    return ItemGroupModel(
      id: data.id,
      groupCode: data.groupCode,
      nameAr: data.nameAr,
      nameEn: data.nameEn,
      parentGroupId: data.parentGroupId,
      inventoryAccountId: data.inventoryAccountId,
      salesRevenueAccountId: data.salesRevenueAccountId,
      cogsAccountId: data.cogsAccountId,
      isActive: data.isActive,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt * 1000),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt * 1000),
    );
  }

  static ItemGroupModel fromEntity(ItemGroupEntity entity) {
    return ItemGroupModel(
      id: entity.id,
      groupCode: entity.groupCode,
      nameAr: entity.nameAr,
      nameEn: entity.nameEn,
      parentGroupId: entity.parentGroupId,
      inventoryAccountId: entity.inventoryAccountId,
      salesRevenueAccountId: entity.salesRevenueAccountId,
      cogsAccountId: entity.cogsAccountId,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  ItemGroupsCompanion toDrift() {
    return ItemGroupsCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      groupCode: Value(groupCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      parentGroupId: Value(parentGroupId),
      inventoryAccountId: Value(inventoryAccountId),
      salesRevenueAccountId: Value(salesRevenueAccountId),
      cogsAccountId: Value(cogsAccountId),
      isActive: Value(isActive),
      createdAt: Value(createdAt.millisecondsSinceEpoch ~/ 1000),
      updatedAt: Value(updatedAt.millisecondsSinceEpoch ~/ 1000),
    );
  }
}
