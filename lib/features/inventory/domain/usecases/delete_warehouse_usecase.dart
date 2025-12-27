import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/inventory/domain/repositories/inventory_setup_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class DeleteWarehouseUseCase implements UseCase<void, int> {
  final InventorySetupRepository repository;

  DeleteWarehouseUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int params) async {
    final result = await repository.deleteWarehouse(params);
    return result.leftMap((l) => ServerFailure(l.toString()));
  }
}
