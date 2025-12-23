import 'package:dartz/dartz.dart';
import '../entities/stock_operation_entity.dart';

abstract class StockOperationsRepository {
  // Incoming Stock Orders
  Future<Either<Exception, List<IncomingStockOrderEntity>>> getAllIncomingOrders();
  Future<Either<Exception, IncomingStockOrderEntity>> getIncomingOrderById(int id);
  Future<Either<Exception, void>> createIncomingOrder(IncomingStockOrderEntity order);
  Future<Either<Exception, void>> updateIncomingOrder(IncomingStockOrderEntity order);
  Future<Either<Exception, void>> postIncomingOrder(int id, String postedBy);
  Future<Either<Exception, void>> deleteIncomingOrder(int id);

  // Outgoing Stock Orders
  Future<Either<Exception, List<OutgoingStockOrderEntity>>> getAllOutgoingOrders();
  Future<Either<Exception, OutgoingStockOrderEntity>> getOutgoingOrderById(int id);
  Future<Either<Exception, void>> createOutgoingOrder(OutgoingStockOrderEntity order);
  Future<Either<Exception, void>> updateOutgoingOrder(OutgoingStockOrderEntity order);
  Future<Either<Exception, void>> postOutgoingOrder(int id, String postedBy);
  Future<Either<Exception, void>> deleteOutgoingOrder(int id);

  // Warehouse Transfers
  Future<Either<Exception, List<WarehouseTransferEntity>>> getAllTransfers();
  Future<Either<Exception, List<WarehouseTransferEntity>>> getPendingTransfers(int warehouseId);
  Future<Either<Exception, WarehouseTransferEntity>> getTransferById(int id);
  Future<Either<Exception, void>> createTransfer(WarehouseTransferEntity transfer);
  Future<Either<Exception, void>> updateTransfer(WarehouseTransferEntity transfer);
  Future<Either<Exception, void>> dispatchTransfer(int id, String dispatchedBy);
  Future<Either<Exception, void>> receiveTransfer(int id, String receivedBy);
  Future<Either<Exception, void>> deleteTransfer(int id);
}
