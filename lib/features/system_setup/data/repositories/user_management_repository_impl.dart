import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/user_management_repository.dart';

class UserManagementRepositoryImpl implements UserManagementRepository {
  final db.AppDatabase database;
  final AuthLocalDataSource authLocalDataSource;

  UserManagementRepositoryImpl(this.database, this.authLocalDataSource);

  @override
  Future<List<UserEntity>> getAllUsers() async {
    // 1. Fetch all users, roles, and user_roles links
    final usersList = await database.select(database.users).get();
    final rolesList = await database.select(database.roles).get();
    final userRolesList = await database.select(database.userRoles).get();

    // 2. Create a map of roles for easy lookup
    final rolesMap = {for (var r in rolesList) r.id: r};

    // 3. Map users to UserEntity, including their assigned roles
    return usersList.map((user) {
      final assignedRoleIds = userRolesList
          .where((ur) => ur.user_id == user.id)
          .map((ur) => ur.role_id);
      
      final assignedRoles = assignedRoleIds
          .map((roleId) => rolesMap[roleId])
          .where((role) => role != null)
          .map((role) => RoleEntity(
                id: role!.id,
                nameAr: role.name_ar,
                nameEn: role.name_en,
                isActive: role.is_active,
                description: role.description
              ))
          .toList();

      return UserEntity(
        userId: user.id,
        username: user.username,
        fullNameAr: user.full_name_ar,
        fullNameEn: user.full_name_en,
        isActive: user.is_active,
        roles: assignedRoles,
      );
    }).toList();
  }
  
  @override
  Future<void> updateUser(UserEntity user, {String? newPassword}) async {
    await database.transaction(() async {
      // 1. Update the user details
       final userCompanion = db.UsersCompanion(
        id: Value(user.userId),
        username: Value(user.username),
        full_name_ar: Value(user.fullNameAr),
        full_name_en: Value(user.fullNameEn),
        is_active: Value(user.isActive),
        password_hash: newPassword != null ? Value(newPassword) : const Value.absent(),
      );

      if (newPassword != null) {
        final localAuth = authLocalDataSource as AuthLocalDataSourceImpl;
        final hashedCompanion = localAuth.hashPasswordForUpdate(userCompanion);
        await (database.update(database.users)..where((u) => u.id.equals(user.userId))).write(hashedCompanion);
      } else {
        await (database.update(database.users)..where((u) => u.id.equals(user.userId))).write(userCompanion);
      }

      // 2. Delete all existing roles for this user
      await (database.delete(database.userRoles)..where((ur) => ur.user_id.equals(user.userId))).go();

      // 3. Insert the new roles
      final rolesToInsert = user.roles.map((role) =>
          db.UserRolesCompanion.insert(user_id: user.userId, role_id: role.id));
      
      if (rolesToInsert.isNotEmpty) {
        await database.batch((batch) {
          batch.insertAll(database.userRoles, rolesToInsert);
        });
      }
    });
  }

  @override
  Future<void> addUser(UserEntity user, String password) async {
    await database.transaction(() async {
      // 1. Add the new user
      final companion = db.UsersCompanion.insert(
        username: user.username,
        password_hash: password,
        full_name_ar: user.fullNameAr,
        full_name_en: user.fullNameEn,
        is_active: Value(user.isActive),
      );
      final newUserId = await authLocalDataSource.insertUser(companion);
      
      // 2. Insert their roles
      final rolesToInsert = user.roles.map((role) =>
          db.UserRolesCompanion.insert(user_id: newUserId, role_id: role.id));

      if(rolesToInsert.isNotEmpty){
        await database.batch((batch) {
          batch.insertAll(database.userRoles, rolesToInsert);
        });
      }
    });
  }
}
