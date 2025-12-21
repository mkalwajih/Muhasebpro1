import 'package:equatable/equatable.dart';

/// Base entity for all voucher types in the General Ledger system
/// Provides common properties and validation for Journal, Payment, and Receipt vouchers
abstract class VoucherBaseEntity extends Equatable {
  const VoucherBaseEntity({
    required this.voucherId,
    required this.branchId,
    required this.docTypeCode,
    required this.docNo,
    required this.date,
    required this.description,
    this.refCode,
    required this.status,
    this.postedAt,
    this.postedBy,
    this.reversedAt,
    this.reversedBy,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  final String voucherId;
  final String branchId;
  final String docTypeCode;
  final String docNo;
  final DateTime date;
  final String description;
  final String? refCode;
  final VoucherStatus status;
  final DateTime? postedAt;
  final String? postedBy;
  final DateTime? reversedAt;
  final String? reversedBy;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Validates the voucher entity
  bool get isValid {
    return voucherId.isNotEmpty &&
        branchId.isNotEmpty &&
        docTypeCode.isNotEmpty &&
        docNo.isNotEmpty &&
        description.isNotEmpty &&
        createdBy.isNotEmpty;
  }

  /// Checks if the voucher can be edited
  bool get canEdit => status == VoucherStatus.draft;

  /// Checks if the voucher can be posted
  bool get canPost => status == VoucherStatus.draft && isValid;

  /// Checks if the voucher can be reversed
  bool get canReverse => status == VoucherStatus.posted;

  /// Checks if the voucher can be deleted
  bool get canDelete => status == VoucherStatus.draft;

  /// Returns the display name for the voucher
  String get displayName => '$docTypeCode-$docNo';

  @override
  List<Object?> get props => [
        voucherId,
        branchId,
        docTypeCode,
        docNo,
        date,
        description,
        refCode,
        status,
        postedAt,
        postedBy,
        reversedAt,
        reversedBy,
        createdBy,
        createdAt,
        updatedAt,
      ];
}

/// Voucher status enumeration
enum VoucherStatus {
  draft('Draft'),
  posted('Posted'),
  reversed('Reversed');

  const VoucherStatus(this.displayName);

  final String displayName;

  /// Creates VoucherStatus from string
  static VoucherStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'draft':
        return VoucherStatus.draft;
      case 'posted':
        return VoucherStatus.posted;
      case 'reversed':
        return VoucherStatus.reversed;
      default:
        throw ArgumentError('Invalid voucher status: $value');
    }
  }

  /// Converts to string for database storage
  String toDbString() {
    switch (this) {
      case VoucherStatus.draft:
        return 'Draft';
      case VoucherStatus.posted:
        return 'Posted';
      case VoucherStatus.reversed:
        return 'Reversed';
    }
  }
}

/// Payment method enumeration for Payment and Receipt vouchers
enum PaymentMethod {
  cash('Cash'),
  check('Check'),
  transfer('Transfer');

  const PaymentMethod(this.displayName);

  final String displayName;

  /// Creates PaymentMethod from string
  static PaymentMethod fromString(String value) {
    switch (value.toLowerCase()) {
      case 'cash':
        return PaymentMethod.cash;
      case 'check':
        return PaymentMethod.check;
      case 'transfer':
        return PaymentMethod.transfer;
      default:
        throw ArgumentError('Invalid payment method: $value');
    }
  }

  /// Converts to string for database storage
  String toDbString() {
    switch (this) {
      case PaymentMethod.cash:
        return 'Cash';
      case PaymentMethod.check:
        return 'Check';
      case PaymentMethod.transfer:
        return 'Transfer';
    }
  }
}

/// Base class for voucher line items
abstract class VoucherLineBaseEntity extends Equatable {
  const VoucherLineBaseEntity({
    required this.lineId,
    required this.voucherId,
    required this.lineNumber,
    required this.accountId,
    required this.amount,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final String lineId;
  final String voucherId;
  final int lineNumber;
  final String accountId;
  final double amount;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Validates the line item
  bool get isValid {
    return lineId.isNotEmpty &&
        voucherId.isNotEmpty &&
        lineNumber > 0 &&
        accountId.isNotEmpty &&
        amount > 0;
  }

  @override
  List<Object?> get props => [
        lineId,
        voucherId,
        lineNumber,
        accountId,
        amount,
        description,
        createdAt,
        updatedAt,
      ];
}