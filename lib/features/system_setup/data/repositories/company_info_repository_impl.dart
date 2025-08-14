import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/company_info_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';

class CompanyInfoRepositoryImpl implements CompanyInfoRepository {
  final CompanyInfoLocalDataSource localDataSource;
  final AppDatabase _database;


  CompanyInfoRepositoryImpl(this.localDataSource, this._database);

  @override
  Future<CompanyInfoEntity?> getCompanyInfo() async {
    final data = await localDataSource.getCompanyInfo();
    if (data == null) return null;

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
  Future<Either<Failure, bool>> saveCompanyInfo(CompanyInfoEntity info) async {
    final isUnique = await isCompanyCodeUnique(info.companyCode, companyId: info.id);
    if (!isUnique) {
      return Left(DuplicateEntryFailure('Company code must be unique.'));
    }

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
    try {
      await localDataSource.upsertCompanyInfo(companion);
      return Right(true);
    } on CacheException {
      return Left(CacheFailure());
    } catch (e) {
      return Left(ServerFailure()); // Generic error for now
    }
  }

  @override
  Future<bool> isCompanyCodeUnique(String code, {int? companyId}) async {
    final query = _database.select(_database.companyInfo)..where((c) => c.companyCode.equals(code));
    
    if (companyId != null) {
      query.where((c) => c.id.isNotValue(companyId));
    }
    
    final result = await query.get();
    return result.isEmpty;
  }

  @override
  Future<Either<Failure, List<CompanyEntity>>> getAllCompanies() async {
    try {
      final localCompanies = await localDataSource.getAllCompanies();
      final companyEntities = localCompanies.map((c) => CompanyEntity(
            id: c.id,
            companyCode: c.companyCode,
            nameAr: c.nameAr,
            nameEn: c.nameEn,
            isMainCompany: c.isMainCompany,
            countryId: c.countryId,
            taxNumber: c.taxNumber,
            commercialRegNo: c.commercialRegNo,
            address: c.address,
            phone: c.phone,
            email: c.email,
            remarks: c.remarks,
          )).toList();
      return Right(companyEntities);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addCompany(CompanyInfoEntity company) async {
    final isUnique = await isCompanyCodeUnique(company.companyCode);
    if (!isUnique) {
      return Left(DuplicateEntryFailure('Company code must be unique.'));
    }
    final companion = CompanyInfoCompanion.insert(
      companyCode: company.companyCode,
      nameAr: company.nameAr,
      nameEn: company.nameEn,
      countryId: Value(company.countryId),
      taxNumber: Value(company.taxNumber),
      commercialRegNo: Value(company.commercialRegNo),
      address: Value(company.address),
      phone: Value(company.phone),
      email: Value(company.email),
      logo: Value(company.logo),
      isMainCompany: Value(company.isMainCompany),
      remarks: Value(company.remarks),
    );
    try {
      await localDataSource.addCompany(companion);
      return const Right(null);
    } on DataIntegrityException catch (e) {
       return Left(DataIntegrityFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateCompany(CompanyInfoEntity company) async {
    final isUnique = await isCompanyCodeUnique(company.companyCode, companyId: company.id);
    if (!isUnique) {
      return Left(DuplicateEntryFailure('Company code must be unique.'));
    }
    final companion = CompanyInfoCompanion(
      id: Value(company.id),
      companyCode: Value(company.companyCode),
      nameAr: Value(company.nameAr),
      nameEn: Value(company.nameEn),
      countryId: Value(company.countryId),
      taxNumber: Value(company.taxNumber),
      commercialRegNo: Value(company.commercialRegNo),
      address: Value(company.address),
      phone: Value(company.phone),
      email: Value(company.email),
      logo: Value(company.logo),
      isMainCompany: Value(company.isMainCompany),
      remarks: Value(company.remarks),
    );
    try {
      await localDataSource.updateCompany(companion);
      return const Right(null);
    } on DataIntegrityException catch (e) {
       return Left(DataIntegrityFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCompany(int id) async {
    try {
      await localDataSource.deleteCompany(id);
      return const Right(null);
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(message: e.message));
    } on DataIntegrityException catch (e) {
      return Left(DataIntegrityFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
