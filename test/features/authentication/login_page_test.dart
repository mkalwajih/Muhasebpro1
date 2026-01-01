
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/login_form.dart';
import 'package:mocktail/mocktail.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Mocks
class MockLoginNotifier extends StateNotifier<LoginState> implements LoginNotifier {
  MockLoginNotifier() : super(LoginState());

  @override
  Future<UserEntity?> login(String username, String password) async {
    state = LoginState(isLoading: true);
    if (username == 'admin' && password == '123456') {
      state = LoginState(isLoading: false);
      return const UserEntity(
        userId: 1,
        username: 'admin',
        fullNameAr: 'admin',
        fullNameEn: 'admin',
        isActive: true,
      );
    } else {
      state = LoginState(isLoading: false, error: 'Invalid credentials');
      return null;
    }
  }
}

class MockGoRouter extends Mock implements GoRouter {}

void main() {
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockGoRouter = MockGoRouter();
  });

  testWidgets('Login form test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginNotifierProvider.overrideWith((ref) => MockLoginNotifier()),
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: InheritedGoRouter(
            goRouter: mockGoRouter,
            child: const Scaffold(
              body: LoginForm(),
            ),
          ),
        ),
      ),
    );

    // Verify that the login form is displayed.
    expect(find.byKey(const Key('username_field')), findsOneWidget);
    expect(find.byKey(const Key('password_field')), findsOneWidget);

    // Enter username and password.
    await tester.enterText(find.byKey(const Key('username_field')), 'admin');
    await tester.enterText(find.byKey(const Key('password_field')), '123456');

    // Tap the login button.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the router navigates to the dashboard on successful login.
    verify(() => mockGoRouter.go('/dashboard')).called(1);
  });
}
