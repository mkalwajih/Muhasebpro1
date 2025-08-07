// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get branch => 'الفرع';

  @override
  String get company => 'الشركة';

  @override
  String get warehouseTooltip => 'سيتم تفعيله عند تفعيل وحدة المخزون';

  @override
  String get leaveBlankToKeepUnchanged => 'اتركه فارغاً لعدم التغيير';

  @override
  String get passwordLengthError => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

  @override
  String get passwordNumberError => 'يجب أن تحتوي كلمة المرور على رقم';

  @override
  String get branchGroups => 'مجموعات الفروع';

  @override
  String get addNewBranchGroup => 'إضافة مجموعة فروع جديدة';

  @override
  String get editBranchGroup => 'تعديل مجموعة الفروع';

  @override
  String get areYouSureYouWantToDelete => 'هل أنت متأكد أنك تريد الحذف؟';

  @override
  String get activate => 'تفعيل';

  @override
  String get uploadLogo => 'تحميل الشعار';

  @override
  String get mainCompany => 'الشركة الرئيسية';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get noDenominations => 'لا توجد فئات';

  @override
  String get viewCompanyInfo => 'عرض معلومات الشركة';

  @override
  String get viewBranches => 'عرض الفروع';

  @override
  String get viewCOA => 'عرض دليل الحسابات';

  @override
  String get viewGeographicalData => 'عرض البيانات الجغرافية';

  @override
  String get viewGeneralParameters => 'عرض الإعدادات العامة';

  @override
  String get viewCurrencies => 'عرض العملات';

  @override
  String get viewTaxSettings => 'عرض إعدادات الضرائب';

  @override
  String get systemSetup => 'إعدادات النظام';

  @override
  String get generalLedger => 'دفتر الأستاذ العام';

  @override
  String get inventory => 'المخزون';

  @override
  String get vendors => 'الموردون';

  @override
  String get customers => 'العملاء';

  @override
  String get reports => 'التقارير';

  @override
  String get welcome => 'أهلاً بك';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get requiredField => 'حقل إجباري';

  @override
  String get saveSuccess => 'تم الحفظ بنجاح';

  @override
  String get saveFailed => 'فشل الحفظ';

  @override
  String get deactivateBranchConfirmationTitle => 'إلغاء تنشيط الفرع';

  @override
  String get deactivateBranchConfirmationMessage => 'هل أنت متأكد أنك تريد إلغاء تنشيط هذا الفرع؟';

  @override
  String get deactivate => 'إلغاء التنشيط';

  @override
  String get error => 'خطأ';

  @override
  String get chartOfAccounts => 'دليل الحسابات';

  @override
  String get addNewAccount => 'إضافة حساب جديد';

  @override
  String get editAccount => 'تعديل حساب';

  @override
  String get companyCode => 'رمز الشركة';

  @override
  String get companyNameAr => 'اسم الشركة (عربي)';

  @override
  String get companyNameEn => 'اسم الشركة (إنجليزي)';

  @override
  String get country => 'الدولة';

  @override
  String get taxNumber => 'الرقم الضريبي';

  @override
  String get commercialRegNo => 'رقم السجل التجاري';

  @override
  String get address => 'العنوان';

  @override
  String get phone => 'الهاتف';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get remarks => 'ملاحظات';

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get currencies => 'العملات';

  @override
  String get addNewCurrency => 'إضافة عملة جديدة';

  @override
  String get editCurrency => 'تعديل عملة';

  @override
  String get selectCurrencyPrompt => 'حدد عملة لعرض التفاصيل';

  @override
  String get addNewDenomination => 'إضافة فئة جديدة';

  @override
  String get editDenomination => 'تعديل فئة';

  @override
  String get value => 'القيمة';

  @override
  String get type => 'النوع';

  @override
  String get generalParameters => 'الإعدادات العامة';

  @override
  String get resetToDefaults => 'إعادة تعيين الافتراضيات';

  @override
  String get confirmReset => 'تأكيد إعادة التعيين';

  @override
  String get confirmResetMessage => 'هل أنت متأكد أنك تريد إعادة تعيين جميع الإعدادات العامة إلى قيمها الافتراضية؟';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get general => 'عام';

  @override
  String get accounting => 'محاسبة';

  @override
  String get security => 'الأمان';

  @override
  String get ui => 'الواجهة';

  @override
  String get backup => 'النسخ الاحتياطي';

  @override
  String get cannotChangeAccountSettings => 'لا يمكن تغيير إعدادات الحسابات أثناء وجود المعاملات';

  @override
  String get geographicalData => 'البيانات الجغرافية';

  @override
  String get zones => 'المناطق';

  @override
  String get countries => 'الدول';

  @override
  String get governorates => 'المحافظات';

  @override
  String get cities => 'المدن';

  @override
  String get regions => 'الأحياء';

  @override
  String get selectParentPrompt => 'حدد أصلاً لإضافة عنصر جديد';

  @override
  String get addNew => 'إضافة جديد';

  @override
  String get confirmDeletion => 'تأكيد الحذف';

  @override
  String get confirmDeleteMessage => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟';

  @override
  String get delete => 'حذف';

  @override
  String get deleteFailed => 'فشل الحذف';

  @override
  String get addNewZone => 'إضافة منطقة جديدة';

  @override
  String get editZone => 'تعديل منطقة';

  @override
  String get addNewCountry => 'إضافة دولة جديدة';

  @override
  String get editCountry => 'تعديل دولة';

  @override
  String get addNewGovernorate => 'إضافة محافظة جديدة';

  @override
  String get editGovernorate => 'تعديل محافظة';

  @override
  String get addNewCity => 'إضافة مدينة جديدة';

  @override
  String get editCity => 'تعديل مدينة';

  @override
  String get addNewRegion => 'إضافة حي جديد';

  @override
  String get editRegion => 'تعديل حي';

  @override
  String get code => 'الرمز';

  @override
  String get nationalityAr => 'الجنسية (عربي)';

  @override
  String get nationalityEn => 'الجنسية (إنجليزي)';

  @override
  String get active => 'نشط';

  @override
  String get roleManagement => 'إدارة الأدوار';

  @override
  String get addNewRole => 'إضافة دور جديد';

  @override
  String get editRole => 'تعديل دور';

  @override
  String get taxSettings => 'إعدادات الضرائب';

  @override
  String get taxBrackets => 'شرائح الضرائب';

  @override
  String get taxTypes => 'أنواع الضرائب';

  @override
  String get taxCalculationMethods => 'طرق حساب الضرائب';

  @override
  String get userManagement => 'إدارة المستخدمين';

  @override
  String get userIsActive => 'نشط';

  @override
  String get userIsInactive => 'غير نشط';

  @override
  String get addNewUser => 'إضافة مستخدم جديد';

  @override
  String get editUser => 'تعديل مستخدم';

  @override
  String get accountNumberType => 'نوع رقم الحساب';

  @override
  String get accountNumberLength => 'طول رقم الحساب';

  @override
  String get costCenterPolicy => 'سياسة مركز التكلفة';

  @override
  String get projectPolicy => 'سياسة المشروع';

  @override
  String get noParent => 'لا يوجد أصل';

  @override
  String get parentAccount => 'الحساب الأصل';

  @override
  String get nature => 'الطبيعة';

  @override
  String get reportType => 'نوع التقرير';

  @override
  String get detailAccountType => 'نوع الحساب التفصيلي';

  @override
  String get cashFlowType => 'نوع التدفق النقدي';

  @override
  String get addNewBranch => 'إضافة فرع جديد';

  @override
  String get editBranch => 'تعديل فرع';

  @override
  String get branchCode => 'رمز الفرع';

  @override
  String get branchNameEn => 'اسم الفرع (إنجليزي)';

  @override
  String get branchNameAr => 'اسم الفرع (عربي)';

  @override
  String get branchGroup => 'مجموعة الفرع';

  @override
  String get defaultWarehouse => 'المستودع الافتراضي';

  @override
  String get logo => 'الشعار';

  @override
  String get currencyCode => 'رمز العملة';

  @override
  String get fractionNameEn => 'اسم الكسر (إنجليزي)';

  @override
  String get fractionNameAr => 'اسم الكسر (عربي)';

  @override
  String get exchangeRate => 'سعر الصرف';

  @override
  String get decimalPlaces => 'الخانات العشرية';

  @override
  String get baseCurrency => 'العملة الأساسية';

  @override
  String get denominations => 'الفئات';

  @override
  String get actions => 'الإجراءات';

  @override
  String get language => 'اللغة';

  @override
  String get dateFormat => 'تنسيق التاريخ';

  @override
  String get calendarType => 'نوع التقويم';

  @override
  String get passwordMinLength => 'الحد الأدنى لطول كلمة المرور';

  @override
  String get autoLockTimeout => 'مهلة القفل التلقائي';

  @override
  String get inMinutes => 'بالدقائق';

  @override
  String get useVAT => 'استخدام ضريبة القيمة المضافة';

  @override
  String get useTDS => 'استخدام ضريبة الخصم';

  @override
  String get useEInvoice => 'استخدام الفاتورة الإلكترونية';

  @override
  String get priceIncludesTax => 'السعر يشمل الضريبة';

  @override
  String get addNewTaxBracket => 'إضافة شريحة ضريبية جديدة';

  @override
  String get taxRate => 'معدل الضريبة';

  @override
  String get isDefault => 'افتراضي';

  @override
  String get addNewTaxCalculationMethod => 'إضافة طريقة حساب ضريبة جديدة';

  @override
  String get category => 'الفئة';

  @override
  String get addNewTaxType => 'إضافة نوع ضريبة جديد';

  @override
  String get calculationMethod => 'طريقة الحساب';

  @override
  String get salesAccount => 'حساب المبيعات';

  @override
  String get purchasesAccount => 'حساب المشتريات';

  @override
  String get uiTheme => 'سمة الواجهة';

  @override
  String get dark => 'داكن';

  @override
  String get light => 'فاتح';

  @override
  String get fontSize => 'حجم الخط';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get usernameRequired => 'اسم المستخدم مطلوب';

  @override
  String get fullNameEn => 'الاسم الكامل (إنجليزي)';

  @override
  String get fullNameAr => 'الاسم الكامل (عربي)';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get status => 'الحالة';

  @override
  String get enableBiometric => 'تمكين المصادقة البيومترية';

  @override
  String get linkToDevice => 'ربط بالجهاز';

  @override
  String get comingSoon => 'قريبا!';

  @override
  String get featureUnderDevelopment => 'هذه الميزة قيد التطوير حاليًا. يرجى التحقق لاحقًا.';

  @override
  String get branchGroupNameEn => 'اسم مجموعة الفرع (إنجليزي)';

  @override
  String get branchGroupNameAr => 'اسم مجموعة الفرع (عربي)';

  @override
  String get branchesModule => 'الفروع';

  @override
  String get companyInfo => 'معلومات الشركة';

  @override
  String get nameEn => 'الاسم (إنجليزي)';

  @override
  String get nameAr => 'الاسم (عربي)';

  @override
  String get accountCode => 'رمز الحساب';

  @override
  String get accountNameAr => 'اسم الحساب (عربي)';

  @override
  String get accountNameEn => 'اسم الحساب (إنجليزي)';

  @override
  String get roleNameEn => 'اسم الدور (إنجليزي)';

  @override
  String get roleNameAr => 'اسم الدور (عربي)';

  @override
  String get description => 'الوصف';

  @override
  String get backupFrequency => 'تكرار النسخ الاحتياطي';

  @override
  String get cloudBackup => 'النسخ الاحتياطي السحابي';

  @override
  String get cloudBackupHint => 'ملاحظة: النسخ الاحتياطي السحابي مهم.';

  @override
  String get editTaxBracket => 'تعديل الشريحة الضريبية';

  @override
  String get editTaxCalculationMethod => 'تعديل طريقة حساب الضريبة';

  @override
  String get editTaxType => 'تعديل نوع الضريبة';

  @override
  String get branches => 'Branches';
}
