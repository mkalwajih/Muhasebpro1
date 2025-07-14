import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/schemas/auth_schema.dart';
import 'package:muhaseb_pro/core/db/schemas/branch_groups_schema.dart';
import 'package:muhaseb_pro/core/db/schemas/branches_schema.dart';
import 'package:muhaseb_pro/core/db/schemas/currencies_schema.dart';
import 'package:muhaseb_pro/core/db/schemas/general_parameters_schema.dart';
import 'package:muhaseb_pro/core/db/schemas/geographical_data_schema.dart';
import 'package:muhaseb_pro/core/db/schemas/system_setup_schema.dart';
import 'package:muhaseb_pro/core/db/schemas/tax_schema.dart';
import 'connection/shared.dart' as connection;

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Roles,
    Permissions,
    RolePermissions,
    BranchGroups,
    Branches,
    Currencies,
    GeneralParameters,
    GeographicalData,
    ChartOfAccounts,
    TaxTypes,
    TaxBrackets,
    TaxCalculationMethods,
    SystemSetup
  ],
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
        await m.createAll();
      },
    );
  }
}
