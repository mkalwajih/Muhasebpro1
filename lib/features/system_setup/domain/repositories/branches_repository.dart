import 'package:dartz/dartz.dart';
import '../entities/branch_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class BranchesRepository {
  Future<Either<Failure, List<BranchEntity>>> getAllBranches();
  Future<Either<Failure, BranchEntity>> getBranch(String branchCode);
  Future<Either<Failure, Unit>> addBranch(BranchEntity branch);
  Future<Either<Failure, Unit>> updateBranch(BranchEntity branch);
  Future<Either<Failure, Unit>> deleteBranch(String branchCode);
}
