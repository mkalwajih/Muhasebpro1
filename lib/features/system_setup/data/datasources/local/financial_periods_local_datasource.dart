import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';

abstract class FinancialPeriodsLocalDataSource {
  Future<List<FinancialPeriod>> getFinancialPeriods();
  Future<FinancialPeriod?> getFinancialPeriodByCode(String periodCode);
  Future<void> addFinancialPeriod(FinancialPeriodsCompanion period);
  Future<void> updateFinancialPeriod(FinancialPeriodsCompanion period);
  Future<void> lockFinancialPeriod(String periodCode, bool isLocked);
  Future<void> deleteFinancialPeriod(String periodCode);
}

class FinancialPeriodsLocalDataSourceImpl implements FinancialPeriodsLocalDataSource {
  final AppDatabase db;

  FinancialPeriodsLocalDataSourceImpl(this.db);

  @override
  Future<List<FinancialPeriod>> getFinancialPeriods() async {
    return await db.select(db.financialPeriods).get();
  }

  @override
  Future<FinancialPeriod?> getFinancialPeriodByCode(String periodCode) async {
    return await (db.select(db.financialPeriods)..where((tbl) => tbl.periodCode.equals(periodCode))).getSingleOrNull();
  }

  @override
  Future<void> addFinancialPeriod(FinancialPeriodsCompanion period) async {
    try {
      await db.into(db.financialPeriods).insert(period);
    } catch (e) {
      if (e.toString().contains('UNIQUE constraint')) {
        throw DuplicateEntryException(message: 'Financial period with this code already exists.');
      }
      throw CacheException(message: 'Error adding financial period: ${e.toString()}');
    }
  }

  @override
  Future<void> updateFinancialPeriod(FinancialPeriodsCompanion period) async {
    final existingPeriod = await getFinancialPeriodByCode(period.periodCode.value);
    if (existingPeriod == null) {
      throw NotFoundException(message: 'Financial period not found.');
    }

    try {
      final rowsAffected = await (db.update(db.financialPeriods)..where((t) => t.id.equals(existingPeriod.id))).write(period);
      if (rowsAffected == 0) {
        throw CacheException(message: 'No rows affected during update. Period might not exist.');
      }
    } catch (e) {
      throw CacheException(message: 'Error updating financial period: ${e.toString()}');
    }
  }

  @override
  Future<void> lockFinancialPeriod(String periodCode, bool isLocked) async {
    final period = await getFinancialPeriodByCode(periodCode);
    if (period == null) {
      throw NotFoundException(message: 'Financial period not found.');
    }
    if (period.isLocked == isLocked) {
      throw DataIntegrityException(message: isLocked ? 'Period is already locked.' : 'Period is already unlocked.');
    }

    try {
      await (db.update(db.financialPeriods)..where((tbl) => tbl.periodCode.equals(periodCode)))
          .write(FinancialPeriodsCompanion(isLocked: Value(isLocked)));
    } catch (e) {
      throw CacheException(message: 'Error locking financial period: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteFinancialPeriod(String periodCode) async {
    final period = await getFinancialPeriodByCode(periodCode);
    if (period == null) {
      throw NotFoundException(message: 'Financial period not found.');
    }
    if (period.isLocked) {
      throw DataIntegrityException(message: 'Cannot delete a locked period.');
    }

    try {
      final rowsAffected = await (db.delete(db.financialPeriods)..where((tbl) => tbl.periodCode.equals(periodCode))).go();
      if (rowsAffected == 0) {
        throw CacheException(message: 'No rows affected during delete. Period might not exist.');
      }
    } catch (e) {
      throw CacheException(message: 'Error deleting financial period: ${e.toString()}');
    }
  }
}
