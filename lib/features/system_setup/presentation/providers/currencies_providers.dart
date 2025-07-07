import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/currency_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/currencies_repository.dart';

final currenciesProvider = StateNotifierProvider<CurrenciesNotifier, AsyncValue<List<CurrencyEntity>>>(
  (ref) => CurrenciesNotifier(ref.read(currenciesRepositoryProvider)),
);

class CurrenciesNotifier extends StateNotifier<AsyncValue<List<CurrencyEntity>>> {
  final CurrenciesRepository _repository;

  CurrenciesNotifier(this._repository) : super(const AsyncValue.loading()) {
    _loadCurrencies();
  }

  Future<void> _loadCurrencies() async {
    try {
      final currencies = await _repository.getAllCurrencies();
      state = AsyncValue.data(currencies);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCurrency(CurrencyEntity currency) async {
    await _repository.addCurrency(currency);
    _loadCurrencies();
  }

  Future<void> updateCurrency(CurrencyEntity currency) async {
    await _repository.updateCurrency(currency);
    _loadCurrencies();
  }

  Future<void> deleteCurrency(String currencyCode) async {
    await _repository.deleteCurrency(currencyCode);
    _loadCurrencies();
  }

  Future<void> addDenomination(DenominationEntity denomination) async {
    await _repository.addDenomination(denomination);
    _loadCurrencies();
  }

  Future<void> updateDenomination(DenominationEntity denomination) async {
    await _repository.updateDenomination(denomination);
    _loadCurrencies();
  }

  Future<void> deleteDenomination(int id) async {
    await _repository.deleteDenomination(id);
    _loadCurrencies();
  }
}
