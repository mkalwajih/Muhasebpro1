import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/core/di/database_provider.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/coa_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/account_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/coa_repository.dart';

final coaRepositoryProvider = Provider<CoaRepository>(
  (ref) => CoaRepositoryImpl(ref.watch(appDatabaseProvider)),
);

final coaProvider = StateNotifierProvider<CoaNotifier, AsyncValue<List<AccountEntity>>>((ref) {
  return CoaNotifier(ref.watch(coaRepositoryProvider));
});

class CoaNotifier extends StateNotifier<AsyncValue<List<AccountEntity>>> {
  final CoaRepository _repository;

  CoaNotifier(this._repository) : super(const AsyncLoading()) {
    fetchCoa();
  }

  Future<void> fetchCoa() async {
    state = const AsyncLoading();
    try {
      final coa = await _repository.getChartOfAccounts();
      state = AsyncData(coa);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> addAccount(AccountEntity account) async {
    await _repository.addAccount(account);
    await fetchCoa();
  }

  Future<void> updateAccount(AccountEntity account) async {
    await _repository.updateAccount(account);
    await fetchCoa();
  }
}
