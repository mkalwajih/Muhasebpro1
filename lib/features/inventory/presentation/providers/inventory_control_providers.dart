import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/features/inventory/data/datasources/local/inventory_control_local_datasource.dart';
import 'package:muhaseb_pro/features/inventory/data/repositories/inventory_control_repository_impl.dart';
// ... other imports

final inventoryControlLocalDataSourceProvider = Provider<InventoryControlLocalDataSource>((ref) {
  // Fixed: databaseProvider -> appDatabaseProvider
  return InventoryControlLocalDataSource(ref.read(appDatabaseProvider)); 
});

final inventoryControlRepositoryProvider = Provider((ref) {
  return InventoryControlRepositoryImpl(
      ref.read(inventoryControlLocalDataSourceProvider));
});

// ... rest of the file
