import 'package:drift/drift.dart';
import '../../../../../core/db/app_database.dart';

class StockOperationsLocalDataSource {
  final AppDatabase _database;

  StockOperationsLocalDataSource(this._database);

  // Incoming Stock Orders - Basic CRUD
  Future<List<IncomingStockOrderData>> getAllIncomingOrders() async {
    final query = _database.select(_database.incomingStockOrders)
      ..orderBy([(t) => OrderingTerm(expression: t.docDate, mode: OrderingMode.desc)]);
    return await query.get();
  }

  Future<IncomingStockOrderData?> getIncomingOrderById(int id) async {
    final query = _database.select(_database.incomingStockOrders)
      ..where((t) => t.id.equals(id));
    return await query.getSingleOrNull();
  }

  Future<int> createIncomingOrder(IncomingStockOrdersCompanion order) async {
    return await _database.into(_database.incomingStockOrders).insert(order);
  }

  Future<void> updateIncomingOrder(int id, IncomingStockOrdersCompanion order) async {
    await (_database.update(_database.incomingStockOrders)
          ..where((t) => t.id.equals(id)))
        .write(order);
  }

  Future<void> deleteIncomingOrder(int id) async {
    await (_database.delete(_database.incomingStockOrders)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // Incoming Stock Order Lines
  Future<List<IncomingStockOrderLineData>> getIncomingOrderLines(int orderId) async {
    final query = _database.select(_database.incomingStockOrderLines)
      ..where((t) => t.orderId.equals(orderId));
    return await query.get();
  }

  Future<void> createIncomingOrderLine(IncomingStockOrderLinesCompanion line) async {
    await _database.into(_database.incomingStockOrderLines).insert(line);
  }

  // Outgoing Stock Orders - Basic CRUD
  Future<List<OutgoingStockOrderData>> getAllOutgoingOrders() async {
    final query = _database.select(_database.outgoingStockOrders)
      ..orderBy([(t) => OrderingTerm(expression: t.docDate, mode: OrderingMode.desc)]);
    return await query.get();
  }

  Future<OutgoingStockOrderData?> getOutgoingOrderById(int id) async {
    final query = _database.select(_database.outgoingStockOrders)
      ..where((t) => t.id.equals(id));
    return await query.getSingleOrNull();
  }

  Future<int> createOutgoingOrder(OutgoingStockOrdersCompanion order) async {
    return await _database.into(_database.outgoingStockOrders).insert(order);
  }

  Future<void> updateOutgoingOrder(int id, OutgoingStockOrdersCompanion order) async {
    await (_database.update(_database.outgoingStockOrders)
          ..where((t) => t.id.equals(id)))
        .write(order);
  }

  Future<void> deleteOutgoingOrder(int id) async {
    await (_database.delete(_database.outgoingStockOrders)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // Outgoing Stock Order Lines
  Future<List<OutgoingStockOrderLineData>> getOutgoingOrderLines(int orderId) async {
    final query = _database.select(_database.outgoingStockOrderLines)
      ..where((t) => t.orderId.equals(orderId));
    return await query.get();
  }

  Future<void> createOutgoingOrderLine(OutgoingStockOrderLinesCompanion line) async {
    await _database.into(_database.outgoingStockOrderLines).insert(line);
  }

  // Warehouse Transfers - Basic CRUD
  Future<List<WarehouseTransferData>> getAllTransfers() async {
    final query = _database.select(_database.warehouseTransfers)
      ..orderBy([(t) => OrderingTerm(expression: t.transferDate, mode: OrderingMode.desc)]);
    return await query.get();
  }

  Future<List<WarehouseTransferData>> getPendingTransfers(int warehouseId) async {
    final query = _database.select(_database.warehouseTransfers)
      ..where((t) => 
          t.destinationWarehouseId.equals(warehouseId) & 
          t.status.equals('Dispatched'));
    return await query.get();
  }

  Future<WarehouseTransferData?> getTransferById(int id) async {
    final query = _database.select(_database.warehouseTransfers)
      ..where((t) => t.id.equals(id));
    return await query.getSingleOrNull();
  }

  Future<int> createTransfer(WarehouseTransfersCompanion transfer) async {
    return await _database.into(_database.warehouseTransfers).insert(transfer);
  }

  Future<void> updateTransfer(int id, WarehouseTransfersCompanion transfer) async {
    await (_database.update(_database.warehouseTransfers)
          ..where((t) => t.id.equals(id)))
        .write(transfer);
  }

  Future<void> deleteTransfer(int id) async {
    await (_database.delete(_database.warehouseTransfers)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // Warehouse Transfer Lines
  Future<List<WarehouseTransferLineData>> getTransferLines(int transferId) async {
    final query = _database.select(_database.warehouseTransferLines)
      ..where((t) => t.transferId.equals(transferId));
    return await query.get();
  }

  Future<void> createTransferLine(WarehouseTransferLinesCompanion line) async {
    await _database.into(_database.warehouseTransferLines).insert(line);
  }

  // Post operations (update stock balances and create transactions)
  Future<void> postIncomingOrder(int orderId, String postedBy) async {
    await _database.transaction(() async {
      // Update order status
      await (_database.update(_database.incomingStockOrders)
            ..where((t) => t.id.equals(orderId)))
          .write(IncomingStockOrdersCompanion(
        status: const Value('Posted'),
        postedAt: Value(DateTime.now().millisecondsSinceEpoch),
        postedBy: Value(postedBy),
      ));

      // Get order and lines
      final order = await getIncomingOrderById(orderId);
      final lines = await getIncomingOrderLines(orderId);

      // Create stock transactions and update balances
      for (final line in lines) {
        // Create stock transaction
        await _database.into(_database.stockTransactions).insert(
              StockTransactionsCompanion(
                transactionType: const Value('Incoming'),
                docNo: Value(order!.docNo),
                docDate: Value(order.docDate),
                warehouseId: Value(order.warehouseId),
                itemId: Value(line.itemId),
                quantity: Value(line.quantity),
                unitCost: Value(line.unitCost),
                totalCost: Value(line.totalCost),
                expiryDate: Value(line.expiryDate),
                batchNumber: Value(line.batchNumber),
                status: const Value('Posted'),
                postedAt: Value(DateTime.now().millisecondsSinceEpoch),
                postedBy: Value(postedBy),
                createdBy: Value(order.createdBy),
                createdAt: Value(DateTime.now().millisecondsSinceEpoch),
                updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
              ),
            );

        // Update stock balance
        final existingBalance = await (_database.select(_database.stockBalances)
              ..where((t) =>
                  t.itemId.equals(line.itemId) &
                  t.warehouseId.equals(order.warehouseId)))
            .getSingleOrNull();

        if (existingBalance != null) {
          await (_database.update(_database.stockBalances)
                ..where((t) => t.id.equals(existingBalance.id)))
              .write(StockBalancesCompanion(
            quantity: Value(existingBalance.quantity + line.quantity),
            updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
          ));
        } else {
          await _database.into(_database.stockBalances).insert(
                StockBalancesCompanion(
                  itemId: Value(line.itemId),
                  warehouseId: Value(order.warehouseId),
                  quantity: Value(line.quantity),
                  reservedQuantity: const Value(0),
                  updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
                ),
              );
        }
      }
    });
  }

  Future<void> postOutgoingOrder(int orderId, String postedBy) async {
    await _database.transaction(() async {
      // Update order status
      await (_database.update(_database.outgoingStockOrders)
            ..where((t) => t.id.equals(orderId)))
          .write(OutgoingStockOrdersCompanion(
        status: const Value('Posted'),
        postedAt: Value(DateTime.now().millisecondsSinceEpoch),
        postedBy: Value(postedBy),
      ));

      // Get order and lines
      final order = await getOutgoingOrderById(orderId);
      final lines = await getOutgoingOrderLines(orderId);

      // Create stock transactions and update balances
      for (final line in lines) {
        // Create stock transaction
        await _database.into(_database.stockTransactions).insert(
              StockTransactionsCompanion(
                transactionType: const Value('Outgoing'),
                docNo: Value(order!.docNo),
                docDate: Value(order.docDate),
                warehouseId: Value(order.warehouseId),
                itemId: Value(line.itemId),
                quantity: Value(-line.quantity),
                unitCost: Value(line.unitCost),
                totalCost: Value(-line.totalCost),
                status: const Value('Posted'),
                postedAt: Value(DateTime.now().millisecondsSinceEpoch),
                postedBy: Value(postedBy),
                createdBy: Value(order.createdBy),
                createdAt: Value(DateTime.now().millisecondsSinceEpoch),
                updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
              ),
            );

        // Update stock balance
        final existingBalance = await (_database.select(_database.stockBalances)
              ..where((t) =>
                  t.itemId.equals(line.itemId) &
                  t.warehouseId.equals(order.warehouseId)))
            .getSingleOrNull();

        if (existingBalance != null) {
          await (_database.update(_database.stockBalances)
                ..where((t) => t.id.equals(existingBalance.id)))
              .write(StockBalancesCompanion(
            quantity: Value(existingBalance.quantity - line.quantity),
            updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
          ));
        }
      }
    });
  }
}
