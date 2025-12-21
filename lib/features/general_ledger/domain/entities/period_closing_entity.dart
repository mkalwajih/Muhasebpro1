import 'package:equatable/equatable.dart';

enum PeriodClosingStatus {
  open,
  inProgress,
  closed,
  failed
}

enum PeriodType {
  monthly,
  quarterly,
  yearly
}

class PeriodClosingEntity extends Equatable {
  final String id;
  final String periodName;
  final PeriodType periodType;
  final DateTime periodStart;
  final DateTime periodEnd;
  final PeriodClosingStatus status;
  final DateTime? closingDate;
  final String? closedBy;
  final String? closedByName;
  final List<String> preClosingChecks;
  final List<String> completedChecks;
  final List<String> failedChecks;
  final Map<String, dynamic> closingData;
  final String? errorMessage;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PeriodClosingEntity({
    required this.id,
    required this.periodName,
    required this.periodType,
    required this.periodStart,
    required this.periodEnd,
    required this.status,
    this.closingDate,
    this.closedBy,
    this.closedByName,
    required this.preClosingChecks,
    required this.completedChecks,
    required this.failedChecks,
    required this.closingData,
    this.errorMessage,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        periodName,
        periodType,
        periodStart,
        periodEnd,
        status,
        closingDate,
        closedBy,
        closedByName,
        preClosingChecks,
        completedChecks,
        failedChecks,
        closingData,
        errorMessage,
        createdAt,
        updatedAt,
      ];

  PeriodClosingEntity copyWith({
    String? id,
    String? periodName,
    PeriodType? periodType,
    DateTime? periodStart,
    DateTime? periodEnd,
    PeriodClosingStatus? status,
    DateTime? closingDate,
    String? closedBy,
    String? closedByName,
    List<String>? preClosingChecks,
    List<String>? completedChecks,
    List<String>? failedChecks,
    Map<String, dynamic>? closingData,
    String? errorMessage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PeriodClosingEntity(
      id: id ?? this.id,
      periodName: periodName ?? this.periodName,
      periodType: periodType ?? this.periodType,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      status: status ?? this.status,
      closingDate: closingDate ?? this.closingDate,
      closedBy: closedBy ?? this.closedBy,
      closedByName: closedByName ?? this.closedByName,
      preClosingChecks: preClosingChecks ?? this.preClosingChecks,
      completedChecks: completedChecks ?? this.completedChecks,
      failedChecks: failedChecks ?? this.failedChecks,
      closingData: closingData ?? this.closingData,
      errorMessage: errorMessage ?? this.errorMessage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  bool get isOpen => status == PeriodClosingStatus.open;
  bool get isClosed => status == PeriodClosingStatus.closed;
  bool get isInProgress => status == PeriodClosingStatus.inProgress;
  bool get hasFailed => status == PeriodClosingStatus.failed;
  bool get canBeClosed => status == PeriodClosingStatus.open && failedChecks.isEmpty;
  bool get canBeReopened => status == PeriodClosingStatus.closed;
  
  double get checksProgress {
    if (preClosingChecks.isEmpty) return 100.0;
    return (completedChecks.length / preClosingChecks.length) * 100;
  }
  
  bool get allChecksCompleted => completedChecks.length == preClosingChecks.length && failedChecks.isEmpty;
}