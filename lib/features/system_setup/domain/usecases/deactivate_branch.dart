import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/branches_repository.dart';

class DeactivateBranch implements UseCase<Unit, String> {
  final BranchesRepository repository;

  DeactivateBranch(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String params) async {
    return await repository.deactivateBranch(params);
  }
}
