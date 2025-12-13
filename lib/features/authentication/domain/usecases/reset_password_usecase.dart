import 'package:muhaseb_pro/features/authentication/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  Future<(bool, String?)> call(String username, String newPassword) {
    return _repository.resetPassword(username, newPassword);
  }
}
