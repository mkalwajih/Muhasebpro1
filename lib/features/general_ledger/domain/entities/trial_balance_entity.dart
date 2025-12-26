import 'package:equatable/equatable.dart';

class TrialBalanceLineEntity extends Equatable {
  final String accountId;
  final String accountCode;
  final String accountName;
  final String accountType;
  final double debitBalance;
  final double creditBalance;
  final int level;
  final bool isHeader;

  const TrialBalanceLineEntity({
    required this.accountId,
    required this.accountCode,
    required this.accountName,
    required this.accountType,
    required this.debitBalance,
    required this.creditBalance,
    required this.level,
    required this.isHeader,
  });

  @override
  List<Object?> get props => [
        accountId,
        accountCode,
        accountName,
        accountType,
        debitBalance,
        creditBalance,
        level,
        isHeader
      ];
}
