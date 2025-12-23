import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/db/app_database.dart';
import '../../../../di/database_provider.dart';
import '../../data/datasources/local/inventory_setup_local_datasource.dart';
import '../../data/repositories/inventory_setup_repository_impl.dart';
import '../../domain/entities/inventory_config_entity.dart';
import '../../domain/entities/warehouse_entity.dart';
import '../../domain/entities/item_group_entity.dart';
import '../../domain/repositories/inventory_setup_repository.dart';

// Data Source Provider
final inventorySetupLocalDataSourceProvider =
    Provider<InventorySetupLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return InventorySetupLocalDataSource(database);
});

// Repository Provider
final inventorySetupRepositoryProvider =
    Provider<InventorySetupRepository>((ref) {
  final dataSource = ref.watch(inventorySetupLocalDataSourceProvider);
  return InventorySetupRepositoryImpl(dataSource);
});

// Inventory Config Provider
final inventoryConfigProvider =
    FutureProvider<InventoryConfigEntity>((ref) async {
  final repository = ref.watch(inventorySetupRepositoryProvider);
  final result = await repository.getInventoryConfig();
  return result.fold(
    (error) => throw error,
    (config) => config,
  );
});

// Warehouses Provider
final warehousesProvider = FutureProvider<List<WarehouseEntity>>((ref) async {
  final repository = ref.watch(inventorySetupRepositoryProvider);
  final result = await repository.getAllWarehouses();
  return result.fold(
    (error) => throw error,
    (warehouses) => warehouses,
  );
});

// Item Groups Provider
final itemGroupsProvider = FutureProvider<List<ItemGroupEntity>>((ref) async {
  final repository = ref.watch(inventorySetupRepositoryProvider);
  final result = await repository.getAllItemGroups();
  return result.fold(
    (error) => throw error,
    (itemGroups) => itemGroups,
  );
});

// Save Inventory Config Use Case
final saveInventoryConfigProvider =
    Provider<Future<void> Function(InventoryConfigEntity)>((ref) {
  return (config) async {
    final repository = ref.read(inventorySetupRepositoryProvider);
    final result = await repository.saveInventoryConfig(config);
    result.fold(
      (error) => throw error,
      (_) {
        ref.invalidate(inventoryConfigProvider);
      },
    );
  };
});

// Create Warehouse Use Case
final createWarehouseProvider =
    Provider<Future<void> Function(WarehouseEntity)>((ref) {
  return (warehouse) async {
    final repository = ref.read(inventorySetupRepositoryProvider);
    final result = await repository.createWarehouse(warehouse);
    result.fold(
      (error) => throw error,
      (_) {
        ref.invalidate(warehousesProvider);
      },
    );
  };
});

// Update Warehouse Use Case
final updateWarehouseProvider =
    Provider<Future<void> Function(WarehouseEntity)>((ref) {
  return (warehouse) async {
    final repository = ref.read(inventorySetupRepositoryProvider);
    final result = await repository.updateWarehouse(warehouse);
    result.fold(
      (error) => throw error,
      (_) {
        ref.invalidate(warehousesProvider);
      },
    );
  };
});

// Delete Warehouse Use Case
final deleteWarehouseProvider =
    Provider<Future<void> Function(int)>((ref) {
  return (id) async {
    final repository = ref.read(inventorySetupRepositoryProvider);
    final result = await repository.deleteWarehouse(id);
    result.fold(
      (error) => throw error,
      (_) {
        ref.invalidate(warehousesProvider);
      },
    );
  };
});

// Create Item Group Use Case
final createItemGroupProvider =
    Provider<Future<void> Function(ItemGroupEntity)>((ref) {
  return (itemGroup) async {
    final repository = ref.read(inventorySetupRepositoryProvider);
    final result = await repository.createItemGroup(itemGroup);
    result.fold(
      (error) => throw error,
      (_) {
        ref.invalidate(itemGroupsProvider);
      },
    );
  };
});

// Update Item Group Use Case
final updateItemGroupProvider =
    Provider<Future<void> Function(ItemGroupEntity)>((ref) {
  return (itemGroup) async {
    final repository = ref.read(inventorySetupRepositoryProvider);
    final result = await repository.updateItemGroup(itemGroup);
    result.fold(
      (error) => throw error,
      (_) {
        ref.invalidate(itemGroupsProvider);
      },
    );
  };
});

// Delete Item Group Use Case
final deleteItemGroupProvider =
    Provider<Future<void> Function(int)>((ref) {
  return (id) async {
    final repository = ref.read(inventorySetupRepositoryProvider);
    final result = await repository.deleteItemGroup(id);
    result.fold(
      (error) => throw error,
      (_) {
        ref.invalidate(itemGroupsProvider);
      },
    );
  };
});
