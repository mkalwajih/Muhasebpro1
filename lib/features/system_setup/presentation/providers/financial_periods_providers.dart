import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/financial_periods_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/financial_periods_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/financial_periods_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/add_financial_period_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/delete_financial_period_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/generate_financial_periods_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_financial_periods_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/lock_financial_period_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/update_financial_period_usecase.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/financial_period_entity.dart';

// --- Datasource Provider ---
final financialPeriodsLocalDataSourceProvider = Provider<FinancialPeriodsLocalDataSource>((ref) {
  final db = ref.read(appDatabaseProvider);
  return FinancialPeriodsLocalDataSourceImpl(db);
});

// --- Repository Provider ---
final financialPeriodsRepositoryProvider = Provider<FinancialPeriodsRepository>((ref) {
  final localDataSource = ref.read(financialPeriodsLocalDataSourceProvider);
  final db = ref.read(appDatabaseProvider); // Pass AppDatabase for direct queries if needed in repo
  return FinancialPeriodsRepositoryImpl(localDataSource, db);
});

// --- Use Case Providers ---
final getFinancialPeriodsUseCaseProvider = Provider<GetFinancialPeriodsUseCase>((ref) {
  final repo = ref.read(financialPeriodsRepositoryProvider);
  return GetFinancialPeriodsUseCase(repo);
});

final addFinancialPeriodUseCaseProvider = Provider<AddFinancialPeriodUseCase>((ref) {
  final repo = ref.read(financialPeriodsRepositoryProvider);
  return AddFinancialPeriodUseCase(repo);
});

final updateFinancialPeriodUseCaseProvider = Provider<UpdateFinancialPeriodUseCase>((ref) {
  final repo = ref.read(financialPeriodsRepositoryProvider);
  return UpdateFinancialPeriodUseCase(repo);
});

final toggleLockFinancialPeriodUseCaseProvider = Provider<ToggleLockFinancialPeriodUseCase>((ref) {
  final repo = ref.read(financialPeriodsRepositoryProvider);
  return ToggleLockFinancialPeriodUseCase(repo);
});

final generateFinancialPeriodsUseCaseProvider = Provider<GenerateFinancialPeriodsUseCase>((ref) {
  final repo = ref.read(financialPeriodsRepositoryProvider);
  return GenerateFinancialPeriodsUseCase(repo);
});

final deleteFinancialPeriodUseCaseProvider = Provider<DeleteFinancialPeriodUseCase>((ref) {
  final repo = ref.read(financialPeriodsRepositoryProvider);
  return DeleteFinancialPeriodUseCase(repo);
});

// --- UI State Notifier Provider ---
final financialPeriodsProvider = StateNotifierProvider<FinancialPeriodsNotifier, AsyncValue<List<FinancialPeriodEntity>>>((ref) {
  return FinancialPeriodsNotifier(
    ref.read(getFinancialPeriodsUseCaseProvider),
    ref.read(addFinancialPeriodUseCaseProvider),
    ref.read(updateFinancialPeriodUseCaseProvider),
    ref.read(toggleLockFinancialPeriodUseCaseProvider),
    ref.read(generateFinancialPeriodsUseCaseProvider),
    ref.read(deleteFinancialPeriodUseCaseProvider),
  );
});

class FinancialPeriodsNotifier extends StateNotifier<AsyncValue<List<FinancialPeriodEntity>>> {
  final GetFinancialPeriodsUseCase _getFinancialPeriods;
  final AddFinancialPeriodUseCase _addFinancialPeriod;
  final UpdateFinancialPeriodUseCase _updateFinancialPeriod;
  final ToggleLockFinancialPeriodUseCase _toggleLockFinancialPeriod;
  final GenerateFinancialPeriodsUseCase _generateFinancialPeriods;
  final DeleteFinancialPeriodUseCase _deleteFinancialPeriod;

  FinancialPeriodsNotifier(
    this._getFinancialPeriods,
    this._addFinancialPeriod,
    this._updateFinancialPeriod,
    this._toggleLockFinancialPeriod,
    this._generateFinancialPeriods,
    this._deleteFinancialPeriod,
  ) : super(const AsyncValue.loading()) {
    loadPeriods(); // Initial load
  }

  Future<void> loadPeriods() async {
    state = const AsyncValue.loading();
    final result = await _getFinancialPeriods(const NoParams());
    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (periods) => AsyncValue.data(periods),
    );
  }

  Future<Either<Failure, void>> addFinancialPeriod(FinancialPeriodEntity period) async {
    state = const AsyncValue.loading(); // Show loading while adding
    final result = await _addFinancialPeriod(period);
    await loadPeriods(); // Reload data after successful add
    return result;
  }

  Future<Either<Failure, void>> updateFinancialPeriod(FinancialPeriodEntity period) async {
    state = const AsyncValue.loading(); // Show loading while updating
    final result = await _updateFinancialPeriod(period);
    await loadPeriods(); // Reload data after successful update
    return result;
  }

  Future<Either<Failure, void>> toggleLockFinancialPeriod(int id, bool isLocked) async {
    state = const AsyncValue.loading(); // Show loading while toggling lock
    // Find the periodCode using the id. This is a temporary solution.
    // In a real app, you might pass the periodCode directly or retrieve it more efficiently.
    final currentPeriods = state.value;
    final period = currentPeriods?.firstWhere((p) => p.id == id);
    
    if (period == null) {
      // Handle case where period is not found locally (shouldn't happen if UI is synced)
      return Left(NotFoundFailure(message: 'Period not found for locking/unlocking.'));
    }

    final result = await _toggleLockFinancialPeriod(ToggleLockFinancialPeriodParams(periodCode: period.periodCode, isLocked: isLocked));
    await loadPeriods(); // Reload data after successful toggle
    return result;
  }

  Future<Either<Failure, void>> generateFinancialPeriods(int startYear, int numberOfYears) async {
    state = const AsyncValue.loading(); // Show loading during generation
    final params = GenerateFinancialPeriodsParams(
      startYear: startYear,
      numberOfYears: numberOfYears,
    );
    final result = await _generateFinancialPeriods(params);
    await loadPeriods(); // Reload data after successful generation
    return result;
  }

  Future<Either<Failure, void>> deleteFinancialPeriod(String periodCode) async {
    state = const AsyncValue.loading(); // Show loading while deleting
    final result = await _deleteFinancialPeriod(periodCode);
    await loadPeriods(); // Reload data after successful delete
    return result;
  }
}
