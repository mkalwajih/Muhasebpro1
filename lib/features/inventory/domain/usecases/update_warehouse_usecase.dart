import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/warehouse_entity.dart';
import 'package:muhaseb_pro/features/inventory/domain/repositories/inventory_setup_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class UpdateWarehouseUseCase implements UseCase<void, WarehouseEntity> {
  final InventorySetupRepository repository;

  UpdateWarehouseUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(WarehouseEntity params) async {
    final result = await repository.updateWarehouse(params);
    return result.leftMap((l) => ServerFailure(message: l.toString()));
  }
}
