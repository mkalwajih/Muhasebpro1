import 'package:muhaseb_pro/features/authentication/domain/repositories/auth_repository.dart';

class SeedUserUseCase {
  final AuthRepository _repository;

  SeedUserUseCase(this._repository);

  Future<void> call() {
    return _repository.seedInitialUser();
  }
}