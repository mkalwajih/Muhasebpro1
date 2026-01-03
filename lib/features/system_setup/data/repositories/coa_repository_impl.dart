import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/account_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/coa_repository.dart';

class CoaRepositoryImpl implements CoaRepository {
  final AppDatabase database;

  CoaRepositoryImpl(this.database);

  @override
  Future<List<AccountEntity>> getChartOfAccounts() async {
    final allAccounts = await database.select(database.accounts).get();
    
    final accountMap = {for (var acc in allAccounts) acc.id: AccountEntity(
      id: acc.id,
      parentId: acc.parentAccountId,
      accountCode: acc.accountCode,
      nameAr: acc.accountNameAr,
      nameEn: acc.accountNameEn,
      level: 0, // Level calculation needs to be implemented
      isActive: acc.isActive,
      isParent: acc.isParent,
      nature: acc.nature,
      reportType: acc.reportType,
      cashFlowType: acc.cashFlowType ?? '',
      detailAccountType: acc.detailAccountType ?? '',
    )};
    
    final topLevelAccounts = <AccountEntity>[];

    for (var acc in allAccounts) {
      if (acc.parentAccountId == null) {
        topLevelAccounts.add(accountMap[acc.id]!);
      } else {
        final parent = accountMap[acc.parentAccountId];
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

  AccountsCompanion _toCompanion(AccountEntity account) {
    return AccountsCompanion(
      id: account.id == 0 ? const Value.absent() : Value(account.id),
      parentAccountId: Value(account.parentId),
      accountCode: Value(account.accountCode),
      accountNameAr: Value(account.nameAr),
      accountNameEn: Value(account.nameEn),
      // level: Value(account.level), // Not in AccountsCompanion, needs re-evaluation
      isActive: Value(account.isActive),
      nature: Value(account.nature),
      reportType: Value(account.reportType),
      cashFlowType: Value(account.cashFlowType),
      detailAccountType: Value(account.detailAccountType),
      accountTypeCode: const Value(''), // Placeholder, check requirements
      isParent: Value(account.isParent),
    );
  }

  
  Future<void> deleteAccount(int accountId) async {
     final children = await (database.select(database.accounts)..where((a) => a.parentAccountId.equals(accountId))).get();
     if(children.isNotEmpty){
       throw Exception("Cannot delete an account with children.");
     }
    await (database.delete(database.accounts)..where((a) => a.id.equals(accountId))).go();
  }
}
