import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/company_info_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';

class CompanyInfoRepositoryImpl implements CompanyInfoRepository {
  final CompanyInfoLocalDataSource localDataSource;

  CompanyInfoRepositoryImpl(this.localDataSource);

  @override
  Future<CompanyInfoEntity?> getCompanyInfo() async {
    final data = await localDataSource.getCompanyInfo();
    if (data == null) return null;
    
    // Map from the Drift-generated CompanyInfoData to our CompanyInfoEntity
    return CompanyInfoEntity(
      id: data.id,
      companyCode: data.company_code,
      nameAr: data.name_ar,
      nameEn: data.name_en,
      countryId: data.country_id,
      taxNumber: data.tax_number,
      commercialRegNo: data.commercial_reg_no,
      address: data.address,
      phone: data.phone,
      email: data.email,
      logo: data.logo,
      isMainCompany: data.is_main_company,
      remarks: data.remarks,
    );
  }

  @override
  Future<void> saveCompanyInfo(CompanyInfoEntity info) {
    // Map from our CompanyInfoEntity to the Drift-generated CompanyInfoCompanion
    final companion = CompanyInfoCompanion(
      id: Value(info.id),
      company_code: Value(info.companyCode),
      name_ar: Value(info.nameAr),
      name_en: Value(info.nameEn),
      country_id: Value(info.countryId),
      tax_number: Value(info.taxNumber),
      commercial_reg_no: Value(info.commercialRegNo),
      address: Value(info.address),
      phone: Value(info.phone),
      email: Value(info.email),
      logo: Value(info.logo),
      is_main_company: Value(info.isMainCompany),
      remarks: Value(info.remarks),
    );
    return localDataSource.upsertCompanyInfo(companion);
  }
}
