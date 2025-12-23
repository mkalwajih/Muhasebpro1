import 'package:drift/drift.dart';
import '../../../../../core/db/app_database.dart';
import '../../models/inventory_config_model.dart';
import '../../models/warehouse_model.dart';
import '../../models/item_group_model.dart';

class InventorySetupLocalDataSource {
  final AppDatabase _database;

  InventorySetupLocalDataSource(this._database);

  // Inventory Config
  Future<InventoryConfigModel?> getInventoryConfig() async {
    final query = _database.select(_database.inventoryConfig);
    final result = await query.getSingleOrNull();
    return result != null ? InventoryConfigModel.fromDrift(result) : null;
  }

  Future<void> saveInventoryConfig(InventoryConfigModel config) async {
    await _database.into(_database.inventoryConfig).insertOnConflictUpdate(
          config.toDrift(),
        );
  }

  // Warehouses
  Future<List<WarehouseModel>> getAllWarehouses() async {
    final query = _database.select(_database.warehouses)
      ..orderBy([(t) => OrderingTerm(expression: t.warehouseCode)]);
    final results = await query.get();
    return results.map((row) => WarehouseModel.fromDrift(row)).toList();
  }

  Future<WarehouseModel?> getWarehouseById(int id) async {
    final query = _database.select(_database.warehouses)
      ..where((t) => t.id.equals(id));
    final result = await query.getSingleOrNull();
    return result != null ? WarehouseModel.fromDrift(result) : null;
  }

  Future<void> createWarehouse(WarehouseModel warehouse) async {
    await _database.into(_database.warehouses).insert(warehouse.toDrift());
  }

  Future<void> updateWarehouse(WarehouseModel warehouse) async {
    await (_database.update(_database.warehouses)
          ..where((t) => t.id.equals(warehouse.id!)))
        .write(warehouse.toDrift());
  }

  Future<void> deleteWarehouse(int id) async {
    await (_database.delete(_database.warehouses)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // Item Groups
  Future<List<ItemGroupModel>> getAllItemGroups() async {
    final query = _database.select(_database.itemGroups)
      ..orderBy([(t) => OrderingTerm(expression: t.groupCode)]);
    final results = await query.get();
    return results.map((row) => ItemGroupModel.fromDrift(row)).toList();
  }

  Future<ItemGroupModel?> getItemGroupById(int id) async {
    final query = _database.select(_database.itemGroups)
      ..where((t) => t.id.equals(id));
    final result = await query.getSingleOrNull();
    return result != null ? ItemGroupModel.fromDrift(result) : null;
  }

  Future<void> createItemGroup(ItemGroupModel itemGroup) async {
    await _database.into(_database.itemGroups).insert(itemGroup.toDrift());
  }

  Future<void> updateItemGroup(ItemGroupModel itemGroup) async {
    await (_database.update(_database.itemGroups)
          ..where((t) => t.id.equals(itemGroup.id!)))
        .write(itemGroup.toDrift());
  }

  Future<void> deleteItemGroup(int id) async {
    await (_database.delete(_database.itemGroups)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}
