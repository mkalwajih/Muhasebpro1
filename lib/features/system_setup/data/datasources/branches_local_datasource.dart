import '../../../../core/db/app_database.dart';
import '../models/branch_model.dart';
import 'package:drift/drift.dart'; // Import for .toUpdateCompanion()

abstract class BranchesLocalDataSource {
  Future<List<BranchModel>> getAllBranches({bool includeInactive = false});
  Future<BranchModel?> getBranch(String branchCode);
  Future<void> addBranch(BranchModel branch);
  Future<void> updateBranch(BranchModel branch);
  Future<void> deactivateBranch(String branchCode);
}

class BranchesLocalDataSourceImpl implements BranchesLocalDataSource {
  final AppDatabase database;

  BranchesLocalDataSourceImpl({required this.database});

  @override
  Future<List<BranchModel>> getAllBranches({bool includeInactive = false}) async {
    final query = database.select(database.branches);
    if (!includeInactive) {
      query.where((b) => b.branchStatus.equals(1)); // 1 for active
    }
    final branches = await query.get();
    return branches.map((branch) => BranchModel.fromDb(branch)).toList();
  }

  @override
  Future<BranchModel?> getBranch(String branchCode) async {
    final branch = await (database.select(database.branches)..where((b) => b.branchCode.equals(branchCode))).getSingleOrNull();
    return branch != null ? BranchModel.fromDb(branch) : null;
  }

  @override
  Future<void> addBranch(BranchModel branch) {
    return database.into(database.branches).insert(branch.toDb());
  }

  @override
  Future<void> updateBranch(BranchModel branch) {
    return database.update(database.branches).replace(branch.toDb());
  }

  @override
  Future<void> deactivateBranch(String branchCode) {
    return (database.update(database.branches)..where((b) => b.branchCode.equals(branchCode)))
        .write(BranchesCompanion(branchStatus: const Value(0))); // Set status to 0 (inactive)
  }
}
