import 'package:drift/drift.dart';

class ChartOfAccounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get code => text().withLength(min: 1, max: 20)();
  IntColumn get parentId => integer().nullable().references(ChartOfAccounts, #id)();
  IntColumn get level => integer()();
  BoolColumn get isHeader => boolean()();
}

class SystemSetup extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isConfigured => boolean().withDefault(const Constant(false))();
}
