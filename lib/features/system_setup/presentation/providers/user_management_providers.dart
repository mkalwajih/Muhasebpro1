import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/user_management_repository.dart';

final userManagementProvider = StateNotifierProvider<UserManagementNotifier, AsyncValue<List<UserEntity>>>((ref) {
  return UserManagementNotifier(ref.watch(userManagementRepositoryProvider));
});

class UserManagementNotifier extends StateNotifier<AsyncValue<List<UserEntity>>> {
  final UserManagementRepository _repository;

  UserManagementNotifier(this._repository) : super(const AsyncLoading()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    state = const AsyncLoading();
    final result = await _repository.getAllUsers();
    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current), // Map Failure to AsyncError
      (users) => state = AsyncData(users),
    );
  }

  Future<void> addUser(UserEntity user, String password) async {
    await _repository.addUser(user, password);
    await fetchUsers();
  }

  Future<void> updateUser(UserEntity user, {String? newPassword}) async {
    await _repository.updateUser(user, newPassword: newPassword);
    await fetchUsers();
  }
}
