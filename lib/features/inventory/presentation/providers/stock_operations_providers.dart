import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/features/inventory/data/datasources/local/stock_operations_local_datasource.dart';
import 'package:muhaseb_pro/features/inventory/data/repositories/stock_operations_repository_impl.dart';

final stockOperationsLocalDataSourceProvider = Provider<StockOperationsLocalDataSource>((ref) {
  // Fixed: databaseProvider -> appDatabaseProvider
  return StockOperationsLocalDataSource(ref.read(appDatabaseProvider));
});

final stockOperationsRepositoryProvider = Provider((ref) {
  return StockOperationsRepositoryImpl(
      ref.read(stockOperationsLocalDataSourceProvider));
});
// ...