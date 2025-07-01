import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/app/app.dart';

import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';

void main() async {
  // Ensure widgets are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  
  // Create a provider container to use providers outside the widget tree
  final container = ProviderContainer();

  // Seed the initial admin user if the database is empty
  await container.read(seedUserUseCaseProvider).call();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}