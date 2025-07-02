import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';

abstract class GeneralParametersRepository {
  Future<GeneralParametersEntity> getGeneralParameters();
  Future<void> saveGeneralParameters(GeneralParametersEntity params);
}
