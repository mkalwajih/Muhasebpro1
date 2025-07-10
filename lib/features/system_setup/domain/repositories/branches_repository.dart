import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import '../entities/branch_entity.dart';

abstract class BranchesRepository {
  Future<Either<Failure, List<BranchEntity>>> getAllBranches({bool includeInactive = false});
  Future<Either<Failure, BranchEntity?>> getBranch(String branchCode);
  Future<Either<Failure, Unit>> addBranch(BranchEntity branch);
  Future<Either<Failure, Unit>> updateBranch(BranchEntity branch);
  Future<Either<Failure, Unit>> deactivateBranch(String branchCode);
  Future<bool> isBranchCodeUnique(String code, {int? branchId});
}
