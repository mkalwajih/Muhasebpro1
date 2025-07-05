import '../../../../core/db/app_database.dart';
import '../models/branch_model.dart';

abstract class BranchesLocalDataSource {
  Future<List<BranchModel>> getAllBranches();
  Future<BranchModel?> getBranch(String branchCode);
  Future<void> addBranch(BranchModel branch);
  Future<void> updateBranch(BranchModel branch);
  Future<void> deleteBranch(String branchCode);
}

class BranchesLocalDataSourceImpl implements BranchesLocalDataSource {
  final AppDatabase database;

  BranchesLocalDataSourceImpl({required this.database});

  @override
  Future<List<BranchModel>> getAllBranches() async {
    final branches = await database.select(database.branches).get();
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
  Future<void> deleteBranch(String branchCode) {
    return (database.delete(database.branches)..where((b) => b.branchCode.equals(branchCode))).go();
  }
}
