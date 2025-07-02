import 'package:muhaseb_pro/core/permissions/app_permissions.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';

abstract class RoleManagementRepository {
  Future<List<RoleEntity>> getAllRoles();
  Future<void> addRole(RoleEntity role);
  Future<void> updateRole(RoleEntity role);
  Future<void> updatePermissionsForRole(int roleId, List<AppPermission> permissions);
}
