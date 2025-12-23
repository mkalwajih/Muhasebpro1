import 'package:dartz/dartz.dart';
import '../entities/inventory_config_entity.dart';
import '../entities/warehouse_entity.dart';
import '../entities/item_group_entity.dart';

abstract class InventorySetupRepository {
  // Inventory Config
  Future<Either<Exception, InventoryConfigEntity>> getInventoryConfig();
  Future<Either<Exception, void>> saveInventoryConfig(InventoryConfigEntity config);

  // Warehouses
  Future<Either<Exception, List<WarehouseEntity>>> getAllWarehouses();
  Future<Either<Exception, WarehouseEntity>> getWarehouseById(int id);
  Future<Either<Exception, void>> createWarehouse(WarehouseEntity warehouse);
  Future<Either<Exception, void>> updateWarehouse(WarehouseEntity warehouse);
  Future<Either<Exception, void>> deleteWarehouse(int id);

  // Item Groups
  Future<Either<Exception, List<ItemGroupEntity>>> getAllItemGroups();
  Future<Either<Exception, ItemGroupEntity>> getItemGroupById(int id);
  Future<Either<Exception, void>> createItemGroup(ItemGroupEntity itemGroup);
  Future<Either<Exception, void>> updateItemGroup(ItemGroupEntity itemGroup);
  Future<Either<Exception, void>> deleteItemGroup(int id);
}
