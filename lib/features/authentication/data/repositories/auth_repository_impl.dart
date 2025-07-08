import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/authentication/data/datasources/local/auth_local_datasource.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/authentication/domain/repositories/auth_repository.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl({required AuthLocalDataSource authLocalDataSource, required AppDatabase database}) : _localDataSource = authLocalDataSource;
  
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<(UserEntity?, String?)> login(String username, String password) async {
    try {
      final user = await _localDataSource.getUserByUsername(username);
      if (user == null) {
        return (null, 'Invalid username or password.');
      }

      if (!user.isActive) {
        return (null, 'This user account is inactive.');
      }
      
      final hashedPassword = _hashPassword(password);
      if (user.passwordHash != hashedPassword) {
        return (null, 'Invalid username or password.');
      }

      final userEntity = UserEntity(
        userId: user.id,
        username: user.username,
        fullNameEn: user.fullNameEn,
        fullNameAr: user.fullNameAr,
        isActive: user.isActive,
      );
      
 return (userEntity, null);

    } catch (e) {
      // Log the error
      return (null, 'An unexpected error occurred.');
    }
  }

  @override
  Future<void> logout() async {
    return;
  }
  
  @override
  Future<void> seedInitialUser() async {
    final userCount = await _localDataSource.countUsers();
    if (userCount == 0) {
      // Seed the default 'admin' user
      const adminUser = UsersCompanion(
        username: Value('admin'),
        passwordHash: Value('admin'), // Will be hashed by datasource
        fullNameAr: Value('المدير العام'),
        fullNameEn: Value('System Administrator'),
        isActive: Value(true),
      );
      await _localDataSource.insertUser(adminUser);
    }
  }
}
