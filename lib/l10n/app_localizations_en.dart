// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get muhasebPro => 'MuhasebPro';

  @override
  String get login => 'Login';

  @override
  String get username => 'Username';

  @override
  String get usernameHint => 'Enter your username';

  @override
  String get usernameRequired => 'Username is required';

  @override
  String get password => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get loginFailed => 'Login Failed';

  @override
  String get invalidCredentials => 'Invalid username or password.';

  @override
  String get anErrorOccurred => 'An unexpected error occurred. Please try again.';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get welcome => 'Welcome';

  @override
  String get logout => 'Logout';

  @override
  String get systemSetup => 'System Setup';

  @override
  String get generalLedger => 'General Ledger';

  @override
  String get inventory => 'Inventory Management';

  @override
  String get vendors => 'Vendors & Purchases';

  @override
  String get customers => 'Customers & Sales';

  @override
  String get reports => 'Reports & Analytics';

  @override
  String get comingSoon => 'Coming Soon';

  @override
  String get featureUnderDevelopment => 'This feature is currently under development.';
}
