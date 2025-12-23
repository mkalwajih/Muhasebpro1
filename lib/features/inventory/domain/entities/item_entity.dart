import 'package:equatable/equatable.dart';
import 'inventory_config_entity.dart';

enum ItemType {
  stockable('Stockable'),
  service('Service'),
  assembled('Assembled');

  final String value;
  const ItemType(this.value);

  static ItemType fromString(String value) {
    return ItemType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => ItemType.stockable,
    );
  }
}

class ItemEntity extends Equatable {
  final int? id;
  final String itemCode;
  final String nameAr;
  final String nameEn;
  final String? barcode;
  final String? description;
  final ItemType itemType;
  final int itemGroupId;
  final String baseUnit;
  final CostingMethod? costingMethod;
  final double costPrice;
  final double? reorderLevel;
  final double? maxStockLevel;
  final double? minStockLevel;
  final bool trackExpiryDate;
  final bool trackBatchNumber;
  final String? inventoryAccountId;
  final String? salesRevenueAccountId;
  final String? cogsAccountId;
  final String? stockDiscrepancyAccountId;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ItemEntity({
    this.id,
    required this.itemCode,
    required this.nameAr,
    required this.nameEn,
    this.barcode,
    this.description,
    required this.itemType,
    required this.itemGroupId,
    required this.baseUnit,
    this.costingMethod,
    this.costPrice = 0,
    this.reorderLevel,
    this.maxStockLevel,
    this.minStockLevel,
    this.trackExpiryDate = false,
    this.trackBatchNumber = false,
    this.inventoryAccountId,
    this.salesRevenueAccountId,
    this.cogsAccountId,
    this.stockDiscrepancyAccountId,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
  });

  ItemEntity copyWith({
    int? id,
    String? itemCode,
    String? nameAr,
    String? nameEn,
    String? barcode,
    String? description,
    ItemType? itemType,
    int? itemGroupId,
    String? baseUnit,
    CostingMethod? costingMethod,
    double? costPrice,
    double? reorderLevel,
    double? maxStockLevel,
    double? minStockLevel,
    bool? trackExpiryDate,
    bool? trackBatchNumber,
    String? inventoryAccountId,
    String? salesRevenueAccountId,
    String? cogsAccountId,
    String? stockDiscrepancyAccountId,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ItemEntity(
      id: id ?? this.id,
      itemCode: itemCode ?? this.itemCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      barcode: barcode ?? this.barcode,
      description: description ?? this.description,
      itemType: itemType ?? this.itemType,
      itemGroupId: itemGroupId ?? this.itemGroupId,
      baseUnit: baseUnit ?? this.baseUnit,
      costingMethod: costingMethod ?? this.costingMethod,
      costPrice: costPrice ?? this.costPrice,
      reorderLevel: reorderLevel ?? this.reorderLevel,
      maxStockLevel: maxStockLevel ?? this.maxStockLevel,
      minStockLevel: minStockLevel ?? this.minStockLevel,
      trackExpiryDate: trackExpiryDate ?? this.trackExpiryDate,
      trackBatchNumber: trackBatchNumber ?? this.trackBatchNumber,
      inventoryAccountId: inventoryAccountId ?? this.inventoryAccountId,
      salesRevenueAccountId: salesRevenueAccountId ?? this.salesRevenueAccountId,
      cogsAccountId: cogsAccountId ?? this.cogsAccountId,
      stockDiscrepancyAccountId: stockDiscrepancyAccountId ?? this.stockDiscrepancyAccountId,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        itemCode,
        nameAr,
        nameEn,
        barcode,
        description,
        itemType,
        itemGroupId,
        baseUnit,
        costingMethod,
        costPrice,
        reorderLevel,
        maxStockLevel,
        minStockLevel,
        trackExpiryDate,
        trackBatchNumber,
        inventoryAccountId,
        salesRevenueAccountId,
        cogsAccountId,
        stockDiscrepancyAccountId,
        isActive,
        createdAt,
        updatedAt,
      ];
}

class ItemSubUnitEntity extends Equatable {
  final int? id;
  final int itemId;
  final String unitName;
  final double conversionFactor;
  final DateTime createdAt;

  const ItemSubUnitEntity({
    this.id,
    required this.itemId,
    required this.unitName,
    required this.conversionFactor,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, itemId, unitName, conversionFactor, createdAt];
}

class ItemSellingPriceEntity extends Equatable {
  final int? id;
  final int itemId;
  final String priceLevelName;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ItemSellingPriceEntity({
    this.id,
    required this.itemId,
    required this.priceLevelName,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, itemId, priceLevelName, price, createdAt, updatedAt];
}

class ItemPromotionalPriceEntity extends Equatable {
  final int? id;
  final int itemSellingPriceId;
  final double promoPrice;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;

  const ItemPromotionalPriceEntity({
    this.id,
    required this.itemSellingPriceId,
    required this.promoPrice,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, itemSellingPriceId, promoPrice, startDate, endDate, createdAt];
}

class ItemAttachmentEntity extends Equatable {
  final int? id;
  final int itemId;
  final String fileName;
  final String filePath;
  final String fileType;
  final DateTime createdAt;

  const ItemAttachmentEntity({
    this.id,
    required this.itemId,
    required this.fileName,
    required this.filePath,
    required this.fileType,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, itemId, fileName, filePath, fileType, createdAt];
}

class OpeningStockEntity extends Equatable {
  final int warehouseId;
  final int itemId;
  final double quantity;
  final double unitCost;
  final DateTime? expiryDate;
  final String? batchNumber;

  const OpeningStockEntity({
    required this.warehouseId,
    required this.itemId,
    required this.quantity,
    required this.unitCost,
    this.expiryDate,
    this.batchNumber,
  });

  double get totalCost => quantity * unitCost;

  @override
  List<Object?> get props => [warehouseId, itemId, quantity, unitCost, expiryDate, batchNumber];
}
