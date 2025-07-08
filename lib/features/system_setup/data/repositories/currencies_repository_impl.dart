import 'package:drift/drift.dart' as drift;
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/currencies_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/currency_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/currencies_repository.dart';

class CurrenciesRepositoryImpl implements CurrenciesRepository {
  final CurrenciesLocalDataSource localDataSource;

  CurrenciesRepositoryImpl(this.localDataSource);

  @override
  Future<List<CurrencyEntity>> getAllCurrencies() async {
    final currencies = await localDataSource.getAllCurrencies();
    final denominations = <String, List<CurrencyDenominationEntity>>{};
    for (var currency in currencies) {
      final denoms = await localDataSource.getDenominations(currency.currencyCode);
      denominations[currency.currencyCode] = denoms
          .map((d) => CurrencyDenominationEntity(
                id: d.id,
                currencyCode: d.currencyCode,
                denominationValue: d.denominationValue,
                denominationNameAr: d.denominationNameAr,
                denominationNameEn: d.denominationNameEn,
                denominationType: d.denominationType,
              ))
          .toList();
    }
    return currencies
        .map((c) => CurrencyEntity(
              currencyCode: c.currencyCode,
              nameAr: c.nameAr,
              nameEn: c.nameEn,
              fractionNameAr: c.fractionNameAr,
              fractionNameEn: c.fractionNameEn,
              exchangeRate: c.exchangeRate,
              isBaseCurrency: c.isBaseCurrency,
              decimalPlaces: c.decimalPlaces,
              minRateLimit: c.minRateLimit,
              maxRateLimit: c.maxRateLimit,
              isActive: c.isActive,
              denominations: denominations[c.currencyCode] ?? [],
            ))
        .toList();
  }

  @override
  Future<void> addCurrency(CurrencyEntity currency) {
    final companion = _toCompanion(currency);
    return localDataSource.addCurrency(companion);
  }

  @override
  Future<void> updateCurrency(CurrencyEntity currency) {
    final companion = _toCompanion(currency);
    return localDataSource.updateCurrency(companion);
  }

  @override
  Future<void> deleteCurrency(String currencyCode) {
    return localDataSource.deleteCurrency(currencyCode);
  }

  @override
  Future<void> addDenomination(CurrencyDenominationEntity denomination) {
    final companion = _toDenominationCompanion(denomination);
    return localDataSource.addDenomination(companion);
  }

  @override
  Future<void> updateDenomination(CurrencyDenominationEntity denomination) {
    final companion = _toDenominationCompanion(denomination);
    return localDataSource.updateDenomination(companion);
  }

  @override
  Future<void> deleteDenomination(int id) {
    return localDataSource.deleteDenomination(id);
  }

  CurrenciesCompanion _toCompanion(CurrencyEntity currency) {
    return CurrenciesCompanion(
      currencyCode: drift.Value(currency.currencyCode),
      nameAr: drift.Value(currency.nameAr),
      nameEn: drift.Value(currency.nameEn),
      fractionNameAr: drift.Value(currency.fractionNameAr),
      fractionNameEn: drift.Value(currency.fractionNameEn),
      exchangeRate: drift.Value(currency.exchangeRate),
      isBaseCurrency: drift.Value(currency.isBaseCurrency),
      decimalPlaces: drift.Value(currency.decimalPlaces),
      minRateLimit: drift.Value(currency.minRateLimit),
      maxRateLimit: drift.Value(currency.maxRateLimit),
      isActive: drift.Value(currency.isActive),
    );
  }

  CurrencyDenominationsCompanion _toDenominationCompanion(
      CurrencyDenominationEntity denomination) {
    return CurrencyDenominationsCompanion(
      id: denomination.id == 0 ? const drift.Value.absent() : drift.Value(denomination.id),
      currencyCode: drift.Value(denomination.currencyCode),
      denominationValue: drift.Value(denomination.denominationValue),
      denominationNameAr: drift.Value(denomination.denominationNameAr),
      denominationNameEn: drift.Value(denomination.denominationNameEn),
      denominationType: drift.Value(denomination.denominationType),
    );
  }
}
