import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/login_form.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'dart:async';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';
import 'package:go_router/go_router.dart';

class FakeLoginNotifier extends StateNotifier<LoginState> implements LoginNotifier {
  final Completer<UserEntity?> _completer = Completer<UserEntity?>();
  FakeLoginNotifier() : super(LoginState());

  @override
  Future<UserEntity?> login(String username, String password) {
    state = LoginState(isLoading: true);
    return _completer.future;
  }

  void completeWithUser(UserEntity? user) {
    state = LoginState(isLoading: false);
    if (!_completer.isCompleted) _completer.complete(user);
  }
}

void main() {
  testWidgets('LoginForm shows loading and calls login', (WidgetTester tester) async {
    final fakeNotifier = FakeLoginNotifier();

    final goRouter = GoRouter(routes: [
      GoRoute(path: '/', builder: (context, state) => const Scaffold(body: LoginForm())),
      GoRoute(path: '/dashboard', builder: (context, state) => const Scaffold(body: Text('dashboard'))),
    ]);

    // set test surface size to avoid RenderFlex overflow
    tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginNotifierProvider.overrideWith((ref) => fakeNotifier),
        ],
        child: MaterialApp.router(
          routerConfig: goRouter,
          localizationsDelegates: const [AppLocalizations.delegate],
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );

    // Type username and password (first and second TextFormField)
    await tester.enterText(find.byType(TextFormField).at(0), 'admin');
    await tester.enterText(find.byType(TextFormField).at(1), '123456');

    // Tap the login button
    await tester.tap(find.text('Welcome'));
    await tester.pump();

    // Button should now show loading indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Complete the login operation
    fakeNotifier.completeWithUser(const UserEntity(userId: 1, username: 'admin', fullNameAr: 'المدير', fullNameEn: 'Admin', isActive: true));

    // Allow the UI to react
    await tester.pumpAndSettle();

    // Loading indicator should disappear
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

}
