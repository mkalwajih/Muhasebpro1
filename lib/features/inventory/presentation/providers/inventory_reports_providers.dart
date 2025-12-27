import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/features/inventory/data/datasources/local/inventory_reports_local_datasource.dart';
import 'package:muhaseb_pro/features/inventory/data/repositories/inventory_reports_repository_impl.dart';
// ... other imports

final inventoryReportsLocalDataSourceProvider = Provider<InventoryReportsLocalDataSource>((ref) {
  // Fixed: databaseProvider -> appDatabaseProvider
  return InventoryReportsLocalDataSource(ref.read(appDatabaseProvider));
});

final inventoryReportsRepositoryProvider = Provider((ref) {
  return InventoryReportsRepositoryImpl(
      ref.read(inventoryReportsLocalDataSourceProvider));
});

// ... rest of the file
