import 'package:drift/drift.dart';
import '../../../../../core/db/app_database.dart';
import '../../models/item_model.dart';

class ItemManagementLocalDataSource {
  final AppDatabase _database;

  ItemManagementLocalDataSource(this._database);

  // Items
  Future<List<ItemModel>> getAllItems() async {
    final query = _database.select(_database.items)
      ..orderBy([(t) => OrderingTerm(expression: t.itemCode)]);
    final results = await query.get();
    return results.map((row) => ItemModel.fromDrift(row)).toList();
  }

  Future<ItemModel?> getItemById(int id) async {
    final query = _database.select(_database.items)
      ..where((t) => t.id.equals(id));
    final result = await query.getSingleOrNull();
    return result != null ? ItemModel.fromDrift(result) : null;
  }

  Future<ItemModel?> getItemByCode(String code) async {
    final query = _database.select(_database.items)
      ..where((t) => t.itemCode.equals(code));
    final result = await query.getSingleOrNull();
    return result != null ? ItemModel.fromDrift(result) : null;
  }

  Future<ItemModel?> getItemByBarcode(String barcode) async {
    final query = _database.select(_database.items)
      ..where((t) => t.master.barcode.equals(barcode));
    final result = await query.getSingleOrNull();
    return result != null ? ItemModel.fromDrift(result) : null;
  }

  Future<void> createItem(ItemModel item) async {
    await _database.into(_database.items).insert(item.toDrift());
  }

  Future<void> updateItem(ItemModel item) async {
    await (_database.update(_database.items)
          ..where((t) => t.id.equals(item.id!)))
        .write(item.toDrift());
  }

  Future<void> deleteItem(int id) async {
    await (_database.delete(_database.items)..where((t) => t.id.equals(id)))
        .go();
  }

  // Opening Stock - Creates stock transactions and updates balances
  Future<void> saveOpeningStock(
      List<Map<String, dynamic>> openingStocks) async {
    await _database.transaction(() async {
      for (final stock in openingStocks) {
        final warehouseId = stock['warehouseId'] as int;
        final itemId = stock['itemId'] as int;
        final quantity = stock['quantity'] as double;
        final unitCost = stock['unitCost'] as double;
        final expiryDate = stock['expiryDate'] as int?;
        final batchNumber = stock['batchNumber'] as String?;

        // Create stock transaction
        await _database.into(_database.stockTransactions).insert(
              StockTransactionsCompanion(
                transactionType: const Value('Opening'),
                docNo: Value('OPEN-${DateTime.now().millisecondsSinceEpoch}'),
                docDate: Value(DateTime.now().millisecondsSinceEpoch),
                warehouseId: Value(warehouseId),
                itemId: Value(itemId),
                quantity: Value(quantity),
                unitCost: Value(unitCost),
                totalCost: Value(quantity * unitCost),
                expiryDate: Value(expiryDate),
                batchNumber: Value(batchNumber),
                status: const Value('Posted'),
                postedAt: Value(DateTime.now().millisecondsSinceEpoch),
                postedBy: const Value('system'),
                createdBy: const Value('system'),
                createdAt: Value(DateTime.now().millisecondsSinceEpoch),
                updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
              ),
            );

        // Update or create stock balance
        final existingBalance = await (_database.select(_database.stockBalances)
              ..where((t) =>
                  t.itemId.equals(itemId) & t.warehouseId.equals(warehouseId)))
            .getSingleOrNull();

        if (existingBalance != null) {
          await (_database.update(_database.stockBalances)
                ..where((t) => t.id.equals(existingBalance.id)))
              .write(
            StockBalancesCompanion(
              quantity: Value(existingBalance.quantity + quantity),
              updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
            ),
          );
        } else {
          await _database.into(_database.stockBalances).insert(
                StockBalancesCompanion(
                  itemId: Value(itemId),
                  warehouseId: Value(warehouseId),
                  quantity: Value(quantity),
                  reservedQuantity: const Value(0),
                  updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
                ),
              );
        }
      }
    });
  }
}
