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

    // Initialize Schema/Pragmas without closing the executor
    final tempDb = AppDatabase.forTesting(db.resolvedExecutor);
    await tempDb.customStatement('PRAGMA foreign_keys = ON;');
    
    // CRITICAL FIX: Do NOT close tempDb here. 
    // await tempDb.close(); <--- This line caused the "connection closed" error.

    return db.resolvedExecutor;
  }));
}
