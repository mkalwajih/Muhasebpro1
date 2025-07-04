// lib/core/db/app_tables.dart

import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/permissions/app_permissions.dart';

// Authentication
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 6, max: 32)();
  TextColumn get passwordHash => text()(); // Changed from password to passwordHash
  TextColumn get fullNameAr => text()(); // Added
  TextColumn get fullNameEn => text()(); // Added
  TextColumn get email => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

// System Setup
class CompanyInfo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get website => text().nullable()();
  BlobColumn get logo => blob().nullable()();
  BoolColumn get isMainCompany => boolean().withDefault(const Constant(false))();
}

class Branches extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get companyId => integer().references(CompanyInfo, #id)();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
}

class FinancialPeriods extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  BoolColumn get isClosed => boolean().withDefault(const Constant(false))();
}

class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentId => integer().nullable().references(Accounts, #id)();
  TextColumn get accountCode => text()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  IntColumn get level => integer()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get nature => text()(); // Consider an enum
  TextColumn get reportType => text()(); // Consider an enum
  TextColumn get cashFlowType => text().nullable()(); // Consider an enum
  TextColumn get detailAccountType => text().nullable()();
}

class Roles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get description => text().nullable()();
}

class UserRoles extends Table {
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get roleId => integer().references(Roles, #id)();

  @override
  Set<Column> get primaryKey => {userId, roleId};
}

class RolePermissions extends Table {
  IntColumn get roleId => integer().references(Roles, #id)();
  TextColumn get permission => textEnum<AppPermission>()();

  @override
  Set<Column> get primaryKey => {roleId, permission};
}

class AuditLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get action => text()();
  TextColumn get details => text().nullable()();
}

class SystemConfig extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get key => text().unique()();
  TextColumn get value => text()();
}

// Geographical Data
class Zones extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

class Countries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get zoneId => integer().references(Zones, #id)();
  TextColumn get code => text()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  TextColumn get nationalityAr => text()();
  TextColumn get nationalityEn => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

class Governorates extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get countryId => integer().references(Countries, #id)();
  TextColumn get code => text()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

class Cities extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get govId => integer().references(Governorates, #id)();
  TextColumn get code => text()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

class Regions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cityId => integer().references(Cities, #id)();
  TextColumn get code => text()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}
