import 'package:muhaseb_pro/core/db/app_database.dart';

abstract class CompanyInfoLocalDataSource {
  Future<CompanyInfoData?> getCompanyInfo();
  Future<void> upsertCompanyInfo(CompanyInfoCompanion info);
}

class CompanyInfoLocalDataSourceImpl implements CompanyInfoLocalDataSource {
  final AppDatabase db;
  CompanyInfoLocalDataSourceImpl(this.db);

  @override
  Future<CompanyInfoData?> getCompanyInfo() {
    return (db.select(db.companyInfo)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();
  }

  @override
  Future<void> upsertCompanyInfo(CompanyInfoCompanion info) {
    return db.into(db.companyInfo).insertOnConflictUpdate(info);
  }
}
