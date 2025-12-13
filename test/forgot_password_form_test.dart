import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/forgot_password_form.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class FakeResetNotifier extends StateNotifier<ResetPasswordState> implements ResetPasswordNotifier {
  final Completer<bool> _completer = Completer<bool>();

  FakeResetNotifier() : super(ResetPasswordState());

  @override
  Future<bool> reset(String username, String newPassword) {
    state = ResetPasswordState(isLoading: true);
    return _completer.future;
  }

  void completeWithSuccess(bool ok) {
    state = ResetPasswordState(isLoading: false, success: ok);
    if (!_completer.isCompleted) _completer.complete(ok);
  }
}

void main() {
  testWidgets('ForgotPasswordForm shows loading and calls reset', (WidgetTester tester) async {
    final fakeNotifier = FakeResetNotifier();

    final goRouter = GoRouter(routes: [
      GoRoute(path: '/', builder: (context, state) => const Scaffold(body: ForgotPasswordForm())),
      GoRoute(path: '/login', builder: (context, state) => const Scaffold(body: Text('login'))),
    ]);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          resetPasswordNotifierProvider.overrideWith((ref) => fakeNotifier),
        ],
        child: MaterialApp.router(
          routerConfig: goRouter,
          localizationsDelegates: const [AppLocalizations.delegate],
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField).at(0), 'admin');
    await tester.enterText(find.byType(TextFormField).at(1), '123456');
    await tester.enterText(find.byType(TextFormField).at(2), '123456');

    await tester.tap(find.text('Save'));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    fakeNotifier.completeWithSuccess(true);

    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
