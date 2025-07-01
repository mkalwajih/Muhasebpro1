import 'package:muhaseb_pro/features/system_setup/domain/entities/account_entity.dart';

abstract class CoaRepository {
  Future<List<AccountEntity>> getChartOfAccounts();
  Future<void> addAccount(AccountEntity account);
  Future<void> updateAccount(AccountEntity account);
}
