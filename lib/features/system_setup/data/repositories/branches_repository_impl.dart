import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/repositories/branches_repository.dart';
import '../datasources/branches_local_datasource.dart';
import '../models/branch_model.dart';

class BranchesRepositoryImpl implements BranchesRepository {
  final BranchesLocalDataSource localDataSource;

  BranchesRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<BranchEntity>>> getAllBranches() async {
    try {
      final localBranches = await localDataSource.getAllBranches();
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
  Future<Either<Failure, Unit>> deleteBranch(String branchCode) async {
    try {
      await localDataSource.deleteBranch(branchCode);
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
