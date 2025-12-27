import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/features/inventory/data/datasources/local/inventory_setup_local_datasource.dart';
import 'package:muhaseb_pro/features/inventory/data/repositories/inventory_setup_repository_impl.dart';
// ... other imports

final inventorySetupLocalDataSourceProvider = Provider<InventorySetupLocalDataSource>((ref) {
  // Fixed: databaseProvider -> appDatabaseProvider
  return InventorySetupLocalDataSource(ref.read(appDatabaseProvider));
});

final inventorySetupRepositoryProvider = Provider((ref) {
  return InventorySetupRepositoryImpl(
      ref.read(inventorySetupLocalDataSourceProvider));
});

// ... rest of the file
