import 'package:drift/drift.dart';
import 'connection/shared.dart' as connection;
import 'package:muhaseb_pro/core/permissions/app_permissions.dart';

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
    Users,
    CompanyInfo,
    Accounts,
    Roles,
    UserRoles,
    // RolePermissions, // This was the line that caused the duplicate definition when also in .drift file
  ],
  include: {
    'package:muhaseb_pro/features/authentication/data/datasources/auth_tables.drift',
    'package:muhaseb_pro/features/system_setup/data/datasources/system_setup_tables.drift',
    'package:muhaseb_pro/features/system_setup/data/datasources/general_parameters_tables.drift'
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.connect());

  @override
  int get schemaVersion => 6; // Bump version

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
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
           // We added the role_permissions table in version 5
          await m.createTable(rolePermissions);
        }
        if (from < 6) {
          await m.createTable(systemConfig);
        }
      },
    );
  }
}
