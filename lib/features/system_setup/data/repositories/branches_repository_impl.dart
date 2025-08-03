import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/repositories/branches_repository.dart';
import '../datasources/local/branches_local_datasource.dart';
import 'package:muhaseb_pro/shared/data/models/branch_model.dart';

class BranchesRepositoryImpl implements BranchesRepository {
  final BranchesLocalDataSource localDataSource;
  final AppDatabase _database;


  BranchesRepositoryImpl({required this.localDataSource, required AppDatabase database}) : _database = database;

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
      final isUnique = await isBranchCodeUnique(branch.branchCode);
      if (!isUnique) {
        return Left(CacheFailure(message: 'Branch code must be unique.'));
      }
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
      final isUnique = await isBranchCodeUnique(branch.branchCode, branchId: branch.id);
      if (!isUnique) {
        return Left(CacheFailure(message: 'Branch code must be unique.'));
      }
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
      await localDataSource.deactivateBranch(branchCode);
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<bool> isBranchCodeUnique(String code, {int? branchId}) async {
    final query = _database.select(_database.branches)..where((b) => b.branchCode.equals(code));
    
    if (branchId != null) {
      query.where((b) => b.id.isNotValue(branchId));
    }
    
    final result = await query.get();
    return result.isEmpty;
  }
}
