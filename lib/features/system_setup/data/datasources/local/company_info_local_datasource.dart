import 'package:muhaseb_pro/core/db/app_database.dart';

abstract class CompanyInfoLocalDataSource {
  Future<CompanyInfoData?> getCompanyInfo();
  Future<void> upsertCompanyInfo(CompanyInfoCompanion info);
  Future<List<CompanyInfoData>> getAllCompanies();
}

class CompanyInfoLocalDataSourceImpl implements CompanyInfoLocalDataSource {
  final AppDatabase db;
  CompanyInfoLocalDataSourceImpl(this.db);

  @override
  Future<CompanyInfoData?> getCompanyInfo() {
    // Retrieve the company marked as the main company
    return (db.select(db.companyInfo)..where((tbl) => tbl.isMainCompany.equals(true))).getSingleOrNull();
  }

  @override
  Future<void> upsertCompanyInfo(CompanyInfoCompanion info) {
    return db.into(db.companyInfo).insertOnConflictUpdate(info);
  }

  @override
  Future<List<CompanyInfoData>> getAllCompanies() async {
    return await db.select(db.companyInfo).get();
  }
}
