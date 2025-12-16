import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/login_screen.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/login_form.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

void main() {
  testWidgets('LoginForm shows loading and calls login', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: LoginScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );

    // Verify that the login form is displayed.
    expect(find.byType(LoginForm), findsOneWidget);

    // Enter username and password.
    await tester.enterText(find.byKey(const Key('username_field')), 'admin');
    await tester.enterText(find.byKey(const Key('password_field')), '123456');

    // Tap the login button.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that a progress indicator is shown.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
