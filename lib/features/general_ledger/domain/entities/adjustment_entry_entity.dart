enum AdjustmentType {
  bankCharges,
  interestEarned,
  errorCorrection,
  other,
}

enum AdjustmentStatus {
  draft,
  pending,
  posted,
  rejected,
}

class AdjustmentEntryEntity {
  final String adjustmentId;
  final String branchId;
  final DateTime adjustmentDate;
  final AdjustmentType adjustmentType;
  final String description;
  final double amount;
  final String accountId;
  final String contraAccountId;
  AdjustmentStatus status;
  final String referenceNumber;
  String? approvedBy;
  DateTime? approvalDate;
  final String createdBy;
  final DateTime createdAt;
  DateTime updatedAt;
  String? journalVoucherId;
  final String? bankStatementId;
  final String? notes;

  AdjustmentEntryEntity({
    required this.adjustmentId,
    required this.branchId,
    required this.adjustmentDate,
    required this.adjustmentType,
    required this.description,
    required this.amount,
    required this.accountId,
    required this.contraAccountId,
    required this.status,
    required this.referenceNumber,
    this.approvedBy,
    this.approvalDate,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.journalVoucherId,
    this.bankStatementId,
    this.notes,
  });
}
