import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';

// Use Case for getting company information
class GetCompanyInfoUseCase {
  final CompanyInfoRepository repository;
  GetCompanyInfoUseCase(this.repository);

  Future<CompanyInfoEntity?> call() async => repository.getCompanyInfo();
}