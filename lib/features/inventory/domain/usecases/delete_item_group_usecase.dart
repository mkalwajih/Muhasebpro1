import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/inventory/domain/repositories/inventory_setup_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class DeleteItemGroupUseCase implements UseCase<void, int> {
  final InventorySetupRepository repository;

  DeleteItemGroupUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int params) async {
    try {
      final result = await repository.deleteItemGroup(params);
      return result.fold(
        (l) => Left(ServerFailure(message: l.toString())),
        (r) => Right(r),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
