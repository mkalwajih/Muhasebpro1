import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class GetAllCompaniesUseCase extends UseCase<List<CompanyEntity>, NoParams> {
  final CompanyInfoRepository repository;

  GetAllCompaniesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CompanyEntity>>> call(NoParams params) async {
    return await repository.getAllCompanies();
  }
}
