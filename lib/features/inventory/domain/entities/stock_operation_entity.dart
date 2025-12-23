import 'package:equatable/equatable.dart';

enum StockOperationStatus {
  draft('Draft'),
  posted('Posted');

  final String value;
  const StockOperationStatus(this.value);

  static StockOperationStatus fromString(String value) {
    return StockOperationStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => StockOperationStatus.draft,
    );
  }
}

enum TransferStatus {
  draft('Draft'),
  dispatched('Dispatched'),
  received('Received');

  final String value;
  const TransferStatus(this.value);

  static TransferStatus fromString(String value) {
    return TransferStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TransferStatus.draft,
    );
  }
}

// Incoming Stock Order
class IncomingStockOrderEntity extends Equatable {
  final int? id;
  final String docNo;
  final DateTime docDate;
  final int warehouseId;
  final String? supplierId;
  final String? refNo;
  final String? notes;
  final StockOperationStatus status;
  final DateTime? postedAt;
  final String? postedBy;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<IncomingStockOrderLineEntity> lines;

  const IncomingStockOrderEntity({
    this.id,
    required this.docNo,
    required this.docDate,
    required this.warehouseId,
    this.supplierId,
    this.refNo,
    this.notes,
    this.status = StockOperationStatus.draft,
    this.postedAt,
    this.postedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.lines = const [],
  });

  double get totalCost => lines.fold(0.0, (sum, line) => sum + line.totalCost);

  bool get canPost => lines.isNotEmpty && status == StockOperationStatus.draft;

  IncomingStockOrderEntity copyWith({
    int? id,
    String? docNo,
    DateTime? docDate,
    int? warehouseId,
    String? supplierId,
    String? refNo,
    String? notes,
    StockOperationStatus? status,
    DateTime? postedAt,
    String? postedBy,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<IncomingStockOrderLineEntity>? lines,
  }) {
    return IncomingStockOrderEntity(
      id: id ?? this.id,
      docNo: docNo ?? this.docNo,
      docDate: docDate ?? this.docDate,
      warehouseId: warehouseId ?? this.warehouseId,
      supplierId: supplierId ?? this.supplierId,
      refNo: refNo ?? this.refNo,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      postedAt: postedAt ?? this.postedAt,
      postedBy: postedBy ?? this.postedBy,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lines: lines ?? this.lines,
    );
  }

  @override
  List<Object?> get props => [
        id,
        docNo,
        docDate,
        warehouseId,
        supplierId,
        refNo,
        notes,
        status,
        postedAt,
        postedBy,
        createdBy,
        createdAt,
        updatedAt,
        lines,
      ];
}

class IncomingStockOrderLineEntity extends Equatable {
  final int? id;
  final int orderId;
  final int itemId;
  final double quantity;
  final double unitCost;
  final double totalCost;
  final DateTime? expiryDate;
  final String? batchNumber;
  final DateTime createdAt;

  const IncomingStockOrderLineEntity({
    this.id,
    required this.orderId,
    required this.itemId,
    required this.quantity,
    required this.unitCost,
    required this.totalCost,
    this.expiryDate,
    this.batchNumber,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        orderId,
        itemId,
        quantity,
        unitCost,
        totalCost,
        expiryDate,
        batchNumber,
        createdAt,
      ];
}

// Outgoing Stock Order
class OutgoingStockOrderEntity extends Equatable {
  final int? id;
  final String docNo;
  final DateTime docDate;
  final int warehouseId;
  final String reason;
  final String beneficiaryAccountId;
  final String? notes;
  final StockOperationStatus status;
  final DateTime? postedAt;
  final String? postedBy;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OutgoingStockOrderLineEntity> lines;

  const OutgoingStockOrderEntity({
    this.id,
    required this.docNo,
    required this.docDate,
    required this.warehouseId,
    required this.reason,
    required this.beneficiaryAccountId,
    this.notes,
    this.status = StockOperationStatus.draft,
    this.postedAt,
    this.postedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.lines = const [],
  });

  double get totalCost => lines.fold(0.0, (sum, line) => sum + line.totalCost);

  bool get canPost => lines.isNotEmpty && status == StockOperationStatus.draft;

  OutgoingStockOrderEntity copyWith({
    int? id,
    String? docNo,
    DateTime? docDate,
    int? warehouseId,
    String? reason,
    String? beneficiaryAccountId,
    String? notes,
    StockOperationStatus? status,
    DateTime? postedAt,
    String? postedBy,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<OutgoingStockOrderLineEntity>? lines,
  }) {
    return OutgoingStockOrderEntity(
      id: id ?? this.id,
      docNo: docNo ?? this.docNo,
      docDate: docDate ?? this.docDate,
      warehouseId: warehouseId ?? this.warehouseId,
      reason: reason ?? this.reason,
      beneficiaryAccountId: beneficiaryAccountId ?? this.beneficiaryAccountId,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      postedAt: postedAt ?? this.postedAt,
      postedBy: postedBy ?? this.postedBy,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lines: lines ?? this.lines,
    );
  }

  @override
  List<Object?> get props => [
        id,
        docNo,
        docDate,
        warehouseId,
        reason,
        beneficiaryAccountId,
        notes,
        status,
        postedAt,
        postedBy,
        createdBy,
        createdAt,
        updatedAt,
        lines,
      ];
}

class OutgoingStockOrderLineEntity extends Equatable {
  final int? id;
  final int orderId;
  final int itemId;
  final double quantity;
  final double unitCost;
  final double totalCost;
  final DateTime createdAt;

  const OutgoingStockOrderLineEntity({
    this.id,
    required this.orderId,
    required this.itemId,
    required this.quantity,
    required this.unitCost,
    required this.totalCost,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        orderId,
        itemId,
        quantity,
        unitCost,
        totalCost,
        createdAt,
      ];
}

// Warehouse Transfer
class WarehouseTransferEntity extends Equatable {
  final int? id;
  final String docNo;
  final DateTime transferDate;
  final int sourceWarehouseId;
  final int destinationWarehouseId;
  final String? refNo;
  final String? notes;
  final TransferStatus status;
  final DateTime? dispatchedAt;
  final String? dispatchedBy;
  final DateTime? receivedAt;
  final String? receivedBy;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<WarehouseTransferLineEntity> lines;

  const WarehouseTransferEntity({
    this.id,
    required this.docNo,
    required this.transferDate,
    required this.sourceWarehouseId,
    required this.destinationWarehouseId,
    this.refNo,
    this.notes,
    this.status = TransferStatus.draft,
    this.dispatchedAt,
    this.dispatchedBy,
    this.receivedAt,
    this.receivedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.lines = const [],
  });

  double get totalCost => lines.fold(0.0, (sum, line) => sum + line.totalCost);

  bool get canDispatch => lines.isNotEmpty && status == TransferStatus.draft;
  bool get canReceive => status == TransferStatus.dispatched;

  WarehouseTransferEntity copyWith({
    int? id,
    String? docNo,
    DateTime? transferDate,
    int? sourceWarehouseId,
    int? destinationWarehouseId,
    String? refNo,
    String? notes,
    TransferStatus? status,
    DateTime? dispatchedAt,
    String? dispatchedBy,
    DateTime? receivedAt,
    String? receivedBy,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<WarehouseTransferLineEntity>? lines,
  }) {
    return WarehouseTransferEntity(
      id: id ?? this.id,
      docNo: docNo ?? this.docNo,
      transferDate: transferDate ?? this.transferDate,
      sourceWarehouseId: sourceWarehouseId ?? this.sourceWarehouseId,
      destinationWarehouseId: destinationWarehouseId ?? this.destinationWarehouseId,
      refNo: refNo ?? this.refNo,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      dispatchedAt: dispatchedAt ?? this.dispatchedAt,
      dispatchedBy: dispatchedBy ?? this.dispatchedBy,
      receivedAt: receivedAt ?? this.receivedAt,
      receivedBy: receivedBy ?? this.receivedBy,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lines: lines ?? this.lines,
    );
  }

  @override
  List<Object?> get props => [
        id,
        docNo,
        transferDate,
        sourceWarehouseId,
        destinationWarehouseId,
        refNo,
        notes,
        status,
        dispatchedAt,
        dispatchedBy,
        receivedAt,
        receivedBy,
        createdBy,
        createdAt,
        updatedAt,
        lines,
      ];
}

class WarehouseTransferLineEntity extends Equatable {
  final int? id;
  final int transferId;
  final int itemId;
  final double quantity;
  final double unitCost;
  final double totalCost;
  final DateTime createdAt;

  const WarehouseTransferLineEntity({
    this.id,
    required this.transferId,
    required this.itemId,
    required this.quantity,
    required this.unitCost,
    required this.totalCost,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        transferId,
        itemId,
        quantity,
        unitCost,
        totalCost,
        createdAt,
      ];
}
