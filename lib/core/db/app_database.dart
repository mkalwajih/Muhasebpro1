import 'package:drift/drift.dart';
import 'connection/shared.dart' as connection;

part 'app_database.g.dart';

@DriftDatabase(
  include: {
    'schemas/auth_schema.drift',
    'schemas/branch_groups_schema.drift',
    'schemas/branches_schema.drift',
    'schemas/currencies_schema.drift',
    'schemas/general_parameters_schema.drift',
    'schemas/geographical_data_schema.drift',
    'schemas/system_setup_schema.drift',
    'schemas/tax_schema.drift',
    'schemas/chart_of_accounts_schema.drift',
    // The main schema.drift file now imports financial_periods_schema.drift
    // so no direct include is needed here. This file is correct.
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.connect());

  @override
  int get schemaVersion => 14; // Incremented schema version

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        await m.createAll();
      },
    );
  }
}