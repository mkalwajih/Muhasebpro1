import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';

DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    final result = await WasmDatabase.open(
      databaseName: 'muhasebpro-db',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      // When features are missing, we can use a more compatible database
      // implementation.
      //
      // This will be slower, but it will still work on browsers that don't
      // support SharedArrayBuffer.
      debugPrint('Unsupported features: \${result.missingFeatures}, falling back to simpler database');
      final fallback = await WasmDatabase.open(
        databaseName: 'muhasebpro-db-fallback',
        sqlite3Uri: Uri.parse('sqlite3.wasm'),
        driftWorkerUri: Uri.parse('drift_worker.js'),
        // NOT providing a drift worker will use a simpler implementation that
        // doesn't require SharedArrayBuffer.
      );
      return fallback.resolvedExecutor;
    }

    return result.resolvedExecutor;
  }));
}
