import 'package:drift/drift.dart';

class Currencies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get symbol => text().withLength(min: 1, max: 5)();
  RealColumn get exchangeRate => real()();
  BoolColumn get isBaseCurrency => boolean().withDefault(const Constant(false))();
}
