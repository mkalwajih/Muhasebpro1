import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/features/system_setup/domain/entities/account_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/coa_repository.dart';

class CoaRepositoryImpl implements CoaRepository {
  final db.AppDatabase database;
  CoaRepositoryImpl(this.database);

  @override
  Future<List<AccountEntity>> getChartOfAccounts() async {
    final accountsList = await database.select(database.accounts).get();
    return _buildTree(accountsList, null);
  }

  List<AccountEntity> _buildTree(List<db.Account> allAccounts, int? parentId) {
    return allAccounts
        .where((account) => account.parentId == parentId)
        .map((account) {
          return AccountEntity(
            id: account.id,
            parentId: account.parentId,
            accountCode: account.accountCode,
            nameAr: account.nameAr,
            nameEn: account.nameEn,
            level: account.level,
            type: account.type,
            isActive: account.isActive,
            children: _buildTree(allAccounts, account.id),
          );
        })
        .toList();
  }

  @override
  Future<void> addAccount(AccountEntity account) {
    final companion = db.AccountsCompanion.insert(
      accountCode: account.accountCode,
      nameAr: account.nameAr,
      nameEn: account.nameEn,
      level: account.level,
      type: account.type,
      parentId: Value(account.parentId),
    );
    return database.into(database.accounts).insert(companion);
  }

  @override
  Future<void> updateAccount(AccountEntity account) {
    final companion = db.AccountsCompanion(
      id: Value(account.id),
      accountCode: Value(account.accountCode),
      nameAr: Value(account.nameAr),
      nameEn: Value(account.nameEn),
      level: Value(account.level),
      type: Value(account.type),
      parentId: Value(account.parentId),
      isActive: Value(account.isActive),
    );
    return (database.update(database.accounts)..where((t) => t.id.equals(account.id))).write(companion);
  }
}
