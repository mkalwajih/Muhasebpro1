import 'package:drift/drift.dart';
import 'connection/shared.dart' as connection;

part 'app_database.g.dart';

@DriftDatabase(
  include: {
    // ORDER MATTERS: System first, then Finance, then Inventory
    'schemas/01_system.drift',
    'schemas/02_finance.drift',
    'schemas/03_inventory.drift',
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
  int get schemaVersion => 17; // Ensure version is incremented

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Reset DB on schema change for development safety
        await customStatement('PRAGMA foreign_keys = OFF');
        for (final entity in allSchemaEntities) {
          if (entity is TableInfo) {
            await m.deleteTable(entity.actualTableName);
          }
        }
        await m.createAll();
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}
