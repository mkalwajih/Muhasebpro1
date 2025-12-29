import 'dart:async';
import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';

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

    // Return the executor directly. 
    // We will handle PRAGMA settings in the AppDatabase class itself.
    return db.resolvedExecutor;
  }));
}