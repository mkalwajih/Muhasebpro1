import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/data/models/company_model.dart';

abstract class CompanyInfoLocalDataSource {
  Future<CompanyInfoData?> getCompanyInfo();
  Future<void> upsertCompanyInfo(CompanyInfoCompanion info);
  Future<List<CompanyModel>> getAllCompanies();
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
  Future<List<CompanyModel>> getAllCompanies() async {
    final companies = await db.select(db.companyInfo).get();
    return companies.map((company) => CompanyModel.fromDb(company)).toList();
  }
}
