import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

import 'package:flutter/foundation.dart';

QueryExecutor connect() {
  // This is the implementation for the web using WASM
  return DatabaseConnection.delayed(Future(() async {
    final result = await WasmDatabase.open(
      databaseName: 'muhasebpro-db', // Your database name
      sqlite3Uri: Uri.parse('sqlite3.wasm'), // Path to the wasm file
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      if (kDebugMode) {
        print('Using ${result.chosenImplementation} due to missing browser features: ${result.missingFeatures}');
      }
    }

    return result.resolvedExecutor;
  }));
}