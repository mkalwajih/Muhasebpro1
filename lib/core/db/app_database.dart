import 'package:drift/drift.dart';
import 'connection/shared.dart' as connection;

part 'app_database.g.dart';

@DriftDatabase(
  include: {
    'schemas/auth_schema.drift',
    'schemas/branch_groups_schema.drift',
    'schemas/branches_schema.drift',
    'schemas/currencies_schema.drift',
    'schemas/financial_periods_schema.drift', // Explicitly included now
    'schemas/general_parameters_schema.drift',
    'schemas/geographical_data_schema.drift',
    'schemas/system_setup_schema.drift',
    'schemas/tax_schema.drift',
    'schemas/chart_of_accounts_schema.drift',
    'schemas/gl_setup_schema.drift',
    'schemas/inventory_schema.drift',
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.connect());

  // New constructor for testing and web migration
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 16; // Incremented for Inventory schema

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        // CRITICAL FIX: Removed 'await m.createAll();' from onUpgrade.
        // This function must contain specific migration steps (e.g., m.addColumn)
        // for each schema version change (from -> to) to prevent data loss.
        // The current implementation is a placeholder for future specific migrations.
      },
    );
  }
}