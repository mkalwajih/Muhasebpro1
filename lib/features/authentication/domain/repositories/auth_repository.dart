import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<(UserEntity?, String?)> login(String username, String password);
  Future<(UserEntity?, String?)> register(UserEntity user, String password);
  Future<(bool, String?)> resetPassword(String username, String newPassword);
  Future<void> logout();
  Future<void> seedInitialUser(); // For first-time setup
}