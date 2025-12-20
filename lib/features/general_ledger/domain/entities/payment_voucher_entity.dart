import 'voucher_base_entity.dart';

/// Payment Voucher entity for simplified payment transactions
/// Automatically generates balanced journal entries upon posting
class PaymentVoucherEntity extends VoucherBaseEntity {
  const PaymentVoucherEntity({
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
    required this.paymentFromAccountId,
    required this.totalAmount,
    required this.payeeName,
    required this.paymentMethod,
    this.checkNo,
    this.journalVoucherId,
    this.lines = const [],
  });

  final String paymentFromAccountId; // Cash/Bank account (Credit side)
  final double totalAmount;
  final String payeeName;
  final PaymentMethod paymentMethod;
  final String? checkNo;
  final String? journalVoucherId; // Generated journal voucher
  final List<PaymentVoucherLineEntity> lines;

  /// Validates the payment voucher
  @override
  bool get isValid {
    return super.isValid &&
        paymentFromAccountId.isNotEmpty &&
        totalAmount > 0 &&
        payeeName.isNotEmpty &&
        lines.isNotEmpty &&
        isAmountBalanced &&
        lines.every((line) => line.isValid) &&
        _validatePaymentMethod();
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

  /// Validates payment method specific requirements
  bool _validatePaymentMethod() {
    switch (paymentMethod) {
      case PaymentMethod.check:
        return checkNo != null && checkNo!.isNotEmpty;
      case PaymentMethod.cash:
      case PaymentMethod.transfer:
        return true;
    }
  }

  /// Creates a copy with updated values
  PaymentVoucherEntity copyWith({
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
    String? paymentFromAccountId,
    double? totalAmount,
    String? payeeName,
    PaymentMethod? paymentMethod,
    String? checkNo,
    String? journalVoucherId,
    List<PaymentVoucherLineEntity>? lines,
  }) {
    return PaymentVoucherEntity(
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
      paymentFromAccountId: paymentFromAccountId ?? this.paymentFromAccountId,
      totalAmount: totalAmount ?? this.totalAmount,
      payeeName: payeeName ?? this.payeeName,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      checkNo: checkNo ?? this.checkNo,
      journalVoucherId: journalVoucherId ?? this.journalVoucherId,
      lines: lines ?? this.lines,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        paymentFromAccountId,
        totalAmount,
        payeeName,
        paymentMethod,
        checkNo,
        journalVoucherId,
        lines,
      ];
}

/// Payment Voucher Line entity for debit accounts
class PaymentVoucherLineEntity extends VoucherLineBaseEntity {
  const PaymentVoucherLineEntity({
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
  PaymentVoucherLineEntity copyWith({
    String? lineId,
    String? voucherId,
    int? lineNumber,
    String? accountId,
    double? amount,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PaymentVoucherLineEntity(
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