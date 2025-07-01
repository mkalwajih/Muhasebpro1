import 'package:drift/drift.dart';
import 'connection/shared.dart' as connection;

part 'app_database.g.dart';

@DriftDatabase(
  include: {
    'package:muhaseb_pro/features/authentication/data/datasources/auth_tables.drift',
    'package:muhaseb_pro/features/system_setup/data/datasources/system_setup_tables.drift'
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.connect());

  @override
  int get schemaVersion => 1;
}
