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
	@override String get success => 'نجاح';
	@override String get status => 'الحالة';
	@override String get description => 'الوصف';
	@override String get notes => 'ملاحظات';
	@override String get date => 'التاريخ';
	@override String get amount => 'المبلغ';
	@override String get total => 'الإجمالي';
	@override String get code => 'الرمز';
	@override String get nameAr => 'الاسم (عربي)';
	@override String get nameEn => 'الاسم (إنجليزي)';
	@override String get fullNameAr => 'الاسم الكامل (عربي)';
	@override String get fullNameEn => 'الاسم الكامل (إنجليزي)';
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
	@override String get confirmDelete => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟';
	@override String get accessDenied => 'تم رفض الوصول';
	@override String get viewList => 'عرض القائمة';
	@override String get filterOptions => 'خيارات التصفية';
	@override String get searchQuery => 'استعلام البحث';
	@override String get enterSearchTerm => 'أدخل عبارة البحث';
	@override String get voucherSavedSuccessfully => 'تم حفظ القسيمة بنجاح';
	@override String get confirmDeletion => 'تأكيد الحذف';
	@override String get confirmDeleteMessage => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟';
	@override String get create => 'إنشاء';
	@override String get approved => 'موافق عليه';
	@override String get rejected => 'مرفوض';
	@override String get pending => 'قيد الانتظار';
	@override String get draft => 'مسودة';
	@override String get cancelled => 'ملغى';
	@override String get posted => 'مرحل';
	@override String get reversed => 'معكوس';
	@override String get all => 'الكل';
	@override String get approve => 'موافقة';
	@override String get reject => 'رفض';
	@override String get approvedBy => 'وافق عليه';
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
	@override String get startSession => 'بدء الجرد';
	@override String get reservations => 'الحجوزات';
	@override String get reports => 'تقارير المخزون';
	@override String get balances => 'أرصدة المخزون';
	@override String get valuation => 'تقييم المخزون';
	@override String get movement => 'حركة الأصناف';
	@override String get stocktakingSessions => 'جلسات الجرد';
	@override String get manageStocktaking => 'إدارة جلسات الجرد';
	@override String get stocktakingInfo => 'عرض وإدارة جلسات الجرد';
	@override String get stockReservations => 'حجوزات المخزون';
	@override String get manageReservations => 'إدارة حجوزات المخزون';
	@override String get createReservation => 'إنشاء حجز';
	@override String get reservationInfo => 'إنشاء وإدارة حجوزات الأصناف';
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
	@override String get code => 'كود الصنف';
	@override String get barcode => 'باركود';
	@override String get type => 'نوع الصنف';
	@override String get costPrice => 'سعر التكلفة';
	@override String get baseUnit => 'الوحدة الأساسية';
	@override String get costingMethod => 'طريقة التكلفة الافتراضية';
	@override String get inventoryVariables => 'متغيرات المخزون';
}

// Path: ops
class _TranslationsOpsAr extends TranslationsOpsEn {
	_TranslationsOpsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'عمليات المخزون';
	@override String get incoming => 'الوارد';
	@override String get outgoing => 'الصادر';
	@override String get transfer => 'تحويل';
	@override String get opening => 'رصيد افتتاحي';
	@override String get quantity => 'الكمية';
	@override String get unitCost => 'سعر الوحدة';
	@override String get totalCost => 'إجمالي التكلفة';
	@override String get manageIncomingStock => 'إدارة الوارد';
	@override String get manageOutgoingStock => 'إدارة الصادر';
	@override String get addOpeningStock => 'إضافة رصيد افتتاحي';
	@override String get manageWarehouseTransfers => 'إدارة تحويلات المستودعات';
	@override String get createIncomingOrder => 'إنشاء أمر توريد';
	@override String get createOutgoingOrder => 'إنشاء أمر صرف';
	@override String get createTransfer => 'إنشاء تحويل';
	@override String get incomingStockOrders => 'أوامر التوريد';
	@override String get outgoingStockOrders => 'أوامر الصرف';
	@override String get warehouseTransfers => 'تحويلات المستودعات';
	@override String get transfers => 'التحويلات';
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
	@override String get title => 'التقارير المالية';
	@override String get trialBalance => 'ميزان المراجعة';
	@override String get incomeStatement => 'قائمة الدخل';
	@override String get balanceSheet => 'الميزانية العمومية';
	@override String get cashFlow => 'التدفقات النقدية';
	@override String get generalLedger => 'دفتر الأستاذ العام';
	@override String get accountStatement => 'كشف حساب';
	@override String get selectAccount => 'اختر حساب';
	@override String get asOfDate => 'بتاريخ';
	@override String get selectReport => 'اختر التقرير';
	@override String get trialBalanceDescription => 'عرض تقرير ميزان المراجعة';
	@override String get incomeStatementDescription => 'عرض قائمة الدخل';
	@override String get balanceSheetDescription => 'عرض الميزانية العمومية';
	@override String get cashFlowDescription => 'عرض قائمة التدفقات النقدية';
	@override String get accountStatementDescription => 'عرض كشف حساب';
	@override String get generalLedgerReport => 'دفتر الأستاذ العام';
	@override String get generalLedgerDescription => 'عرض دفتر الأستاذ العام';
	@override String get reportRefreshed => 'تم تحديث التقرير';
	@override String get exportReport => 'تصدير التقرير';
	@override String get exportToPdf => 'تصدير إلى PDF';
	@override String get exportToExcel => 'تصدير إلى Excel';
	@override String get exportToCsv => 'تصدير إلى CSV';
	@override String reportExportedSuccessfully({required String format}) => 'تم تصدير التقرير إلى ${format}';
	@override String get reportSentToPrinter => 'تم إرسال التقرير للطباعة';
	@override String get cashFlowStatement => 'قائمة التدفقات النقدية';
	@override String get toDate => 'إلى تاريخ';
	@override String get fromDate => 'من تاريخ';
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
	@override String get journalVoucher => 'قيد يومية';
	@override String get receiptVoucher => 'سند قبض';
	@override String get paymentVoucher => 'سند صرف';
	@override String get transferVoucher => 'سند تحويل';
	@override String get createAndManageJournalVouchers => 'إنشاء وإدارة قيود اليومية';
	@override String get managePaymentVouchers => 'إدارة سندات الصرف';
	@override String get manageReceiptVouchers => 'إدارة سندات القبض';
	@override String get manageCashAndBankAccounts => 'إدارة حسابات النقدية والبنوك';
	@override String get viewFinancialReportsAndStatements => 'عرض التقارير والقوائم المالية';
	@override String get manageTransactionRequests => 'إدارة طلبات المعاملات';
	@override String get reviewPostAndClosePeriods => 'مراجعة وترحيل وإغلاق الفترات';
	@override String get journalVouchers => 'قيود اليومية';
	@override String get paymentVouchers => 'سندات الصرف';
	@override String get receiptVouchers => 'سندات القبض';
	@override String get transactionRequests => 'طلبات المعاملات';
	@override String get allRequests => 'جميع الطلبات';
	@override String get myRequests => 'طلباتي';
	@override String get pendingApprovals => 'الموافقات المعلقة';
	@override String get createRequest => 'إنشاء طلب';
	@override String get editRequest => 'تعديل طلب';
	@override String get requestType => 'نوع الطلب';
	@override String get requestDate => 'تاريخ الطلب';
	@override String get requester => 'مقدم الطلب';
	@override String get approver => 'الموافق';
	@override String get approvalDate => 'تاريخ الموافقة';
	@override String get rejectionReason => 'سبب الرفض';
	@override String get pleaseEnterAmount => 'الرجاء إدخال المبلغ';
	@override String get pleaseEnterValidAmount => 'الرجاء إدخال مبلغ صحيح';
	@override String get pleaseEnterDescription => 'الرجاء إدخال الوصف';
	@override String get requestCreatedSuccessfully => 'تم إنشاء الطلب بنجاح';
	@override String get requestUpdatedSuccessfully => 'تم تحديث الطلب بنجاح';
	@override String get requestApprovedSuccessfully => 'تمت الموافقة على الطلب بنجاح';
	@override String get requestRejectedSuccessfully => 'تم رفض الطلب بنجاح';
	@override String get noRequestsFound => 'لم يتم العثور على طلبات';
	@override String get youHaveNotCreatedAnyRequests => 'لم تقم بإنشاء أي طلبات';
	@override String get noTransactionRequestsFound => 'لم يتم العثور على طلبات معاملات';
	@override String get failedToLoadRequests => 'فشل تحميل الطلبات';
	@override String get requestDetails => 'تفاصيل الطلب';
	@override String get noPendingApprovals => 'لا توجد موافقات معلقة';
	@override String get allRequestsHaveBeenProcessed => 'تمت معالجة جميع الطلبات';
	@override String get failedToLoadPendingApprovals => 'فشل تحميل الموافقات المعلقة';
	@override String get rejectRequest => 'رفض الطلب';
	@override String get pleaseProvideRejectionReason => 'الرجاء تقديم سبب الرفض';
	@override String get adjustmentEntry => 'قيد تسوية';
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
	@override String get reference => 'مرجع';
	@override String get debit => 'مدين';
	@override String get credit => 'دائن';
	@override String get difference => 'الفرق';
	@override String get post => 'ترحيل';
	@override String get reverse => 'عكس';
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
			'common.success' => 'نجاح',
			'common.status' => 'الحالة',
			'common.description' => 'الوصف',
			'common.notes' => 'ملاحظات',
			'common.date' => 'التاريخ',
			'common.amount' => 'المبلغ',
			'common.total' => 'الإجمالي',
			'common.code' => 'الرمز',
			'common.nameAr' => 'الاسم (عربي)',
			'common.nameEn' => 'الاسم (إنجليزي)',
			'common.fullNameAr' => 'الاسم الكامل (عربي)',
			'common.fullNameEn' => 'الاسم الكامل (إنجليزي)',
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
			'common.confirmDelete' => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟',
			'common.accessDenied' => 'تم رفض الوصول',
			'common.viewList' => 'عرض القائمة',
			'common.filterOptions' => 'خيارات التصفية',
			'common.searchQuery' => 'استعلام البحث',
			'common.enterSearchTerm' => 'أدخل عبارة البحث',
			'common.voucherSavedSuccessfully' => 'تم حفظ القسيمة بنجاح',
			'common.confirmDeletion' => 'تأكيد الحذف',
			'common.confirmDeleteMessage' => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟',
			'common.create' => 'إنشاء',
			'common.approved' => 'موافق عليه',
			'common.rejected' => 'مرفوض',
			'common.pending' => 'قيد الانتظار',
			'common.draft' => 'مسودة',
			'common.cancelled' => 'ملغى',
			'common.posted' => 'مرحل',
			'common.reversed' => 'معكوس',
			'common.all' => 'الكل',
			'common.approve' => 'موافقة',
			'common.reject' => 'رفض',
			'common.approvedBy' => 'وافق عليه',
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
			'control.startSession' => 'بدء الجرد',
			'control.reservations' => 'الحجوزات',
			'control.reports' => 'تقارير المخزون',
			'control.balances' => 'أرصدة المخزون',
			'control.valuation' => 'تقييم المخزون',
			'control.movement' => 'حركة الأصناف',
			'control.stocktakingSessions' => 'جلسات الجرد',
			'control.manageStocktaking' => 'إدارة جلسات الجرد',
			'control.stocktakingInfo' => 'عرض وإدارة جلسات الجرد',
			'control.stockReservations' => 'حجوزات المخزون',
			'control.manageReservations' => 'إدارة حجوزات المخزون',
			'control.createReservation' => 'إنشاء حجز',
			'control.reservationInfo' => 'إنشاء وإدارة حجوزات الأصناف',
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
			'master.code' => 'كود الصنف',
			'master.barcode' => 'باركود',
			'master.type' => 'نوع الصنف',
			'master.costPrice' => 'سعر التكلفة',
			'master.baseUnit' => 'الوحدة الأساسية',
			'master.costingMethod' => 'طريقة التكلفة الافتراضية',
			'master.inventoryVariables' => 'متغيرات المخزون',
			'ops.title' => 'عمليات المخزون',
			'ops.incoming' => 'الوارد',
			'ops.outgoing' => 'الصادر',
			'ops.transfer' => 'تحويل',
			'ops.opening' => 'رصيد افتتاحي',
			'ops.quantity' => 'الكمية',
			'ops.unitCost' => 'سعر الوحدة',
			'ops.totalCost' => 'إجمالي التكلفة',
			'ops.manageIncomingStock' => 'إدارة الوارد',
			'ops.manageOutgoingStock' => 'إدارة الصادر',
			'ops.addOpeningStock' => 'إضافة رصيد افتتاحي',
			'ops.manageWarehouseTransfers' => 'إدارة تحويلات المستودعات',
			'ops.createIncomingOrder' => 'إنشاء أمر توريد',
			'ops.createOutgoingOrder' => 'إنشاء أمر صرف',
			'ops.createTransfer' => 'إنشاء تحويل',
			'ops.incomingStockOrders' => 'أوامر التوريد',
			'ops.outgoingStockOrders' => 'أوامر الصرف',
			'ops.warehouseTransfers' => 'تحويلات المستودعات',
			'ops.transfers' => 'التحويلات',
			'params.title' => 'الإعدادات العامة',
			'params.defaultLanguage' => 'اللغة الافتراضية',
			'params.dateFormat' => 'تنسيق التاريخ',
			'params.baseCurrency' => 'العملة الأساسية',
			'params.currencies' => 'العملات',
			'params.currencyNameAr' => 'اسم العملة (عربي)',
			'params.currencyNameEn' => 'اسم العملة (إنجليزي)',
			'params.symbol' => 'الرمز',
			'params.exchangeRate' => 'سعر الصرف',
			'reports.title' => 'التقارير المالية',
			'reports.trialBalance' => 'ميزان المراجعة',
			'reports.incomeStatement' => 'قائمة الدخل',
			'reports.balanceSheet' => 'الميزانية العمومية',
			'reports.cashFlow' => 'التدفقات النقدية',
			'reports.generalLedger' => 'دفتر الأستاذ العام',
			'reports.accountStatement' => 'كشف حساب',
			'reports.selectAccount' => 'اختر حساب',
			'reports.asOfDate' => 'بتاريخ',
			'reports.selectReport' => 'اختر التقرير',
			'reports.trialBalanceDescription' => 'عرض تقرير ميزان المراجعة',
			'reports.incomeStatementDescription' => 'عرض قائمة الدخل',
			'reports.balanceSheetDescription' => 'عرض الميزانية العمومية',
			'reports.cashFlowDescription' => 'عرض قائمة التدفقات النقدية',
			'reports.accountStatementDescription' => 'عرض كشف حساب',
			'reports.generalLedgerReport' => 'دفتر الأستاذ العام',
			'reports.generalLedgerDescription' => 'عرض دفتر الأستاذ العام',
			'reports.reportRefreshed' => 'تم تحديث التقرير',
			'reports.exportReport' => 'تصدير التقرير',
			'reports.exportToPdf' => 'تصدير إلى PDF',
			'reports.exportToExcel' => 'تصدير إلى Excel',
			'reports.exportToCsv' => 'تصدير إلى CSV',
			'reports.reportExportedSuccessfully' => ({required String format}) => 'تم تصدير التقرير إلى ${format}',
			'reports.reportSentToPrinter' => 'تم إرسال التقرير للطباعة',
			'reports.cashFlowStatement' => 'قائمة التدفقات النقدية',
			'reports.toDate' => 'إلى تاريخ',
			'reports.fromDate' => 'من تاريخ',
			'setup.title' => 'إعدادات الأستاذ العام',
			'setup.docTypes' => 'أنواع المستندات',
			'setup.docTypeAdd' => 'إضافة نوع مستند',
			'setup.docTypeEdit' => 'تعديل نوع مستند',
			'setup.docTypeCode' => 'رمز النوع',
			'setup.descCoding' => 'ترميز البيانات',
			'setup.descCodingAdd' => 'إضافة ترميز بيان',
			'setup.descCodingEdit' => 'تعديل ترميز بيان',
			'setup.sequenceMethod' => 'طريقة الترقيم',
			'transactions.journalVoucher' => 'قيد يومية',
			'transactions.receiptVoucher' => 'سند قبض',
			'transactions.paymentVoucher' => 'سند صرف',
			'transactions.transferVoucher' => 'سند تحويل',
			'transactions.createAndManageJournalVouchers' => 'إنشاء وإدارة قيود اليومية',
			'transactions.managePaymentVouchers' => 'إدارة سندات الصرف',
			'transactions.manageReceiptVouchers' => 'إدارة سندات القبض',
			'transactions.manageCashAndBankAccounts' => 'إدارة حسابات النقدية والبنوك',
			'transactions.viewFinancialReportsAndStatements' => 'عرض التقارير والقوائم المالية',
			'transactions.manageTransactionRequests' => 'إدارة طلبات المعاملات',
			'transactions.reviewPostAndClosePeriods' => 'مراجعة وترحيل وإغلاق الفترات',
			'transactions.journalVouchers' => 'قيود اليومية',
			'transactions.paymentVouchers' => 'سندات الصرف',
			'transactions.receiptVouchers' => 'سندات القبض',
			'transactions.transactionRequests' => 'طلبات المعاملات',
			'transactions.allRequests' => 'جميع الطلبات',
			'transactions.myRequests' => 'طلباتي',
			'transactions.pendingApprovals' => 'الموافقات المعلقة',
			'transactions.createRequest' => 'إنشاء طلب',
			'transactions.editRequest' => 'تعديل طلب',
			'transactions.requestType' => 'نوع الطلب',
			'transactions.requestDate' => 'تاريخ الطلب',
			'transactions.requester' => 'مقدم الطلب',
			'transactions.approver' => 'الموافق',
			'transactions.approvalDate' => 'تاريخ الموافقة',
			'transactions.rejectionReason' => 'سبب الرفض',
			'transactions.pleaseEnterAmount' => 'الرجاء إدخال المبلغ',
			'transactions.pleaseEnterValidAmount' => 'الرجاء إدخال مبلغ صحيح',
			'transactions.pleaseEnterDescription' => 'الرجاء إدخال الوصف',
			'transactions.requestCreatedSuccessfully' => 'تم إنشاء الطلب بنجاح',
			'transactions.requestUpdatedSuccessfully' => 'تم تحديث الطلب بنجاح',
			'transactions.requestApprovedSuccessfully' => 'تمت الموافقة على الطلب بنجاح',
			'transactions.requestRejectedSuccessfully' => 'تم رفض الطلب بنجاح',
			'transactions.noRequestsFound' => 'لم يتم العثور على طلبات',
			'transactions.youHaveNotCreatedAnyRequests' => 'لم تقم بإنشاء أي طلبات',
			'transactions.noTransactionRequestsFound' => 'لم يتم العثور على طلبات معاملات',
			'transactions.failedToLoadRequests' => 'فشل تحميل الطلبات',
			'transactions.requestDetails' => 'تفاصيل الطلب',
			'transactions.noPendingApprovals' => 'لا توجد موافقات معلقة',
			'transactions.allRequestsHaveBeenProcessed' => 'تمت معالجة جميع الطلبات',
			'transactions.failedToLoadPendingApprovals' => 'فشل تحميل الموافقات المعلقة',
			'transactions.rejectRequest' => 'رفض الطلب',
			'transactions.pleaseProvideRejectionReason' => 'الرجاء تقديم سبب الرفض',
			'transactions.adjustmentEntry' => 'قيد تسوية',
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
			'vouchers.reference' => 'مرجع',
			'vouchers.debit' => 'مدين',
			'vouchers.credit' => 'دائن',
			'vouchers.difference' => 'الفرق',
			'vouchers.post' => 'ترحيل',
			'vouchers.reverse' => 'عكس',
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
