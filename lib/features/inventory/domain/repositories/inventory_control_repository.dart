import 'package:dartz/dartz.dart';
import '../entities/inventory_control_entity.dart';

abstract class InventoryControlRepository {
  // Stocktaking Sessions
  Future<Either<Exception, List<StocktakingSessionEntity>>> getAllSessions();
  Future<Either<Exception, StocktakingSessionEntity>> getSessionById(int id);
  Future<Either<Exception, void>> createSession(StocktakingSessionEntity session);
  Future<Either<Exception, void>> updateSession(StocktakingSessionEntity session);
  Future<Either<Exception, void>> completeSession(int id);
  Future<Either<Exception, void>> postSession(int id, String postedBy);
  Future<Either<Exception, void>> deleteSession(int id);

  // Stocktaking Counts
  Future<Either<Exception, void>> updateCount(StocktakingCountEntity count);

  // Stock Reservations
  Future<Either<Exception, List<StockReservationEntity>>> getAllReservations();
  Future<Either<Exception, List<StockReservationEntity>>> getActiveReservations();
  Future<Either<Exception, void>> createReservation(StockReservationEntity reservation);
  Future<Either<Exception, void>> releaseReservation(int id);
  Future<Either<Exception, void>> deleteReservation(int id);
}
