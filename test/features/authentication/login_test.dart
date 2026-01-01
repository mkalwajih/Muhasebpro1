
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/app/app.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';

void main() {
  testWidgets('Login screen should login with default credentials', (WidgetTester tester) async {
    // 1. Create a ProviderContainer for the test.
    final container = ProviderContainer();

    // 2. Pump the App widget with the container.
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const App(),
      ),
    );

    // It takes time to render the first frame.
    await tester.pumpAndSettle();

    // 3. Seed the initial admin user.
    // We need to `await` this to ensure the user is created before we try to log in.
    await container.read(seedUserUseCaseProvider).call();
    await tester.pumpAndSettle();

    // The login form is now visible.
    // Find the AppLocalizations instance to get the localized strings.
    final BuildContext context = tester.element(find.byType(MaterialApp));
    final loc = AppLocalizations.of(context)!;

    // 4. Enter default credentials
    await tester.enterText(find.byKey(const Key('username_field')), 'admin');
    await tester.enterText(find.byKey(const Key('password_field')), '123456');
    await tester.pump();

    // 5. Tap the login button
    // The button text is "Welcome" from the localization file.
    await tester.tap(find.text(loc.welcome));
    await tester.pumpAndSettle();

    // 6. Check if the user is authenticated and redirected to the dashboard
    final authState = container.read(authStateProvider);
    expect(authState, isA<UserEntity>());
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
