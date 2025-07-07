import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/add_branch.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/deactivate_branch.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_all_branches.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/update_branch.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

// 2. Use Case Providers (updated for deactivate)
final getAllBranchesUseCaseProvider = Provider<GetAllBranches>((ref) {
  return GetAllBranches(ref.watch(branchesRepositoryProvider));
});

final addBranchUseCaseProvider = Provider<AddBranch>((ref) {
  return AddBranch(ref.watch(branchesRepositoryProvider));
});

final updateBranchUseCaseProvider = Provider<UpdateBranch>((ref) {
  return UpdateBranch(ref.watch(branchesRepositoryProvider));
});

final deactivateBranchUseCaseProvider = Provider<DeactivateBranch>((ref) {
  return DeactivateBranch(ref.watch(branchesRepositoryProvider));
});

// 3. StateNotifier for Branches
class BranchesNotifier extends StateNotifier<AsyncValue<List<BranchEntity>>> {
  final GetAllBranches _getAllBranches;
  final AddBranch _addBranch;
  final UpdateBranch _updateBranch;
  final DeactivateBranch _deactivateBranch;

  BranchesNotifier(this._getAllBranches, this._addBranch, this._updateBranch, this._deactivateBranch)
      : super(const AsyncValue.loading()) {
    fetchBranches();
  }

  Future<void> fetchBranches({bool includeInactive = false}) async {
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
      (_) => fetchBranches(),
    );
  }

  Future<void> updateBranch(BranchEntity branch) async {
    final result = await _updateBranch(UpdateBranchParams(branch: branch));
     result.fold(
      (failure) {
        // Optionally handle failure
      },
      (_) => fetchBranches(),
    );
  }

  Future<void> deactivateBranch(String branchCode) async {
    final result = await _deactivateBranch(DeactivateBranchParams(branchCode: branchCode));
     result.fold(
      (failure) {
        // Optionally handle failure
      },
      (_) => fetchBranches(),
    );
  }
}

// 4. The StateNotifierProvider
final branchesProvider = StateNotifierProvider<BranchesNotifier, AsyncValue<List<BranchEntity>>>((ref) {
  return BranchesNotifier(
    ref.watch(getAllBranchesUseCaseProvider),
    ref.watch(addBranchUseCaseProvider),
    ref.watch(updateBranchUseCaseProvider),
    ref.watch(deactivateBranchUseCaseProvider),
  );
});
