import 'package:equatable/equatable.dart';

enum StocktakingStatus {
  active('Active'),
  completed('Completed'),
  posted('Posted');

  final String value;
  const StocktakingStatus(this.value);

  static StocktakingStatus fromString(String value) {
    return StocktakingStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => StocktakingStatus.active,
    );
  }
}

enum ReservationStatus {
  active('Active'),
  released('Released');

  final String value;
  const ReservationStatus(this.value);

  static ReservationStatus fromString(String value) {
    return ReservationStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => ReservationStatus.active,
    );
  }
}

// Stocktaking Session
class StocktakingSessionEntity extends Equatable {
  final int? id;
  final String sessionNo;
  final int warehouseId;
  final DateTime sessionDate;
  final StocktakingStatus status;
  final String? notes;
  final DateTime? postedAt;
  final String? postedBy;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<StocktakingCountEntity> counts;

  const StocktakingSessionEntity({
    this.id,
    required this.sessionNo,
    required this.warehouseId,
    required this.sessionDate,
    this.status = StocktakingStatus.active,
    this.notes,
    this.postedAt,
    this.postedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.counts = const [],
  });

  bool get canComplete => counts.isNotEmpty && 
      counts.every((c) => c.physicalQuantity != null) &&
      status == StocktakingStatus.active;

  bool get canPost => status == StocktakingStatus.completed;

  int get totalItems => counts.length;
  int get countedItems => counts.where((c) => c.physicalQuantity != null).length;
  double get totalDiscrepancyValue => counts.fold(0.0, (sum, c) => sum + (c.discrepancyValue ?? 0));

  StocktakingSessionEntity copyWith({
    int? id,
    String? sessionNo,
    int? warehouseId,
    DateTime? sessionDate,
    StocktakingStatus? status,
    String? notes,
    DateTime? postedAt,
    String? postedBy,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<StocktakingCountEntity>? counts,
  }) {
    return StocktakingSessionEntity(
      id: id ?? this.id,
      sessionNo: sessionNo ?? this.sessionNo,
      warehouseId: warehouseId ?? this.warehouseId,
      sessionDate: sessionDate ?? this.sessionDate,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      postedAt: postedAt ?? this.postedAt,
      postedBy: postedBy ?? this.postedBy,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      counts: counts ?? this.counts,
    );
  }

  @override
  List<Object?> get props => [
        id,
        sessionNo,
        warehouseId,
        sessionDate,
        status,
        notes,
        postedAt,
        postedBy,
        createdBy,
        createdAt,
        updatedAt,
        counts,
      ];
}

// Stocktaking Count
class StocktakingCountEntity extends Equatable {
  final int? id;
  final int sessionId;
  final int itemId;
  final double bookQuantity;
  final double? physicalQuantity;
  final double? discrepancy;
  final double? discrepancyValue;
  final DateTime? countedAt;
  final String? countedBy;
  final DateTime createdAt;

  const StocktakingCountEntity({
    this.id,
    required this.sessionId,
    required this.itemId,
    required this.bookQuantity,
    this.physicalQuantity,
    this.discrepancy,
    this.discrepancyValue,
    this.countedAt,
    this.countedBy,
    required this.createdAt,
  });

  bool get isCounted => physicalQuantity != null;
  bool get hasDiscrepancy => discrepancy != null && discrepancy != 0;

  StocktakingCountEntity copyWith({
    int? id,
    int? sessionId,
    int? itemId,
    double? bookQuantity,
    double? physicalQuantity,
    double? discrepancy,
    double? discrepancyValue,
    DateTime? countedAt,
    String? countedBy,
    DateTime? createdAt,
  }) {
    return StocktakingCountEntity(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      itemId: itemId ?? this.itemId,
      bookQuantity: bookQuantity ?? this.bookQuantity,
      physicalQuantity: physicalQuantity ?? this.physicalQuantity,
      discrepancy: discrepancy ?? this.discrepancy,
      discrepancyValue: discrepancyValue ?? this.discrepancyValue,
      countedAt: countedAt ?? this.countedAt,
      countedBy: countedBy ?? this.countedBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        sessionId,
        itemId,
        bookQuantity,
        physicalQuantity,
        discrepancy,
        discrepancyValue,
        countedAt,
        countedBy,
        createdAt,
      ];
}

// Stock Reservation
class StockReservationEntity extends Equatable {
  final int? id;
  final int itemId;
  final int warehouseId;
  final double reservedQuantity;
  final DateTime reservationEndDate;
  final String? notes;
  final ReservationStatus status;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  const StockReservationEntity({
    this.id,
    required this.itemId,
    required this.warehouseId,
    required this.reservedQuantity,
    required this.reservationEndDate,
    this.notes,
    this.status = ReservationStatus.active,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isExpired => DateTime.now().isAfter(reservationEndDate);
  bool get isActive => status == ReservationStatus.active && !isExpired;

  StockReservationEntity copyWith({
    int? id,
    int? itemId,
    int? warehouseId,
    double? reservedQuantity,
    DateTime? reservationEndDate,
    String? notes,
    ReservationStatus? status,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StockReservationEntity(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      warehouseId: warehouseId ?? this.warehouseId,
      reservedQuantity: reservedQuantity ?? this.reservedQuantity,
      reservationEndDate: reservationEndDate ?? this.reservationEndDate,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        itemId,
        warehouseId,
        reservedQuantity,
        reservationEndDate,
        notes,
        status,
        createdBy,
        createdAt,
        updatedAt,
      ];
}
