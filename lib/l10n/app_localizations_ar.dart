// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get muhasebPro => 'محاسب برو';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get usernameHint => 'أدخل اسم المستخدم الخاص بك';

  @override
  String get usernameRequired => 'اسم المستخدم مطلوب';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordHint => 'أدخل كلمة المرور الخاصة بك';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get loginFailed => 'فشل تسجيل الدخول';

  @override
  String get invalidCredentials => 'اسم المستخدم أو كلمة المرور غير صحيحة.';

  @override
  String get anErrorOccurred => 'حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى.';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get welcome => 'أهلاً بك';

  @override
  String get logout => 'تسجيل الخروج';
}
