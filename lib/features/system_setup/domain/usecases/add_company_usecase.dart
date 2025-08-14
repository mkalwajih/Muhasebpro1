import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class AddCompanyUseCase implements UseCase<void, CompanyInfoEntity> {
  final CompanyInfoRepository repository;

  AddCompanyUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CompanyInfoEntity company) async {
    return await repository.addCompany(company);
  }
}
