
import 'package:dartz/dartz.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/item_group_entity.dart';
import 'package:muhaseb_pro/features/inventory/domain/repositories/inventory_setup_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

class GetAllItemGroupsUseCase implements UseCase<List<ItemGroupEntity>, NoParams> {
  final InventorySetupRepository repository;

  GetAllItemGroupsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ItemGroupEntity>>> call(NoParams params) async {
    final result = await repository.getAllItemGroups();
    return result.leftMap((l) => ServerFailure(l.toString()));
  }
}
