import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/financial_periods_repository.dart';

class ToggleLockFinancialPeriodUseCase implements UseCase<void, ToggleLockFinancialPeriodParams> {
  final FinancialPeriodsRepository repository;

  ToggleLockFinancialPeriodUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ToggleLockFinancialPeriodParams params) async {
    return await repository.toggleLockFinancialPeriod(params.periodCode, params.isLocked);
  }
}

class ToggleLockFinancialPeriodParams {
  final String periodCode;
  final bool isLocked;

  ToggleLockFinancialPeriodParams({required this.periodCode, required this.isLocked});
}
