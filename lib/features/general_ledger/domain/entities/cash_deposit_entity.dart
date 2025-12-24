
import 'package:equatable/equatable.dart';

class CashDepositEntity extends Equatable {
  final String depositId;
  final String branchId;
  final DateTime depositDate;
  final String fromAccountId;
  final String toAccountId;
  final double amount;
  final String description;
  final DepositStatus status;
  final String preparedBy;
  final String? confirmedBy;
  final DateTime? confirmationDate;
  final String referenceNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? depositSlipNumber;
  final String? bankConfirmationNumber;

  const CashDepositEntity({
    required this.depositId,
    required this.branchId,
    required this.depositDate,
    required this.fromAccountId,
    required this.toAccountId,
    required this.amount,
    required this.description,
    required this.status,
    required this.preparedBy,
    this.confirmedBy,
    this.confirmationDate,
    required this.referenceNumber,
    required this.createdAt,
    required this.updatedAt,
    this.depositSlipNumber,
    this.bankConfirmationNumber,
  });

  @override
  List<Object?> get props => [
        depositId,
        branchId,
        depositDate,
        fromAccountId,
        toAccountId,
        amount,
        description,
        status,
        preparedBy,
        confirmedBy,
        confirmationDate,
        referenceNumber,
        createdAt,
        updatedAt,
        depositSlipNumber,
        bankConfirmationNumber,
      ];
}

enum DepositStatus {
  draft,
  pending,
  confirmed,
  cancelled,
}
