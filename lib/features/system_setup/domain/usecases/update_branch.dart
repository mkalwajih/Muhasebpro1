import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import '../entities/branch_entity.dart';
import '../repositories/branches_repository.dart';

class UpdateBranch implements UseCase<Unit, UpdateBranchParams> {
  final BranchesRepository repository;

  UpdateBranch(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UpdateBranchParams params) async {
    return await repository.updateBranch(params.branch);
  }
}

class UpdateBranchParams extends Equatable {
  final BranchEntity branch;

  const UpdateBranchParams({required this.branch});

  @override
  List<Object> get props => [branch];
}
