import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/warehouse_entity.dart';
import 'package:muhaseb_pro/features/inventory/domain/repositories/inventory_setup_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class CreateWarehouseUseCase implements UseCase<void, WarehouseEntity> {
  final InventorySetupRepository repository;

  CreateWarehouseUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(WarehouseEntity params) async {
    final result = await repository.createWarehouse(params);
    return result.leftMap((l) => ServerFailure(l.toString()));
  }
}
