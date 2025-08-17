import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/branches_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class DeactivateBranchUseCase extends UseCase<Unit, String> {
  final BranchesRepository repository;

  DeactivateBranchUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String params) async {
    return await repository.deactivateBranch(params);
  }
}
