import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/app/app.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart'; // Import Slang

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Slang
  LocaleSettings.useDeviceLocale(); 

  final container = ProviderContainer();

  runApp(
    UncontrolledProviderScope(
      container: container,
      // Wrap with TranslationProvider for reactive locale changes
      child: TranslationProvider(
        child: const App(),
      ),
    ),
  );

  // Seed user logic...
  container.read(seedUserUseCaseProvider).call().catchError((e) => print(e));
}
