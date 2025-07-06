import 'package:drift/drift.dart';
import 'connection/shared.dart' as connection;

part 'app_database.g.dart';

@DriftDatabase(
  include: {
    'schema.drift',
    'schemas/branches_schema.drift',
    'schemas/branch_groups_schema.drift',
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.connect());

  @override
  int get schemaVersion => 13; // Bumped version after fixing schema syntax

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        // We'll let drift handle all migrations from now on.
        // For major changes, a custom migration step might be needed,
        // but for now, letting drift recreate tables is safer.
        await m.createAll();
      },
    );
  }
}
