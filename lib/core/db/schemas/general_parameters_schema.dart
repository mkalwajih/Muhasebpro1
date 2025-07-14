import 'package:drift/drift.dart';

class GeneralParameters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get appName => text().withLength(min: 1, max: 50)();
  TextColumn get dateFormat => text().withLength(min: 1, max: 20)();
  TextColumn get timeFormat => text().withLength(min: 1, max: 20)();
}
