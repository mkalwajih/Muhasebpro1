import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';

abstract class CompanyInfoRepository {
  Future<CompanyInfoEntity?> getCompanyInfo();
  Future<void> saveCompanyInfo(CompanyInfoEntity info);
  Future<Either<Failure, List<CompanyEntity>>> getAllCompanies();
}
