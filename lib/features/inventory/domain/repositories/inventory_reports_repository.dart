import 'package:dartz/dartz.dart';
import '../entities/inventory_report_entity.dart';

abstract class InventoryReportsRepository {
  Future<Either<Exception, List<InventoryBalanceEntity>>> getInventoryBalances(
      ReportFilterEntity filter);
  
  Future<Either<Exception, List<ItemTransactionEntity>>> getItemTransactions(
      ReportFilterEntity filter);
  
  Future<Either<Exception, List<InventoryValuationEntity>>> getInventoryValuation(
      ReportFilterEntity filter);
  
  Future<Either<Exception, List<StaleInventoryEntity>>> getStaleInventory(
      ReportFilterEntity filter);
  
  Future<Either<Exception, List<LowStockEntity>>> getLowStockItems(
      ReportFilterEntity filter);
}
