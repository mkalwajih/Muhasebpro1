import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/role_management_repository.dart';
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';

final roleManagementProvider = StateNotifierProvider<RoleManagementNotifier, AsyncValue<List<RoleEntity>>>((ref) {
  return RoleManagementNotifier(ref.watch(roleManagementRepositoryProvider));
});

class RoleManagementNotifier extends StateNotifier<AsyncValue<List<RoleEntity>>> {
  final RoleManagementRepository _repository;

  RoleManagementNotifier(this._repository) : super(const AsyncLoading()) {
    fetchRoles();
  }

  Future<void> fetchRoles() async {
    state = const AsyncLoading();
    try {
      final roles = await _repository.getAllRoles();
      state = AsyncData(roles);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> addRole(RoleEntity role) async {
    await _repository.addRole(role);
    await fetchRoles();
  }

  Future<void> updateRole(RoleEntity role) async {
    await _repository.updateRole(role);
    await fetchRoles();
  }

  Future<void> updatePermissions(int roleId, List<AppPermission> permissions) async {
    await _repository.updatePermissionsForRole(roleId, permissions);
    await fetchRoles();
  }
}
