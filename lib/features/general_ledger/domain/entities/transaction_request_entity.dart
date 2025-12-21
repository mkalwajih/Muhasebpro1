import 'package:equatable/equatable.dart';

enum TransactionRequestStatus {
  draft,
  pendingApproval,
  approved,
  rejected,
  cancelled
}

enum TransactionRequestType {
  journalVoucher,
  paymentVoucher,
  receiptVoucher,
  adjustmentEntry
}

class TransactionRequestEntity extends Equatable {
  final String id;
  final String requestNumber;
  final TransactionRequestType type;
  final TransactionRequestStatus status;
  final String requesterId;
  final String requesterName;
  final String? approverId;
  final String? approverName;
  final DateTime requestDate;
  final DateTime? approvalDate;
  final String description;
  final double totalAmount;
  final String? voucherId;
  final String? rejectionReason;
  final Map<String, dynamic> requestData;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TransactionRequestEntity({
    required this.id,
    required this.requestNumber,
    required this.type,
    required this.status,
    required this.requesterId,
    required this.requesterName,
    this.approverId,
    this.approverName,
    required this.requestDate,
    this.approvalDate,
    required this.description,
    required this.totalAmount,
    this.voucherId,
    this.rejectionReason,
    required this.requestData,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        requestNumber,
        type,
        status,
        requesterId,
        requesterName,
        approverId,
        approverName,
        requestDate,
        approvalDate,
        description,
        totalAmount,
        voucherId,
        rejectionReason,
        requestData,
        notes,
        createdAt,
        updatedAt,
      ];

  TransactionRequestEntity copyWith({
    String? id,
    String? requestNumber,
    TransactionRequestType? type,
    TransactionRequestStatus? status,
    String? requesterId,
    String? requesterName,
    String? approverId,
    String? approverName,
    DateTime? requestDate,
    DateTime? approvalDate,
    String? description,
    double? totalAmount,
    String? voucherId,
    String? rejectionReason,
    Map<String, dynamic>? requestData,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionRequestEntity(
      id: id ?? this.id,
      requestNumber: requestNumber ?? this.requestNumber,
      type: type ?? this.type,
      status: status ?? this.status,
      requesterId: requesterId ?? this.requesterId,
      requesterName: requesterName ?? this.requesterName,
      approverId: approverId ?? this.approverId,
      approverName: approverName ?? this.approverName,
      requestDate: requestDate ?? this.requestDate,
      approvalDate: approvalDate ?? this.approvalDate,
      description: description ?? this.description,
      totalAmount: totalAmount ?? this.totalAmount,
      voucherId: voucherId ?? this.voucherId,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      requestData: requestData ?? this.requestData,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  bool get canBeApproved => status == TransactionRequestStatus.pendingApproval;
  bool get canBeRejected => status == TransactionRequestStatus.pendingApproval;
  bool get canBeCancelled => status == TransactionRequestStatus.draft || status == TransactionRequestStatus.pendingApproval;
  bool get isProcessed => status == TransactionRequestStatus.approved || status == TransactionRequestStatus.rejected;
}