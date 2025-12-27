import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/item_group_entity.dart';

class ItemGroupModel extends ItemGroupEntity {
  const ItemGroupModel({
    required super.id,
    required super.groupCode,
    required super.nameAr,
    required super.nameEn,
    super.parentGroupId,
    required super.inventoryAccountId,
    required super.salesRevenueAccountId,
    required super.cogsAccountId,
    required super.isActive,
  });

  // Fixed: Changed ItemGroupData to ItemGroup
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
    );
  }

  ItemGroupsCompanion toCompanion() {
    return ItemGroupsCompanion(
      groupCode: Value(groupCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      parentGroupId: Value(parentGroupId),
      inventoryAccountId: Value(inventoryAccountId),
      salesRevenueAccountId: Value(salesRevenueAccountId),
      cogsAccountId: Value(cogsAccountId),
      isActive: Value(isActive),
    );
  }
}
