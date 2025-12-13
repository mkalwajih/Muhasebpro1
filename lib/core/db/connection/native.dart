import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

QueryExecutor connect() {
  return LazyDatabase(() async {
    applyWorkaroundToOpenSqlite3OnOldAndroidVersions();

    // Debug log for database connection initiation
    // ignore: avoid_print
    print('[AppDatabase] connect: getting application documents directory');

    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'muhasebpro.sqlite'));

    // Debug log before creating database in background
    // ignore: avoid_print
    print('[AppDatabase] connect: creating NativeDatabase (background) at ${file.path}');

    return NativeDatabase.createInBackground(file);
  });
}