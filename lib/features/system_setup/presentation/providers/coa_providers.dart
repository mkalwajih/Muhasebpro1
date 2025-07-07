import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/account_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/coa_repository.dart';

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
