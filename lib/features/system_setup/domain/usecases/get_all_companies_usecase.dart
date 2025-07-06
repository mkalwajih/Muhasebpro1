import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/core/errors/failures.dart';
import 'package:muhaseb_pro/core/usecases/usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';

class GetAllCompaniesUseCase implements UseCase<List<Company>, NoParams> {
  final CompanyInfoRepository repository;

  GetAllCompaniesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Company>>> call(NoParams params) async {
    return await repository.getAllCompanies();
  }
}
