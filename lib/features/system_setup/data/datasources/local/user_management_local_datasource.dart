import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';
import 'package:muhaseb_pro/shared/data/models/role_model.dart';
import 'package:muhaseb_pro/shared/data/models/user_model.dart';

abstract class IUserManagementLocalDataSource {
  Future<List<UserEntity>> getAllUsers();
  Future<List<RoleEntity>> getUserRoles(int userId);
  Future<void> addUser(UserEntity user, String passwordHash);
  Future<void> updateUser(UserEntity user, {String? passwordHash});
  Future<void> deleteUser(int userId);
}

class UserManagementLocalDataSource implements IUserManagementLocalDataSource {
  final AppDatabase _db;

  UserManagementLocalDataSource(this._db);

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final usersWithRoles = await _db.select(_db.users).join([
      leftOuterJoin(_db.userRoles, _db.userRoles.userId.equalsExp(_db.users.userId)),
      leftOuterJoin(_db.roles, _db.roles.id.equalsExp(_db.userRoles.roleId)),
    ]).get();

    final Map<int, UserEntity> userMap = {};
    for (final row in usersWithRoles) {
      final user = row.readTable(_db.users);
      final role = row.readTableOrNull(_db.roles);
      
      userMap.putIfAbsent(user.userId, () => user.toEntity(roles: []));
      
      if (role != null) {
        userMap[user.userId]!.roles.add(role.toEntity());
      }
    }
    return userMap.values.toList();
  }
  
  @override
  Future<List<RoleEntity>> getUserRoles(int userId) async {
    final query = _db.select(_db.userRoles).join([
      innerJoin(_db.roles, _db.roles.id.equalsExp(_db.userRoles.roleId))
    ])..where(_db.userRoles.userId.equals(userId));

    final result = await query.get();
    return result.map((row) => row.readTable(_db.roles).toEntity()).toList();
  }

  @override
  Future<void> addUser(UserEntity user, String passwordHash) async {
    await _db.transaction(() async {
      final companion = UserCompanionMapper.fromEntity(user).copyWith(password: Value(passwordHash));
      final newUserId = await _db.into(_db.users).insert(companion);
      
      for (final role in user.roles) {
        await _db.into(_db.userRoles).insert(UserRolesCompanion(userId: Value(newUserId), roleId: Value(role.id)));
      }
    });
  }

  @override
  Future<void> updateUser(UserEntity user, {String? passwordHash}) async {
    await _db.transaction(() async {
      var companion = UserCompanionMapper.fromEntity(user);
      if(passwordHash != null) {
        companion = companion.copyWith(password: Value(passwordHash));
      }
      await (_db.update(_db.users)..where((u) => u.userId.equals(user.userId))).write(companion);

      // Sync roles
      await (_db.delete(_db.userRoles)..where((ur) => ur.userId.equals(user.userId))).go();
      for (final role in user.roles) {
        await _db.into(_db.userRoles).insert(UserRolesCompanion(userId: Value(user.userId), roleId: Value(role.id)));
      }
    });
  }

  @override
  Future<void> deleteUser(int userId) async {
    await (_db.delete(_db.users)..where((u) => u.userId.equals(userId))).go();
  }
}
