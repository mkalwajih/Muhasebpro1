import 'package:equatable/equatable.dart';

class BankStatementEntity extends Equatable {
  final String statementId;
  final String branchId;
  final String accountId;
  final DateTime statementDate;
  final double openingBalance;
  final double closingBalance;
  final double totalDebits;
  final double totalCredits;
  final DateTime statementPeriodFrom;
  final DateTime statementPeriodTo;
  final String bankReference;
  final bool isReconciled; // Changed to final
  final List<BankTransactionEntity> transactions;
  final String status;
  final String? reconciledBy; // Changed to final
  final DateTime? reconciledDate; // Changed to final
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt; // Changed to final

  const BankStatementEntity({
    required this.statementId,
    required this.branchId,
    required this.accountId,
    required this.statementDate,
    required this.openingBalance,
    required this.closingBalance,
    required this.totalDebits,
    required this.totalCredits,
    required this.statementPeriodFrom,
    required this.statementPeriodTo,
    required this.bankReference,
    required this.isReconciled,
    required this.transactions,
    required this.status,
    this.reconciledBy,
    this.reconciledDate,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  BankStatementEntity copyWith({
    String? statementId,
    String? branchId,
    String? accountId,
    DateTime? statementDate,
    double? openingBalance,
    double? closingBalance,
    double? totalDebits,
    double? totalCredits,
    DateTime? statementPeriodFrom,
    DateTime? statementPeriodTo,
    String? bankReference,
    bool? isReconciled,
    List<BankTransactionEntity>? transactions,
    String? status,
    String? reconciledBy,
    DateTime? reconciledDate,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BankStatementEntity(
      statementId: statementId ?? this.statementId,
      branchId: branchId ?? this.branchId,
      accountId: accountId ?? this.accountId,
      statementDate: statementDate ?? this.statementDate,
      openingBalance: openingBalance ?? this.openingBalance,
      closingBalance: closingBalance ?? this.closingBalance,
      totalDebits: totalDebits ?? this.totalDebits,
      totalCredits: totalCredits ?? this.totalCredits,
      statementPeriodFrom: statementPeriodFrom ?? this.statementPeriodFrom,
      statementPeriodTo: statementPeriodTo ?? this.statementPeriodTo,
      bankReference: bankReference ?? this.bankReference,
      isReconciled: isReconciled ?? this.isReconciled,
      transactions: transactions ?? this.transactions,
      status: status ?? this.status,
      reconciledBy: reconciledBy ?? this.reconciledBy,
      reconciledDate: reconciledDate ?? this.reconciledDate,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        statementId,
        branchId,
        accountId,
        statementDate,
        openingBalance,
        closingBalance,
        totalDebits,
        totalCredits,
        statementPeriodFrom,
        statementPeriodTo,
        bankReference,
        isReconciled,
        transactions,
        status,
        reconciledBy,
        reconciledDate,
        createdBy,
        createdAt,
        updatedAt,
      ];
}

class BankTransactionEntity extends Equatable {
  final String transactionId;
  final String statementId;
  final DateTime transactionDate;
  final String description;
  final double debitAmount;
  final double creditAmount;
  final double balance;
  final BankTransactionType transactionType;
  final String referenceNumber;
  final bool isMatched;
  final String? matchedVoucherId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BankTransactionEntity({
    required this.transactionId,
    required this.statementId,
    required this.transactionDate,
    required this.description,
    required this.debitAmount,
    required this.creditAmount,
    required this.balance,
    required this.transactionType,
    required this.referenceNumber,
    required this.isMatched,
    this.matchedVoucherId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        transactionId,
        statementId,
        transactionDate,
        description,
        debitAmount,
        creditAmount,
        balance,
        transactionType,
        referenceNumber,
        isMatched,
        matchedVoucherId,
        createdAt,
        updatedAt,
      ];
}

enum BankTransactionType {
  debit,
  credit,
}