import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';

class StockOperationsLocalDataSource {
  final AppDatabase _database;

  StockOperationsLocalDataSource(this._database);

  // Incoming Stock Orders
  Future<List<IncomingStockOrder>> getAllIncomingOrders() async {
    return await _database.select(_database.incomingStockOrders).get();
  }

  Future<IncomingStockOrder?> getIncomingOrderById(int id) async {
    return await (_database.select(_database.incomingStockOrders)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> createIncomingOrder(IncomingStockOrdersCompanion order) async {
    return await _database.into(_database.incomingStockOrders).insert(order);
  }

  Future<void> postIncomingOrder(int id, String postedBy) async {
    await (_database.update(_database.incomingStockOrders)..where((t) => t.id.equals(id))).write(
      IncomingStockOrdersCompanion(status: const Value('Posted'), postedBy: Value(postedBy)),
    );
  }

  Future<void> deleteIncomingOrder(int id) async {
    await (_database.delete(_database.incomingStockOrders)..where((t) => t.id.equals(id))).go();
  }

  // Outgoing Stock Orders
  Future<List<OutgoingStockOrder>> getAllOutgoingOrders() async {
    return await _database.select(_database.outgoingStockOrders).get();
  }

  Future<int> createOutgoingOrder(OutgoingStockOrdersCompanion order) async {
    return await _database.into(_database.outgoingStockOrders).insert(order);
  }

  Future<void> postOutgoingOrder(int id, String postedBy) async {
    await (_database.update(_database.outgoingStockOrders)..where((t) => t.id.equals(id))).write(
      OutgoingStockOrdersCompanion(status: const Value('Posted'), postedBy: Value(postedBy)),
    );
  }

  Future<void> deleteOutgoingOrder(int id) async {
    await (_database.delete(_database.outgoingStockOrders)..where((t) => t.id.equals(id))).go();
  }

  // Warehouse Transfers
  Future<List<WarehouseTransfer>> getAllTransfers() async {
    return await _database.select(_database.warehouseTransfers).get();
  }

  Future<int> createTransfer(WarehouseTransfersCompanion transfer) async {
    return await _database.into(_database.warehouseTransfers).insert(transfer);
  }

  Future<void> deleteTransfer(int id) async {
    await (_database.delete(_database.warehouseTransfers)..where((t) => t.id.equals(id))).go();
  }

  // Transfer Lines
  Future<void> addTransferLines(List<WarehouseTransferLinesCompanion> lines) async {
    await _database.batch((batch) {
      batch.insertAll(_database.warehouseTransferLines, lines);
    });
  }
}