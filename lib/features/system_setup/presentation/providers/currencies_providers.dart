import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/currencies_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/currencies_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/currency_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/currencies_repository.dart';
import 'package:muhaseb_pro/core/di/database_provider.dart';

final currenciesLocalDataSourceProvider = Provider<CurrenciesLocalDataSource>(
  (ref) => CurrenciesLocalDataSourceImpl(ref.read(databaseProvider)),
);

final currenciesRepositoryProvider = Provider<CurrenciesRepository>(
  (ref) => CurrenciesRepositoryImpl(ref.read(currenciesLocalDataSourceProvider)),
);

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

  Future<void> addDenomination(CurrencyDenominationEntity denomination) async {
    await _repository.addDenomination(denomination);
    _loadCurrencies();
  }

  Future<void> updateDenomination(CurrencyDenominationEntity denomination) async {
    await _repository.updateDenomination(denomination);
    _loadCurrencies();
  }

  Future<void> deleteDenomination(int id) async {
    await _repository.deleteDenomination(id);
    _loadCurrencies();
  }
}
