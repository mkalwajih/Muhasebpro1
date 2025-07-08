import 'package:muhaseb_pro/core/db/app_database.dart' as app_db;

abstract class TaxLocalDataSource {
  Future<List<app_db.TaxBracketData>> getTaxBrackets();
  Future<void> addTaxBracket(app_db.TaxBracketCompanion taxBracket);
  Future<void> updateTaxBracket(app_db.TaxBracketCompanion taxBracket);
  Future<int> deleteTaxBracket(String bracketCode);

  Future<List<app_db.TaxType>> getTaxTypes();
  Future<void> addTaxType(app_db.TaxTypesCompanion taxType);
  Future<void> updateTaxType(app_db.TaxTypesCompanion taxType);
  Future<int> deleteTaxType(String typeCode);

  Future<List<app_db.TaxCalcMethod>> getTaxCalcMethods();
  Future<void> addTaxCalcMethod(app_db.TaxCalcMethodsCompanion taxCalcMethod);
  Future<void> updateTaxCalcMethod(app_db.TaxCalcMethodsCompanion taxCalcMethod);
  Future<int> deleteTaxCalcMethod(String methodCode);
}

class TaxLocalDataSourceImpl implements TaxLocalDataSource {
  final app_db.AppDatabase db;

  TaxLocalDataSourceImpl(this.db);

  @override
  Future<List<app_db.TaxBracketData>> getTaxBrackets() => db.select(db.taxBracket).get();

  @override
  Future<void> addTaxBracket(app_db.TaxBracketCompanion taxBracket) =>
      db.into(db.taxBracket).insert(taxBracket);

  @override
  Future<void> updateTaxBracket(app_db.TaxBracketCompanion taxBracket) =>
      (db.update(db.taxBracket)
            ..where((tbl) => tbl.bracketCode.equals(taxBracket.bracketCode.value)))
          .write(taxBracket);

  @override
  Future<int> deleteTaxBracket(String bracketCode) =>
      (db.delete(db.taxBracket)..where((tbl) => tbl.bracketCode.equals(bracketCode))).go();

  @override
  Future<List<app_db.TaxType>> getTaxTypes() => db.select(db.taxTypes).get();

  @override
  Future<void> addTaxType(app_db.TaxTypesCompanion taxType) =>
      db.into(db.taxTypes).insert(taxType);

  @override
  Future<void> updateTaxType(app_db.TaxTypesCompanion taxType) =>
      (db.update(db.taxTypes)
            ..where((tbl) => tbl.typeCode.equals(taxType.typeCode.value)))
          .write(taxType);

  @override
  Future<int> deleteTaxType(String typeCode) =>
      (db.delete(db.taxTypes)..where((tbl) => tbl.typeCode.equals(typeCode))).go();

  @override
  Future<List<app_db.TaxCalcMethod>> getTaxCalcMethods() =>
      db.select(db.taxCalcMethods).get();

  @override
  Future<void> addTaxCalcMethod(app_db.TaxCalcMethodsCompanion taxCalcMethod) =>
      db.into(db.taxCalcMethods).insert(taxCalcMethod);

  @override
  Future<void> updateTaxCalcMethod(app_db.TaxCalcMethodsCompanion taxCalcMethod) =>
      (db.update(db.taxCalcMethods)
            ..where((tbl) => tbl.methodCode.equals(taxCalcMethod.methodCode.value)))
          .write(taxCalcMethod);

  @override
  Future<int> deleteTaxCalcMethod(String methodCode) =>
      (db.delete(db.taxCalcMethods)..where((tbl) => tbl.methodCode.equals(methodCode))).go();
}
