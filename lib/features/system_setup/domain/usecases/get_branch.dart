import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import '../entities/branch_entity.dart';
import '../repositories/branches_repository.dart';

class GetBranch implements UseCase<BranchEntity?, GetBranchParams> {
  final BranchesRepository repository;

  GetBranch(this.repository);

  @override
  Future<Either<Failure, BranchEntity?>> call(GetBranchParams params) async {
    return await repository.getBranch(params.branchCode);
  }
}

class GetBranchParams extends Equatable {
  final String branchCode;

  const GetBranchParams({required this.branchCode});

  @override
  List<Object> get props => [branchCode];
}
