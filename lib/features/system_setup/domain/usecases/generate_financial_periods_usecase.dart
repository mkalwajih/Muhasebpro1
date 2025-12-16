import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/financial_period_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/financial_periods_repository.dart';

class GenerateFinancialPeriodsParams {
  final int startYear;
  final int numberOfYears;

  GenerateFinancialPeriodsParams({
    required this.startYear,
    required this.numberOfYears,
  });
}

class GenerateFinancialPeriodsUseCase implements UseCase<void, GenerateFinancialPeriodsParams> {
  final FinancialPeriodsRepository repository;

  GenerateFinancialPeriodsUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(GenerateFinancialPeriodsParams params) async {
    final List<FinancialPeriodEntity> generatedPeriods = [];

    for (int year = params.startYear; year < params.startYear + params.numberOfYears; year++) {
      for (int i = 1; i <= 12; i++) {
        final startDate = DateTime(year, i, 1);
        final endDate = DateTime(year, i + 1, 0); // Last day of the month
        generatedPeriods.add(FinancialPeriodEntity(
          periodCode: '$year-M${i.toString().padLeft(2, '0')}',
          fiscalYear: year,
          periodType: 'Monthly',
          periodNumber: i,
          startDate: startDate,
          endDate: endDate,
          isLocked: false, // Default to unlocked
        ));
      }
    }

    // Attempt to add all to the repository
    // This is a simplified approach. In a real app, you might have a bulk insert.
    for (final period in generatedPeriods) {
      final result = await repository.addFinancialPeriod(period);
      if (result.isLeft()) {
        // If any single period fails to add, return that failure.
        return Left(result.fold((l) => l, (r) => throw Exception('Should not happen')));
      }
    }

    return const Right(null);
  }
}
