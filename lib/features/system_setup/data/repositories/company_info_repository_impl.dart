import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/company_info_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';
import 'package:drift/drift.dart';

class CompanyInfoRepositoryImpl implements CompanyInfoRepository {
  final CompanyInfoLocalDataSource localDataSource;

  CompanyInfoRepositoryImpl(this.localDataSource);

  @override
  Future<CompanyInfoEntity?> getCompanyInfo() async {
    final data = await localDataSource.getCompanyInfo();
    if (data == null) return null;
    return CompanyInfoEntity(
      nameAr: data.nameAr,
      nameEn: data.nameEn,
      addressAr: data.addressAr,
      addressEn: data.addressEn,
      phone: data.phone,
      email: data.email,
      website: data.website,
      taxNumber: data.taxNumber,
      commercialRegNo: data.commercialRegNo,
    );
  }

  @override
  Future<void> saveCompanyInfo(CompanyInfoEntity info) {
    final companion = CompanyInfoCompanion.insert(
      nameAr: info.nameAr,
      nameEn: info.nameEn,
      addressAr: Value(info.addressAr),
      addressEn: Value(info.addressEn),
      phone: Value(info.phone),
      email: Value(info.email),
      website: Value(info.website),
      taxNumber: Value(info.taxNumber),
      commercialRegNo: Value(info.commercialRegNo),
    );
    return localDataSource.upsertCompanyInfo(companion);
  }
}