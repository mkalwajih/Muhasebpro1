import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/role_management_repository.dart';

class RoleManagementRepositoryImpl implements RoleManagementRepository {
  final db.AppDatabase database;
  RoleManagementRepositoryImpl(this.database);

  @override
  Future<List<RoleEntity>> getAllRoles() async {
    final rolesList = await database.select(database.roles).get();
    final permissionsList = await database.select(database.rolePermissions).get();

    return rolesList.map((role) {
      final assignedPermissionKeys = permissionsList
          .where((p) => p.roleId == role.id)
          .map((p) => AppPermission.values.byName(p.permission))
          .toList();

      return RoleEntity(
        id: role.id,
        nameAr: role.nameAr,
        nameEn: role.nameEn,
        description: role.description ?? '',
        isActive: role.isActive,
        permissions: assignedPermissionKeys,
      );
    }).toList();
  }
  
    @override
  Future<List<RoleEntity>> getRolesForUser(int userId) async {
    // 1. Find all role IDs for the given user
    final userRolesQuery = database.select(database.userRoles)
      ..where((ur) => ur.userId.equals(userId));
    final userRoles = await userRolesQuery.get();
    final roleIds = userRoles.map((ur) => ur.roleId).toList();

    if (roleIds.isEmpty) {
      return [];
    }

    // 2. Fetch the details for those roles
    final rolesQuery = database.select(database.roles)
      ..where((r) => r.id.isIn(roleIds) & r.isActive.equals(true));
    final rolesList = await rolesQuery.get();

    // 3. Fetch all permissions for the fetched roles in a single query
    final permissionsQuery = database.select(database.rolePermissions)
      ..where((p) => p.roleId.isIn(roleIds));
    final permissionsList = await permissionsQuery.get();

    // 4. Map the results
    return rolesList.map((role) {
      final assignedPermissions = permissionsList
          .where((p) => p.roleId == role.id)
          .map((p) => AppPermission.values.byName(p.permission))
          .toList();
      
      return RoleEntity(
        id: role.id,
        nameAr: role.nameAr,
        nameEn: role.nameEn,
        description: role.description ?? '',
        isActive: role.isActive,
        permissions: assignedPermissions,
      );
    }).toList();
  }


  @override
  Future<void> addRole(RoleEntity role) {
    // Adding a role doesn't assign permissions initially.
    final companion = db.RolesCompanion.insert(
      nameAr: role.nameAr,
      nameEn: role.nameEn,
      description: Value(role.description),
      isActive: role.isActive,
    );
    return database.into(database.roles).insert(companion);
  }

  @override
  Future<void> updateRole(RoleEntity role) {
    // This method only updates the role's own details, not its permissions.
    final companion = db.RolesCompanion(
      id: Value(role.id),
      nameAr: Value(role.nameAr),
      nameEn: Value(role.nameEn),
      description: Value(role.description),
      isActive: Value(role.isActive),
    );
    return (database.update(database.roles)..where((r) => r.id.equals(role.id)))
        .write(companion);
  }

  @override
  Future<void> updatePermissionsForRole(int roleId, List<AppPermission> permissions) async {
    await database.transaction(() async {
      // 1. Delete all existing permissions for this role
      await (database.delete(database.rolePermissions)..where((p) => p.roleId.equals(roleId))).go();

      // 2. Insert the new permissions
      final permissionsToInsert = permissions.map((p) =>
          db.RolePermissionsCompanion.insert(roleId: roleId, permission: p.name)); 
      
      if (permissionsToInsert.isNotEmpty) {
        await database.batch((batch) {
          batch.insertAll(database.rolePermissions, permissionsToInsert);
        });
      }
    });
  }
}
