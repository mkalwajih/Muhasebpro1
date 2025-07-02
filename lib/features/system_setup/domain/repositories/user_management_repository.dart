import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';

abstract class UserManagementRepository {
  Future<List<UserEntity>> getAllUsers();
  Future<void> addUser(UserEntity user, String password);
  Future<void> updateUser(UserEntity user, {String? newPassword});
}
