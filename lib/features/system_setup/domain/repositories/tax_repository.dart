import 'package:muhaseb_pro/features/system_setup/domain/entities/tax_entity.dart';

abstract class TaxRepository {
  Future<List<TaxBracketEntity>> getTaxBrackets();
  Future<void> addTaxBracket(TaxBracketEntity taxBracket);
  Future<void> updateTaxBracket(TaxBracketEntity taxBracket);
  Future<void> deleteTaxBracket(String bracketCode);

  Future<List<TaxTypeEntity>> getTaxTypes();
  Future<void> addTaxType(TaxTypeEntity taxType);
  Future<void> updateTaxType(TaxTypeEntity taxType);
  Future<void> deleteTaxType(String typeCode);

  Future<List<TaxCalcMethodEntity>> getTaxCalcMethods();
  Future<void> addTaxCalcMethod(TaxCalcMethodEntity taxCalcMethod);
  Future<void> updateTaxCalcMethod(TaxCalcMethodEntity taxCalcMethod);
  Future<void> deleteTaxCalcMethod(String methodCode);
}
