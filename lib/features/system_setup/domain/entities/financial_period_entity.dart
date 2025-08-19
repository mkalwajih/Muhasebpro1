import 'package:equatable/equatable.dart';

class FinancialPeriodEntity extends Equatable {
  final int? id;
  final String periodCode;
  final int fiscalYear;
  final String periodType; // 'Monthly', 'Quarterly', 'Custom'
  final int? periodNumber; // 1-12 for Monthly, 1-4 for Quarterly, or custom for Custom
  final DateTime startDate;
  final DateTime endDate;
  final bool isLocked;

  const FinancialPeriodEntity({
    this.id,
    required this.periodCode,
    required this.fiscalYear,
    required this.periodType,
    this.periodNumber,
    required this.startDate,
    required this.endDate,
    required this.isLocked,
  });

  @override
  List<Object?> get props => [
        id,
        periodCode,
        fiscalYear,
        periodType,
        periodNumber,
        startDate,
        endDate,
        isLocked,
      ];

  FinancialPeriodEntity copyWith({
    int? id,
    String? periodCode,
    int? fiscalYear,
    String? periodType,
    int? periodNumber,
    DateTime? startDate,
    DateTime? endDate,
    bool? isLocked,
  }) {
    return FinancialPeriodEntity(
      id: id ?? this.id,
      periodCode: periodCode ?? this.periodCode,
      fiscalYear: fiscalYear ?? this.fiscalYear,
      periodType: periodType ?? this.periodType,
      periodNumber: periodNumber ?? this.periodNumber,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isLocked: isLocked ?? this.isLocked,
    );
  }
}
