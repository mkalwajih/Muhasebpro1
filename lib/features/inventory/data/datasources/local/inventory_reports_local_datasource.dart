import '../../../../../core/db/app_database.dart';

class InventoryReportsLocalDataSource {
  final AppDatabase _database;

  InventoryReportsLocalDataSource(this._database);

  // Inventory Balances Report
  Future<List<Map<String, dynamic>>> getInventoryBalances({
    DateTime? asOfDate,
    int? warehouseId,
    int? itemGroupId,
  }) async {
    // Simplified query - would need proper joins and calculations
    final balances = await _database.select(_database.stockBalances).get();
    
    return balances.map((balance) {
      return {
        'itemId': balance.itemId,
        'warehouseId': balance.warehouseId,
        'quantityOnHand': balance.quantity,
        'reservedQuantity': balance.reservedQuantity,
        'availableQuantity': balance.quantity - balance.reservedQuantity,
      };
    }).toList();
  }

  // Item Transactions Report (Stock Card)
  Future<List<Map<String, dynamic>>> getItemTransactions({
    required int itemId,
    DateTime? startDate,
    DateTime? endDate,
    int? warehouseId,
  }) async {
    var query = _database.select(_database.stockTransactions)
      ..where((t) => t.itemId.equals(itemId));
    
    if (warehouseId != null) {
      query = query..where((t) => t.warehouseId.equals(warehouseId));
    }
    
    query = query..orderBy([(t) => OrderingTerm(expression: t.docDate)]);
    
    final transactions = await query.get();
    
    double runningBalance = 0;
    return transactions.map((txn) {
      runningBalance += txn.quantity;
      return {
        'date': DateTime.fromMillisecondsSinceEpoch(txn.docDate),
        'transactionType': txn.transactionType,
        'docNo': txn.docNo,
        'warehouseId': txn.warehouseId,
        'quantityIn': txn.quantity > 0 ? txn.quantity : 0,
        'quantityOut': txn.quantity < 0 ? -txn.quantity : 0,
        'runningBalance': runningBalance,
        'unitCost': txn.unitCost,
      };
    }).toList();
  }

  // Inventory Valuation Report
  Future<List<Map<String, dynamic>>> getInventoryValuation({
    DateTime? asOfDate,
    int? warehouseId,
  }) async {
    // Simplified - would need proper aggregation with item groups
    final balances = await _database.select(_database.stockBalances).get();
    
    return [
      {
        'itemGroupCode': 'ALL',
        'itemGroupNameAr': 'الكل',
        'itemGroupNameEn': 'All',
        'totalQuantity': balances.fold<double>(0, (sum, b) => sum + b.quantity),
        'totalValue': 0.0, // Would need item costs
        'itemCount': balances.length,
      }
    ];
  }

  // Stale Inventory Report
  Future<List<Map<String, dynamic>>> getStaleInventory({
    int staleSinceDays = 90,
    int? warehouseId,
  }) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: staleSinceDays));
    
    // Simplified - would need proper query with last transaction date
    return [];
  }

  // Low Stock Report
  Future<List<Map<String, dynamic>>> getLowStockItems({
    int? warehouseId,
    int? itemGroupId,
  }) async {
    // Simplified - would need to join with items table to check reorder levels
    return [];
  }
}
