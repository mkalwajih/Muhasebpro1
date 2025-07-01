import 'package:drift/drift.dart';
import 'connection/shared.dart' as connection;

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    CompanyInfo, // CRITICAL FIX: Add the missing table class
    Accounts,    // Add the new table class
  ],
  include: {
    'package:muhaseb_pro/features/authentication/data/datasources/auth_tables.drift',
    'package:muhaseb_pro/features/system_setup/data/datasources/system_setup_tables.drift'
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.connect());

  // Bump the schema version because we added a new table.
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          // We added the accounts table in version 2
          await m.createTable(accounts);
        }
      },
    );
  }
}
