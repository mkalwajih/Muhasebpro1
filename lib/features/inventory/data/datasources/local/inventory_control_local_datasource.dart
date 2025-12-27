import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';

class InventoryControlLocalDataSource {
  final AppDatabase _database;

  InventoryControlLocalDataSource(this._database);

  // Stocktaking Sessions
  Future<List<StocktakingSession>> getAllStocktakingSessions() async {
    return await _database.select(_database.stocktakingSessions).get();
  }

  Future<StocktakingSession?> getStocktakingSessionById(int id) async {
    return await (_database.select(_database.stocktakingSessions)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> createStocktakingSession(StocktakingSessionsCompanion session) async {
    return await _database.into(_database.stocktakingSessions).insert(session);
  }

  Future<void> updateStocktakingSession(StocktakingSessionsCompanion session) async {
    await (_database.update(_database.stocktakingSessions)..where((t) => t.id.equals(session.id.value))).write(session);
  }

  Future<void> deleteSession(int id) async {
    await (_database.delete(_database.stocktakingSessions)..where((t) => t.id.equals(id))).go();
  }

  Future<void> completeSession(int id) async {
    await (_database.update(_database.stocktakingSessions)..where((t) => t.id.equals(id))).write(
      const StocktakingSessionsCompanion(status: Value('Completed')),
    );
  }

  Future<void> postSession(int id, String postedBy) async {
    await (_database.update(_database.stocktakingSessions)..where((t) => t.id.equals(id))).write(
      StocktakingSessionsCompanion(status: const Value('Posted'), postedBy: Value(postedBy)),
    );
  }

  // Stocktaking Counts
  Future<List<StocktakingCount>> getCountsForSession(int sessionId) async {
    return await (_database.select(_database.stocktakingCounts)..where((t) => t.sessionId.equals(sessionId))).get();
  }

  Future<void> saveStocktakingCount(StocktakingCountsCompanion count) async {
    await _database.into(_database.stocktakingCounts).insertOnConflictUpdate(count);
  }

  // Stock Reservations
  Future<List<StockReservation>> getAllReservations() async {
    return await _database.select(_database.stockReservations).get();
  }

  Future<List<StockReservation>> getActiveReservations() async {
    return await (_database.select(_database.stockReservations)..where((t) => t.status.equals('Active'))).get();
  }

  Future<void> createReservation(StockReservationsCompanion reservation) async {
    await _database.into(_database.stockReservations).insert(reservation);
  }

  Future<void> releaseReservation(int id) async {
    await (_database.update(_database.stockReservations)
      ..where((t) => t.id.equals(id)))
      .write(StockReservationsCompanion(
        status: const Value('Released'),
        updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
      ));
  }

  Future<void> deleteReservation(int id) async {
    await (_database.delete(_database.stockReservations)..where((t) => t.id.equals(id))).go();
  }
}