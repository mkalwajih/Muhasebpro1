import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';

class SaveCompanyInfoUseCase extends UseCase<void, CompanyInfoEntity> {
  final CompanyInfoRepository repository;
  SaveCompanyInfoUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CompanyInfoEntity info) async {
    try {
      await repository.saveCompanyInfo(info);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}