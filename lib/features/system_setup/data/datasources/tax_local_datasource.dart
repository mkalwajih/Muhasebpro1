import 'package:muhaseb_pro/core/db/app_database.dart' as db;

abstract class TaxLocalDataSource {
  Future<List<db.TaxBracket>> getTaxBrackets();
  Future<void> addTaxBracket(db.TaxBracketsCompanion taxBracket);
  Future<void> updateTaxBracket(db.TaxBracketsCompanion taxBracket);
  Future<int> deleteTaxBracket(String bracketCode);

  Future<List<db.TaxType>> getTaxTypes();
  Future<void> addTaxType(db.TaxTypesCompanion taxType);
  Future<void> updateTaxType(db.TaxTypesCompanion taxType);
  Future<int> deleteTaxType(String typeCode);

  Future<List<db.TaxCalcMethod>> getTaxCalcMethods();
  Future<void> addTaxCalcMethod(db.TaxCalcMethodsCompanion taxCalcMethod);
  Future<void> updateTaxCalcMethod(db.TaxCalcMethodsCompanion taxCalcMethod);
  Future<int> deleteTaxCalcMethod(String methodCode);
}

class TaxLocalDataSourceImpl implements TaxLocalDataSource {
  final db.AppDatabase db;

  TaxLocalDataSourceImpl(this.db);

  @override
  Future<List<db.TaxBracket>> getTaxBrackets() => db.select(db.taxBrackets).get();

  @override
  Future<void> addTaxBracket(db.TaxBracketsCompanion taxBracket) =>
      db.into(db.taxBrackets).insert(taxBracket);

  @override
  Future<void> updateTaxBracket(db.TaxBracketsCompanion taxBracket) =>
      (db.update(db.taxBrackets)
            ..where((tbl) => tbl.bracketCode.equals(taxBracket.bracketCode.value)))
          .write(taxBracket);

  @override
  Future<int> deleteTaxBracket(String bracketCode) =>
      (db.delete(db.taxBrackets)..where((tbl) => tbl.bracketCode.equals(bracketCode))).go();

  @override
  Future<List<db.TaxType>> getTaxTypes() => db.select(db.taxTypes).get();

  @override
  Future<void> addTaxType(db.TaxTypesCompanion taxType) =>
      db.into(db.taxTypes).insert(taxType);

  @override
  Future<void> updateTaxType(db.TaxTypesCompanion taxType) =>
      (db.update(db.taxTypes)
            ..where((tbl) => tbl.typeCode.equals(taxType.typeCode.value)))
          .write(taxType);

  @override
  Future<int> deleteTaxType(String typeCode) =>
      (db.delete(db.taxTypes)..where((tbl) => tbl.typeCode.equals(typeCode))).go();

  @override
  Future<List<db.TaxCalcMethod>> getTaxCalcMethods() =>
      db.select(db.taxCalcMethods).get();

  @override
  Future<void> addTaxCalcMethod(db.TaxCalcMethodsCompanion taxCalcMethod) =>
      db.into(db.taxCalcMethods).insert(taxCalcMethod);

  @override
  Future<void> updateTaxCalcMethod(db.TaxCalcMethodsCompanion taxCalcMethod) =>
      (db.update(db.taxCalcMethods)
            ..where((tbl) => tbl.methodCode.equals(taxCalcMethod.methodCode.value)))
          .write(taxCalcMethod);

  @override
  Future<int> deleteTaxCalcMethod(String methodCode) =>
      (db.delete(db.taxCalcMethods)..where((tbl) => tbl.methodCode.equals(methodCode))).go();
}
