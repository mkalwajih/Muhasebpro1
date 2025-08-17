import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/branches_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

import '../entities/branch_entity.dart';

class GetBranchUseCase extends UseCase<BranchEntity?, String> {
  final BranchesRepository repository;

  GetBranchUseCase(this.repository);

  @override
  Future<Either<Failure, BranchEntity?>> call(String params) async {
    return await repository.getBranch(params);
  }
}
