import 'package:equatable/equatable.dart';

enum PostingBatchStatus {
  draft,
  inProgress,
  completed,
  failed,
  cancelled
}

class PostingBatchEntity extends Equatable {
  final String id;
  final String batchNumber;
  final PostingBatchStatus status;
  final DateTime batchDate;
  final String description;
  final List<String> voucherIds;
  final int totalVouchers;
  final int processedVouchers;
  final int failedVouchers;
  final double totalAmount;
  final String? errorMessage;
  final String createdBy;
  final String createdByName;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final DateTime updatedAt;

  const PostingBatchEntity({
    required this.id,
    required this.batchNumber,
    required this.status,
    required this.batchDate,
    required this.description,
    required this.voucherIds,
    required this.totalVouchers,
    required this.processedVouchers,
    required this.failedVouchers,
    required this.totalAmount,
    this.errorMessage,
    required this.createdBy,
    required this.createdByName,
    required this.createdAt,
    this.startedAt,
    this.completedAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        batchNumber,
        status,
        batchDate,
        description,
        voucherIds,
        totalVouchers,
        processedVouchers,
        failedVouchers,
        totalAmount,
        errorMessage,
        createdBy,
        createdByName,
        createdAt,
        startedAt,
        completedAt,
        updatedAt,
      ];

  PostingBatchEntity copyWith({
    String? id,
    String? batchNumber,
    PostingBatchStatus? status,
    DateTime? batchDate,
    String? description,
    List<String>? voucherIds,
    int? totalVouchers,
    int? processedVouchers,
    int? failedVouchers,
    double? totalAmount,
    String? errorMessage,
    String? createdBy,
    String? createdByName,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime? updatedAt,
  }) {
    return PostingBatchEntity(
      id: id ?? this.id,
      batchNumber: batchNumber ?? this.batchNumber,
      status: status ?? this.status,
      batchDate: batchDate ?? this.batchDate,
      description: description ?? this.description,
      voucherIds: voucherIds ?? this.voucherIds,
      totalVouchers: totalVouchers ?? this.totalVouchers,
      processedVouchers: processedVouchers ?? this.processedVouchers,
      failedVouchers: failedVouchers ?? this.failedVouchers,
      totalAmount: totalAmount ?? this.totalAmount,
      errorMessage: errorMessage ?? this.errorMessage,
      createdBy: createdBy ?? this.createdBy,
      createdByName: createdByName ?? this.createdByName,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  bool get isInProgress => status == PostingBatchStatus.inProgress;
  bool get isCompleted => status == PostingBatchStatus.completed;
  bool get hasFailed => status == PostingBatchStatus.failed;
  bool get canBeStarted => status == PostingBatchStatus.draft;
  bool get canBeCancelled => status == PostingBatchStatus.draft || status == PostingBatchStatus.inProgress;
  
  double get progressPercentage {
    if (totalVouchers == 0) return 0.0;
    return (processedVouchers / totalVouchers) * 100;
  }
}