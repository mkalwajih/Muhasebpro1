///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAuthAr auth = _TranslationsAuthAr._(_root);
	@override late final _TranslationsCoaAr coa = _TranslationsCoaAr._(_root);
	@override late final _TranslationsCoaSetupAr coa_setup = _TranslationsCoaSetupAr._(_root);
	@override late final _TranslationsCommonAr common = _TranslationsCommonAr._(_root);
	@override late final _TranslationsCompanyAr company = _TranslationsCompanyAr._(_root);
	@override late final _TranslationsControlAr control = _TranslationsControlAr._(_root);
	@override late final _TranslationsDashboardAr dashboard = _TranslationsDashboardAr._(_root);
	@override late final _TranslationsDefaultsAr defaults = _TranslationsDefaultsAr._(_root);
	@override late final _TranslationsFinanceConfigAr finance_config = _TranslationsFinanceConfigAr._(_root);
	@override late final _TranslationsGeoAr geo = _TranslationsGeoAr._(_root);
	@override late final _TranslationsMasterAr master = _TranslationsMasterAr._(_root);
	@override late final _TranslationsOpsAr ops = _TranslationsOpsAr._(_root);
	@override late final _TranslationsParamsAr params = _TranslationsParamsAr._(_root);
	@override late final _TranslationsReportsAr reports = _TranslationsReportsAr._(_root);
	@override late final _TranslationsSetupAr setup = _TranslationsSetupAr._(_root);
	@override late final _TranslationsTransactionsAr transactions = _TranslationsTransactionsAr._(_root);
	@override late final _TranslationsUsersAr users = _TranslationsUsersAr._(_root);
	@override late final _TranslationsVouchersAr vouchers = _TranslationsVouchersAr._(_root);
}

// Path: auth
class _TranslationsAuthAr extends TranslationsAuthEn {
	_TranslationsAuthAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'محاسب برو';
	@override String get subtitle => 'سجل الدخول إلى حسابك';
	@override String get username => 'اسم المستخدم';
	@override String get password => 'كلمة المرور';
	@override String get newPassword => 'كلمة المرور الجديدة';
	@override String get confirmPassword => 'تأكيد كلمة المرور';
	@override String get login => 'تسجيل الدخول';
	@override String get logout => 'تسجيل الخروج';
	@override String get register => 'تسجيل';
	@override String get forgotPassword => 'نسيت كلمة المرور؟';
	@override String get resetPassword => 'إعادة تعيين كلمة المرور';
	@override String get resetPasswordSuccess => 'تم إعادة تعيين كلمة المرور بنجاح';
	@override String get backToLogin => 'العودة لتسجيل الدخول';
	@override String get welcome => 'مرحباً';
	@override String get registrationSuccess => 'تم التسجيل بنجاح';
	@override String get userInactive => 'هذا الحساب غير نشط';
	@override String get invalidCredentials => 'اسم المستخدم أو كلمة المرور غير صحيحة';
	@override String get passwordMismatch => 'كلمات المرور غير متطابقة';
	@override String get passwordLength => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
}

// Path: coa
class _TranslationsCoaAr extends TranslationsCoaEn {
	_TranslationsCoaAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'دليل الحسابات';
	@override String get accountCode => 'رمز الحساب';
	@override String get accountNameAr => 'اسم الحساب (عربي)';
	@override String get accountNameEn => 'اسم الحساب (إنجليزي)';
	@override String get parentAccount => 'الحساب الرئيسي';
	@override String get accountNature => 'طبيعة الحساب';
	@override String get reportType => 'نوع التقرير';
	@override String get selectAccountPrompt => 'اختر حساباً لعرض التفاصيل';
}

// Path: coa_setup
class _TranslationsCoaSetupAr extends TranslationsCoaSetupEn {
	_TranslationsCoaSetupAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'دليل الحسابات';
	@override String get accountCode => 'رمز الحساب';
	@override String get parentAccount => 'الحساب الرئيسي';
	@override String get nature => 'طبيعة الحساب';
	@override String get reportType => 'نوع التقرير';
	@override String get level => 'المستوى';
	@override String get detailType => 'نوع الحساب التفصيلي';
	@override String get cashFlowType => 'نوع التدفق النقدي';
	@override String get noParent => 'لا يوجد أصل';
	@override String get debit => 'مدين';
	@override String get credit => 'دائن';
}

// Path: common
class _TranslationsCommonAr extends TranslationsCommonEn {
	_TranslationsCommonAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get save => 'حفظ';
	@override String get cancel => 'إلغاء';
	@override String get delete => 'حذف';
	@override String get edit => 'تعديل';
	@override String get add => 'إضافة';
	@override String get addNew => 'إضافة جديد';
	@override String get update => 'تحديث';
	@override String get submit => 'إرسال';
	@override String get confirm => 'تأكيد';
	@override String get close => 'إغلاق';
	@override String get search => 'بحث';
	@override String get filter => 'تصفية';
	@override String get apply => 'تطبيق';
	@override String get reset => 'إعادة تعيين';
	@override String get refresh => 'تحديث';
	@override String get details => 'التفاصيل';
	@override String get actions => 'إجراءات';
	@override String get yes => 'نعم';
	@override String get no => 'لا';
	@override String get active => 'نشط';
	@override String get inactive => 'غير نشط';
	@override String get loading => 'جاري التحميل...';
	@override String get error => 'خطأ';
	@override String get success => 'تم بنجاح';
	@override String get status => 'الحالة';
	@override String get description => 'الوصف';
	@override String get notes => 'ملاحظات';
	@override String get date => 'التاريخ';
	@override String get amount => 'المبلغ';
	@override String get total => 'الإجمالي';
	@override String get code => 'الرمز';
	@override String get nameAr => 'الاسم (عربي)';
	@override String get nameEn => 'الاسم (انجليزي)';
	@override String get fullNameAr => 'الاسم الكامل (عربي)';
	@override String get fullNameEn => 'الاسم الكامل (انجليزي)';
	@override String get logo => 'الشعار';
	@override String get uploadLogo => 'رفع الشعار';
	@override String get export => 'تصدير';
	@override String get print => 'طباعة';
	@override String get fromDate => 'من تاريخ';
	@override String get toDate => 'إلى تاريخ';
	@override String get requiredField => 'حقل مطلوب';
	@override String get comingSoon => 'قريباً!';
	@override String get saveSuccess => 'تم الحفظ بنجاح';
	@override String get saveFailed => 'فشل الحفظ';
	@override String get deleteSuccess => 'تم الحذف بنجاح';
	@override String get deleteFailed => 'فشل الحذف';
	@override String get confirmDelete => 'هل أنت متأكد من حذف هذا العنصر؟';
	@override String get accessDenied => 'تم رفض الوصول';
}

// Path: company
class _TranslationsCompanyAr extends TranslationsCompanyEn {
	_TranslationsCompanyAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'معلومات الشركة';
	@override String get add => 'إضافة شركة جديدة';
	@override String get edit => 'تعديل شركة';
	@override String get companyCode => 'رمز الشركة';
	@override String get taxNumber => 'الرقم الضريبي';
	@override String get regNumber => 'رقم السجل التجاري';
	@override String get isMainCompany => 'الشركة الرئيسية';
	@override String get address => 'العنوان';
	@override String get phone => 'الهاتف';
	@override String get email => 'البريد الإلكتروني';
	@override String get selectPrompt => 'اختر شركة من القائمة لعرض التفاصيل.';
	@override String get noCompanies => 'لم يتم إنشاء شركات بعد.';
	@override String get branchTitle => 'الفروع';
	@override String get branchAdd => 'إضافة فرع جديد';
	@override String get branchEdit => 'تعديل فرع';
	@override String get branchCode => 'رمز الفرع';
	@override String get branchGroup => 'مجموعة الفرع';
	@override String get defaultWarehouse => 'المستودع الافتراضي';
	@override String get selectOrCreateBranch => 'اختر فرعاً أو أنشئ واحداً جديداً';
}

// Path: control
class _TranslationsControlAr extends TranslationsControlEn {
	_TranslationsControlAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مراقبة المخزون';
	@override String get stocktaking => 'الجرد';
	@override String get startSession => 'بدء جلسة جرد';
	@override String get reservations => 'الحجوزات';
	@override String get reports => 'تقارير المخزون';
	@override String get balances => 'أرصدة المخزون';
	@override String get valuation => 'تقييم المخزون';
	@override String get movement => 'حركة الصنف';
}

// Path: dashboard
class _TranslationsDashboardAr extends TranslationsDashboardEn {
	_TranslationsDashboardAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get systemSetup => 'إعدادات النظام';
	@override String get generalLedger => 'الأستاذ العام';
	@override String get inventory => 'المخزون';
	@override String get vendors => 'الموردون';
	@override String get customers => 'العملاء';
	@override String get reports => 'التقارير';
}

// Path: defaults
class _TranslationsDefaultsAr extends TranslationsDefaultsEn {
	_TranslationsDefaultsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإعدادات الافتراضية';
	@override String get defaultAccounts => 'الحسابات الافتراضية';
	@override String get defaultItems => 'الأصناف الافتراضية';
	@override String get defaultUnits => 'الوحدات الافتراضية';
	@override String get defaultPayment => 'طرق الدفع الافتراضية';
	@override String get defaultSales => 'حسابات المبيعات الافتراضية';
	@override String get defaultPurchases => 'حسابات المشتريات الافتراضية';
}

// Path: finance_config
class _TranslationsFinanceConfigAr extends TranslationsFinanceConfigEn {
	_TranslationsFinanceConfigAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get paramsTitle => 'الإعدادات العامة';
	@override String get language => 'اللغة';
	@override String get dateFormat => 'تنسيق التاريخ';
	@override String get calendarType => 'نوع التقويم';
	@override String get backupSettings => 'إعدادات النسخ الاحتياطي';
	@override String get currencyTitle => 'العملات';
	@override String get currencyAdd => 'إضافة عملة جديدة';
	@override String get currencyEdit => 'تعديل عملة';
	@override String get baseCurrency => 'العملة الأساسية';
	@override String get exchangeRate => 'سعر الصرف';
	@override String get decimalPlaces => 'الخانات العشرية';
	@override String get denominations => 'الفئات';
	@override String get denomAdd => 'إضافة فئة جديدة';
	@override String get denomEdit => 'تعديل فئة';
	@override String get symbol => 'الرمز';
	@override String get taxTitle => 'إعدادات الضرائب';
	@override String get taxBrackets => 'الشرائح الضريبية';
	@override String get taxBracketAdd => 'إضافة شريحة ضريبية جديدة';
	@override String get taxBracketEdit => 'تعديل الشريحة الضريبية';
	@override String get taxTypes => 'أنواع الضرائب';
	@override String get taxTypeAdd => 'إضافة نوع ضريبة جديد';
	@override String get taxTypeEdit => 'تعديل نوع الضريبة';
	@override String get taxRate => 'المعدل';
	@override String get isCompound => 'ضريبة مركبة';
	@override String get calcMethod => 'طريقة الحساب';
	@override String get calcMethodAdd => 'إضافة طريقة حساب جديدة';
	@override String get calcMethodEdit => 'تعديل طريقة الحساب';
	@override String get periodTitle => 'الفترات المالية';
	@override String get periodAdd => 'إضافة فترة مالية';
	@override String get periodEdit => 'تعديل فترة مالية';
	@override String get fiscalYear => 'السنة المالية';
	@override String get generatePeriods => 'إنشاء الفترات';
	@override String get lockPeriod => 'قفل الفترة';
	@override String get isLocked => 'مقفلة';
	@override String get unlocked => 'مفتوحة';
}

// Path: geo
class _TranslationsGeoAr extends TranslationsGeoEn {
	_TranslationsGeoAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'البيانات الجغرافية';
	@override String get zones => 'المناطق';
	@override String get zoneAdd => 'إضافة منطقة جديدة';
	@override String get zoneEdit => 'تعديل منطقة';
	@override String get countries => 'الدول';
	@override String get countryAdd => 'إضافة دولة جديدة';
	@override String get countryEdit => 'تعديل دولة';
	@override String get governorates => 'المحافظات';
	@override String get governorateAdd => 'إضافة محافظة جديدة';
	@override String get governorateEdit => 'تعديل محافظة';
	@override String get cities => 'المدن';
	@override String get cityAdd => 'إضافة مدينة جديدة';
	@override String get cityEdit => 'تعديل مدينة';
	@override String get regions => 'الأحياء';
	@override String get regionAdd => 'إضافة حي جديد';
	@override String get regionEdit => 'تعديل حي';
	@override String get nationalityAr => 'الجنسية (عربي)';
	@override String get nationalityEn => 'الجنسية (إنجليزي)';
	@override String get selectParentPrompt => 'حدد عنصراً رئيسياً لإضافة سجل جديد';
}

// Path: master
class _TranslationsMasterAr extends TranslationsMasterEn {
	_TranslationsMasterAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الأصناف';
	@override String get setup => 'إعدادات المخزون';
	@override String get itemGroups => 'مجموعات الأصناف';
	@override String get warehouses => 'المستودعات';
	@override String get add => 'إضافة صنف';
	@override String get code => 'رمز الصنف';
	@override String get barcode => 'الباركود';
	@override String get type => 'نوع الصنف';
	@override String get costPrice => 'سعر التكلفة';
	@override String get baseUnit => 'الوحدة الأساسية';
	@override String get costingMethod => 'طريقة التكلفة الافتراضية';
}

// Path: ops
class _TranslationsOpsAr extends TranslationsOpsEn {
	_TranslationsOpsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'عمليات المخزون';
	@override String get incoming => 'إدخال مخزني';
	@override String get outgoing => 'إخراج مخزني';
	@override String get transfer => 'تحويل مخزني';
	@override String get opening => 'الرصيد الافتتاحي';
	@override String get quantity => 'الكمية';
	@override String get unitCost => 'تكلفة الوحدة';
	@override String get totalCost => 'التكلفة الإجمالية';
}

// Path: params
class _TranslationsParamsAr extends TranslationsParamsEn {
	_TranslationsParamsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإعدادات العامة';
	@override String get defaultLanguage => 'اللغة الافتراضية';
	@override String get dateFormat => 'تنسيق التاريخ';
	@override String get baseCurrency => 'العملة الأساسية';
	@override String get currencies => 'العملات';
	@override String get currencyNameAr => 'اسم العملة (عربي)';
	@override String get currencyNameEn => 'اسم العملة (إنجليزي)';
	@override String get symbol => 'الرمز';
	@override String get exchangeRate => 'سعر الصرف';
}

// Path: reports
class _TranslationsReportsAr extends TranslationsReportsEn {
	_TranslationsReportsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'التقارير';
	@override String get trialBalance => 'ميزان المراجعة';
	@override String get balanceSheet => 'الميزانية العمومية';
	@override String get incomeStatement => 'قائمة الدخل';
	@override String get cashFlow => 'التدفقات النقدية';
}

// Path: setup
class _TranslationsSetupAr extends TranslationsSetupEn {
	_TranslationsSetupAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إعدادات الأستاذ العام';
	@override String get docTypes => 'أنواع المستندات';
	@override String get docTypeAdd => 'إضافة نوع مستند';
	@override String get docTypeEdit => 'تعديل نوع مستند';
	@override String get docTypeCode => 'رمز النوع';
	@override String get descCoding => 'ترميز البيانات';
	@override String get descCodingAdd => 'إضافة ترميز بيان';
	@override String get descCodingEdit => 'تعديل ترميز بيان';
	@override String get sequenceMethod => 'طريقة الترقيم';
}

// Path: transactions
class _TranslationsTransactionsAr extends TranslationsTransactionsEn {
	_TranslationsTransactionsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الحركات';
	@override String get journalVoucher => 'سند قيد';
	@override String get receiptVoucher => 'سند قبض';
	@override String get paymentVoucher => 'سند صرف';
	@override String get transferVoucher => 'سند تحويل';
}

// Path: users
class _TranslationsUsersAr extends TranslationsUsersEn {
	_TranslationsUsersAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إدارة المستخدمين';
	@override String get add => 'إضافة مستخدم جديد';
	@override String get edit => 'تعديل مستخدم';
	@override String get fullNameAr => 'الاسم الكامل (عربي)';
	@override String get fullNameEn => 'الاسم الكامل (إنجليزي)';
	@override String get enableBiometric => 'تفعيل البصمة';
	@override String get linkToDevice => 'ربط الجهاز';
	@override String get isActive => 'نشط';
	@override String get isInactive => 'غير نشط';
	@override String get roleManagement => 'إدارة الأدوار';
	@override String get roleAdd => 'إضافة دور جديد';
	@override String get roleEdit => 'تعديل دور';
	@override String get roleName => 'اسم الدور';
	@override String get permissions => 'الصلاحيات';
}

// Path: vouchers
class _TranslationsVouchersAr extends TranslationsVouchersEn {
	_TranslationsVouchersAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get journal => 'قيد يومية';
	@override String get payment => 'سند صرف';
	@override String get receipt => 'سند قبض';
	@override String get reference => 'رقم المرجع';
	@override String get debit => 'مدين';
	@override String get credit => 'دائن';
	@override String get difference => 'الفرق';
	@override String get post => 'ترحيل';
	@override String get reverse => 'عكس القيد';
	@override String get lines => 'الأسطر';
	@override String get addEntry => 'إضافة قيد';
	@override String get confirmPost => 'تأكيد الترحيل';
	@override String get postedMsg => 'تم ترحيل السند بنجاح';
	@override String get paymentMethod => 'طريقة الدفع';
	@override String get checkNumber => 'رقم الشيك';
	@override String get beneficiary => 'المستفيد';
	@override String get payer => 'الدافع';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'auth.title' => 'محاسب برو',
			'auth.subtitle' => 'سجل الدخول إلى حسابك',
			'auth.username' => 'اسم المستخدم',
			'auth.password' => 'كلمة المرور',
			'auth.newPassword' => 'كلمة المرور الجديدة',
			'auth.confirmPassword' => 'تأكيد كلمة المرور',
			'auth.login' => 'تسجيل الدخول',
			'auth.logout' => 'تسجيل الخروج',
			'auth.register' => 'تسجيل',
			'auth.forgotPassword' => 'نسيت كلمة المرور؟',
			'auth.resetPassword' => 'إعادة تعيين كلمة المرور',
			'auth.resetPasswordSuccess' => 'تم إعادة تعيين كلمة المرور بنجاح',
			'auth.backToLogin' => 'العودة لتسجيل الدخول',
			'auth.welcome' => 'مرحباً',
			'auth.registrationSuccess' => 'تم التسجيل بنجاح',
			'auth.userInactive' => 'هذا الحساب غير نشط',
			'auth.invalidCredentials' => 'اسم المستخدم أو كلمة المرور غير صحيحة',
			'auth.passwordMismatch' => 'كلمات المرور غير متطابقة',
			'auth.passwordLength' => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
			'coa.title' => 'دليل الحسابات',
			'coa.accountCode' => 'رمز الحساب',
			'coa.accountNameAr' => 'اسم الحساب (عربي)',
			'coa.accountNameEn' => 'اسم الحساب (إنجليزي)',
			'coa.parentAccount' => 'الحساب الرئيسي',
			'coa.accountNature' => 'طبيعة الحساب',
			'coa.reportType' => 'نوع التقرير',
			'coa.selectAccountPrompt' => 'اختر حساباً لعرض التفاصيل',
			'coa_setup.title' => 'دليل الحسابات',
			'coa_setup.accountCode' => 'رمز الحساب',
			'coa_setup.parentAccount' => 'الحساب الرئيسي',
			'coa_setup.nature' => 'طبيعة الحساب',
			'coa_setup.reportType' => 'نوع التقرير',
			'coa_setup.level' => 'المستوى',
			'coa_setup.detailType' => 'نوع الحساب التفصيلي',
			'coa_setup.cashFlowType' => 'نوع التدفق النقدي',
			'coa_setup.noParent' => 'لا يوجد أصل',
			'coa_setup.debit' => 'مدين',
			'coa_setup.credit' => 'دائن',
			'common.save' => 'حفظ',
			'common.cancel' => 'إلغاء',
			'common.delete' => 'حذف',
			'common.edit' => 'تعديل',
			'common.add' => 'إضافة',
			'common.addNew' => 'إضافة جديد',
			'common.update' => 'تحديث',
			'common.submit' => 'إرسال',
			'common.confirm' => 'تأكيد',
			'common.close' => 'إغلاق',
			'common.search' => 'بحث',
			'common.filter' => 'تصفية',
			'common.apply' => 'تطبيق',
			'common.reset' => 'إعادة تعيين',
			'common.refresh' => 'تحديث',
			'common.details' => 'التفاصيل',
			'common.actions' => 'إجراءات',
			'common.yes' => 'نعم',
			'common.no' => 'لا',
			'common.active' => 'نشط',
			'common.inactive' => 'غير نشط',
			'common.loading' => 'جاري التحميل...',
			'common.error' => 'خطأ',
			'common.success' => 'تم بنجاح',
			'common.status' => 'الحالة',
			'common.description' => 'الوصف',
			'common.notes' => 'ملاحظات',
			'common.date' => 'التاريخ',
			'common.amount' => 'المبلغ',
			'common.total' => 'الإجمالي',
			'common.code' => 'الرمز',
			'common.nameAr' => 'الاسم (عربي)',
			'common.nameEn' => 'الاسم (انجليزي)',
			'common.fullNameAr' => 'الاسم الكامل (عربي)',
			'common.fullNameEn' => 'الاسم الكامل (انجليزي)',
			'common.logo' => 'الشعار',
			'common.uploadLogo' => 'رفع الشعار',
			'common.export' => 'تصدير',
			'common.print' => 'طباعة',
			'common.fromDate' => 'من تاريخ',
			'common.toDate' => 'إلى تاريخ',
			'common.requiredField' => 'حقل مطلوب',
			'common.comingSoon' => 'قريباً!',
			'common.saveSuccess' => 'تم الحفظ بنجاح',
			'common.saveFailed' => 'فشل الحفظ',
			'common.deleteSuccess' => 'تم الحذف بنجاح',
			'common.deleteFailed' => 'فشل الحذف',
			'common.confirmDelete' => 'هل أنت متأكد من حذف هذا العنصر؟',
			'common.accessDenied' => 'تم رفض الوصول',
			'company.title' => 'معلومات الشركة',
			'company.add' => 'إضافة شركة جديدة',
			'company.edit' => 'تعديل شركة',
			'company.companyCode' => 'رمز الشركة',
			'company.taxNumber' => 'الرقم الضريبي',
			'company.regNumber' => 'رقم السجل التجاري',
			'company.isMainCompany' => 'الشركة الرئيسية',
			'company.address' => 'العنوان',
			'company.phone' => 'الهاتف',
			'company.email' => 'البريد الإلكتروني',
			'company.selectPrompt' => 'اختر شركة من القائمة لعرض التفاصيل.',
			'company.noCompanies' => 'لم يتم إنشاء شركات بعد.',
			'company.branchTitle' => 'الفروع',
			'company.branchAdd' => 'إضافة فرع جديد',
			'company.branchEdit' => 'تعديل فرع',
			'company.branchCode' => 'رمز الفرع',
			'company.branchGroup' => 'مجموعة الفرع',
			'company.defaultWarehouse' => 'المستودع الافتراضي',
			'company.selectOrCreateBranch' => 'اختر فرعاً أو أنشئ واحداً جديداً',
			'control.title' => 'مراقبة المخزون',
			'control.stocktaking' => 'الجرد',
			'control.startSession' => 'بدء جلسة جرد',
			'control.reservations' => 'الحجوزات',
			'control.reports' => 'تقارير المخزون',
			'control.balances' => 'أرصدة المخزون',
			'control.valuation' => 'تقييم المخزون',
			'control.movement' => 'حركة الصنف',
			'dashboard.systemSetup' => 'إعدادات النظام',
			'dashboard.generalLedger' => 'الأستاذ العام',
			'dashboard.inventory' => 'المخزون',
			'dashboard.vendors' => 'الموردون',
			'dashboard.customers' => 'العملاء',
			'dashboard.reports' => 'التقارير',
			'defaults.title' => 'الإعدادات الافتراضية',
			'defaults.defaultAccounts' => 'الحسابات الافتراضية',
			'defaults.defaultItems' => 'الأصناف الافتراضية',
			'defaults.defaultUnits' => 'الوحدات الافتراضية',
			'defaults.defaultPayment' => 'طرق الدفع الافتراضية',
			'defaults.defaultSales' => 'حسابات المبيعات الافتراضية',
			'defaults.defaultPurchases' => 'حسابات المشتريات الافتراضية',
			'finance_config.paramsTitle' => 'الإعدادات العامة',
			'finance_config.language' => 'اللغة',
			'finance_config.dateFormat' => 'تنسيق التاريخ',
			'finance_config.calendarType' => 'نوع التقويم',
			'finance_config.backupSettings' => 'إعدادات النسخ الاحتياطي',
			'finance_config.currencyTitle' => 'العملات',
			'finance_config.currencyAdd' => 'إضافة عملة جديدة',
			'finance_config.currencyEdit' => 'تعديل عملة',
			'finance_config.baseCurrency' => 'العملة الأساسية',
			'finance_config.exchangeRate' => 'سعر الصرف',
			'finance_config.decimalPlaces' => 'الخانات العشرية',
			'finance_config.denominations' => 'الفئات',
			'finance_config.denomAdd' => 'إضافة فئة جديدة',
			'finance_config.denomEdit' => 'تعديل فئة',
			'finance_config.symbol' => 'الرمز',
			'finance_config.taxTitle' => 'إعدادات الضرائب',
			'finance_config.taxBrackets' => 'الشرائح الضريبية',
			'finance_config.taxBracketAdd' => 'إضافة شريحة ضريبية جديدة',
			'finance_config.taxBracketEdit' => 'تعديل الشريحة الضريبية',
			'finance_config.taxTypes' => 'أنواع الضرائب',
			'finance_config.taxTypeAdd' => 'إضافة نوع ضريبة جديد',
			'finance_config.taxTypeEdit' => 'تعديل نوع الضريبة',
			'finance_config.taxRate' => 'المعدل',
			'finance_config.isCompound' => 'ضريبة مركبة',
			'finance_config.calcMethod' => 'طريقة الحساب',
			'finance_config.calcMethodAdd' => 'إضافة طريقة حساب جديدة',
			'finance_config.calcMethodEdit' => 'تعديل طريقة الحساب',
			'finance_config.periodTitle' => 'الفترات المالية',
			'finance_config.periodAdd' => 'إضافة فترة مالية',
			'finance_config.periodEdit' => 'تعديل فترة مالية',
			'finance_config.fiscalYear' => 'السنة المالية',
			'finance_config.generatePeriods' => 'إنشاء الفترات',
			'finance_config.lockPeriod' => 'قفل الفترة',
			'finance_config.isLocked' => 'مقفلة',
			'finance_config.unlocked' => 'مفتوحة',
			'geo.title' => 'البيانات الجغرافية',
			'geo.zones' => 'المناطق',
			'geo.zoneAdd' => 'إضافة منطقة جديدة',
			'geo.zoneEdit' => 'تعديل منطقة',
			'geo.countries' => 'الدول',
			'geo.countryAdd' => 'إضافة دولة جديدة',
			'geo.countryEdit' => 'تعديل دولة',
			'geo.governorates' => 'المحافظات',
			'geo.governorateAdd' => 'إضافة محافظة جديدة',
			'geo.governorateEdit' => 'تعديل محافظة',
			'geo.cities' => 'المدن',
			'geo.cityAdd' => 'إضافة مدينة جديدة',
			'geo.cityEdit' => 'تعديل مدينة',
			'geo.regions' => 'الأحياء',
			'geo.regionAdd' => 'إضافة حي جديد',
			'geo.regionEdit' => 'تعديل حي',
			'geo.nationalityAr' => 'الجنسية (عربي)',
			'geo.nationalityEn' => 'الجنسية (إنجليزي)',
			'geo.selectParentPrompt' => 'حدد عنصراً رئيسياً لإضافة سجل جديد',
			'master.title' => 'الأصناف',
			'master.setup' => 'إعدادات المخزون',
			'master.itemGroups' => 'مجموعات الأصناف',
			'master.warehouses' => 'المستودعات',
			'master.add' => 'إضافة صنف',
			'master.code' => 'رمز الصنف',
			'master.barcode' => 'الباركود',
			'master.type' => 'نوع الصنف',
			'master.costPrice' => 'سعر التكلفة',
			'master.baseUnit' => 'الوحدة الأساسية',
			'master.costingMethod' => 'طريقة التكلفة الافتراضية',
			'ops.title' => 'عمليات المخزون',
			'ops.incoming' => 'إدخال مخزني',
			'ops.outgoing' => 'إخراج مخزني',
			'ops.transfer' => 'تحويل مخزني',
			'ops.opening' => 'الرصيد الافتتاحي',
			'ops.quantity' => 'الكمية',
			'ops.unitCost' => 'تكلفة الوحدة',
			'ops.totalCost' => 'التكلفة الإجمالية',
			'params.title' => 'الإعدادات العامة',
			'params.defaultLanguage' => 'اللغة الافتراضية',
			'params.dateFormat' => 'تنسيق التاريخ',
			'params.baseCurrency' => 'العملة الأساسية',
			'params.currencies' => 'العملات',
			'params.currencyNameAr' => 'اسم العملة (عربي)',
			'params.currencyNameEn' => 'اسم العملة (إنجليزي)',
			'params.symbol' => 'الرمز',
			'params.exchangeRate' => 'سعر الصرف',
			'reports.title' => 'التقارير',
			'reports.trialBalance' => 'ميزان المراجعة',
			'reports.balanceSheet' => 'الميزانية العمومية',
			'reports.incomeStatement' => 'قائمة الدخل',
			'reports.cashFlow' => 'التدفقات النقدية',
			'setup.title' => 'إعدادات الأستاذ العام',
			'setup.docTypes' => 'أنواع المستندات',
			'setup.docTypeAdd' => 'إضافة نوع مستند',
			'setup.docTypeEdit' => 'تعديل نوع مستند',
			'setup.docTypeCode' => 'رمز النوع',
			'setup.descCoding' => 'ترميز البيانات',
			'setup.descCodingAdd' => 'إضافة ترميز بيان',
			'setup.descCodingEdit' => 'تعديل ترميز بيان',
			'setup.sequenceMethod' => 'طريقة الترقيم',
			'transactions.title' => 'الحركات',
			'transactions.journalVoucher' => 'سند قيد',
			'transactions.receiptVoucher' => 'سند قبض',
			'transactions.paymentVoucher' => 'سند صرف',
			'transactions.transferVoucher' => 'سند تحويل',
			'users.title' => 'إدارة المستخدمين',
			'users.add' => 'إضافة مستخدم جديد',
			'users.edit' => 'تعديل مستخدم',
			'users.fullNameAr' => 'الاسم الكامل (عربي)',
			'users.fullNameEn' => 'الاسم الكامل (إنجليزي)',
			'users.enableBiometric' => 'تفعيل البصمة',
			'users.linkToDevice' => 'ربط الجهاز',
			'users.isActive' => 'نشط',
			'users.isInactive' => 'غير نشط',
			'users.roleManagement' => 'إدارة الأدوار',
			'users.roleAdd' => 'إضافة دور جديد',
			'users.roleEdit' => 'تعديل دور',
			'users.roleName' => 'اسم الدور',
			'users.permissions' => 'الصلاحيات',
			'vouchers.journal' => 'قيد يومية',
			'vouchers.payment' => 'سند صرف',
			'vouchers.receipt' => 'سند قبض',
			'vouchers.reference' => 'رقم المرجع',
			'vouchers.debit' => 'مدين',
			'vouchers.credit' => 'دائن',
			'vouchers.difference' => 'الفرق',
			'vouchers.post' => 'ترحيل',
			'vouchers.reverse' => 'عكس القيد',
			'vouchers.lines' => 'الأسطر',
			'vouchers.addEntry' => 'إضافة قيد',
			'vouchers.confirmPost' => 'تأكيد الترحيل',
			'vouchers.postedMsg' => 'تم ترحيل السند بنجاح',
			'vouchers.paymentMethod' => 'طريقة الدفع',
			'vouchers.checkNumber' => 'رقم الشيك',
			'vouchers.beneficiary' => 'المستفيد',
			'vouchers.payer' => 'الدافع',
			_ => null,
		};
	}
}
