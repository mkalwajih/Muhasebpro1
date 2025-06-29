import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// Define the Users table directly in this file
@DataClassName('User')
class Users extends Table {
  IntColumn get userId => integer().autoIncrement()();
  TextColumn get username => text().unique()();
  TextColumn get passwordHash => text()();
  TextColumn get fullNameAr => text()();
  TextColumn get fullNameEn => text()();
  TextColumn get email => text().nullable()();
  IntColumn get assignedBranchId => integer().nullable()();
  IntColumn get employeeId => integer().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'muhasebpro.sqlite'));
    // For debugging, you can log the path: print('Database file path: ${file.path}');
    return NativeDatabase.createInBackground(file);
  });
}