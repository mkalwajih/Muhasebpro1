import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/register_form.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';

class FakeRegisterNotifier extends StateNotifier<RegisterState> implements RegisterNotifier {
  final Completer<UserEntity?> _completer = Completer<UserEntity?>();

  FakeRegisterNotifier() : super(RegisterState());

  @override
  Future<UserEntity?> register(UserEntity user, String password) {
    state = RegisterState(isLoading: true);
    return _completer.future;
  }

  void completeWithUser(UserEntity? user) {
    state = RegisterState(isLoading: false);
    if (!_completer.isCompleted) _completer.complete(user);
  }
}

void main() {
  testWidgets('RegisterForm shows loading and calls register', (WidgetTester tester) async {
    final fakeNotifier = FakeRegisterNotifier();

    final goRouter = GoRouter(routes: [
      GoRoute(path: '/', builder: (context, state) => const Scaffold(body: RegisterForm())),
      GoRoute(path: '/dashboard', builder: (context, state) => const Scaffold(body: Text('dashboard'))),
    ]);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          registerNotifierProvider.overrideWith((ref) => fakeNotifier),
        ],
        child: MaterialApp.router(
          routerConfig: goRouter,
          localizationsDelegates: const [AppLocalizations.delegate],
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField).at(0), 'newuser');
    await tester.enterText(find.byType(TextFormField).at(3), '123456');
    await tester.enterText(find.byType(TextFormField).at(4), '123456');

    await tester.tap(find.text('Add New User'));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    fakeNotifier.completeWithUser(const UserEntity(userId: 2, username: 'newuser', fullNameAr: 'المستخدم', fullNameEn: 'New', isActive: true));

    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
