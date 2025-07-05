import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/branch_entity.dart';
import '../repositories/branches_repository.dart';

class GetAllBranches implements UseCase<List<BranchEntity>, NoParams> {
  final BranchesRepository repository;

  GetAllBranches(this.repository);

  @override
  Future<Either<Failure, List<BranchEntity>>> call(NoParams params) async {
    return await repository.getAllBranches();
  }
}
