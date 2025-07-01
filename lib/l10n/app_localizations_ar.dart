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

  @override
  String get systemSetup => 'إعدادات النظام';

  @override
  String get generalLedger => 'الحسابات العامة';

  @override
  String get inventory => 'إدارة المخزون';

  @override
  String get vendors => 'الموردون والمشتريات';

  @override
  String get customers => 'العملاء والمبيعات';

  @override
  String get reports => 'التقارير والتحليلات';

  @override
  String get comingSoon => 'قريباً';

  @override
  String get featureUnderDevelopment => 'هذه الميزة قيد التطوير حالياً.';

  @override
  String get companyInfo => 'بيانات الشركة';

  @override
  String get companyNameAr => 'اسم الشركة (عربي)';

  @override
  String get companyNameEn => 'اسم الشركة (انجليزي)';

  @override
  String get addressAr => 'العنوان (عربي)';

  @override
  String get addressEn => 'العنوان (انجليزي)';

  @override
  String get phone => 'الهاتف';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get website => 'الموقع الإلكتروني';

  @override
  String get taxNumber => 'الرقم الضريبي';

  @override
  String get commercialRegNo => 'رقم السجل التجاري';

  @override
  String get save => 'حفظ';

  @override
  String get saving => 'جاري الحفظ...';

  @override
  String get saveSuccess => 'تم حفظ البيانات بنجاح.';

  @override
  String get saveFailed => 'فشل حفظ البيانات.';
}
