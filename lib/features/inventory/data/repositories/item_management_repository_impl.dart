import 'package:dartz/dartz.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/repositories/item_management_repository.dart';
import '../datasources/local/item_management_local_datasource.dart';
import '../models/item_model.dart';

class ItemManagementRepositoryImpl implements ItemManagementRepository {
  final ItemManagementLocalDataSource _localDataSource;

  ItemManagementRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Exception, List<ItemEntity>>> getAllItems() async {
    try {
      final items = await _localDataSource.getAllItems();
      return Right(items);
    } catch (e) {
      return Left(Exception('Failed to get items: $e'));
    }
  }

  @override
  Future<Either<Exception, ItemEntity>> getItemById(int id) async {
    try {
      final item = await _localDataSource.getItemById(id);
      if (item == null) {
        return Left(Exception('Item not found'));
      }
      return Right(item);
    } catch (e) {
      return Left(Exception('Failed to get item: $e'));
    }
  }

  @override
  Future<Either<Exception, ItemEntity>> getItemByCode(String code) async {
    try {
      final item = await _localDataSource.getItemByCode(code);
      if (item == null) {
        return Left(Exception('Item not found'));
      }
      return Right(item);
    } catch (e) {
      return Left(Exception('Failed to get item: $e'));
    }
  }

  @override
  Future<Either<Exception, ItemEntity>> getItemByBarcode(String barcode) async {
    try {
      final item = await _localDataSource.getItemByBarcode(barcode);
      if (item == null) {
        return Left(Exception('Item not found'));
      }
      return Right(item);
    } catch (e) {
      return Left(Exception('Failed to get item: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> createItem(ItemEntity item) async {
    try {
      final model = ItemModel.fromEntity(item);
      await _localDataSource.createItem(model);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to create item: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> updateItem(ItemEntity item) async {
    try {
      final model = ItemModel.fromEntity(item);
      await _localDataSource.updateItem(model);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to update item: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> deleteItem(int id) async {
    try {
      await _localDataSource.deleteItem(id);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete item: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> saveOpeningStock(
      List<OpeningStockEntity> openingStocks) async {
    try {
      final stocksData = openingStocks.map((stock) {
        return {
          'warehouseId': stock.warehouseId,
          'itemId': stock.itemId,
          'quantity': stock.quantity,
          'unitCost': stock.unitCost,
          'expiryDate': stock.expiryDate?.millisecondsSinceEpoch,
          'batchNumber': stock.batchNumber,
        };
      }).toList();

      await _localDataSource.saveOpeningStock(stocksData);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to save opening stock: $e'));
    }
  }
}
