import 'package:flutter/material.dart';
import 'forgot_password_form.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(loc.forgotPassword)),
      body: const ForgotPasswordForm(),
    );
  }
}
