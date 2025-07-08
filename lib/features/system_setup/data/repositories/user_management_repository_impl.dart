import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/features/authentication/data/datasources/local/auth_local_datasource.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/user_management_repository.dart';

class UserManagementRepositoryImpl implements UserManagementRepository {
  final db.AppDatabase database;
  final AuthLocalDataSource authLocalDataSource;

  UserManagementRepositoryImpl({required this.database, required this.authLocalDataSource});

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
          .where((ur) => ur.userId == user.id)
          .map((ur) => ur.roleId);
      
      final assignedRoles = assignedRoleIds
          .map((roleId) => rolesMap[roleId])
          .where((role) => role != null)
          .map((role) => RoleEntity(
                id: role!.id,
                nameAr: role.nameAr,
                nameEn: role.nameEn,
                isActive: role.isActive,
                description: role.description ?? ''
              ))
          .toList();

      return UserEntity(
        userId: user.id,
        username: user.username,
        fullNameAr: user.fullNameAr,
        fullNameEn: user.fullNameEn,
        isActive: user.isActive,
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
        fullNameAr: Value(user.fullNameAr),
        fullNameEn: Value(user.fullNameEn),
        isActive: Value(user.isActive),
        passwordHash: newPassword != null ? Value(newPassword) : const Value.absent(),
      );

      if (newPassword != null) {
        final localAuth = authLocalDataSource as AuthLocalDataSourceImpl;
        final hashedCompanion = localAuth.hashPasswordForUpdate(userCompanion);
        await (database.update(database.users)..where((u) => u.id.equals(user.userId))).write(hashedCompanion);
      } else {
        await (database.update(database.users)..where((u) => u.id.equals(user.userId))).write(userCompanion);
      }

      // 2. Delete all existing roles for this user
      await (database.delete(database.userRoles)..where((ur) => ur.userId.equals(user.userId))).go();

      // 3. Insert the new roles
      final rolesToInsert = user.roles.map((role) =>
          db.UserRolesCompanion.insert(userId: user.userId, roleId: role.id));
      
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
        passwordHash: password,
        fullNameAr: user.fullNameAr,
        fullNameEn: user.fullNameEn,
        isActive: Value(user.isActive),
      );
      final newUserId = await authLocalDataSource.insertUser(companion);
      
      // 2. Insert their roles
      final rolesToInsert = user.roles.map((role) =>
          db.UserRolesCompanion.insert(userId: newUserId, roleId: role.id));

      if(rolesToInsert.isNotEmpty){
        await database.batch((batch) {
          batch.insertAll(database.userRoles, rolesToInsert);
        });
      }
    });
  }
}
