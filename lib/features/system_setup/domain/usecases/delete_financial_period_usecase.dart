import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/financial_periods_repository.dart';

class DeleteFinancialPeriodUseCase implements UseCase<void, String> {
  final FinancialPeriodsRepository repository;

  DeleteFinancialPeriodUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String periodCode) async {
    return await repository.deleteFinancialPeriod(periodCode);
  }
}
