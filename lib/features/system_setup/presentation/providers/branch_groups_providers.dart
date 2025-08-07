import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/branch_groups_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/branch_groups_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_group_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/branch_groups_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';

final branchGroupsLocalDataSourceProvider = Provider<IBranchGroupsLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return BranchGroupsLocalDataSource(db);
});

final branchGroupsRepositoryProvider = Provider<IBranchGroupsRepository>((ref) {
  final localDataSource = ref.watch(branchGroupsLocalDataSourceProvider);
  return BranchGroupsRepository(localDataSource);
});

final branchGroupsProvider = StateNotifierProvider<BranchGroupsNotifier, AsyncValue<List<BranchGroupEntity>>>((ref) {
  final repository = ref.watch(branchGroupsRepositoryProvider);
  return BranchGroupsNotifier(repository);
});

class BranchGroupsNotifier extends StateNotifier<AsyncValue<List<BranchGroupEntity>>> {
  final IBranchGroupsRepository _repository;

  BranchGroupsNotifier(this._repository) : super(const AsyncLoading()) {
    getAllBranchGroups();
  }

  Future<void> getAllBranchGroups() async {
    state = const AsyncLoading();
    final result = await _repository.getAllBranchGroups();
    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current),
      (data) => state = AsyncData(data),
    );
  }

  Future<void> addBranchGroup(BranchGroupEntity branchGroup) async {
    final result = await _repository.addBranchGroup(branchGroup);
    result.fold(
      (failure) => _handleFailure(failure),
      (_) => getAllBranchGroups(),
    );
  }

  Future<void> updateBranchGroup(BranchGroupEntity branchGroup) async {
    final result = await _repository.updateBranchGroup(branchGroup);
    result.fold(
      (failure) => _handleFailure(failure),
      (_) => getAllBranchGroups(),
    );
  }

  Future<void> deleteBranchGroup(int id) async {
    final result = await _repository.deleteBranchGroup(id);
    result.fold(
      (failure) => _handleFailure(failure),
      (_) => getAllBranchGroups(),
    );
  }

  void _handleFailure(Failure failure) {
    if (mounted) {
      // Revert to the previous successful state to avoid showing an error screen
      state = state.whenData((value) => value);
      // You can then show a dialog or snackbar with the failure message
      // For simplicity, re-throwing here to be caught by a UI layer if needed
      throw failure;
    }
  }
}
