import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/features/system_setup/domain/entities/account_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/coa_repository.dart';

class CoaRepositoryImpl implements CoaRepository {
  final db.AppDatabase database;

  CoaRepositoryImpl(this.database);

  @override
  Future<List<AccountEntity>> getChartOfAccounts() async {
    final allAccounts = await database.select(database.accounts).get();
    
    final accountMap = {for (var acc in allAccounts) acc.id: AccountEntity(
      id: acc.id,
      parentId: acc.parentId,
      accountCode: acc.accountCode,
      nameAr: acc.nameAr,
      nameEn: acc.nameEn,
      level: acc.level,
      isActive: acc.isActive,
      isParent: true,
      nature: acc.nature,
      reportType: acc.reportType,
      cashFlowType: acc.cashFlowType ?? '',
      detailAccountType: acc.detailAccountType ?? '',
    )};
    
    final topLevelAccounts = <AccountEntity>[];

    for (var acc in allAccounts) {
      if (acc.parentId == null) {
        topLevelAccounts.add(accountMap[acc.id]!);
      } else {
        final parent = accountMap[acc.parentId];
        if (parent != null) {
          parent.children.add(accountMap[acc.id]!);
        }
      }
    }
    return topLevelAccounts;
  }
  
  @override
  Future<void> addAccount(AccountEntity account) {
    final companion = _toCompanion(account);
    return database.into(database.accounts).insert(companion);
  }

  @override
  Future<void> updateAccount(AccountEntity account) {
    final companion = _toCompanion(account);
    return (database.update(database.accounts)..where((a) => a.id.equals(account.id))).write(companion);
  }

  db.AccountsCompanion _toCompanion(AccountEntity account) {
    return db.AccountsCompanion(
      id: account.id == 0 ? const Value.absent() : Value(account.id),
      parentId: Value(account.parentId),
      accountCode: Value(account.accountCode),
      nameAr: Value(account.nameAr),
      nameEn: Value(account.nameEn),
      level: Value(account.level),
      isActive: Value(account.isActive),
      nature: Value(account.nature),
      reportType: Value(account.reportType),
      cashFlowType: Value(account.cashFlowType),
      detailAccountType: Value(account.detailAccountType),
    );
  }

  
  Future<void> deleteAccount(int accountId) async {
     final children = await (database.select(database.accounts)..where((a) => a.parentId.equals(accountId))).get();
     if(children.isNotEmpty){
       throw Exception("Cannot delete an account with children.");
     }
    await (database.delete(database.accounts)..where((a) => a.id.equals(accountId))).go();
  }
}
