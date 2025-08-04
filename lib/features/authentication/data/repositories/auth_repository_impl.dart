import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/authentication/data/datasources/local/auth_local_datasource.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/authentication/domain/repositories/auth_repository.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/user_management_local_datasource.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';


class AuthRepositoryImpl implements AuthRepository {
  final IAuthLocalDataSource _localDataSource;
  final IUserManagementLocalDataSource _userManagementLocalDataSource;
  final AppDatabase _db;

  AuthRepositoryImpl(this._localDataSource, this._userManagementLocalDataSource, this._db);

  @override
  Future<Either<Failure, UserEntity>> login(String username, String password) async {
    try {
      final user = await _localDataSource.login(username);
      if (user == null) {
        return Left(InvalidCredentialsFailure());
      }
      final hashedPassword = sha256.convert(utf8.encode(password)).toString();
      if (user.password != hashedPassword) {
        return Left(InvalidCredentialsFailure());
      }
      if (!user.isActive) {
        return Left(UserInactiveFailure());
      }
      
      final roles = await _userManagementLocalDataSource.getUserRoles(user.userId);
      final userEntity = UserEntity(
        userId: user.userId,
        username: user.username,
        fullNameAr: user.fullNameAr,
        fullNameEn: user.fullNameEn,
        isActive: user.isActive,
        roles: roles,
      );

      return Right(userEntity);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> seedUser() async {
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
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
