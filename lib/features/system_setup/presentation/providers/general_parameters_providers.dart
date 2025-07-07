import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/general_parameters_repository.dart';

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
