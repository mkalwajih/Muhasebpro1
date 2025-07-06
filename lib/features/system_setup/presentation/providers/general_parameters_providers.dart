import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/core/di/database_provider.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/general_parameters_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/general_parameters_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/general_parameters_repository.dart';


// Provider for the local data source
final generalParametersLocalDataSourceProvider = Provider<GeneralParametersLocalDataSource>(
  (ref) => GeneralParametersLocalDataSourceImpl(ref.read(appDatabaseProvider)),
);

// Provider for the repository
final generalParametersRepositoryProvider = Provider<GeneralParametersRepository>(
  (ref) => GeneralParametersRepositoryImpl(ref.read(generalParametersLocalDataSourceProvider), ref.read(appDatabaseProvider)),
);

// StateNotifierProvider for managing GeneralParametersEntity
final generalParametersProvider = StateNotifierProvider<GeneralParametersNotifier, AsyncValue<GeneralParametersEntity>>(
  (ref) => GeneralParametersNotifier(ref.read(generalParametersRepositoryProvider)),
);

class GeneralParametersNotifier extends StateNotifier<AsyncValue<GeneralParametersEntity>> {
  final GeneralParametersRepository _repository;

  GeneralParametersNotifier(this._repository) : super(const AsyncValue.loading()) {
    _loadGeneralParameters();
  }

  Future<void> _loadGeneralParameters() async {
    try {
      final params = await _repository.getGeneralParameters();
      state = AsyncValue.data(params);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> saveGeneralParameters(GeneralParametersEntity params) async {
    state = const AsyncValue.loading(); // Show loading state during save
    try {
      await _repository.saveGeneralParameters(params);
      state = AsyncValue.data(params); // Update with the saved data
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  // Method to reset to defaults
  Future<void> resetToDefaults() async {
    state = const AsyncValue.loading();
    try {
      await _repository.saveGeneralParameters(GeneralParametersEntity.defaults());
      state = AsyncValue.data(GeneralParametersEntity.defaults());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
