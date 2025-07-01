import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';

abstract class CompanyInfoRepository { 
  Future<CompanyInfoEntity?> getCompanyInfo();
  Future<void> saveCompanyInfo(CompanyInfoEntity info);
}