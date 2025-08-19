import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/financial_period_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/financial_periods_repository.dart';

class UpdateFinancialPeriodUseCase implements UseCase<void, FinancialPeriodEntity> {
  final FinancialPeriodsRepository repository;

  UpdateFinancialPeriodUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(FinancialPeriodEntity params) async {
    return await repository.updateFinancialPeriod(params);
  }
}
