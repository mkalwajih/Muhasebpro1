import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/financial_period_entity.dart';

abstract class FinancialPeriodsRepository {
  Future<Either<Failure, List<FinancialPeriodEntity>>> getFinancialPeriods();
  Future<Either<Failure, FinancialPeriodEntity>> getFinancialPeriodByCode(String periodCode);
  Future<Either<Failure, void>> addFinancialPeriod(FinancialPeriodEntity period);
  Future<Either<Failure, void>> updateFinancialPeriod(FinancialPeriodEntity period);
  Future<Either<Failure, void>> toggleLockFinancialPeriod(String periodCode, bool isLocked);
  Future<Either<Failure, void>> deleteFinancialPeriod(String periodCode);
  // No generate periods here, as generation logic typically resides in a use case.
}
