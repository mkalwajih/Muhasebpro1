import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<(UserEntity?, String?)> login(String username, String password);
  Future<void> logout();
  Future<void> seedInitialUser(); // For first-time setup
}