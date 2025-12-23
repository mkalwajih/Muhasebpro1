import 'package:dartz/dartz.dart';
import '../entities/item_entity.dart';

abstract class ItemManagementRepository {
  // Items
  Future<Either<Exception, List<ItemEntity>>> getAllItems();
  Future<Either<Exception, ItemEntity>> getItemById(int id);
  Future<Either<Exception, ItemEntity>> getItemByCode(String code);
  Future<Either<Exception, ItemEntity>> getItemByBarcode(String barcode);
  Future<Either<Exception, void>> createItem(ItemEntity item);
  Future<Either<Exception, void>> updateItem(ItemEntity item);
  Future<Either<Exception, void>> deleteItem(int id);
  
  // Opening Stock
  Future<Either<Exception, void>> saveOpeningStock(List<OpeningStockEntity> openingStocks);
}
