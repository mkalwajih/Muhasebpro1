import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/add_branch.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/deactivate_branch.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/delete_branch_usecase.dart'; // New import
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_all_branches.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_branch.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/update_branch.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';

// Use Case Providers
final getAllBranchesUseCaseProvider = Provider<GetAllBranchesUseCase>(
    (ref) => GetAllBranchesUseCase(ref.watch(branchesRepositoryProvider)));

final getBranchUseCaseProvider = Provider<GetBranchUseCase>(
    (ref) => GetBranchUseCase(ref.watch(branchesRepositoryProvider)));

final addBranchUseCaseProvider = Provider<AddBranchUseCase>(
    (ref) => AddBranchUseCase(ref.watch(branchesRepositoryProvider)));

final updateBranchUseCaseProvider = Provider<UpdateBranchUseCase>(
    (ref) => UpdateBranchUseCase(ref.watch(branchesRepositoryProvider)));

final deactivateBranchUseCaseProvider = Provider<DeactivateBranchUseCase>(
    (ref) => DeactivateBranchUseCase(ref.watch(branchesRepositoryProvider)));

final deleteBranchUseCaseProvider = Provider<DeleteBranchUseCase>(
    (ref) => DeleteBranchUseCase(ref.watch(branchesRepositoryProvider))); // New provider


// Branches List Notifier
final branchesProvider = StateNotifierProvider<BranchesNotifier, AsyncValue<List<BranchEntity>>>((ref) {
  return BranchesNotifier(
    ref.watch(getAllBranchesUseCaseProvider),
    ref.watch(addBranchUseCaseProvider),
    ref.watch(updateBranchUseCaseProvider),
    ref.watch(deactivateBranchUseCaseProvider),
    ref.watch(deleteBranchUseCaseProvider),
  );
});

class BranchesNotifier extends StateNotifier<AsyncValue<List<BranchEntity>>> {
  final GetAllBranchesUseCase _getAllBranches;
  final AddBranchUseCase _addBranch;
  final UpdateBranchUseCase _updateBranch;
  final DeactivateBranchUseCase _deactivateBranch;
  final DeleteBranchUseCase _deleteBranch;

  BranchesNotifier(
    this._getAllBranches,
    this._addBranch,
    this._updateBranch,
    this._deactivateBranch,
    this._deleteBranch,
  ) : super(const AsyncValue.loading()) {
    _fetchBranches();
  }

  Future<void> _fetchBranches({bool includeInactive = false}) async {
    state = const AsyncValue.loading();
    final result = await _getAllBranches(GetAllBranchesParams(includeInactive: includeInactive));
    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (branches) => AsyncValue.data(branches),
    );
  }

  Future<Either<Failure, Unit>> addBranch(BranchEntity branch) async {
    final result = await _addBranch(branch);
    result.fold(
      (failure) {},
      (_) => _fetchBranches(),
    );
    return result;
  }

  Future<Either<Failure, Unit>> updateBranch(BranchEntity branch) async {
    final result = await _updateBranch(branch);
    result.fold(
      (failure) {},
      (_) => _fetchBranches(),
    );
    return result;
  }

  Future<Either<Failure, Unit>> deactivateBranch(String branchCode) async {
    final result = await _deactivateBranch(branchCode);
    result.fold(
      (failure) {},
      (_) => _fetchBranches(),
    );
    return result;
  }

  Future<Either<Failure, Unit>> deleteBranch(int id) async {
    final result = await _deleteBranch(id);
    result.fold(
      (failure) {},
      (_) => _fetchBranches(),
    );
    return result.map((_) => unit);
  }
}

// Provider for the currently selected branch in the UI (for master-detail view)
final selectedBranchProvider = StateProvider<BranchEntity?>((ref) => null);
