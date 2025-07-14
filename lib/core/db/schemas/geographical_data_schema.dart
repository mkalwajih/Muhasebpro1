import 'package:drift/drift.dart';

class GeographicalData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get parentId => integer().nullable().references(GeographicalData, #id)();
  IntColumn get level => integer()();
}
