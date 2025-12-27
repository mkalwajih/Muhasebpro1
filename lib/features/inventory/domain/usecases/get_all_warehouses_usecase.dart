
import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/warehouse_entity.dart';
import 'package:muhaseb_pro/features/inventory/domain/repositories/inventory_setup_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class GetAllWarehousesUseCase implements UseCase<List<WarehouseEntity>, NoParams> {
  final InventorySetupRepository repository;

  GetAllWarehousesUseCase(this.repository);

  @override
  Future<Either<Failure, List<WarehouseEntity>>> call(NoParams params) async {
    final result = await repository.getAllWarehouses();
    return result.leftMap((l) => ServerFailure(l.toString()));
  }
}
