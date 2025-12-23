import 'package:dartz/dartz.dart';
import '../../domain/entities/inventory_config_entity.dart';
import '../../domain/entities/warehouse_entity.dart';
import '../../domain/entities/item_group_entity.dart';
import '../../domain/repositories/inventory_setup_repository.dart';
import '../datasources/local/inventory_setup_local_datasource.dart';
import '../models/inventory_config_model.dart';
import '../models/warehouse_model.dart';
import '../models/item_group_model.dart';

class InventorySetupRepositoryImpl implements InventorySetupRepository {
  final InventorySetupLocalDataSource _localDataSource;

  InventorySetupRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Exception, InventoryConfigEntity>> getInventoryConfig() async {
    try {
      final config = await _localDataSource.getInventoryConfig();
      if (config == null) {
        // Return default config if none exists
        final defaultConfig = InventoryConfigEntity(
          defaultCostingMethod: CostingMethod.weightedAverage,
          updatedAt: DateTime.now(),
        );
        return Right(defaultConfig);
      }
      return Right(config);
    } catch (e) {
      return Left(Exception('Failed to get inventory config: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> saveInventoryConfig(
      InventoryConfigEntity config) async {
    try {
      final model = InventoryConfigModel.fromEntity(config);
      await _localDataSource.saveInventoryConfig(model);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to save inventory config: $e'));
    }
  }

  @override
  Future<Either<Exception, List<WarehouseEntity>>> getAllWarehouses() async {
    try {
      final warehouses = await _localDataSource.getAllWarehouses();
      return Right(warehouses);
    } catch (e) {
      return Left(Exception('Failed to get warehouses: $e'));
    }
  }

  @override
  Future<Either<Exception, WarehouseEntity>> getWarehouseById(int id) async {
    try {
      final warehouse = await _localDataSource.getWarehouseById(id);
      if (warehouse == null) {
        return Left(Exception('Warehouse not found'));
      }
      return Right(warehouse);
    } catch (e) {
      return Left(Exception('Failed to get warehouse: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> createWarehouse(
      WarehouseEntity warehouse) async {
    try {
      final model = WarehouseModel.fromEntity(warehouse);
      await _localDataSource.createWarehouse(model);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to create warehouse: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> updateWarehouse(
      WarehouseEntity warehouse) async {
    try {
      final model = WarehouseModel.fromEntity(warehouse);
      await _localDataSource.updateWarehouse(model);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to update warehouse: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> deleteWarehouse(int id) async {
    try {
      await _localDataSource.deleteWarehouse(id);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete warehouse: $e'));
    }
  }

  @override
  Future<Either<Exception, List<ItemGroupEntity>>> getAllItemGroups() async {
    try {
      final itemGroups = await _localDataSource.getAllItemGroups();
      return Right(itemGroups);
    } catch (e) {
      return Left(Exception('Failed to get item groups: $e'));
    }
  }

  @override
  Future<Either<Exception, ItemGroupEntity>> getItemGroupById(int id) async {
    try {
      final itemGroup = await _localDataSource.getItemGroupById(id);
      if (itemGroup == null) {
        return Left(Exception('Item group not found'));
      }
      return Right(itemGroup);
    } catch (e) {
      return Left(Exception('Failed to get item group: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> createItemGroup(
      ItemGroupEntity itemGroup) async {
    try {
      final model = ItemGroupModel.fromEntity(itemGroup);
      await _localDataSource.createItemGroup(model);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to create item group: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> updateItemGroup(
      ItemGroupEntity itemGroup) async {
    try {
      final model = ItemGroupModel.fromEntity(itemGroup);
      await _localDataSource.updateItemGroup(model);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to update item group: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> deleteItemGroup(int id) async {
    try {
      await _localDataSource.deleteItemGroup(id);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete item group: $e'));
    }
  }
}
