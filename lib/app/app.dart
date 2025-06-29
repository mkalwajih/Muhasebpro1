import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/core/config/app_router.dart'; // Import the router
import 'package:muhaseb_pro/core/theme/app_theme.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // <-- COMMENT THIS OUT

// Change to a ConsumerWidget
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the router provider
    final router = ref.watch(routerProvider);

    // Change from MaterialApp to MaterialApp.router
    return MaterialApp.router(
      title: 'MuhasebPro',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // -- TEMPORARILY COMMENT OUT THE 3 LINES BELOW --
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      // locale: const Locale('en'),

      // Router Configuration
      routerConfig: router,
    );
  }
}