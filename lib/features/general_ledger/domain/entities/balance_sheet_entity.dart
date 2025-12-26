import 'package:equatable/equatable.dart';

enum BalanceSheetSection { assets, liabilities, equity, total }

class BalanceSheetLineEntity extends Equatable {
  final String accountId;
  final String accountCode;
  final String accountName;
  final double amount;
  final bool isHeader;
  final int level;
  final BalanceSheetSection sectionType;

  const BalanceSheetLineEntity({
    required this.accountId,
    required this.accountCode,
    required this.accountName,
    required this.amount,
    required this.isHeader,
    required this.level,
    required this.sectionType,
  });

  @override
  List<Object?> get props => [
        accountId,
        accountCode,
        accountName,
        amount,
        isHeader,
        level,
        sectionType
      ];
}
