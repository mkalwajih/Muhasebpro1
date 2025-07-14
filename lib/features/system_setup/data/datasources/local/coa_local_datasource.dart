
import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/authentication/data/datasources/local/auth_local_datasource.dart';

abstract class CoaLocalDataSource {
  Future<void> addAccount(ChartOfAccountsCompanion account);
  Future<void> updateAccount(ChartOfAccountsCompanion account);
  Future<void> deleteAccount(int id);
  Future<List<ChartOfAccount>> getAccounts();
  Future<ChartOfAccount?> getAccount(int id);
}

class CoaLocalDataSourceImpl implements CoaLocalDataSource {
  final AppDatabase database;
  final AuthLocalDataSource authLocalDataSource;

  CoaLocalDataSourceImpl({required this.database, required this.authLocalDataSource});

  @override
  Future<void> addAccount(ChartOfAccountsCompanion account) async {
    await database.into(database.chartOfAccounts).insert(account);
  }

  @override
  Future<void> updateAccount(ChartOfAccountsCompanion account) async {
    await (database.update(database.chartOfAccounts)
          ..where((tbl) => tbl.id.equals(account.id.value)))
        .write(account);
  }

  @override
  Future<void> deleteAccount(int id) async {
    await (database.delete(database.chartOfAccounts)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  @override
  Future<List<ChartOfAccount>> getAccounts() async {
    return await database.select(database.chartOfAccounts).get();
  }

  @override
  Future<ChartOfAccount?> getAccount(int id) async {
    return await (database.select(database.chartOfAccounts)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }
}
