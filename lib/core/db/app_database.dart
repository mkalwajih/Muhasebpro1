import 'package:drift/drift.dart';
import 'connection/shared.dart' as connection;
import 'package:muhaseb_pro/core/permissions/app_permissions.dart';
import 'package:muhaseb_pro/core/db/app_tables.dart';

part 'app_database.g.dart';

// Type converter for the AppPermission enum
class AppPermissionConverter extends TypeConverter<AppPermission, String> {
  const AppPermissionConverter();
  @override
  AppPermission fromSql(String fromDb) {
    return AppPermission.values.byName(fromDb);
  }

  @override
  String toSql(AppPermission value) {
    return value.name;
  }
}


@DriftDatabase(
  tables: [
    // Authentication
    Users,
    
    // System Setup
    CompanyInfo,
    Branches,
    FinancialPeriods,
    Accounts,
    Roles,
    UserRoles,
    RolePermissions,
    AuditLog,
    SystemConfig, // Added here

    // Geographical Data
    Zones,
    Countries,
    Governorates,
    Cities,
    Regions
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.connect());

  @override
  int get schemaVersion => 7; // Bump version for the new geo tables

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        // Your existing migrations
        if (from < 2) {
          await m.createTable(accounts);
        }
        if (from < 3) {
          await m.createTable(roles);
        }
        if (from < 4) {
          await m.createTable(userRoles);
        }
        if (from < 5) {
          await m.createTable(rolePermissions);
        }
        if (from < 6) {
           // Correctly create the systemConfig table during migration
           await m.createTable(systemConfig);
        }
        // Add migration for version 7
        if (from < 7) {
          await m.createTable(zones);
          await m.createTable(countries);
          await m.createTable(governorates);
          await m.createTable(cities);
          await m.createTable(regions);
        }
      },
    );
  }
}
