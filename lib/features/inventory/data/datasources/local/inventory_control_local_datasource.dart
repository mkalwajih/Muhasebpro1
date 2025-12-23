import 'package:drift/drift.dart';
import '../../../../../core/db/app_database.dart';

class InventoryControlLocalDataSource {
  final AppDatabase _database;

  InventoryControlLocalDataSource(this._database);

  // Stocktaking Sessions
  Future<List<StocktakingSessionData>> getAllSessions() async {
    final query = _database.select(_database.stocktakingSessions)
      ..orderBy([(t) => OrderingTerm(expression: t.sessionDate, mode: OrderingMode.desc)]);
    return await query.get();
  }

  Future<StocktakingSessionData?> getSessionById(int id) async {
    final query = _database.select(_database.stocktakingSessions)
      ..where((t) => t.id.equals(id));
    return await query.getSingleOrNull();
  }

  Future<int> createSession(StocktakingSessionsCompanion session) async {
    return await _database.into(_database.stocktakingSessions).insert(session);
  }

  Future<void> updateSession(int id, StocktakingSessionsCompanion session) async {
    await (_database.update(_database.stocktakingSessions)
          ..where((t) => t.id.equals(id)))
        .write(session);
  }

  Future<void> deleteSession(int id) async {
    await (_database.delete(_database.stocktakingSessions)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // Stocktaking Counts
  Future<List<StocktakingCountData>> getSessionCounts(int sessionId) async {
    final query = _database.select(_database.stocktakingCounts)
      ..where((t) => t.sessionId.equals(sessionId));
    return await query.get();
  }

  Future<void> createCount(StocktakingCountsCompanion count) async {
    await _database.into(_database.stocktakingCounts).insert(count);
  }

  Future<void> updateCount(int id, StocktakingCountsCompanion count) async {
    await (_database.update(_database.stocktakingCounts)
          ..where((t) => t.id.equals(id)))
        .write(count);
  }

  // Complete session - calculate discrepancies
  Future<void> completeSession(int sessionId) async {
    await _database.transaction(() async {
      final counts = await getSessionCounts(sessionId);
      
      for (final count in counts) {
        if (count.physicalQuantity != null) {
          final discrepancy = count.physicalQuantity! - count.bookQuantity;
          // Simplified - would need item cost for accurate value
          final discrepancyValue = discrepancy * 10.0; // Placeholder
          
          await updateCount(
            count.id,
            StocktakingCountsCompanion(
              discrepancy: Value(discrepancy),
              discrepancyValue: Value(discrepancyValue),
            ),
          );
        }
      }

      await updateSession(
        sessionId,
        StocktakingSessionsCompanion(
          status: const Value('Completed'),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });
  }

  // Post session - create adjustment transactions
  Future<void> postSession(int sessionId, String postedBy) async {
    await _database.transaction(() async {
      final session = await getSessionById(sessionId);
      final counts = await getSessionCounts(sessionId);

      for (final count in counts) {
        if (count.discrepancy != null && count.discrepancy != 0) {
          // Create stock transaction for adjustment
          await _database.into(_database.stockTransactions).insert(
                StockTransactionsCompanion(
                  transactionType: const Value('Adjustment'),
                  docNo: Value(session!.sessionNo),
                  docDate: Value(session.sessionDate),
                  warehouseId: Value(session.warehouseId),
                  itemId: Value(count.itemId),
                  quantity: Value(count.discrepancy!),
                  unitCost: const Value(0), // Would need actual cost
                  totalCost: Value(count.discrepancyValue ?? 0),
                  status: const Value('Posted'),
                  postedAt: Value(DateTime.now().millisecondsSinceEpoch),
                  postedBy: Value(postedBy),
                  createdBy: Value(session.createdBy),
                  createdAt: Value(DateTime.now().millisecondsSinceEpoch),
                  updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
                ),
              );

          // Update stock balance
          final existingBalance = await (_database.select(_database.stockBalances)
                ..where((t) =>
                    t.itemId.equals(count.itemId) &
                    t.warehouseId.equals(session.warehouseId)))
              .getSingleOrNull();

          if (existingBalance != null) {
            await (_database.update(_database.stockBalances)
                  ..where((t) => t.id.equals(existingBalance.id)))
                .write(StockBalancesCompanion(
              quantity: Value(existingBalance.quantity + count.discrepancy!),
              updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
            ));
          }
        }
      }

      await updateSession(
        sessionId,
        StocktakingSessionsCompanion(
          status: const Value('Posted'),
          postedAt: Value(DateTime.now().millisecondsSinceEpoch),
          postedBy: Value(postedBy),
        ),
      );
    });
  }

  // Stock Reservations
  Future<List<StockReservationData>> getAllReservations() async {
    final query = _database.select(_database.stockReservations)
      ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]);
    return await query.get();
  }

  Future<List<StockReservationData>> getActiveReservations() async {
    final query = _database.select(_database.stockReservations)
      ..where((t) => t.status.equals('Active'));
    return await query.get();
  }

  Future<void> createReservation(StockReservationsCompanion reservation) async {
    await _database.transaction(() async {
      final reservationId = await _database.into(_database.stockReservations).insert(reservation);
      
      // Update stock balance reserved quantity
      final balance = await (_database.select(_database.stockBalances)
            ..where((t) =>
                t.itemId.equals(reservation.itemId.value) &
                t.warehouseId.equals(reservation.warehouseId.value)))
          .getSingleOrNull();

      if (balance != null) {
        await (_database.update(_database.stockBalances)
              ..where((t) => t.id.equals(balance.id)))
            .write(StockBalancesCompanion(
          reservedQuantity: Value(balance.reservedQuantity + reservation.reservedQuantity.value),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ));
      }
    });
  }

  Future<void> releaseReservation(int id) async {
    await _database.transaction(() async {
      final reservation = await (_database.select(_database.stockReservations)
            ..where((t) => t.id.equals(id)))
          .getSingleOrNull();

      if (reservation != null) {
        // Update reservation status
        await (_database.update(_database.stockReservations)
              ..where((t) => t.id.equals(id)))
            .write(StockReservationsCompanion(
          status: const Value('Released'),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ));

        // Update stock balance reserved quantity
        final balance = await (_database.select(_database.stockBalances)
              ..where((t) =>
                  t.itemId.equals(reservation.itemId) &
                  t.warehouseId.equals(reservation.warehouseId)))
            .getSingleOrNull();

        if (balance != null) {
          await (_database.update(_database.stockBalances)
                ..where((t) => t.id.equals(balance.id)))
              .write(StockBalancesCompanion(
            reservedQuantity: Value(balance.reservedQuantity - reservation.reservedQuantity),
            updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
          ));
        }
      }
    });
  }

  Future<void> deleteReservation(int id) async {
    await (_database.delete(_database.stockReservations)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}
