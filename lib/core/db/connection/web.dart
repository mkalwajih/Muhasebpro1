import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';

DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    final db = await WasmDatabase.open(
      databaseName: 'muhasebpro-db',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );

    if (db.missingFeatures.isNotEmpty) {
      debugPrint('Unsupported features: ${db.missingFeatures}');
    }

    // This is the crucial part. We need to create a temporary AppDatabase
    // instance to run the migrations.
    final tempDb = AppDatabase.forTesting(db.resolvedExecutor);
    await tempDb.customStatement('PRAGMA foreign_keys = ON;');
    await tempDb.close();

    return db.resolvedExecutor;
  }));
}
