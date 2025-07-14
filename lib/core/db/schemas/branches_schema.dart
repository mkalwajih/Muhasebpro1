import 'package:drift/drift.dart';

class Branches extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get groupId => integer().references(BranchGroups, #id)();
}
