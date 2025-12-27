import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/item_group_entity.dart';
import 'package:muhaseb_pro/features/inventory/domain/repositories/inventory_setup_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class UpdateItemGroupUseCase implements UseCase<void, ItemGroupEntity> {
  final InventorySetupRepository repository;

  UpdateItemGroupUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ItemGroupEntity params) async {
    try {
      final result = await repository.updateItemGroup(params);
      return result.fold(
        (l) => Left(ServerFailure(message: l.toString())),
        (r) => Right(r),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
