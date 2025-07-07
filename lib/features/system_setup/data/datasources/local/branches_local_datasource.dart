import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/shared/data/models/branch_model.dart';
abstract class BranchesLocalDataSource {
  Future<List<Branch>> getAllBranches({bool includeInactive = false});
  Future<Branch?> getBranch(String branchCode);
  Future<void> addBranch(Branch branch);
  Future<void> updateBranch(Branch branch);
  Future<void> deactivateBranch(String branchCode);
}

class BranchesLocalDataSourceImpl implements BranchesLocalDataSource {
  final AppDatabase database;

  BranchesLocalDataSourceImpl(this.database);

  @override
  Future<List<Branch>> getAllBranches({bool includeInactive = false}) async {
    final query = database.select(database.branches);
    if (!includeInactive) {
      query.where((b) => b.branchStatus.equals(1)); // 1 for active
    }
    return await query.get();
  }

  @override
  Future<Branch?> getBranch(String branchCode) async {
    return await (database.select(database.branches)..where((b) => b.branchCode.equals(branchCode))).getSingleOrNull();
  }

  @override
  Future<void> addBranch(Branch branch) {
    return database.into(database.branches).insert(branch);
  }

  @override
  Future<void> updateBranch(Branch branch) {
    return database.update(database.branches).replace(branch);
  }

  @override
  Future<void> deactivateBranch(String branchCode) {
    return (database.update(database.branches)..where((b) => b.branchCode.equals(branchCode)))
        .write(const BranchesCompanion(branchStatus: Value(0))); // Set status to 0 (inactive)
  }
}
