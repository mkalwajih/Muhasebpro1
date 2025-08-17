import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/branches_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

import '../entities/branch_entity.dart';

class AddBranchUseCase extends UseCase<Unit, BranchEntity> {
  final BranchesRepository repository;

  AddBranchUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(BranchEntity params) async {
    return await repository.addBranch(params);
  }
}
