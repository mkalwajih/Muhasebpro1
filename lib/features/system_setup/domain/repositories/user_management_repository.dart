import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';

abstract class UserManagementRepository {
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<void> addUser(UserEntity user, String password);
  Future<void> updateUser(UserEntity user, {String? newPassword});
}
