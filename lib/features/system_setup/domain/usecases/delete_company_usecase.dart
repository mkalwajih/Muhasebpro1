import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class DeleteCompanyUseCase implements UseCase<void, int> {
  final CompanyInfoRepository repository;

  DeleteCompanyUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int companyId) async {
    return await repository.deleteCompany(companyId);
  }
}
