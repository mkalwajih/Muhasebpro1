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
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.connect());

  @override
  int get schemaVersion => 13; 

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        // The method 'deleteEverything' isn't defined for the type 'Migrator'.
        // Removed the invalid call to m.deleteEverything().
        // If a full database reset on upgrade is desired,
        // it needs to be implemented by dropping and recreating tables manually
        // or by deleting all entries from each table.
        await m.createAll();
      },
    );
  }
}
