import 'package:equatable/equatable.dart';

class ItemGroupEntity extends Equatable {
  final int? id;
  final String groupCode;
  final String nameAr;
  final String nameEn;
  final int? parentGroupId;
  final String inventoryAccountId;
  final String salesRevenueAccountId;
  final String cogsAccountId;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ItemGroupEntity({
    this.id,
    required this.groupCode,
    required this.nameAr,
    required this.nameEn,
    this.parentGroupId,
    required this.inventoryAccountId,
    required this.salesRevenueAccountId,
    required this.cogsAccountId,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
  });

  ItemGroupEntity copyWith({
    int? id,
    String? groupCode,
    String? nameAr,
    String? nameEn,
    int? parentGroupId,
    String? inventoryAccountId,
    String? salesRevenueAccountId,
    String? cogsAccountId,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ItemGroupEntity(
      id: id ?? this.id,
      groupCode: groupCode ?? this.groupCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      parentGroupId: parentGroupId ?? this.parentGroupId,
      inventoryAccountId: inventoryAccountId ?? this.inventoryAccountId,
      salesRevenueAccountId: salesRevenueAccountId ?? this.salesRevenueAccountId,
      cogsAccountId: cogsAccountId ?? this.cogsAccountId,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        groupCode,
        nameAr,
        nameEn,
        parentGroupId,
        inventoryAccountId,
        salesRevenueAccountId,
        cogsAccountId,
        isActive,
        createdAt,
        updatedAt,
      ];
}
