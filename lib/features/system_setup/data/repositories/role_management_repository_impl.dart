import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/core/permissions/app_permissions.dart';
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
          .where((p) => p.role_id == role.id)
          .map((p) => AppPermission.values.byName(p.permission)) // Fix: Convert String to AppPermission
          .toList();

      return RoleEntity(
        id: role.id,
        nameAr: role.name_ar,
        nameEn: role.name_en,
        description: role.description,
        isActive: role.is_active,
        permissions: assignedPermissionKeys,
      );
    }).toList();
  }

  @override
  Future<void> addRole(RoleEntity role) {
    // Adding a role doesn't assign permissions initially.
    final companion = db.RolesCompanion.insert(
      name_ar: role.nameAr,
      name_en: role.nameEn,
      description: Value(role.description),
      is_active: Value(role.isActive),
    );
    return database.into(database.roles).insert(companion);
  }

  @override
  Future<void> updateRole(RoleEntity role) {
    // This method only updates the role's own details, not its permissions.
    final companion = db.RolesCompanion(
      id: Value(role.id),
      name_ar: Value(role.nameAr),
      name_en: Value(role.nameEn),
      description: Value(role.description),
      is_active: Value(role.isActive),
    );
    return (database.update(database.roles)..where((r) => r.id.equals(role.id)))
        .write(companion);
  }

  @override
  Future<void> updatePermissionsForRole(int roleId, List<AppPermission> permissions) async {
    await database.transaction(() async {
      // 1. Delete all existing permissions for this role
      await (database.delete(database.rolePermissions)..where((p) => p.role_id.equals(roleId))).go();

      // 2. Insert the new permissions
      final permissionsToInsert = permissions.map((p) =>
          db.RolePermissionsCompanion.insert(role_id: roleId, permission: p.name)); // Fix: Convert AppPermission to String
      
      if (permissionsToInsert.isNotEmpty) {
        await database.batch((batch) {
          batch.insertAll(database.rolePermissions, permissionsToInsert);
        });
      }
    });
  }
}
