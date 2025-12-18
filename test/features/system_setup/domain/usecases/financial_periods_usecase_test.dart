import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/financial_period_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/financial_periods_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/add_financial_period_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/delete_financial_period_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/generate_financial_periods_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_financial_periods_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/lock_financial_period_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/update_financial_period_usecase.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

import 'financial_periods_usecase_test.mocks.dart';

@GenerateMocks([FinancialPeriodsRepository])
void main() {
  late MockFinancialPeriodsRepository mockRepository;
  late GetFinancialPeriodsUseCase getFinancialPeriodsUseCase;
  late AddFinancialPeriodUseCase addFinancialPeriodUseCase;
  late UpdateFinancialPeriodUseCase updateFinancialPeriodUseCase;
  late ToggleLockFinancialPeriodUseCase toggleLockFinancialPeriodUseCase;
  late GenerateFinancialPeriodsUseCase generateFinancialPeriodsUseCase;
  late DeleteFinancialPeriodUseCase deleteFinancialPeriodUseCase;

  setUp(() {
    mockRepository = MockFinancialPeriodsRepository();
    getFinancialPeriodsUseCase = GetFinancialPeriodsUseCase(mockRepository);
    addFinancialPeriodUseCase = AddFinancialPeriodUseCase(mockRepository);
    updateFinancialPeriodUseCase = UpdateFinancialPeriodUseCase(mockRepository);
    toggleLockFinancialPeriodUseCase = ToggleLockFinancialPeriodUseCase(mockRepository);
    generateFinancialPeriodsUseCase = GenerateFinancialPeriodsUseCase(mockRepository);
    deleteFinancialPeriodUseCase = DeleteFinancialPeriodUseCase(mockRepository);
  });

  final tFinancialPeriod = FinancialPeriodEntity(
    id: 1,
    periodCode: '2023-M01',
    fiscalYear: 2023,
    periodType: 'Monthly',
    periodNumber: 1,
    startDate: DateTime(2023, 1, 1),
    endDate: DateTime(2023, 1, 31),
    isLocked: false,
  );

  group('GetFinancialPeriodsUseCase', () {
    test('should get list of financial periods from the repository', () async {
      when(mockRepository.getFinancialPeriods())
          .thenAnswer((_) async => Right([tFinancialPeriod]));

      final result = await getFinancialPeriodsUseCase(const NoParams());

      expect(result, Right([tFinancialPeriod]));
      verify(mockRepository.getFinancialPeriods());
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when getting financial periods fails', () async {
      when(mockRepository.getFinancialPeriods())
          .thenAnswer((_) async => Left(ServerFailure(message: 'Server Error')));

      final result = await getFinancialPeriodsUseCase(const NoParams());

      expect(result, Left(ServerFailure(message: 'Server Error')));
      verify(mockRepository.getFinancialPeriods());
      verifyNoMoreInteractions(mockRepository);
    });
  });

  group('AddFinancialPeriodUseCase', () {
    test('should add a financial period to the repository', () async {
      when(mockRepository.addFinancialPeriod(tFinancialPeriod))
          .thenAnswer((_) async => const Right(null));

      final result = await addFinancialPeriodUseCase(tFinancialPeriod);

      expect(result, const Right(null));
      verify(mockRepository.addFinancialPeriod(tFinancialPeriod));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when adding a financial period fails', () async {
      when(mockRepository.addFinancialPeriod(tFinancialPeriod))
          .thenAnswer((_) async => Left(DataIntegrityFailure(message: 'Overlap')));

      final result = await addFinancialPeriodUseCase(tFinancialPeriod);

      expect(result, Left(DataIntegrityFailure(message: 'Overlap')));
      verify(mockRepository.addFinancialPeriod(tFinancialPeriod));
      verifyNoMoreInteractions(mockRepository);
    });
  });

  group('UpdateFinancialPeriodUseCase', () {
    test('should update a financial period in the repository', () async {
      when(mockRepository.updateFinancialPeriod(tFinancialPeriod))
          .thenAnswer((_) async => const Right(null));

      final result = await updateFinancialPeriodUseCase(tFinancialPeriod);

      expect(result, const Right(null));
      verify(mockRepository.updateFinancialPeriod(tFinancialPeriod));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when updating a financial period fails', () async {
      when(mockRepository.updateFinancialPeriod(tFinancialPeriod))
          .thenAnswer((_) async => Left(NotFoundFailure(message: 'Not Found')));

      final result = await updateFinancialPeriodUseCase(tFinancialPeriod);

      expect(result, Left(NotFoundFailure(message: 'Not Found')));
      verify(mockRepository.updateFinancialPeriod(tFinancialPeriod));
      verifyNoMoreInteractions(mockRepository);
    });
  });

  group('ToggleLockFinancialPeriodUseCase', () {
    test('should lock a financial period', () async {
      when(mockRepository.toggleLockFinancialPeriod('2023-M01', true))
          .thenAnswer((_) async => const Right(null));

      final result = await toggleLockFinancialPeriodUseCase(
          ToggleLockFinancialPeriodParams(periodCode: '2023-M01', isLocked: true));

      expect(result, const Right(null));
      verify(mockRepository.toggleLockFinancialPeriod('2023-M01', true));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should unlock a financial period', () async {
      when(mockRepository.toggleLockFinancialPeriod('2023-M01', false))
          .thenAnswer((_) async => const Right(null));

      final result = await toggleLockFinancialPeriodUseCase(
          ToggleLockFinancialPeriodParams(periodCode: '2023-M01', isLocked: false));

      expect(result, const Right(null));
      verify(mockRepository.toggleLockFinancialPeriod('2023-M01', false));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when toggling lock fails', () async {
      when(mockRepository.toggleLockFinancialPeriod('2023-M01', true))
          .thenAnswer((_) async => Left(DataIntegrityFailure(message: 'Locked')));

      final result = await toggleLockFinancialPeriodUseCase(
          ToggleLockFinancialPeriodParams(periodCode: '2023-M01', isLocked: true));

      expect(result, Left(DataIntegrityFailure(message: 'Locked')));
      verify(mockRepository.toggleLockFinancialPeriod('2023-M01', true));
      verifyNoMoreInteractions(mockRepository);
    });
  });

  group('GenerateFinancialPeriodsUseCase', () {
    test('should generate and add financial periods to the repository', () async {
      final params = GenerateFinancialPeriodsParams(startYear: 2024, numberOfYears: 1);

      when(mockRepository.addFinancialPeriod(any)).thenAnswer((_) async => const Right(null));

      final result = await generateFinancialPeriodsUseCase(params);

      expect(result, const Right(null));
      verify(mockRepository.addFinancialPeriod(any)).called(12); // Assuming 12 months for 1 year
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure if any period addition fails during generation', () async {
      final params = GenerateFinancialPeriodsParams(startYear: 2024, numberOfYears: 1);

      when(mockRepository.addFinancialPeriod(any))
          .thenAnswer((_) async => Left(DuplicateEntryFailure(message: 'Duplicate')));

      final result = await generateFinancialPeriodsUseCase(params);

      expect(result, Left(DuplicateEntryFailure(message: 'Duplicate')));
      verify(mockRepository.addFinancialPeriod(any)); // Should be called at least once
      verifyNoMoreInteractions(mockRepository);
    });
  });

  group('DeleteFinancialPeriodUseCase', () {
    test('should delete a financial period from the repository', () async {
      when(mockRepository.deleteFinancialPeriod('2023-M01'))
          .thenAnswer((_) async => const Right(null));

      final result = await deleteFinancialPeriodUseCase('2023-M01');

      expect(result, const Right(null));
      verify(mockRepository.deleteFinancialPeriod('2023-M01'));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when deleting a financial period fails', () async {
      when(mockRepository.deleteFinancialPeriod('2023-M01'))
          .thenAnswer((_) async => Left(DataIntegrityFailure(message: 'Has Transactions')));

      final result = await deleteFinancialPeriodUseCase('2023-M01');

      expect(result, Left(DataIntegrityFailure(message: 'Has Transactions')));
      verify(mockRepository.deleteFinancialPeriod('2023-M01'));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
