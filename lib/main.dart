import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/app/app.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';

void main() async {
  // 1. Initialize Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Create the Provider Container
  final container = ProviderContainer();

  // Run the app immediately to avoid blocking the UI thread on Android.
  // Perform seeding in the background to prevent ANR if seeding takes time.
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );

  // Seed the initial admin user if the database is empty (async, don't await)
  container.read(seedUserUseCaseProvider).call().timeout(const Duration(seconds: 10), onTimeout: () {
    // ignore: avoid_print
    print('[SeedUser] timeout after 10 seconds');
  }).then((_) {
    // Optional: Debug log - remove or replace with logger if needed.
    // ignore: avoid_print
    print('[SeedUser] completed');
  }).catchError((e, st) {
    // ignore: avoid_print
    print('[SeedUser] failed: $e');
  });
}
