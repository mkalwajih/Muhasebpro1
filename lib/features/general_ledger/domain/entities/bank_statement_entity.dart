
import 'package:equatable/equatable.dart';

class BankStatementEntity extends Equatable {
  final String statementId;
  final String branchId;
  final String accountId;
  final DateTime statementDate;
  final double openingBalance;
  final double closingBalance;
  final List<BankTransactionEntity> transactions;
  final String status;
  final String? reconciledBy;
  final DateTime? reconciliationDate;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BankStatementEntity({
    required this.statementId,
    required this.branchId,
    required this.accountId,
    required this.statementDate,
    required this.openingBalance,
    required this.closingBalance,
    required this.transactions,
    required this.status,
    this.reconciledBy,
    this.reconciliationDate,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        statementId,
        branchId,
        accountId,
        statementDate,
        openingBalance,
        closingBalance,
        transactions,
        status,
        reconciledBy,
        reconciliationDate,
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
  final double amount;
  final BankTransactionType type;
  final String referenceNumber;
  final bool isReconciled;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BankTransactionEntity({
    required this.transactionId,
    required this.statementId,
    required this.transactionDate,
    required this.description,
    required this.amount,
    required this.type,
    required this.referenceNumber,
    required this.isReconciled,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        transactionId,
        statementId,
        transactionDate,
        description,
        amount,
        type,
        referenceNumber,
        isReconciled,
        createdAt,
        updatedAt,
      ];
}

enum BankTransactionType {
  debit,
  credit,
}
