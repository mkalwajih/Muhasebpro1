import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../di/database_provider.dart';
import '../../data/datasources/local/item_management_local_datasource.dart';
import '../../data/repositories/item_management_repository_impl.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/repositories/item_management_repository.dart';

// Data Source Provider
final itemManagementLocalDataSourceProvider =
    Provider<ItemManagementLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return ItemManagementLocalDataSource(database);
});

// Repository Provider
final itemManagementRepositoryProvider =
    Provider<ItemManagementRepository>((ref) {
  final dataSource = ref.watch(itemManagementLocalDataSourceProvider);
  return ItemManagementRepositoryImpl(dataSource);
});

// Items Provider
final itemsProvider = FutureProvider<List<ItemEntity>>((ref) async {
  final repository = ref.watch(itemManagementRepositoryProvider);
  final result = await repository.getAllItems();
  return result.fold(
    (error) => throw error,
    (items) => items,
  );
});

// Get Item by ID Provider
final itemByIdProvider =
    FutureProvider.family<ItemEntity, int>((ref, id) async {
  final repository = ref.watch(itemManagementRepositoryProvider);
  final result = await repository.getItemById(id);
  return result.fold(
    (error) => throw error,
    (item) => item,
  );
});

// Create Item Use Case
final createItemProvider = Provider<Future<void> Function(ItemEntity)>((ref) {
  return (item) async {
    final repository = ref.read(itemManagementRepositoryProvider);
    final result = await repository.createItem(item);
    result.fold(
      (error) => throw error,
      (_) {
        ref.invalidate(itemsProvider);
      },
    );
  };
});

// Update Item Use Case
final updateItemProvider = Provider<Future<void> Function(ItemEntity)>((ref) {
  return (item) async {
    final repository = ref.read(itemManagementRepositoryProvider);
    final result = await repository.updateItem(item);
    result.fold(
      (error) => throw error,
      (_) {
        ref.invalidate(itemsProvider);
        if (item.id != null) {
          ref.invalidate(itemByIdProvider(item.id!));
        }
      },
    );
  };
});

// Delete Item Use Case
final deleteItemProvider = Provider<Future<void> Function(int)>((ref) {
  return (id) async {
    final repository = ref.read(itemManagementRepositoryProvider);
    final result = await repository.deleteItem(id);
    result.fold(
      (error) => throw error,
      (_) {
        ref.invalidate(itemsProvider);
      },
    );
  };
});

// Save Opening Stock Use Case
final saveOpeningStockProvider =
    Provider<Future<void> Function(List<OpeningStockEntity>)>((ref) {
  return (openingStocks) async {
    final repository = ref.read(itemManagementRepositoryProvider);
    final result = await repository.saveOpeningStock(openingStocks);
    result.fold(
      (error) => throw error,
      (_) {
        // Invalidate relevant providers after saving opening stock
        ref.invalidate(itemsProvider);
      },
    );
  };
});
