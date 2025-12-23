import 'package:equatable/equatable.dart';

class WarehouseEntity extends Equatable {
  final int? id;
  final String warehouseCode;
  final String nameAr;
  final String nameEn;
  final int branchId;
  final String inventoryAccountId;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const WarehouseEntity({
    this.id,
    required this.warehouseCode,
    required this.nameAr,
    required this.nameEn,
    required this.branchId,
    required this.inventoryAccountId,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
  });

  WarehouseEntity copyWith({
    int? id,
    String? warehouseCode,
    String? nameAr,
    String? nameEn,
    int? branchId,
    String? inventoryAccountId,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WarehouseEntity(
      id: id ?? this.id,
      warehouseCode: warehouseCode ?? this.warehouseCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      branchId: branchId ?? this.branchId,
      inventoryAccountId: inventoryAccountId ?? this.inventoryAccountId,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        warehouseCode,
        nameAr,
        nameEn,
        branchId,
        inventoryAccountId,
        isActive,
        createdAt,
        updatedAt,
      ];
}
