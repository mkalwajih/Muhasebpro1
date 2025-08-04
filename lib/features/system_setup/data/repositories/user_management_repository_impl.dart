import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/user_management_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/user_management_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';

class UserManagementRepositoryImpl implements IUserManagementRepository {
  final IUserManagementLocalDataSource _localDataSource;

  UserManagementRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    try {
      final users = await _localDataSource.getAllUsers();
      return Right(users);
    } catch (e) {
      return Left(CacheFailure('Failed to load users: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addUser(UserEntity user, String password) async {
    try {
      final passwordHash = sha256.convert(utf8.encode(password)).toString();
      await _localDataSource.addUser(user, passwordHash);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure('Failed to add user: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUser(UserEntity user, {String? newPassword}) async {
    try {
      String? passwordHash;
      if (newPassword != null && newPassword.isNotEmpty) {
        passwordHash = sha256.convert(utf8.encode(newPassword)).toString();
      }
      await _localDataSource.updateUser(user, passwordHash: passwordHash);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure('Failed to update user: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUser(int userId) async {
    try {
      await _localDataSource.deleteUser(userId);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure('Failed to delete user: $e'));
    }
  }
}
