import 'package:equatable/equatable.dart';

class BankReconciliationEntity extends Equatable {
  final String reconciliationId;
  final String branchId;
  final String accountId;
  final DateTime reconciliationDate;
  final double bankStatementBalance;
  final double bookBalance;
  final List<BankReconciliationItemEntity> items;
  final String status;
  final String? approvedBy;
  final DateTime? approvalDate;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BankReconciliationEntity({
    required this.reconciliationId,
    required this.branchId,
    required this.accountId,
    required this.reconciliationDate,
    required this.bankStatementBalance,
    required this.bookBalance,
    required this.items,
    required this.status,
    this.approvedBy,
    this.approvalDate,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        reconciliationId,
        branchId,
        accountId,
        reconciliationDate,
        bankStatementBalance,
        bookBalance,
        items,
        status,
        approvedBy,
        approvalDate,
        createdBy,
        createdAt,
        updatedAt,
      ];
}

class BankReconciliationItemEntity extends Equatable {
  final String itemId;
  final String reconciliationId;
  final ReconciliationItemType itemType;
  final String description;
  final double amount;
  final DateTime date;
  final String referenceNumber;
  final bool isCleared;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BankReconciliationItemEntity({
    required this.itemId,
    required this.reconciliationId,
    required this.itemType,
    required this.description,
    required this.amount,
    required this.date,
    required this.referenceNumber,
    required this.isCleared,
    required this.createdAt,
    required this.updatedAt,
  });

  BankReconciliationItemEntity copyWith({
    String? itemId,
    String? reconciliationId,
    ReconciliationItemType? itemType,
    String? description,
    double? amount,
    DateTime? date,
    String? referenceNumber,
    bool? isCleared,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BankReconciliationItemEntity(
      itemId: itemId ?? this.itemId,
      reconciliationId: reconciliationId ?? this.reconciliationId,
      itemType: itemType ?? this.itemType,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      isCleared: isCleared ?? this.isCleared,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        itemId,
        reconciliationId,
        itemType,
        description,
        amount,
        date,
        referenceNumber,
        isCleared,
        createdAt,
        updatedAt,
      ];
}

enum ReconciliationItemType {
  deposit,
  check,
  adjustment,
}
