import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';

// Use Case for getting company information
class GetCompanyInfoUseCase extends UseCase<CompanyInfoEntity?, NoParams> {
  final CompanyInfoRepository repository;
  GetCompanyInfoUseCase(this.repository);

  @override
  Future<Either<Failure, CompanyInfoEntity?>> call(NoParams params) async {
    try {
      final result = await repository.getCompanyInfo();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}