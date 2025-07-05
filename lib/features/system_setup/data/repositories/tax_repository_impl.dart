import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/tax_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/tax_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/tax_repository.dart';

class TaxRepositoryImpl implements TaxRepository {
  final TaxLocalDataSource localDataSource;

  TaxRepositoryImpl(this.localDataSource);

  @override
  Future<List<TaxBracketEntity>> getTaxBrackets() async {
    final taxBrackets = await localDataSource.getTaxBrackets();
    return taxBrackets
        .map((e) => TaxBracketEntity(
              bracketCode: e.bracketCode,
              nameAr: e.nameAr,
              nameEn: e.nameEn,
              taxRate: e.taxRate,
              isDefault: e.isDefault,
            ))
        .toList();
  }

  @override
  Future<void> addTaxBracket(TaxBracketEntity taxBracket) {
    final companion = TaxBracketsCompanion(
      bracketCode: Value(taxBracket.bracketCode),
      nameAr: Value(taxBracket.nameAr),
      nameEn: Value(taxBracket.nameEn),
      taxRate: Value(taxBracket.taxRate),
      isDefault: Value(taxBracket.isDefault),
    );
    return localDataSource.addTaxBracket(companion);
  }

  @override
  Future<void> updateTaxBracket(TaxBracketEntity taxBracket) {
    final companion = TaxBracketsCompanion(
      bracketCode: Value(taxBracket.bracketCode),
      nameAr: Value(taxBracket.nameAr),
      nameEn: Value(taxBracket.nameEn),
      taxRate: Value(taxBracket.taxRate),
      isDefault: Value(taxBracket.isDefault),
    );
    return localDataSource.updateTaxBracket(companion);
  }

  @override
  Future<void> deleteTaxBracket(String bracketCode) {
    return localDataSource.deleteTaxBracket(bracketCode);
  }

  @override
  Future<List<TaxTypeEntity>> getTaxTypes() async {
    final taxTypes = await localDataSource.getTaxTypes();
    return taxTypes
        .map((e) => TaxTypeEntity(
              typeCode: e.typeCode,
              nameAr: e.nameAr,
              nameEn: e.nameEn,
              calcMethod: e.calcMethod,
              salesAccountId: e.salesAccountId,
              purchasesAccountId: e.purchasesAccountId,
            ))
        .toList();
  }

  @override
  Future<void> addTaxType(TaxTypeEntity taxType) {
    final companion = TaxTypesCompanion(
      typeCode: Value(taxType.typeCode),
      nameAr: Value(taxType.nameAr),
      nameEn: Value(taxType.nameEn),
      calcMethod: Value(taxType.calcMethod),
      salesAccountId: Value(taxType.salesAccountId),
      purchasesAccountId: Value(taxType.purchasesAccountId),
    );
    return localDataSource.addTaxType(companion);
  }

  @override
  Future<void> updateTaxType(TaxTypeEntity taxType) {
    final companion = TaxTypesCompanion(
      typeCode: Value(taxType.typeCode),
      nameAr: Value(taxType.nameAr),
      nameEn: Value(taxType.nameEn),
      calcMethod: Value(taxType.calcMethod),
      salesAccountId: Value(taxType.salesAccountId),
      purchasesAccountId: Value(taxType.purchasesAccountId),
    );
    return localDataSource.updateTaxType(companion);
  }

  @override
  Future<void> deleteTaxType(String typeCode) {
    return localDataSource.deleteTaxType(typeCode);
  }

  @override
  Future<List<TaxCalcMethodEntity>> getTaxCalcMethods() async {
    final taxCalcMethods = await localDataSource.getTaxCalcMethods();
    return taxCalcMethods
        .map((e) => TaxCalcMethodEntity(
              methodCode: e.methodCode,
              nameAr: e.nameAr,
              nameEn: e.nameEn,
              category: e.category,
            ))
        .toList();
  }

  @override
  Future<void> addTaxCalcMethod(TaxCalcMethodEntity taxCalcMethod) {
    final companion = TaxCalcMethodsCompanion(
      methodCode: Value(taxCalcMethod.methodCode),
      nameAr: Value(taxCalcMethod.nameAr),
      nameEn: Value(taxCalcMethod.nameEn),
      category: Value(taxCalcMethod.category),
    );
    return localDataSource.addTaxCalcMethod(companion);
  }

  @override
  Future<void> updateTaxCalcMethod(TaxCalcMethodEntity taxCalcMethod) {
    final companion = TaxCalcMethodsCompanion(
      methodCode: Value(taxCalcMethod.methodCode),
      nameAr: Value(taxCalcMethod.nameAr),
      nameEn: Value(taxCalcMethod.nameEn),
      category: Value(taxCalcMethod.category),
    );
    return localDataSource.updateTaxCalcMethod(companion);
  }

  @override
  Future<void> deleteTaxCalcMethod(String methodCode) {
    return localDataSource.deleteTaxCalcMethod(methodCode);
  }
}
