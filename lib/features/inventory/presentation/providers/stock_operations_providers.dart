import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../di/database_provider.dart';
import '../../data/datasources/local/stock_operations_local_datasource.dart';
import '../../data/repositories/stock_operations_repository_impl.dart';
import '../../domain/repositories/stock_operations_repository.dart';

// Data Source Provider
final stockOperationsLocalDataSourceProvider =
    Provider<StockOperationsLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return StockOperationsLocalDataSource(database);
});

// Repository Provider
final stockOperationsRepositoryProvider =
    Provider<StockOperationsRepository>((ref) {
  final dataSource = ref.watch(stockOperationsLocalDataSourceProvider);
  return StockOperationsRepositoryImpl(dataSource);
});

// Note: Full providers would be implemented here for each operation type
// For now, providing basic structure
