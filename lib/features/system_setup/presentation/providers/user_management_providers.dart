import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/auth_module.dart';
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
    try {
      final users = await _repository.getAllUsers();
      state = AsyncData(users);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
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
