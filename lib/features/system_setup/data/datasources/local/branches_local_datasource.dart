import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/shared/data/models/branch_model.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_entity.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';
import 'package:sqlite3/sqlite3.dart';

abstract class BranchesLocalDataSource {
  Future<List<BranchModel>> getAllBranches({bool includeInactive = false});
  Future<BranchModel?> getBranch(String branchCode);
  Future<void> addBranch(BranchEntity branch);
  Future<void> updateBranch(BranchEntity branch);
  Future<void> deactivateBranch(String branchCode);
  Future<void> deleteBranch(int id);
}

class BranchesLocalDataSourceImpl implements BranchesLocalDataSource {
  final AppDatabase database;

  BranchesLocalDataSourceImpl(this.database);

  @override
  Future<List<BranchModel>> getAllBranches({bool includeInactive = false}) async {
    final query = database.select(database.branches);
    if (!includeInactive) {
      query.where((b) => b.branchStatus.equals(true));
    }
    final result = await query.get();
    return result.map((b) => BranchModel.fromDb(b)).toList();
  }

  @override
  Future<BranchModel?> getBranch(String branchCode) async {
    final branch = await (database.select(database.branches)..where((b) => b.branchCode.equals(branchCode))).getSingleOrNull();
    return branch != null ? BranchModel.fromDb(branch) : null;
  }

  @override
  Future<void> addBranch(BranchEntity branch) {
    final branchCompanion = BranchModel.fromEntity(branch).toDb();
    return database.into(database.branches).insert(branchCompanion);
  }

  @override
  Future<void> updateBranch(BranchEntity branch) {
    final branchCompanion = BranchModel.fromEntity(branch).toDb();
    return database.update(database.branches).replace(branchCompanion);
  }

  @override
  Future<void> deactivateBranch(String branchCode) {
    return (database.update(database.branches)..where((b) => b.branchCode.equals(branchCode)))
        .write(const BranchesCompanion(branchStatus: Value(false)));
  }

  @override
  Future<void> deleteBranch(int id) async {
    try {
      final deletedRows = await (database.delete(database.branches)..where((tbl) => tbl.id.equals(id))).go();
      if (deletedRows == 0) {
        throw NotFoundException(message: 'Branch not found.');
      }
    } on SqliteException catch (e) {
      if (e.message.contains('FOREIGN KEY constraint failed')) {
        throw DataIntegrityException(message: 'Cannot delete branch: linked transactions or data exist.');
      }
      rethrow;
    }
  }
}
