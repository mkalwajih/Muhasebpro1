import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../di/database_provider.dart';
import '../../data/datasources/local/inventory_reports_local_datasource.dart';
import '../../data/repositories/inventory_reports_repository_impl.dart';
import '../../domain/repositories/inventory_reports_repository.dart';

// Data Source Provider
final inventoryReportsLocalDataSourceProvider =
    Provider<InventoryReportsLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return InventoryReportsLocalDataSource(database);
});

// Repository Provider
final inventoryReportsRepositoryProvider =
    Provider<InventoryReportsRepository>((ref) {
  final dataSource = ref.watch(inventoryReportsLocalDataSourceProvider);
  return InventoryReportsRepositoryImpl(dataSource);
});
