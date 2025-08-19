import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/financial_periods_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/financial_period_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/financial_periods_repository.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';

class FinancialPeriodsRepositoryImpl implements FinancialPeriodsRepository {
  final FinancialPeriodsLocalDataSource localDataSource;
  final AppDatabase _database;

  FinancialPeriodsRepositoryImpl(this.localDataSource, this._database);

  FinancialPeriodEntity _toEntity(FinancialPeriod data) {
    return FinancialPeriodEntity(
      id: data.id,
      periodCode: data.periodCode,
      fiscalYear: data.fiscalYear,
      periodType: data.periodType,
      periodNumber: data.periodNumber,
      startDate: DateTime.fromMillisecondsSinceEpoch(data.startDate),
      endDate: DateTime.fromMillisecondsSinceEpoch(data.endDate),
      isLocked: data.isLocked,
    );
  }

  FinancialPeriodsCompanion _toCompanion(FinancialPeriodEntity entity) {
    return FinancialPeriodsCompanion(
      id: entity.id != null ? Value(entity.id!) : const Value.absent(),
      periodCode: Value(entity.periodCode),
      fiscalYear: Value(entity.fiscalYear),
      periodType: Value(entity.periodType),
      periodNumber: Value(entity.periodNumber),
      startDate: Value(entity.startDate.millisecondsSinceEpoch),
      endDate: Value(entity.endDate.millisecondsSinceEpoch),
      isLocked: Value(entity.isLocked),
    );
  }

  @override
  Future<Either<Failure, List<FinancialPeriodEntity>>> getFinancialPeriods() async {
    try {
      final periodsData = await localDataSource.getFinancialPeriods();
      return Right(periodsData.map(_toEntity).toList());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, FinancialPeriodEntity>> getFinancialPeriodByCode(String periodCode) async {
    try {
      final periodData = await localDataSource.getFinancialPeriodByCode(periodCode);
      if (periodData == null) {
        return Left(NotFoundFailure(message: 'Financial period not found.'));
      }
      return Right(_toEntity(periodData));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> addFinancialPeriod(FinancialPeriodEntity period) async {
    final hasOverlap = await _checkPeriodOverlap(period.startDate, period.endDate);
    if (hasOverlap) {
      return Left(DataIntegrityFailure(message: 'New period overlaps with existing periods.'));
    }

    try {
      await localDataSource.addFinancialPeriod(_toCompanion(period));
      return const Right(null);
    } on DuplicateEntryException catch (e) {
      return Left(DuplicateEntryFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> updateFinancialPeriod(FinancialPeriodEntity period) async {
    // Business rule: Period dates cannot be modified if transactions exist.
    // TODO: Implement actual transaction check when transaction table is available.
    // if (await _hasTransactions(period.periodCode)) {
    //   return Left(DataIntegrityFailure(message: 'Cannot modify period dates with existing transactions.'));
    // }

    final hasOverlap = await _checkPeriodOverlap(period.startDate, period.endDate, excludePeriodCode: period.periodCode);
    if (hasOverlap) {
      return Left(DataIntegrityFailure(message: 'Updated period overlaps with other periods.'));
    }

    try {
      await localDataSource.updateFinancialPeriod(_toCompanion(period));
      return const Right(null);
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> toggleLockFinancialPeriod(String periodCode, bool isLocked) async {
    // Business rule: Cannot lock if transactions exist and are not finalized.
    // TODO: Implement actual transaction finalization check when transaction table is available.
    // if (!await _areTransactionsFinalized(periodCode)) {
    //   return Left(DataIntegrityFailure(message: 'Cannot lock period with unfinalized transactions.'));
    // }
    try {
      await localDataSource.lockFinancialPeriod(periodCode, isLocked);
      return const Right(null);
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(message: e.message));
    } on DataIntegrityException catch (e) {
      return Left(DataIntegrityFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFinancialPeriod(String periodCode) async {
    // Business rule: Cannot delete if transactions exist.
    // TODO: Implement actual transaction check when transaction table is available.
    // if (await _hasTransactions(periodCode)) {
    //   return Left(DataIntegrityFailure(message: 'Cannot delete period with existing transactions.'));
    // }
    try {
      await localDataSource.deleteFinancialPeriod(periodCode);
      return const Right(null);
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(message: e.message));
    } on DataIntegrityException catch (e) {
      return Left(DataIntegrityFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<bool> _checkPeriodOverlap(DateTime newStartDate, DateTime newEndDate, {String? excludePeriodCode}) async {
    final query = _database.select(_database.financialPeriods);

    if (excludePeriodCode != null) {
      query.where((tbl) => tbl.periodCode.isNotValue(excludePeriodCode));
    }

    final existingPeriods = await query.get();

    for (var period in existingPeriods) {
      final existingStartDate = DateTime.fromMillisecondsSinceEpoch(period.startDate);
      final existingEndDate = DateTime.fromMillisecondsSinceEpoch(period.endDate);

      if (newStartDate.isBefore(existingEndDate.add(const Duration(days: 1))) &&
          newEndDate.isAfter(existingStartDate.subtract(const Duration(days: 1)))) {
        return true;
      }
    }
    return false;
  }

  // Placeholder for actual transaction checks. These will require a dedicated transactions table.
  Future<bool> _hasTransactions(String periodCode) async {
    // This method would query the transactions table to see if any transactions
    // fall within the date range of the given financial period.
    // Example (conceptual):
    // final count = await (_database.transactions.filter(
    //   (t) => t.transactionDate.isBetween(period.startDate, period.endDate)
    // ).count().get();
    // return count > 0;
    return Future.value(false); // Currently, no transaction table, so always false
  }

  Future<bool> _areTransactionsFinalized(String periodCode) async {
    // This method would check if all transactions within the period are finalized.
    // This might involve a 'status' column in the transactions table.
    // Example (conceptual):
    // final unfinalizedCount = await (_database.transactions.filter(
    //   (t) => t.transactionDate.isBetween(period.startDate, period.endDate) &
    //          t.status.equals('unfinalized')
    // ).count().get();
    // return unfinalizedCount == 0;
    return Future.value(true); // Currently, no transaction table, so always true
  }
}
