import 'package:drift/drift.dart';
import 'connection/shared.dart' as connection;

part 'app_database.g.dart';

@DriftDatabase(
  include: {
    // System Setup
    'schemas/system_setup/geographical_data.drift',
    'schemas/system_setup/companies.drift',
    'schemas/system_setup/branch_groups.drift',
    'schemas/system_setup/branches.drift',
    'schemas/system_setup/financial_periods.drift',
    'schemas/system_setup/currencies.drift',
    'schemas/system_setup/general_parameters.drift',
    'schemas/system_setup/taxes.drift',

    // Auth
    'schemas/auth/users.drift',

    // General Ledger
    'schemas/general_ledger/chart_of_accounts.drift',
    'schemas/general_ledger/journal_vouchers.drift',
    'schemas/general_ledger/transaction_requests.drift',
    'schemas/general_ledger/cash_bank.drift',
    'schemas/general_ledger/posting_batches.drift',

    // Inventory
    'schemas/inventory/inventory_config.drift',
    'schemas/inventory/item_groups.drift',
    'schemas/inventory/warehouses.drift',
    'schemas/inventory/items.drift',
    'schemas/inventory/stock_operations.drift',
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
  int get schemaVersion => 18; 

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
