import 'package:drift/drift.dart';

class TaxTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get calculationMethodId =>
      integer().references(TaxCalculationMethods, #id)();
}

class TaxBrackets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get typeId => integer().references(TaxTypes, #id)();
  RealColumn get fromAmount => real()();
  RealColumn get toAmount => real()();
  RealColumn get rate => real()();
}

class TaxCalculationMethods extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
}
