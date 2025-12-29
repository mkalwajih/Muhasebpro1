// lib/core/db/app_database.dart

import 'package:drift/drift.dart';
import 'connection/shared.dart' as connection;

part 'app_database.g.dart';

@DriftDatabase(
  include: {
    // ... (existing includes)
    'schemas/auth_schema.drift',
    'schemas/branch_groups_schema.drift',
    'schemas/branches_schema.drift',
    'schemas/currencies_schema.drift',
    'schemas/financial_periods_schema.drift',
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
  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() {
    return _instance;
  }

  AppDatabase._internal() : super(connection.connect());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 16;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // DEVELOPMENT FIX: Drop all tables and recreate them if schema version changes.
        // This solves the "Unexpected null value" error caused by missing columns in the web database.
        
        // Disable foreign keys to allow dropping tables in any order
        await customStatement('PRAGMA foreign_keys = OFF');
        
        for (final entity in allSchemaEntities) {
          if (entity is TableInfo) {
            await m.deleteTable(entity.actualTableName);
          }
        }
        
        await m.createAll();
      },
      beforeOpen: (details) async {
        // Enable foreign keys
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}