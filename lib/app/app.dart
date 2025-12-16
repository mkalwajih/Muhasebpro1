import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/core/config/app_router.dart';
import 'package:muhaseb_pro/core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/l10n/locale_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: locale.languageCode == 'ar'
          ? AppTheme.lightTheme.copyWith(
              textTheme: AppTheme.lightTheme.textTheme.apply(fontFamily: 'NotoNaskhArabic'),
            )
          : AppTheme.lightTheme,
      darkTheme: locale.languageCode == 'ar'
          ? AppTheme.darkTheme.copyWith(
              textTheme: AppTheme.darkTheme.textTheme.apply(fontFamily: 'NotoNaskhArabic'),
            )
          : AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
