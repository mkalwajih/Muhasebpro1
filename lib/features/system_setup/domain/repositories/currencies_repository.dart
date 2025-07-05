import 'package:muhaseb_pro/features/system_setup/domain/entities/currency_entity.dart';

abstract class CurrenciesRepository {
  Future<List<CurrencyEntity>> getAllCurrencies();
  Future<void> addCurrency(CurrencyEntity currency);
  Future<void> updateCurrency(CurrencyEntity currency);
  Future<void> deleteCurrency(String currencyCode);
  Future<void> addDenomination(CurrencyDenominationEntity denomination);
  Future<void> updateDenomination(CurrencyDenominationEntity denomination);
  Future<void> deleteDenomination(int id);
}
