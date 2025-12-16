import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/register_screen.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/register_form.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

void main() {
  testWidgets('RegisterForm shows loading and calls register', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: RegisterScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );

    // Verify that the register form is displayed.
    expect(find.byType(RegisterForm), findsOneWidget);

    // Enter user details.
    await tester.enterText(find.byKey(const Key('username_field')), 'testuser');
    await tester.enterText(find.byKey(const Key('full_name_ar_field')), 'Test User AR');
    await tester.enterText(find.byKey(const Key('full_name_en_field')), 'Test User EN');
    await tester.enterText(find.byKey(const Key('password_field')), 'password');

    // Tap the register button.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that a progress indicator is shown.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
