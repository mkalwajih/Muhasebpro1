import 'voucher_base_entity.dart';

/// Receipt Voucher entity for simplified receipt transactions
/// Automatically generates balanced journal entries upon posting
class ReceiptVoucherEntity extends VoucherBaseEntity {
  const ReceiptVoucherEntity({
    required super.voucherId,
    required super.branchId,
    required super.docTypeCode,
    required super.docNo,
    required super.date,
    required super.description,
    super.refCode,
    required super.status,
    super.postedAt,
    super.postedBy,
    super.reversedAt,
    super.reversedBy,
    required super.createdBy,
    required super.createdAt,
    required super.updatedAt,
    required this.receiptToAccountId,
    required this.totalAmount,
    required this.payerName,
    required this.paymentMethod,
    this.journalVoucherId,
    this.lines = const [],
  });

  final String receiptToAccountId; // Cash/Bank account (Debit side)
  final double totalAmount;
  final String payerName;
  final PaymentMethod paymentMethod;
  final String? journalVoucherId; // Generated journal voucher
  final List<ReceiptVoucherLineEntity> lines;

  /// Validates the receipt voucher
  @override
  bool get isValid {
    return super.isValid &&
        receiptToAccountId.isNotEmpty &&
        totalAmount > 0 &&
        payerName.isNotEmpty &&
        lines.isNotEmpty &&
        isAmountBalanced &&
        lines.every((line) => line.isValid);
  }

  /// Checks if total amount matches sum of line amounts
  bool get isAmountBalanced {
    final calculatedTotal = lines.fold<double>(
      0.0,
      (sum, line) => sum + line.amount,
    );
    return (totalAmount - calculatedTotal).abs() < 0.01;
  }

  /// Gets the amount difference (should be zero for valid vouchers)
  double get amountDifference {
    final calculatedTotal = lines.fold<double>(
      0.0,
      (sum, line) => sum + line.amount,
    );
    return totalAmount - calculatedTotal;
  }

  /// Creates a copy with updated values
  ReceiptVoucherEntity copyWith({
    String? voucherId,
    String? branchId,
    String? docTypeCode,
    String? docNo,
    DateTime? date,
    String? description,
    String? refCode,
    VoucherStatus? status,
    DateTime? postedAt,
    String? postedBy,
    DateTime? reversedAt,
    String? reversedBy,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? receiptToAccountId,
    double? totalAmount,
    String? payerName,
    PaymentMethod? paymentMethod,
    String? journalVoucherId,
    List<ReceiptVoucherLineEntity>? lines,
  }) {
    return ReceiptVoucherEntity(
      voucherId: voucherId ?? this.voucherId,
      branchId: branchId ?? this.branchId,
      docTypeCode: docTypeCode ?? this.docTypeCode,
      docNo: docNo ?? this.docNo,
      date: date ?? this.date,
      description: description ?? this.description,
      refCode: refCode ?? this.refCode,
      status: status ?? this.status,
      postedAt: postedAt ?? this.postedAt,
      postedBy: postedBy ?? this.postedBy,
      reversedAt: reversedAt ?? this.reversedAt,
      reversedBy: reversedBy ?? this.reversedBy,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      receiptToAccountId: receiptToAccountId ?? this.receiptToAccountId,
      totalAmount: totalAmount ?? this.totalAmount,
      payerName: payerName ?? this.payerName,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      journalVoucherId: journalVoucherId ?? this.journalVoucherId,
      lines: lines ?? this.lines,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        receiptToAccountId,
        totalAmount,
        payerName,
        paymentMethod,
        journalVoucherId,
        lines,
      ];
}

/// Receipt Voucher Line entity for credit accounts
class ReceiptVoucherLineEntity extends VoucherLineBaseEntity {
  const ReceiptVoucherLineEntity({
    required super.lineId,
    required super.voucherId,
    required super.lineNumber,
    required super.accountId,
    required super.amount,
    super.description,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Creates a copy with updated values
  ReceiptVoucherLineEntity copyWith({
    String? lineId,
    String? voucherId,
    int? lineNumber,
    String? accountId,
    double? amount,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReceiptVoucherLineEntity(
      lineId: lineId ?? this.lineId,
      voucherId: voucherId ?? this.voucherId,
      lineNumber: lineNumber ?? this.lineNumber,
      accountId: accountId ?? this.accountId,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}