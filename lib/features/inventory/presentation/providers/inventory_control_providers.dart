import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../di/database_provider.dart';
import '../../data/datasources/local/inventory_control_local_datasource.dart';
import '../../data/repositories/inventory_control_repository_impl.dart';
import '../../domain/repositories/inventory_control_repository.dart';

// Data Source Provider
final inventoryControlLocalDataSourceProvider =
    Provider<InventoryControlLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return InventoryControlLocalDataSource(database);
});

// Repository Provider
final inventoryControlRepositoryProvider =
    Provider<InventoryControlRepository>((ref) {
  final dataSource = ref.watch(inventoryControlLocalDataSourceProvider);
  return InventoryControlRepositoryImpl(dataSource);
});
