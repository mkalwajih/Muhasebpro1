import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';

abstract class CompanyInfoLocalDataSource {
  Future<CompanyInfoData?> getCompanyInfo(); // Retrieves the main company
  Future<List<CompanyInfoData>> getAllCompanies();
  Future<void> addCompany(CompanyInfoCompanion info);
  Future<void> updateCompany(CompanyInfoCompanion info);
  Future<void> deleteCompany(int id);
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
  Future<List<CompanyInfoData>> getAllCompanies() async {
    return await db.select(db.companyInfo).get();
  }

  @override
  Future<void> addCompany(CompanyInfoCompanion info) async {
    // If the new company is set as main, ensure no other company is main
    if (info.isMainCompany.value == true) {
      await (db.update(db.companyInfo)
            ..where((tbl) => tbl.isMainCompany.equals(true)))
          .write(const CompanyInfoCompanion(isMainCompany: Value(false)));
    }
    await db.into(db.companyInfo).insert(info);
  }

  @override
  Future<void> updateCompany(CompanyInfoCompanion info) async {
    // If the updated company is set as main, ensure no other company is main
    if (info.isMainCompany.value == true) {
      await (db.update(db.companyInfo)
            ..where((tbl) => tbl.isMainCompany.equals(true) & tbl.id.isNotValue(info.id.value)))
          .write(const CompanyInfoCompanion(isMainCompany: Value(false)));
    }
    await db.update(db.companyInfo).replace(info);
  }

  @override
  Future<void> deleteCompany(int id) async {
    final company = await (db.select(db.companyInfo)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (company == null) {
      throw NotFoundException(message: 'Company not found.');
    }
    if (company.isMainCompany) {
      throw DataIntegrityException(message: 'Cannot delete the main company.');
    }

    // TODO: Add checks for linked branches or transactions before deletion
    // For now, assume no linked data blocks deletion.
    // In a real scenario, you'd check foreign key relationships.

    final deletedRows = await (db.delete(db.companyInfo)..where((tbl) => tbl.id.equals(id))).go();
    if (deletedRows == 0) {
      throw Exception('Failed to delete company.');
    }
  }
}
