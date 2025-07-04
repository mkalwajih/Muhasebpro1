import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:drift/drift.dart' hide Column; // Import hide Column to prevent conflict with Flutter's Column

abstract class CompanyInfoLocalDataSource {
  Future<CompanyInfoData?> getCompanyInfo();
  Future<void> upsertCompanyInfo(CompanyInfoCompanion info);
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
}
