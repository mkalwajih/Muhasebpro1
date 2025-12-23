import 'package:drift/drift.dart' as drift;
import '../../../../core/db/app_database.dart';
import '../../domain/entities/item_group_entity.dart';

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
    super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ItemGroupModel.fromEntity(ItemGroupEntity entity) {
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

  factory ItemGroupModel.fromDrift(ItemGroupData data) {
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
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  ItemGroupsCompanion toDrift() {
    return ItemGroupsCompanion(
      id: id != null ? drift.Value(id!) : const drift.Value.absent(),
      groupCode: drift.Value(groupCode),
      nameAr: drift.Value(nameAr),
      nameEn: drift.Value(nameEn),
      parentGroupId: drift.Value(parentGroupId),
      inventoryAccountId: drift.Value(inventoryAccountId),
      salesRevenueAccountId: drift.Value(salesRevenueAccountId),
      cogsAccountId: drift.Value(cogsAccountId),
      isActive: drift.Value(isActive),
      createdAt: drift.Value(createdAt.millisecondsSinceEpoch),
      updatedAt: drift.Value(updatedAt.millisecondsSinceEpoch),
    );
  }
}
