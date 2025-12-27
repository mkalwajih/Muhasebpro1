import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/features/inventory/data/datasources/local/inventory_setup_local_datasource.dart';
import 'package:muhaseb_pro/features/inventory/data/repositories/inventory_setup_repository_impl.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/get_all_warehouses_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/get_all_item_groups_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/create_warehouse_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/update_warehouse_usecase.dart';
import 'package:muhaseb_pro/features/inventory/domain/usecases/delete_warehouse_usecase.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

// Data Source
final inventorySetupLocalDataSourceProvider = Provider<InventorySetupLocalDataSource>((ref) {
  return InventorySetupLocalDataSource(ref.read(appDatabaseProvider));
});

// Repository
final inventorySetupRepositoryProvider = Provider((ref) {
  return InventorySetupRepositoryImpl(
      ref.read(inventorySetupLocalDataSourceProvider));
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
    return await useCase.call(warehouse);
});

final updateWarehouseProvider = FutureProvider.family((ref, warehouse) async {
    final useCase = ref.read(updateWarehouseUseCaseProvider);
    return await useCase.call(warehouse);
});

final deleteWarehouseProvider = FutureProvider.family((ref, id) async {
    final useCase = ref.read(deleteWarehouseUseCaseProvider);
    return await useCase.call(id);
});