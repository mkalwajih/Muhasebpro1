import 'package:muhaseb_pro/core/db/app_database.dart';

abstract class CurrenciesLocalDataSource {
  Future<List<Currency>> getAllCurrencies();
  Future<List<CurrencyDenomination>> getDenominations(String currencyCode);
  Future<void> addCurrency(CurrenciesCompanion currency);
  Future<void> updateCurrency(CurrenciesCompanion currency);
  Future<int> deleteCurrency(String currencyCode);
  Future<void> addDenomination(CurrencyDenominationsCompanion denomination);
  Future<void> updateDenomination(CurrencyDenominationsCompanion denomination);
  Future<int> deleteDenomination(int id);
}

class CurrenciesLocalDataSourceImpl implements CurrenciesLocalDataSource {
  final AppDatabase db;

  CurrenciesLocalDataSourceImpl(this.db);

  @override
  Future<List<Currency>> getAllCurrencies() => db.select(db.currencies).get();

  @override
  Future<List<CurrencyDenomination>> getDenominations(String currencyCode) =>
      (db.select(db.currencyDenominations)
            ..where((tbl) => tbl.currencyCode.equals(currencyCode)))
          .get();

  @override
  Future<void> addCurrency(CurrenciesCompanion currency) =>
      db.into(db.currencies).insert(currency);

  @override
  Future<void> updateCurrency(CurrenciesCompanion currency) =>
      (db.update(db.currencies)
            ..where((tbl) => tbl.currencyCode.equals(currency.currencyCode.value)))
          .write(currency);

  @override
  Future<int> deleteCurrency(String currencyCode) =>
      (db.delete(db.currencies)..where((tbl) => tbl.currencyCode.equals(currencyCode))).go();

  @override
  Future<void> addDenomination(CurrencyDenominationsCompanion denomination) =>
      db.into(db.currencyDenominations).insert(denomination);

  @override
  Future<void> updateDenomination(CurrencyDenominationsCompanion denomination) =>
      (db.update(db.currencyDenominations)
            ..where((tbl) => tbl.id.equals(denomination.id.value)))
          .write(denomination);

  @override
  Future<int> deleteDenomination(int id) =>
      (db.delete(db.currencyDenominations)..where((tbl) => tbl.id.equals(id))).go();
}
