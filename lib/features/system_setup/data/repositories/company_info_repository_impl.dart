import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/core/errors/exceptions.dart';
import 'package:muhaseb_pro/core/errors/failures.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/company_info_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
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
      companyCode: data.companyCode,
      nameAr: data.nameAr,
      nameEn: data.nameEn,
      countryId: data.countryId,
      taxNumber: data.taxNumber,
      commercialRegNo: data.commercialRegNo,
      address: data.address,
      phone: data.phone,
      email: data.email,
      logo: data.logo,
      isMainCompany: data.isMainCompany,
      remarks: data.remarks,
    );
  }

  @override
  Future<void> saveCompanyInfo(CompanyInfoEntity info) {
    // Map from our CompanyInfoEntity to the Drift-generated CompanyInfoCompanion
    final companion = CompanyInfoCompanion(
      id: Value(info.id),
      companyCode: Value(info.companyCode),
      nameAr: Value(info.nameAr),
      nameEn: Value(info.nameEn),
      countryId: Value(info.countryId),
      taxNumber: Value(info.taxNumber),
      commercialRegNo: Value(info.commercialRegNo),
      address: Value(info.address),
      phone: Value(info.phone),
      email: Value(info.email),
      logo: Value(info.logo),
      isMainCompany: Value(info.isMainCompany),
      remarks: Value(info.remarks),
    );
    return localDataSource.upsertCompanyInfo(companion);
  }

  @override
  Future<Either<Failure, List<Company>>> getAllCompanies() async {
    try {
      final localCompanies = await localDataSource.getAllCompanies();
      return Right(localCompanies);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
