import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';

class SaveCompanyInfoUseCase {
  final CompanyInfoRepository repository;
  SaveCompanyInfoUseCase(this.repository);

  Future<void> call(CompanyInfoEntity info) => repository.saveCompanyInfo(info);
}