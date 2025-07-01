import 'package:drift/drift.dart';
// Import the platform-agnostic connection function
import 'connection/shared.dart' as connection;
// Import the table definitions
// FIX: DO NOT import the .drift.dart file. It doesn't exist.
// The 'part' directive below is what makes the generated code available.
part 'app_database.g.dart';
@DriftDatabase(
  // FIX: The `tables` list should not be const.
  tables: [
    Users,
  ],
  // This tells drift_dev where to find the .drift file to generate the tables from.
  // The path is relative to the project root for package URIs.
  include: {'package:muhaseb_pro/features/authentication/data/datasources/auth_tables.drift'},
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.connect());

  @override
  int get schemaVersion => 1;
}