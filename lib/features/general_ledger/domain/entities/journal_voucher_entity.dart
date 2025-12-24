
import 'voucher_base_entity.dart';

/// Journal Voucher entity for general ledger transactions
/// Supports master-detail structure with debit/credit entries
class JournalVoucherEntity extends VoucherBaseEntity {
  const JournalVoucherEntity({
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
    required this.totalDebit,
    required this.totalCredit,
    this.isReversing = false,
    this.isPeriodic = false,
    this.lines = const [],
    this.attachments = const [],
  });

  final double totalDebit;
  final double totalCredit;
  final bool isReversing;
  final bool isPeriodic;
  final List<JournalVoucherLineEntity> lines;
  final List<String> attachments; // File paths or URLs

  /// Validates the journal voucher
  @override
  bool get isValid {
    return super.isValid &&
        lines.isNotEmpty &&
        isBalanced &&
        lines.every((line) => line.isValid);
  }

  /// Checks if the voucher is balanced (total debit = total credit)
  bool get isBalanced {
    final calculatedDebit = lines.fold<double>(
      0.0,
      (sum, line) => sum + line.debit,
    );
    final calculatedCredit = lines.fold<double>(
      0.0,
      (sum, line) => sum + line.credit,
    );
    
    return (calculatedDebit - calculatedCredit).abs() < 0.01 &&
           (totalDebit - calculatedDebit).abs() < 0.01 &&
           (totalCredit - calculatedCredit).abs() < 0.01;
  }

  /// Gets the balance difference (should be zero for valid vouchers)
  double get balanceDifference => totalDebit - totalCredit;

  /// Creates a copy with updated values
  JournalVoucherEntity copyWith({
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
    double? totalDebit,
    double? totalCredit,
    bool? isReversing,
    bool? isPeriodic,
    List<JournalVoucherLineEntity>? lines,
    List<String>? attachments,
  }) {
    return JournalVoucherEntity(
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
      totalDebit: totalDebit ?? this.totalDebit,
      totalCredit: totalCredit ?? this.totalCredit,
      isReversing: isReversing ?? this.isReversing,
      isPeriodic: isPeriodic ?? this.isPeriodic,
      lines: lines ?? this.lines,
      attachments: attachments ?? this.attachments,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        totalDebit,
        totalCredit,
        isReversing,
        isPeriodic,
        lines,
        attachments,
      ];
}

/// Journal Voucher Line entity for individual debit/credit entries
class JournalVoucherLineEntity extends VoucherLineBaseEntity {
  const JournalVoucherLineEntity({
    required super.lineId,
    required super.voucherId,
    required super.lineNumber,
    required super.accountId,
    required super.amount,
    super.description,
    required super.createdAt,
    required super.updatedAt,
    required this.debit,
    required this.credit,
    this.currencyCode = 'USD',
    this.exchangeRate = 1.0,
    this.foreignDebit = 0.0,
    this.foreignCredit = 0.0,
    this.costCenterId,
  });

  final double debit;
  final double credit;
  final String currencyCode;
  final double exchangeRate;
  final double foreignDebit;
  final double foreignCredit;
  final String? costCenterId;

  /// Validates the journal voucher line
  @override
  bool get isValid {
    return super.isValid &&
        (debit > 0 || credit > 0) &&
        (debit == 0 || credit == 0) && // Either debit or credit, not both
        exchangeRate > 0;
  }

  /// Checks if this is a debit entry
  bool get isDebit => debit > 0;

  /// Checks if this is a credit entry
  bool get isCredit => credit > 0;

  /// Checks if this line uses foreign currency
  bool get isForeignCurrency => currencyCode != 'USD' && exchangeRate != 1.0;

  /// Gets the effective amount (debit or credit)
  @override
  double get amount => isDebit ? debit : credit;

  /// Gets the foreign amount (if applicable)
  double get foreignAmount => isDebit ? foreignDebit : foreignCredit;

  /// Creates a copy with updated values
  JournalVoucherLineEntity copyWith({
    String? lineId,
    String? voucherId,
    int? lineNumber,
    String? accountId,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? debit,
    double? credit,
    String? currencyCode,
    double? exchangeRate,
    double? foreignDebit,
    double? foreignCredit,
    String? costCenterId,
  }) {
    return JournalVoucherLineEntity(
      lineId: lineId ?? this.lineId,
      voucherId: voucherId ?? this.voucherId,
      lineNumber: lineNumber ?? this.lineNumber,
      accountId: accountId ?? this.accountId,
      amount: amount, // Calculated from debit/credit
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      debit: debit ?? this.debit,
      credit: credit ?? this.credit,
      currencyCode: currencyCode ?? this.currencyCode,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      foreignDebit: foreignDebit ?? this.foreignDebit,
      foreignCredit: foreignCredit ?? this.foreignCredit,
      costCenterId: costCenterId ?? this.costCenterId,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        debit,
        credit,
        currencyCode,
        exchangeRate,
        foreignDebit,
        foreignCredit,
        costCenterId,
      ];
}