import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart'; // This will be generated

// Define the Users table
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().unique()();
  TextColumn get passwordHash => text()();
  TextColumn get fullNameEn => text()();
  TextColumn get fullNameAr => text()();
  TextColumn get email => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('Active'))();
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
    return NativeDatabase(file);
  });
}