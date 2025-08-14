import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';

abstract class CompanyInfoRepository {
  Future<CompanyInfoEntity?> getCompanyInfo();
  Future<Either<Failure, bool>> saveCompanyInfo(CompanyInfoEntity info);
  Future<bool> isCompanyCodeUnique(String code, {int? companyId});
  Future<Either<Failure, List<CompanyEntity>>> getAllCompanies();
  Future<Either<Failure, void>> addCompany(CompanyInfoEntity company);
  Future<Either<Failure, void>> updateCompany(CompanyInfoEntity company);
  Future<Either<Failure, void>> deleteCompany(int id);
}
