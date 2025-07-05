import 'package:muhaseb_pro/core/db/app_database.dart';

abstract class GeneralParametersLocalDataSource {
  Future<SystemConfigData?> getGeneralParameters();
  Future<void> saveGeneralParameters(SystemConfigCompanion params);
}

class GeneralParametersLocalDataSourceImpl implements GeneralParametersLocalDataSource {
  final AppDatabase db;

  GeneralParametersLocalDataSourceImpl(this.db);

  @override
  Future<SystemConfigData?> getGeneralParameters() async {
    // Assuming there's always one row for system config, with ID 1 as default
    return (db.select(db.systemConfig)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();
  }

  @override
  Future<void> saveGeneralParameters(SystemConfigCompanion params) async {
    // Use insertOnConflictUpdate to ensure we always have one row (either insert or update)
    await db.into(db.systemConfig).insertOnConflictUpdate(params);
  }
}
