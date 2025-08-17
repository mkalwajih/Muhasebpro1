import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/branches_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

import '../entities/branch_entity.dart';

class GetAllBranchesUseCase extends UseCase<List<BranchEntity>, GetAllBranchesParams> {
  final BranchesRepository repository;

  GetAllBranchesUseCase(this.repository);

  @override
  Future<Either<Failure, List<BranchEntity>>> call(GetAllBranchesParams params) async {
    return await repository.getAllBranches(includeInactive: params.includeInactive);
  }
}

class GetAllBranchesParams {
  final bool includeInactive;

  GetAllBranchesParams({this.includeInactive = false});
}
