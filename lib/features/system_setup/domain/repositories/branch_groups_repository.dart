import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_group_entity.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';

abstract class IBranchGroupsRepository {
  Future<Either<Failure, List<BranchGroupEntity>>> getAllBranchGroups();
  Future<Either<Failure, Unit>> addBranchGroup(BranchGroupEntity branchGroup);
  Future<Either<Failure, Unit>> updateBranchGroup(BranchGroupEntity branchGroup);
  Future<Either<Failure, Unit>> deleteBranchGroup(int id);
}
