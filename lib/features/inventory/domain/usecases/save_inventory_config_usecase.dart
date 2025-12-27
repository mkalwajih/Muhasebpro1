import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/inventory_config_entity.dart';
import 'package:muhaseb_pro/features/inventory/domain/repositories/inventory_setup_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class SaveInventoryConfigUseCase implements UseCase<void, InventoryConfigEntity> {
  final InventorySetupRepository repository;

  SaveInventoryConfigUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(InventoryConfigEntity params) async {
    final result = await repository.saveInventoryConfig(params);
    return result.leftMap((l) => ServerFailure(message: l.toString()));
  }
}
