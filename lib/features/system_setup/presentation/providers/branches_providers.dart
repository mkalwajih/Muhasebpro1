import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/db/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/datasources/branches_local_datasource.dart';
import '../../data/repositories/branches_repository_impl.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/repositories/branches_repository.dart';
import '../../domain/usecases/add_branch.dart';
import '../../domain/usecases/delete_branch.dart';
import '../../domain/usecases/get_all_branches.dart';
import '../../domain/usecases/update_branch.dart';

// 1. Data Layer Providers (no change)
final branchesLocalDataSourceProvider = Provider<BranchesLocalDataSource>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return BranchesLocalDataSourceImpl(database: database);
});

final branchesRepositoryProvider = Provider<BranchesRepository>((ref) {
  final localDataSource = ref.watch(branchesLocalDataSourceProvider);
  return BranchesRepositoryImpl(localDataSource: localDataSource);
});

// 2. Use Case Providers (no change)
final getAllBranchesUseCaseProvider = Provider<GetAllBranches>((ref) {
  return GetAllBranches(ref.watch(branchesRepositoryProvider));
});

final addBranchUseCaseProvider = Provider<AddBranch>((ref) {
  return AddBranch(ref.watch(branchesRepositoryProvider));
});

final updateBranchUseCaseProvider = Provider<UpdateBranch>((ref) {
  return UpdateBranch(ref.watch(branchesRepositoryProvider));
});

final deleteBranchUseCaseProvider = Provider<DeleteBranch>((ref) {
  return DeleteBranch(ref.watch(branchesRepositoryProvider));
});


// 3. StateNotifier for Branches
class BranchesNotifier extends StateNotifier<AsyncValue<List<BranchEntity>>> {
  final GetAllBranches _getAllBranches;
  final AddBranch _addBranch;
  final UpdateBranch _updateBranch;
  final DeleteBranch _deleteBranch;

  BranchesNotifier(this._getAllBranches, this._addBranch, this._updateBranch, this._deleteBranch)
      : super(const AsyncValue.loading()) {
    fetchBranches();
  }

  Future<void> fetchBranches() async {
    state = const AsyncValue.loading();
    final result = await _getAllBranches(NoParams());
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (branches) => state = AsyncValue.data(branches),
    );
  }

  Future<void> addBranch(BranchEntity branch) async {
    final result = await _addBranch(AddBranchParams(branch: branch));
    result.fold(
      (failure) {
        // Optionally handle failure, e.g., show a snackbar
      },
      (_) => fetchBranches(), // Refresh the list on success
    );
  }

  Future<void> updateBranch(BranchEntity branch) async {
    final result = await _updateBranch(UpdateBranchParams(branch: branch));
     result.fold(
      (failure) {
        // Optionally handle failure
      },
      (_) => fetchBranches(), // Refresh the list
    );
  }

  Future<void> deleteBranch(String branchCode) async {
    final result = await _deleteBranch(DeleteBranchParams(branchCode: branchCode));
     result.fold(
      (failure) {
        // Optionally handle failure
      },
      (_) => fetchBranches(), // Refresh the list
    );
  }
}

// 4. The StateNotifierProvider
final branchesProvider = StateNotifierProvider<BranchesNotifier, AsyncValue<List<BranchEntity>>>((ref) {
  return BranchesNotifier(
    ref.watch(getAllBranchesUseCaseProvider),
    ref.watch(addBranchUseCaseProvider),
    ref.watch(updateBranchUseCaseProvider),
    ref.watch(deleteBranchUseCaseProvider),
  );
});
