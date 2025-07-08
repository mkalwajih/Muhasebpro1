import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/repositories/branches_repository.dart';
import '../datasources/local/branches_local_datasource.dart';
import 'package:muhaseb_pro/shared/data/models/branch_model.dart';

class BranchesRepositoryImpl implements BranchesRepository {
  final BranchesLocalDataSource localDataSource;

  BranchesRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<BranchEntity>>> getAllBranches({bool includeInactive = false}) async {
    try {
      final localBranches = await localDataSource.getAllBranches(includeInactive: includeInactive);
      return Right(localBranches);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, BranchEntity>> getBranch(String branchCode) async {
    try {
      final localBranch = await localDataSource.getBranch(branchCode);
      if (localBranch != null) {
        return Right(localBranch);
      } else {
        return Left(CacheFailure());
      }
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addBranch(BranchEntity branch) async {
    try {
      final branchModel = BranchModel.fromEntity(branch);
      await localDataSource.addBranch(branchModel);
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateBranch(BranchEntity branch) async {
    try {
      final branchModel = BranchModel.fromEntity(branch);
      await localDataSource.updateBranch(branchModel);
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deactivateBranch(String branchCode) async {
    try {
      // Before deactivating, we should add logic here to check for associated transactions
      // For now, we'll just call the datasource method
      await localDataSource.deactivateBranch(branchCode);
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
