import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/branch_groups_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_group_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/branch_groups_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';

class BranchGroupsRepository implements IBranchGroupsRepository {
  final IBranchGroupsLocalDataSource _localDataSource;

  BranchGroupsRepository(this._localDataSource);

  @override
  Future<Either<Failure, List<BranchGroupEntity>>> getAllBranchGroups() async {
    try {
      final result = await _localDataSource.getAllBranchGroups();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addBranchGroup(BranchGroupEntity branchGroup) async {
    try {
      await _localDataSource.addBranchGroup(branchGroup);
      return const Right(unit);
    } on DataIntegrityException catch(e) {
      return Left(DataIntegrityFailure(message: e.message ?? 'A group with this name already exists.'));
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateBranchGroup(BranchGroupEntity branchGroup) async {
    try {
      await _localDataSource.updateBranchGroup(branchGroup);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteBranchGroup(int id) async {
    try {
      await _localDataSource.deleteBranchGroup(id);
      return const Right(unit);
    } on DataIntegrityException catch (e) {
      return Left(DataIntegrityFailure(message: e.message ?? 'This group is in use and cannot be deleted.'));
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
