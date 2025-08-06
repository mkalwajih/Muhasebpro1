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

      final roles =
          await _userManagementLocalDataSource.getUserRoles(user.userId);
      final userEntity = UserEntity(
        userId: user.userId,
        username: user.username,
        fullNameAr: user.fullNameAr,
        fullNameEn: user.fullNameEn,
        isActive: user.isActive,
        roles: roles,
      );

      return (userEntity, null);
    } catch (e) {
      return (null, e.toString());
    }
  }

  @override
  Future<void> seedInitialUser() async {
    try {
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
    } catch (e) {
      // Handle exception
    }
  }

  @override
  Future<void> logout() async {
    // Implement logout logic here
  }
}
