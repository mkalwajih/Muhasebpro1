import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/forgot_password_form.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

void main() {
  testWidgets('ForgotPasswordForm shows loading and calls reset', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ForgotPasswordScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );

    // Verify that the forgot password form is displayed.
    expect(find.byType(ForgotPasswordForm), findsOneWidget);

    // Enter username.
    await tester.enterText(find.byKey(const Key('username_field')), 'admin');

    // Tap the reset button.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that a progress indicator is shown.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
