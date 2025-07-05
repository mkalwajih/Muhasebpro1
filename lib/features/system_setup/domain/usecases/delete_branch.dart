import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/branches_repository.dart';

class DeleteBranch implements UseCase<Unit, DeleteBranchParams> {
  final BranchesRepository repository;

  DeleteBranch(this.repository);

  @override
  Future<Either<Failure, Unit>> call(DeleteBranchParams params) async {
    return await repository.deleteBranch(params.branchCode);
  }
}

class DeleteBranchParams extends Equatable {
  final String branchCode;

  const DeleteBranchParams({required this.branchCode});

  @override
  List<Object> get props => [branchCode];
}
