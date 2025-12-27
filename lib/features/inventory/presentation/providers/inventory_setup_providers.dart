import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/features/inventory/data/datasources/local/inventory_setup_local_datasource.dart';
import 'package:muhaseb_pro/features/inventory/data/repositories/inventory_setup_repository_impl.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/item_group_entity.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/warehouse_entity.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/get_all_warehouses_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/get_all_item_groups_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/create_warehouse_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/update_warehouse_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/delete_warehouse_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/create_item_group_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/update_item_group_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/delete_item_group_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/save_inventory_config_usecase.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/inventory_config_entity.dart';

// Data Source
final inventorySetupLocalDataSourceProvider = Provider<InventorySetupLocalDataSource>((ref) {
  return InventorySetupLocalDataSource(ref.read(appDatabaseProvider));
});

// Repository
final inventorySetupRepositoryProvider = Provider((ref) {
  return InventorySetupRepositoryImpl(ref.read(inventorySetupLocalDataSourceProvider));
});

// Use Cases
final getAllWarehousesUseCaseProvider = Provider((ref) {
  return GetAllWarehousesUseCase(ref.read(inventorySetupRepositoryProvider));
});

final getAllItemGroupsUseCaseProvider = Provider((ref) {
  return GetAllItemGroupsUseCase(ref.read(inventorySetupRepositoryProvider));
});

final createWarehouseUseCaseProvider = Provider((ref) {
  return CreateWarehouseUseCase(ref.read(inventorySetupRepositoryProvider));
});

final updateWarehouseUseCaseProvider = Provider((ref) {
  return UpdateWarehouseUseCase(ref.read(inventorySetupRepositoryProvider));
});

final deleteWarehouseUseCaseProvider = Provider((ref) {
  return DeleteWarehouseUseCase(ref.read(inventorySetupRepositoryProvider));
});

final createItemGroupUseCaseProvider = Provider((ref) {
  return CreateItemGroupUseCase(ref.read(inventorySetupRepositoryProvider));
});

final updateItemGroupUseCaseProvider = Provider((ref) {
  return UpdateItemGroupUseCase(ref.read(inventorySetupRepositoryProvider));
});

final deleteItemGroupUseCaseProvider = Provider((ref) {
  return DeleteItemGroupUseCase(ref.read(inventorySetupRepositoryProvider));
});

final saveInventoryConfigUseCaseProvider = Provider((ref) {
  return SaveInventoryConfigUseCase(ref.read(inventorySetupRepositoryProvider));
});

// Providers for UI
final warehousesProvider = FutureProvider((ref) async {
  final useCase = ref.read(getAllWarehousesUseCaseProvider);
  return await useCase.call(const NoParams());
});

final itemGroupsProvider = FutureProvider((ref) async {
  final useCase = ref.read(getAllItemGroupsUseCaseProvider);
  return await useCase.call(const NoParams());
});

final createWarehouseProvider = FutureProvider.family((ref, warehouse) async {
  final useCase = ref.read(createWarehouseUseCaseProvider);
  return await useCase.call(warehouse as WarehouseEntity);
});

final updateWarehouseProvider = FutureProvider.family((ref, warehouse) async {
  final useCase = ref.read(updateWarehouseUseCaseProvider);
  return await useCase.call(warehouse as WarehouseEntity);
});

final deleteWarehouseProvider = FutureProvider.family((ref, id) async {
  final useCase = ref.read(deleteWarehouseUseCaseProvider);
  return await useCase.call(id as int);
});

final createItemGroupProvider = FutureProvider.family((ref, itemGroup) async {
  final useCase = ref.read(createItemGroupUseCaseProvider);
  return await useCase.call(itemGroup as ItemGroupEntity);
});

final updateItemGroupProvider = FutureProvider.family((ref, itemGroup) async {
  final useCase = ref.read(updateItemGroupUseCaseProvider);
  return await useCase.call(itemGroup as ItemGroupEntity);
});

final deleteItemGroupProvider = FutureProvider.family((ref, id) async {
  final useCase = ref.read(deleteItemGroupUseCaseProvider);
  return await useCase.call(id as int);
});

final saveInventoryConfigProvider = Provider((ref) {
  final useCase = ref.read(saveInventoryConfigUseCaseProvider);
  return useCase.call;
});

// Added missing inventoryConfigProvider
final inventoryConfigProvider = FutureProvider<InventoryConfigEntity>((ref) async {
  final repo = ref.read(inventorySetupRepositoryProvider);
  final result = await repo.getInventoryConfig();
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
});
