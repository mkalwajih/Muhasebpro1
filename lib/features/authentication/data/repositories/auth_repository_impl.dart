import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/authentication/data/datasources/local/auth_local_datasource.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/authentication/domain/repositories/auth_repository.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/user_management_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final IAuthLocalDataSource _localDataSource;
  final IUserManagementLocalDataSource _userManagementLocalDataSource;
  final AppDatabase _db;

  AuthRepositoryImpl(this._localDataSource,
      this._userManagementLocalDataSource, this._db);

  @override
  Future<(UserEntity?, String?)> login(String username, String password) async {
    try {
      final user = await _localDataSource.login(username);
      if (user == null) {
        return (null, 'Invalid credentials');
      }
      final hashedPassword = sha256.convert(utf8.encode(password)).toString();
      if (user.password != hashedPassword) {
        return (null, 'Invalid credentials');
      }
      if (!user.isActive) {
        return (null, 'User is inactive');
      }

      final roles = await _userManagementLocalDataSource.getUserRoles(user.userId);
      final userEntity = UserEntity(
        userId: user.userId,
        username: user.username,
        fullNameAr: user.fullNameAr,
        fullNameEn: user.fullNameEn,
        isActive: user.isActive,
        roles: roles ?? [], // Provide a default empty list
      );

      return (userEntity, null);
    } catch (e) {
      return (null, e.toString());
    }
  }

  @override
  Future<void> seedInitialUser() async {
    try {
      // Debug log for seeding timings
      // ignore: avoid_print
      print('[AuthRepository] seedInitialUser: start');
      final users = await _db.select(_db.users).get();
      if (users.isEmpty) {
        const defaultUser = UserEntity(
          userId: 1,
          username: 'admin',
          fullNameAr: 'المدير',
          fullNameEn: 'Admin',
          isActive: true,
        );
        await _localDataSource.seedUser(defaultUser, '123456');
      }
      // ignore: avoid_print
      print('[AuthRepository] seedInitialUser: completed');
    } catch (e) {
      // ignore: avoid_print
      print('[AuthRepository] seedInitialUser: failed: $e');
    }
  }

  @override
  Future<(UserEntity?, String?)> register(UserEntity user, String password) async {
    try {
      final existing = await _localDataSource.login(user.username);
      if (existing != null) return (null, 'User already exists');

      await _localDataSource.seedUser(user, password);

      final created = await _localDataSource.login(user.username);
      if (created == null) return (null, 'Failed to create user');

      final roles = await _userManagementLocalDataSource.getUserRoles(created.userId);
      final userEntity = UserEntity.fromUser(created, roles: roles);
      return (userEntity, null);
    } catch (e) {
      return (null, e.toString());
    }
  }

  @override
  Future<(bool, String?)> resetPassword(String username, String newPassword) async {
    try {
      final user = await _localDataSource.login(username);
      if (user == null) return (false, 'User not found');

      final roles = await _userManagementLocalDataSource.getUserRoles(user.userId);
      final userEntity = UserEntity.fromUser(user, roles: roles);

      await _localDataSource.updateUser(userEntity, newPassword: newPassword);

      return (true, null);
    } catch (e) {
      return (false, e.toString());
    }
  }

  @override
  Future<void> logout() async {
    // Implement logout logic here
  }
}
