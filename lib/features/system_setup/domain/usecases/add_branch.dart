import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import '../entities/branch_entity.dart';
import '../repositories/branches_repository.dart';

class AddBranch implements UseCase<Unit, AddBranchParams> {
  final BranchesRepository repository;

  AddBranch(this.repository);

  @override
  Future<Either<Failure, Unit>> call(AddBranchParams params) async {
    return await repository.addBranch(params.branch);
  }
}

class AddBranchParams extends Equatable {
  final BranchEntity branch;

  const AddBranchParams({required this.branch});

  @override
  List<Object> get props => [branch];
}
