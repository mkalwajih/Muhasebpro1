/// Generated file. Do not edit.
///
/// Original: lib/l10n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 508 (254 per locale)
///
/// Built on 2025-12-30 at 19:46 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ar(languageCode: 'ar', build: _TranslationsAr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsAuthEn auth = _TranslationsAuthEn._(_root);
	late final _TranslationsCoaEn coa = _TranslationsCoaEn._(_root);
	late final _TranslationsCoaSetupEn coa_setup = _TranslationsCoaSetupEn._(_root);
	late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
	late final _TranslationsCompanyEn company = _TranslationsCompanyEn._(_root);
	late final _TranslationsControlEn control = _TranslationsControlEn._(_root);
	late final _TranslationsDashboardEn dashboard = _TranslationsDashboardEn._(_root);
	late final _TranslationsDefaultsEn defaults = _TranslationsDefaultsEn._(_root);
	late final _TranslationsFinanceConfigEn finance_config = _TranslationsFinanceConfigEn._(_root);
	late final _TranslationsGeoEn geo = _TranslationsGeoEn._(_root);
	late final _TranslationsMasterEn master = _TranslationsMasterEn._(_root);
	late final _TranslationsOpsEn ops = _TranslationsOpsEn._(_root);
	late final _TranslationsParamsEn params = _TranslationsParamsEn._(_root);
	late final _TranslationsReportsEn reports = _TranslationsReportsEn._(_root);
	late final _TranslationsSetupEn setup = _TranslationsSetupEn._(_root);
	late final _TranslationsTransactionsEn transactions = _TranslationsTransactionsEn._(_root);
	late final _TranslationsUsersEn users = _TranslationsUsersEn._(_root);
	late final _TranslationsVouchersEn vouchers = _TranslationsVouchersEn._(_root);
}

// Path: auth
class _TranslationsAuthEn {
	_TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'MuhasebPro';
	String get subtitle => 'Sign in to your account';
	String get username => 'Username';
	String get password => 'Password';
	String get confirmPassword => 'Confirm Password';
	String get login => 'Login';
	String get logout => 'Logout';
	String get register => 'Register';
	String get forgotPassword => 'Forgot Password?';
	String get resetPassword => 'Reset Password';
	String get welcome => 'Welcome';
	String get registrationSuccess => 'Registration successful';
	String get userInactive => 'This account is inactive';
	String get invalidCredentials => 'Invalid username or password';
	String get passwordMismatch => 'Passwords do not match';
	String get passwordLength => 'Password must be at least 6 characters';
}

// Path: coa
class _TranslationsCoaEn {
	_TranslationsCoaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Chart of Accounts';
	String get accountCode => 'Account Code';
	String get accountNameAr => 'Account Name (Arabic)';
	String get accountNameEn => 'Account Name (English)';
	String get parentAccount => 'Parent Account';
	String get accountNature => 'Account Nature';
	String get reportType => 'Report Type';
	String get selectAccountPrompt => 'Select an account to view details';
}

// Path: coa_setup
class _TranslationsCoaSetupEn {
	_TranslationsCoaSetupEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Chart of Accounts';
	String get accountCode => 'Account Code';
	String get parentAccount => 'Parent Account';
	String get nature => 'Nature';
	String get reportType => 'Report Type';
	String get level => 'Level';
	String get detailType => 'Detail Account Type';
	String get cashFlowType => 'Cash Flow Type';
	String get noParent => 'No Parent';
	String get debit => 'Debit';
	String get credit => 'Credit';
}

// Path: common
class _TranslationsCommonEn {
	_TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get save => 'Save';
	String get cancel => 'Cancel';
	String get delete => 'Delete';
	String get edit => 'Edit';
	String get add => 'Add';
	String get addNew => 'Add New';
	String get update => 'Update';
	String get submit => 'Submit';
	String get confirm => 'Confirm';
	String get close => 'Close';
	String get search => 'Search';
	String get filter => 'Filter';
	String get apply => 'Apply';
	String get reset => 'Reset';
	String get refresh => 'Refresh';
	String get details => 'Details';
	String get actions => 'Actions';
	String get yes => 'Yes';
	String get no => 'No';
	String get active => 'Active';
	String get inactive => 'Inactive';
	String get loading => 'Loading...';
	String get error => 'Error';
	String get success => 'Success';
	String get status => 'Status';
	String get description => 'Description';
	String get notes => 'Notes';
	String get date => 'Date';
	String get amount => 'Amount';
	String get total => 'Total';
	String get code => 'Code';
	String get nameAr => 'Name (Arabic)';
	String get nameEn => 'Name (English)';
	String get logo => 'Logo';
	String get uploadLogo => 'Upload Logo';
	String get export => 'Export';
	String get print => 'Print';
	String get fromDate => 'From Date';
	String get toDate => 'To Date';
	String get requiredField => 'Required Field';
	String get comingSoon => 'Coming Soon!';
	String get saveSuccess => 'Saved successfully';
	String get saveFailed => 'Failed to save';
	String get deleteSuccess => 'Deleted successfully';
	String get deleteFailed => 'Failed to delete';
	String get confirmDelete => 'Are you sure you want to delete this item?';
	String get accessDenied => 'Access Denied';
}

// Path: company
class _TranslationsCompanyEn {
	_TranslationsCompanyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Company Info';
	String get add => 'Add New Company';
	String get edit => 'Edit Company';
	String get companyCode => 'Company Code';
	String get taxNumber => 'Tax Number';
	String get regNumber => 'Commercial Registration No.';
	String get isMainCompany => 'Main Company';
	String get address => 'Address';
	String get phone => 'Phone';
	String get email => 'Email';
	String get selectPrompt => 'Select a company from the list to view details.';
	String get noCompanies => 'No companies created yet.';
	String get branchTitle => 'Branches';
	String get branchAdd => 'Add New Branch';
	String get branchEdit => 'Edit Branch';
	String get branchCode => 'Branch Code';
	String get branchGroup => 'Branch Group';
	String get defaultWarehouse => 'Default Warehouse';
	String get selectOrCreateBranch => 'Select a branch or create a new one';
}

// Path: control
class _TranslationsControlEn {
	_TranslationsControlEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Inventory Control';
	String get stocktaking => 'Stocktaking';
	String get startSession => 'Start Stocktaking';
	String get reservations => 'Reservations';
	String get reports => 'Inventory Reports';
	String get balances => 'Stock Balances';
	String get valuation => 'Stock Valuation';
	String get movement => 'Item Movement';
}

// Path: dashboard
class _TranslationsDashboardEn {
	_TranslationsDashboardEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get systemSetup => 'System Setup';
	String get generalLedger => 'General Ledger';
	String get inventory => 'Inventory';
	String get vendors => 'Vendors';
	String get customers => 'Customers';
	String get reports => 'Reports';
}

// Path: defaults
class _TranslationsDefaultsEn {
	_TranslationsDefaultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Defaults';
	String get defaultAccounts => 'Default Accounts';
	String get defaultItems => 'Default Items';
	String get defaultUnits => 'Default Units';
	String get defaultPayment => 'Default Payment Methods';
	String get defaultSales => 'Default Sales Accounts';
	String get defaultPurchases => 'Default Purchases Accounts';
}

// Path: finance_config
class _TranslationsFinanceConfigEn {
	_TranslationsFinanceConfigEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get paramsTitle => 'General Parameters';
	String get language => 'Language';
	String get dateFormat => 'Date Format';
	String get calendarType => 'Calendar Type';
	String get backupSettings => 'Backup Settings';
	String get currencyTitle => 'Currencies';
	String get currencyAdd => 'Add New Currency';
	String get currencyEdit => 'Edit Currency';
	String get baseCurrency => 'Base Currency';
	String get exchangeRate => 'Exchange Rate';
	String get decimalPlaces => 'Decimal Places';
	String get denominations => 'Denominations';
	String get denomAdd => 'Add New Denomination';
	String get denomEdit => 'Edit Denomination';
	String get symbol => 'Symbol';
	String get taxTitle => 'Tax Settings';
	String get taxBrackets => 'Tax Brackets';
	String get taxBracketAdd => 'Add New Tax Bracket';
	String get taxBracketEdit => 'Edit Tax Bracket';
	String get taxTypes => 'Tax Types';
	String get taxTypeAdd => 'Add New Tax Type';
	String get taxTypeEdit => 'Edit Tax Type';
	String get taxRate => 'Tax Rate';
	String get isCompound => 'Is Compound';
	String get calcMethod => 'Calculation Method';
	String get calcMethodAdd => 'Add New Calculation Method';
	String get calcMethodEdit => 'Edit Calculation Method';
	String get periodTitle => 'Financial Periods';
	String get periodAdd => 'Add Financial Period';
	String get periodEdit => 'Edit Financial Period';
	String get fiscalYear => 'Fiscal Year';
	String get generatePeriods => 'Generate Periods';
	String get lockPeriod => 'Lock Period';
	String get isLocked => 'Locked';
	String get unlocked => 'Unlocked';
}

// Path: geo
class _TranslationsGeoEn {
	_TranslationsGeoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Geographical Data';
	String get zones => 'Zones';
	String get zoneAdd => 'Add New Zone';
	String get zoneEdit => 'Edit Zone';
	String get countries => 'Countries';
	String get countryAdd => 'Add New Country';
	String get countryEdit => 'Edit Country';
	String get governorates => 'Governorates';
	String get governorateAdd => 'Add New Governorate';
	String get governorateEdit => 'Edit Governorate';
	String get cities => 'Cities';
	String get cityAdd => 'Add New City';
	String get cityEdit => 'Edit City';
	String get regions => 'Regions';
	String get regionAdd => 'Add New Region';
	String get regionEdit => 'Edit Region';
	String get nationalityAr => 'Nationality (Arabic)';
	String get nationalityEn => 'Nationality (English)';
	String get selectParentPrompt => 'Select a parent item to add new record';
}

// Path: master
class _TranslationsMasterEn {
	_TranslationsMasterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Items';
	String get setup => 'Inventory Setup';
	String get itemGroups => 'Item Groups';
	String get warehouses => 'Warehouses';
	String get add => 'Add Item';
	String get code => 'Item Code';
	String get barcode => 'Barcode';
	String get type => 'Item Type';
	String get costPrice => 'Cost Price';
	String get baseUnit => 'Base Unit';
	String get costingMethod => 'Default Costing Method';
}

// Path: ops
class _TranslationsOpsEn {
	_TranslationsOpsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Stock Operations';
	String get incoming => 'Incoming Stock';
	String get outgoing => 'Outgoing Stock';
	String get transfer => 'Transfer';
	String get opening => 'Opening Stock';
	String get quantity => 'Quantity';
	String get unitCost => 'Unit Cost';
	String get totalCost => 'Total Cost';
}

// Path: params
class _TranslationsParamsEn {
	_TranslationsParamsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'General Parameters';
	String get defaultLanguage => 'Default Language';
	String get dateFormat => 'Date Format';
	String get baseCurrency => 'Base Currency';
	String get currencies => 'Currencies';
	String get currencyNameAr => 'Currency Name (Arabic)';
	String get currencyNameEn => 'Currency Name (English)';
	String get symbol => 'Symbol';
	String get exchangeRate => 'Exchange Rate';
}

// Path: reports
class _TranslationsReportsEn {
	_TranslationsReportsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Reports';
	String get trialBalance => 'Trial Balance';
	String get balanceSheet => 'Balance Sheet';
	String get incomeStatement => 'Income Statement';
	String get cashFlow => 'Cash Flow';
}

// Path: setup
class _TranslationsSetupEn {
	_TranslationsSetupEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'GL Setup & Config';
	String get docTypes => 'Document Types';
	String get docTypeAdd => 'Add Document Type';
	String get docTypeEdit => 'Edit Document Type';
	String get docTypeCode => 'Type Code';
	String get descCoding => 'Description Coding';
	String get descCodingAdd => 'Add Description Coding';
	String get descCodingEdit => 'Edit Description Coding';
	String get sequenceMethod => 'Sequence Method';
}

// Path: transactions
class _TranslationsTransactionsEn {
	_TranslationsTransactionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Transactions';
	String get journalVoucher => 'Journal Voucher';
	String get receiptVoucher => 'Receipt Voucher';
	String get paymentVoucher => 'Payment Voucher';
	String get transferVoucher => 'Transfer Voucher';
}

// Path: users
class _TranslationsUsersEn {
	_TranslationsUsersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'User Management';
	String get add => 'Add New User';
	String get edit => 'Edit User';
	String get fullNameAr => 'Full Name (Arabic)';
	String get fullNameEn => 'Full Name (English)';
	String get enableBiometric => 'Enable Biometric';
	String get linkToDevice => 'Link to Device';
	String get isActive => 'Active';
	String get isInactive => 'Inactive';
	String get roleManagement => 'Role Management';
	String get roleAdd => 'Add New Role';
	String get roleEdit => 'Edit Role';
	String get roleName => 'Role Name';
	String get permissions => 'Permissions';
}

// Path: vouchers
class _TranslationsVouchersEn {
	_TranslationsVouchersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get journal => 'Journal Voucher';
	String get payment => 'Payment Voucher';
	String get receipt => 'Receipt Voucher';
	String get reference => 'Reference No';
	String get debit => 'Debit';
	String get credit => 'Credit';
	String get difference => 'Difference';
	String get post => 'Post';
	String get reverse => 'Reverse';
	String get lines => 'Lines';
	String get addEntry => 'Add Entry';
	String get confirmPost => 'Confirm Posting';
	String get postedMsg => 'Voucher posted successfully';
	String get paymentMethod => 'Payment Method';
	String get checkNumber => 'Check Number';
	String get beneficiary => 'Beneficiary';
	String get payer => 'Payer';
}

// Path: <root>
class _TranslationsAr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsAr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsAr _root = this; // ignore: unused_field

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
class _TranslationsAuthAr implements _TranslationsAuthEn {
	_TranslationsAuthAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'محاسب برو';
	@override String get subtitle => 'سجل الدخول إلى حسابك';
	@override String get username => 'اسم المستخدم';
	@override String get password => 'كلمة المرور';
	@override String get confirmPassword => 'تأكيد كلمة المرور';
	@override String get login => 'تسجيل الدخول';
	@override String get logout => 'تسجيل الخروج';
	@override String get register => 'تسجيل جديد';
	@override String get forgotPassword => 'نسيت كلمة المرور؟';
	@override String get resetPassword => 'إعادة تعيين كلمة المرور';
	@override String get welcome => 'أهلاً بك';
	@override String get registrationSuccess => 'تم التسجيل بنجاح';
	@override String get userInactive => 'هذا الحساب غير نشط';
	@override String get invalidCredentials => 'اسم المستخدم أو كلمة المرور غير صحيحة';
	@override String get passwordMismatch => 'كلمتا المرور غير متطابقتين';
	@override String get passwordLength => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
}

// Path: coa
class _TranslationsCoaAr implements _TranslationsCoaEn {
	_TranslationsCoaAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsCoaSetupAr implements _TranslationsCoaSetupEn {
	_TranslationsCoaSetupAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsCommonAr implements _TranslationsCommonEn {
	_TranslationsCommonAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
	@override String get actions => 'الإجراءات';
	@override String get yes => 'نعم';
	@override String get no => 'لا';
	@override String get active => 'نشط';
	@override String get inactive => 'غير نشط';
	@override String get loading => 'جاري التحميل...';
	@override String get error => 'خطأ';
	@override String get success => 'نجاح';
	@override String get status => 'الحالة';
	@override String get description => 'البيان';
	@override String get notes => 'ملاحظات';
	@override String get date => 'التاريخ';
	@override String get amount => 'المبلغ';
	@override String get total => 'المجموع';
	@override String get code => 'الرمز';
	@override String get nameAr => 'الاسم (عربي)';
	@override String get nameEn => 'الاسم (إنجليزي)';
	@override String get logo => 'الشعار';
	@override String get uploadLogo => 'تحميل الشعار';
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
}

// Path: company
class _TranslationsCompanyAr implements _TranslationsCompanyEn {
	_TranslationsCompanyAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsControlAr implements _TranslationsControlEn {
	_TranslationsControlAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsDashboardAr implements _TranslationsDashboardEn {
	_TranslationsDashboardAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get systemSetup => 'إعدادات النظام';
	@override String get generalLedger => 'الأستاذ العام';
	@override String get inventory => 'المخزون';
	@override String get vendors => 'الموردون';
	@override String get customers => 'العملاء';
	@override String get reports => 'التقارير';
}

// Path: defaults
class _TranslationsDefaultsAr implements _TranslationsDefaultsEn {
	_TranslationsDefaultsAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsFinanceConfigAr implements _TranslationsFinanceConfigEn {
	_TranslationsFinanceConfigAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsGeoAr implements _TranslationsGeoEn {
	_TranslationsGeoAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsMasterAr implements _TranslationsMasterEn {
	_TranslationsMasterAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsOpsAr implements _TranslationsOpsEn {
	_TranslationsOpsAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsParamsAr implements _TranslationsParamsEn {
	_TranslationsParamsAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsReportsAr implements _TranslationsReportsEn {
	_TranslationsReportsAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'التقارير';
	@override String get trialBalance => 'ميزان المراجعة';
	@override String get balanceSheet => 'الميزانية العمومية';
	@override String get incomeStatement => 'قائمة الدخل';
	@override String get cashFlow => 'التدفقات النقدية';
}

// Path: setup
class _TranslationsSetupAr implements _TranslationsSetupEn {
	_TranslationsSetupAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsTransactionsAr implements _TranslationsTransactionsEn {
	_TranslationsTransactionsAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الحركات';
	@override String get journalVoucher => 'سند قيد';
	@override String get receiptVoucher => 'سند قبض';
	@override String get paymentVoucher => 'سند صرف';
	@override String get transferVoucher => 'سند تحويل';
}

// Path: users
class _TranslationsUsersAr implements _TranslationsUsersEn {
	_TranslationsUsersAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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
class _TranslationsVouchersAr implements _TranslationsVouchersEn {
	_TranslationsVouchersAr._(this._root);

	@override final _TranslationsAr _root; // ignore: unused_field

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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'auth.title': return 'MuhasebPro';
			case 'auth.subtitle': return 'Sign in to your account';
			case 'auth.username': return 'Username';
			case 'auth.password': return 'Password';
			case 'auth.confirmPassword': return 'Confirm Password';
			case 'auth.login': return 'Login';
			case 'auth.logout': return 'Logout';
			case 'auth.register': return 'Register';
			case 'auth.forgotPassword': return 'Forgot Password?';
			case 'auth.resetPassword': return 'Reset Password';
			case 'auth.welcome': return 'Welcome';
			case 'auth.registrationSuccess': return 'Registration successful';
			case 'auth.userInactive': return 'This account is inactive';
			case 'auth.invalidCredentials': return 'Invalid username or password';
			case 'auth.passwordMismatch': return 'Passwords do not match';
			case 'auth.passwordLength': return 'Password must be at least 6 characters';
			case 'coa.title': return 'Chart of Accounts';
			case 'coa.accountCode': return 'Account Code';
			case 'coa.accountNameAr': return 'Account Name (Arabic)';
			case 'coa.accountNameEn': return 'Account Name (English)';
			case 'coa.parentAccount': return 'Parent Account';
			case 'coa.accountNature': return 'Account Nature';
			case 'coa.reportType': return 'Report Type';
			case 'coa.selectAccountPrompt': return 'Select an account to view details';
			case 'coa_setup.title': return 'Chart of Accounts';
			case 'coa_setup.accountCode': return 'Account Code';
			case 'coa_setup.parentAccount': return 'Parent Account';
			case 'coa_setup.nature': return 'Nature';
			case 'coa_setup.reportType': return 'Report Type';
			case 'coa_setup.level': return 'Level';
			case 'coa_setup.detailType': return 'Detail Account Type';
			case 'coa_setup.cashFlowType': return 'Cash Flow Type';
			case 'coa_setup.noParent': return 'No Parent';
			case 'coa_setup.debit': return 'Debit';
			case 'coa_setup.credit': return 'Credit';
			case 'common.save': return 'Save';
			case 'common.cancel': return 'Cancel';
			case 'common.delete': return 'Delete';
			case 'common.edit': return 'Edit';
			case 'common.add': return 'Add';
			case 'common.addNew': return 'Add New';
			case 'common.update': return 'Update';
			case 'common.submit': return 'Submit';
			case 'common.confirm': return 'Confirm';
			case 'common.close': return 'Close';
			case 'common.search': return 'Search';
			case 'common.filter': return 'Filter';
			case 'common.apply': return 'Apply';
			case 'common.reset': return 'Reset';
			case 'common.refresh': return 'Refresh';
			case 'common.details': return 'Details';
			case 'common.actions': return 'Actions';
			case 'common.yes': return 'Yes';
			case 'common.no': return 'No';
			case 'common.active': return 'Active';
			case 'common.inactive': return 'Inactive';
			case 'common.loading': return 'Loading...';
			case 'common.error': return 'Error';
			case 'common.success': return 'Success';
			case 'common.status': return 'Status';
			case 'common.description': return 'Description';
			case 'common.notes': return 'Notes';
			case 'common.date': return 'Date';
			case 'common.amount': return 'Amount';
			case 'common.total': return 'Total';
			case 'common.code': return 'Code';
			case 'common.nameAr': return 'Name (Arabic)';
			case 'common.nameEn': return 'Name (English)';
			case 'common.logo': return 'Logo';
			case 'common.uploadLogo': return 'Upload Logo';
			case 'common.export': return 'Export';
			case 'common.print': return 'Print';
			case 'common.fromDate': return 'From Date';
			case 'common.toDate': return 'To Date';
			case 'common.requiredField': return 'Required Field';
			case 'common.comingSoon': return 'Coming Soon!';
			case 'common.saveSuccess': return 'Saved successfully';
			case 'common.saveFailed': return 'Failed to save';
			case 'common.deleteSuccess': return 'Deleted successfully';
			case 'common.deleteFailed': return 'Failed to delete';
			case 'common.confirmDelete': return 'Are you sure you want to delete this item?';
			case 'common.accessDenied': return 'Access Denied';
			case 'company.title': return 'Company Info';
			case 'company.add': return 'Add New Company';
			case 'company.edit': return 'Edit Company';
			case 'company.companyCode': return 'Company Code';
			case 'company.taxNumber': return 'Tax Number';
			case 'company.regNumber': return 'Commercial Registration No.';
			case 'company.isMainCompany': return 'Main Company';
			case 'company.address': return 'Address';
			case 'company.phone': return 'Phone';
			case 'company.email': return 'Email';
			case 'company.selectPrompt': return 'Select a company from the list to view details.';
			case 'company.noCompanies': return 'No companies created yet.';
			case 'company.branchTitle': return 'Branches';
			case 'company.branchAdd': return 'Add New Branch';
			case 'company.branchEdit': return 'Edit Branch';
			case 'company.branchCode': return 'Branch Code';
			case 'company.branchGroup': return 'Branch Group';
			case 'company.defaultWarehouse': return 'Default Warehouse';
			case 'company.selectOrCreateBranch': return 'Select a branch or create a new one';
			case 'control.title': return 'Inventory Control';
			case 'control.stocktaking': return 'Stocktaking';
			case 'control.startSession': return 'Start Stocktaking';
			case 'control.reservations': return 'Reservations';
			case 'control.reports': return 'Inventory Reports';
			case 'control.balances': return 'Stock Balances';
			case 'control.valuation': return 'Stock Valuation';
			case 'control.movement': return 'Item Movement';
			case 'dashboard.systemSetup': return 'System Setup';
			case 'dashboard.generalLedger': return 'General Ledger';
			case 'dashboard.inventory': return 'Inventory';
			case 'dashboard.vendors': return 'Vendors';
			case 'dashboard.customers': return 'Customers';
			case 'dashboard.reports': return 'Reports';
			case 'defaults.title': return 'Defaults';
			case 'defaults.defaultAccounts': return 'Default Accounts';
			case 'defaults.defaultItems': return 'Default Items';
			case 'defaults.defaultUnits': return 'Default Units';
			case 'defaults.defaultPayment': return 'Default Payment Methods';
			case 'defaults.defaultSales': return 'Default Sales Accounts';
			case 'defaults.defaultPurchases': return 'Default Purchases Accounts';
			case 'finance_config.paramsTitle': return 'General Parameters';
			case 'finance_config.language': return 'Language';
			case 'finance_config.dateFormat': return 'Date Format';
			case 'finance_config.calendarType': return 'Calendar Type';
			case 'finance_config.backupSettings': return 'Backup Settings';
			case 'finance_config.currencyTitle': return 'Currencies';
			case 'finance_config.currencyAdd': return 'Add New Currency';
			case 'finance_config.currencyEdit': return 'Edit Currency';
			case 'finance_config.baseCurrency': return 'Base Currency';
			case 'finance_config.exchangeRate': return 'Exchange Rate';
			case 'finance_config.decimalPlaces': return 'Decimal Places';
			case 'finance_config.denominations': return 'Denominations';
			case 'finance_config.denomAdd': return 'Add New Denomination';
			case 'finance_config.denomEdit': return 'Edit Denomination';
			case 'finance_config.symbol': return 'Symbol';
			case 'finance_config.taxTitle': return 'Tax Settings';
			case 'finance_config.taxBrackets': return 'Tax Brackets';
			case 'finance_config.taxBracketAdd': return 'Add New Tax Bracket';
			case 'finance_config.taxBracketEdit': return 'Edit Tax Bracket';
			case 'finance_config.taxTypes': return 'Tax Types';
			case 'finance_config.taxTypeAdd': return 'Add New Tax Type';
			case 'finance_config.taxTypeEdit': return 'Edit Tax Type';
			case 'finance_config.taxRate': return 'Tax Rate';
			case 'finance_config.isCompound': return 'Is Compound';
			case 'finance_config.calcMethod': return 'Calculation Method';
			case 'finance_config.calcMethodAdd': return 'Add New Calculation Method';
			case 'finance_config.calcMethodEdit': return 'Edit Calculation Method';
			case 'finance_config.periodTitle': return 'Financial Periods';
			case 'finance_config.periodAdd': return 'Add Financial Period';
			case 'finance_config.periodEdit': return 'Edit Financial Period';
			case 'finance_config.fiscalYear': return 'Fiscal Year';
			case 'finance_config.generatePeriods': return 'Generate Periods';
			case 'finance_config.lockPeriod': return 'Lock Period';
			case 'finance_config.isLocked': return 'Locked';
			case 'finance_config.unlocked': return 'Unlocked';
			case 'geo.title': return 'Geographical Data';
			case 'geo.zones': return 'Zones';
			case 'geo.zoneAdd': return 'Add New Zone';
			case 'geo.zoneEdit': return 'Edit Zone';
			case 'geo.countries': return 'Countries';
			case 'geo.countryAdd': return 'Add New Country';
			case 'geo.countryEdit': return 'Edit Country';
			case 'geo.governorates': return 'Governorates';
			case 'geo.governorateAdd': return 'Add New Governorate';
			case 'geo.governorateEdit': return 'Edit Governorate';
			case 'geo.cities': return 'Cities';
			case 'geo.cityAdd': return 'Add New City';
			case 'geo.cityEdit': return 'Edit City';
			case 'geo.regions': return 'Regions';
			case 'geo.regionAdd': return 'Add New Region';
			case 'geo.regionEdit': return 'Edit Region';
			case 'geo.nationalityAr': return 'Nationality (Arabic)';
			case 'geo.nationalityEn': return 'Nationality (English)';
			case 'geo.selectParentPrompt': return 'Select a parent item to add new record';
			case 'master.title': return 'Items';
			case 'master.setup': return 'Inventory Setup';
			case 'master.itemGroups': return 'Item Groups';
			case 'master.warehouses': return 'Warehouses';
			case 'master.add': return 'Add Item';
			case 'master.code': return 'Item Code';
			case 'master.barcode': return 'Barcode';
			case 'master.type': return 'Item Type';
			case 'master.costPrice': return 'Cost Price';
			case 'master.baseUnit': return 'Base Unit';
			case 'master.costingMethod': return 'Default Costing Method';
			case 'ops.title': return 'Stock Operations';
			case 'ops.incoming': return 'Incoming Stock';
			case 'ops.outgoing': return 'Outgoing Stock';
			case 'ops.transfer': return 'Transfer';
			case 'ops.opening': return 'Opening Stock';
			case 'ops.quantity': return 'Quantity';
			case 'ops.unitCost': return 'Unit Cost';
			case 'ops.totalCost': return 'Total Cost';
			case 'params.title': return 'General Parameters';
			case 'params.defaultLanguage': return 'Default Language';
			case 'params.dateFormat': return 'Date Format';
			case 'params.baseCurrency': return 'Base Currency';
			case 'params.currencies': return 'Currencies';
			case 'params.currencyNameAr': return 'Currency Name (Arabic)';
			case 'params.currencyNameEn': return 'Currency Name (English)';
			case 'params.symbol': return 'Symbol';
			case 'params.exchangeRate': return 'Exchange Rate';
			case 'reports.title': return 'Reports';
			case 'reports.trialBalance': return 'Trial Balance';
			case 'reports.balanceSheet': return 'Balance Sheet';
			case 'reports.incomeStatement': return 'Income Statement';
			case 'reports.cashFlow': return 'Cash Flow';
			case 'setup.title': return 'GL Setup & Config';
			case 'setup.docTypes': return 'Document Types';
			case 'setup.docTypeAdd': return 'Add Document Type';
			case 'setup.docTypeEdit': return 'Edit Document Type';
			case 'setup.docTypeCode': return 'Type Code';
			case 'setup.descCoding': return 'Description Coding';
			case 'setup.descCodingAdd': return 'Add Description Coding';
			case 'setup.descCodingEdit': return 'Edit Description Coding';
			case 'setup.sequenceMethod': return 'Sequence Method';
			case 'transactions.title': return 'Transactions';
			case 'transactions.journalVoucher': return 'Journal Voucher';
			case 'transactions.receiptVoucher': return 'Receipt Voucher';
			case 'transactions.paymentVoucher': return 'Payment Voucher';
			case 'transactions.transferVoucher': return 'Transfer Voucher';
			case 'users.title': return 'User Management';
			case 'users.add': return 'Add New User';
			case 'users.edit': return 'Edit User';
			case 'users.fullNameAr': return 'Full Name (Arabic)';
			case 'users.fullNameEn': return 'Full Name (English)';
			case 'users.enableBiometric': return 'Enable Biometric';
			case 'users.linkToDevice': return 'Link to Device';
			case 'users.isActive': return 'Active';
			case 'users.isInactive': return 'Inactive';
			case 'users.roleManagement': return 'Role Management';
			case 'users.roleAdd': return 'Add New Role';
			case 'users.roleEdit': return 'Edit Role';
			case 'users.roleName': return 'Role Name';
			case 'users.permissions': return 'Permissions';
			case 'vouchers.journal': return 'Journal Voucher';
			case 'vouchers.payment': return 'Payment Voucher';
			case 'vouchers.receipt': return 'Receipt Voucher';
			case 'vouchers.reference': return 'Reference No';
			case 'vouchers.debit': return 'Debit';
			case 'vouchers.credit': return 'Credit';
			case 'vouchers.difference': return 'Difference';
			case 'vouchers.post': return 'Post';
			case 'vouchers.reverse': return 'Reverse';
			case 'vouchers.lines': return 'Lines';
			case 'vouchers.addEntry': return 'Add Entry';
			case 'vouchers.confirmPost': return 'Confirm Posting';
			case 'vouchers.postedMsg': return 'Voucher posted successfully';
			case 'vouchers.paymentMethod': return 'Payment Method';
			case 'vouchers.checkNumber': return 'Check Number';
			case 'vouchers.beneficiary': return 'Beneficiary';
			case 'vouchers.payer': return 'Payer';
			default: return null;
		}
	}
}

extension on _TranslationsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'auth.title': return 'محاسب برو';
			case 'auth.subtitle': return 'سجل الدخول إلى حسابك';
			case 'auth.username': return 'اسم المستخدم';
			case 'auth.password': return 'كلمة المرور';
			case 'auth.confirmPassword': return 'تأكيد كلمة المرور';
			case 'auth.login': return 'تسجيل الدخول';
			case 'auth.logout': return 'تسجيل الخروج';
			case 'auth.register': return 'تسجيل جديد';
			case 'auth.forgotPassword': return 'نسيت كلمة المرور؟';
			case 'auth.resetPassword': return 'إعادة تعيين كلمة المرور';
			case 'auth.welcome': return 'أهلاً بك';
			case 'auth.registrationSuccess': return 'تم التسجيل بنجاح';
			case 'auth.userInactive': return 'هذا الحساب غير نشط';
			case 'auth.invalidCredentials': return 'اسم المستخدم أو كلمة المرور غير صحيحة';
			case 'auth.passwordMismatch': return 'كلمتا المرور غير متطابقتين';
			case 'auth.passwordLength': return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
			case 'coa.title': return 'دليل الحسابات';
			case 'coa.accountCode': return 'رمز الحساب';
			case 'coa.accountNameAr': return 'اسم الحساب (عربي)';
			case 'coa.accountNameEn': return 'اسم الحساب (إنجليزي)';
			case 'coa.parentAccount': return 'الحساب الرئيسي';
			case 'coa.accountNature': return 'طبيعة الحساب';
			case 'coa.reportType': return 'نوع التقرير';
			case 'coa.selectAccountPrompt': return 'اختر حساباً لعرض التفاصيل';
			case 'coa_setup.title': return 'دليل الحسابات';
			case 'coa_setup.accountCode': return 'رمز الحساب';
			case 'coa_setup.parentAccount': return 'الحساب الرئيسي';
			case 'coa_setup.nature': return 'طبيعة الحساب';
			case 'coa_setup.reportType': return 'نوع التقرير';
			case 'coa_setup.level': return 'المستوى';
			case 'coa_setup.detailType': return 'نوع الحساب التفصيلي';
			case 'coa_setup.cashFlowType': return 'نوع التدفق النقدي';
			case 'coa_setup.noParent': return 'لا يوجد أصل';
			case 'coa_setup.debit': return 'مدين';
			case 'coa_setup.credit': return 'دائن';
			case 'common.save': return 'حفظ';
			case 'common.cancel': return 'إلغاء';
			case 'common.delete': return 'حذف';
			case 'common.edit': return 'تعديل';
			case 'common.add': return 'إضافة';
			case 'common.addNew': return 'إضافة جديد';
			case 'common.update': return 'تحديث';
			case 'common.submit': return 'إرسال';
			case 'common.confirm': return 'تأكيد';
			case 'common.close': return 'إغلاق';
			case 'common.search': return 'بحث';
			case 'common.filter': return 'تصفية';
			case 'common.apply': return 'تطبيق';
			case 'common.reset': return 'إعادة تعيين';
			case 'common.refresh': return 'تحديث';
			case 'common.details': return 'التفاصيل';
			case 'common.actions': return 'الإجراءات';
			case 'common.yes': return 'نعم';
			case 'common.no': return 'لا';
			case 'common.active': return 'نشط';
			case 'common.inactive': return 'غير نشط';
			case 'common.loading': return 'جاري التحميل...';
			case 'common.error': return 'خطأ';
			case 'common.success': return 'نجاح';
			case 'common.status': return 'الحالة';
			case 'common.description': return 'البيان';
			case 'common.notes': return 'ملاحظات';
			case 'common.date': return 'التاريخ';
			case 'common.amount': return 'المبلغ';
			case 'common.total': return 'المجموع';
			case 'common.code': return 'الرمز';
			case 'common.nameAr': return 'الاسم (عربي)';
			case 'common.nameEn': return 'الاسم (إنجليزي)';
			case 'common.logo': return 'الشعار';
			case 'common.uploadLogo': return 'تحميل الشعار';
			case 'common.export': return 'تصدير';
			case 'common.print': return 'طباعة';
			case 'common.fromDate': return 'من تاريخ';
			case 'common.toDate': return 'إلى تاريخ';
			case 'common.requiredField': return 'حقل مطلوب';
			case 'common.comingSoon': return 'قريباً!';
			case 'common.saveSuccess': return 'تم الحفظ بنجاح';
			case 'common.saveFailed': return 'فشل الحفظ';
			case 'common.deleteSuccess': return 'تم الحذف بنجاح';
			case 'common.deleteFailed': return 'فشل الحذف';
			case 'common.confirmDelete': return 'هل أنت متأكد أنك تريد حذف هذا العنصر؟';
			case 'common.accessDenied': return 'تم رفض الوصول';
			case 'company.title': return 'معلومات الشركة';
			case 'company.add': return 'إضافة شركة جديدة';
			case 'company.edit': return 'تعديل شركة';
			case 'company.companyCode': return 'رمز الشركة';
			case 'company.taxNumber': return 'الرقم الضريبي';
			case 'company.regNumber': return 'رقم السجل التجاري';
			case 'company.isMainCompany': return 'الشركة الرئيسية';
			case 'company.address': return 'العنوان';
			case 'company.phone': return 'الهاتف';
			case 'company.email': return 'البريد الإلكتروني';
			case 'company.selectPrompt': return 'اختر شركة من القائمة لعرض التفاصيل.';
			case 'company.noCompanies': return 'لم يتم إنشاء شركات بعد.';
			case 'company.branchTitle': return 'الفروع';
			case 'company.branchAdd': return 'إضافة فرع جديد';
			case 'company.branchEdit': return 'تعديل فرع';
			case 'company.branchCode': return 'رمز الفرع';
			case 'company.branchGroup': return 'مجموعة الفرع';
			case 'company.defaultWarehouse': return 'المستودع الافتراضي';
			case 'company.selectOrCreateBranch': return 'اختر فرعاً أو أنشئ واحداً جديداً';
			case 'control.title': return 'مراقبة المخزون';
			case 'control.stocktaking': return 'الجرد';
			case 'control.startSession': return 'بدء جلسة جرد';
			case 'control.reservations': return 'الحجوزات';
			case 'control.reports': return 'تقارير المخزون';
			case 'control.balances': return 'أرصدة المخزون';
			case 'control.valuation': return 'تقييم المخزون';
			case 'control.movement': return 'حركة الصنف';
			case 'dashboard.systemSetup': return 'إعدادات النظام';
			case 'dashboard.generalLedger': return 'الأستاذ العام';
			case 'dashboard.inventory': return 'المخزون';
			case 'dashboard.vendors': return 'الموردون';
			case 'dashboard.customers': return 'العملاء';
			case 'dashboard.reports': return 'التقارير';
			case 'defaults.title': return 'الإعدادات الافتراضية';
			case 'defaults.defaultAccounts': return 'الحسابات الافتراضية';
			case 'defaults.defaultItems': return 'الأصناف الافتراضية';
			case 'defaults.defaultUnits': return 'الوحدات الافتراضية';
			case 'defaults.defaultPayment': return 'طرق الدفع الافتراضية';
			case 'defaults.defaultSales': return 'حسابات المبيعات الافتراضية';
			case 'defaults.defaultPurchases': return 'حسابات المشتريات الافتراضية';
			case 'finance_config.paramsTitle': return 'الإعدادات العامة';
			case 'finance_config.language': return 'اللغة';
			case 'finance_config.dateFormat': return 'تنسيق التاريخ';
			case 'finance_config.calendarType': return 'نوع التقويم';
			case 'finance_config.backupSettings': return 'إعدادات النسخ الاحتياطي';
			case 'finance_config.currencyTitle': return 'العملات';
			case 'finance_config.currencyAdd': return 'إضافة عملة جديدة';
			case 'finance_config.currencyEdit': return 'تعديل عملة';
			case 'finance_config.baseCurrency': return 'العملة الأساسية';
			case 'finance_config.exchangeRate': return 'سعر الصرف';
			case 'finance_config.decimalPlaces': return 'الخانات العشرية';
			case 'finance_config.denominations': return 'الفئات';
			case 'finance_config.denomAdd': return 'إضافة فئة جديدة';
			case 'finance_config.denomEdit': return 'تعديل فئة';
			case 'finance_config.symbol': return 'الرمز';
			case 'finance_config.taxTitle': return 'إعدادات الضرائب';
			case 'finance_config.taxBrackets': return 'الشرائح الضريبية';
			case 'finance_config.taxBracketAdd': return 'إضافة شريحة ضريبية جديدة';
			case 'finance_config.taxBracketEdit': return 'تعديل الشريحة الضريبية';
			case 'finance_config.taxTypes': return 'أنواع الضرائب';
			case 'finance_config.taxTypeAdd': return 'إضافة نوع ضريبة جديد';
			case 'finance_config.taxTypeEdit': return 'تعديل نوع الضريبة';
			case 'finance_config.taxRate': return 'المعدل';
			case 'finance_config.isCompound': return 'ضريبة مركبة';
			case 'finance_config.calcMethod': return 'طريقة الحساب';
			case 'finance_config.calcMethodAdd': return 'إضافة طريقة حساب جديدة';
			case 'finance_config.calcMethodEdit': return 'تعديل طريقة الحساب';
			case 'finance_config.periodTitle': return 'الفترات المالية';
			case 'finance_config.periodAdd': return 'إضافة فترة مالية';
			case 'finance_config.periodEdit': return 'تعديل فترة مالية';
			case 'finance_config.fiscalYear': return 'السنة المالية';
			case 'finance_config.generatePeriods': return 'إنشاء الفترات';
			case 'finance_config.lockPeriod': return 'قفل الفترة';
			case 'finance_config.isLocked': return 'مقفلة';
			case 'finance_config.unlocked': return 'مفتوحة';
			case 'geo.title': return 'البيانات الجغرافية';
			case 'geo.zones': return 'المناطق';
			case 'geo.zoneAdd': return 'إضافة منطقة جديدة';
			case 'geo.zoneEdit': return 'تعديل منطقة';
			case 'geo.countries': return 'الدول';
			case 'geo.countryAdd': return 'إضافة دولة جديدة';
			case 'geo.countryEdit': return 'تعديل دولة';
			case 'geo.governorates': return 'المحافظات';
			case 'geo.governorateAdd': return 'إضافة محافظة جديدة';
			case 'geo.governorateEdit': return 'تعديل محافظة';
			case 'geo.cities': return 'المدن';
			case 'geo.cityAdd': return 'إضافة مدينة جديدة';
			case 'geo.cityEdit': return 'تعديل مدينة';
			case 'geo.regions': return 'الأحياء';
			case 'geo.regionAdd': return 'إضافة حي جديد';
			case 'geo.regionEdit': return 'تعديل حي';
			case 'geo.nationalityAr': return 'الجنسية (عربي)';
			case 'geo.nationalityEn': return 'الجنسية (إنجليزي)';
			case 'geo.selectParentPrompt': return 'حدد عنصراً رئيسياً لإضافة سجل جديد';
			case 'master.title': return 'الأصناف';
			case 'master.setup': return 'إعدادات المخزون';
			case 'master.itemGroups': return 'مجموعات الأصناف';
			case 'master.warehouses': return 'المستودعات';
			case 'master.add': return 'إضافة صنف';
			case 'master.code': return 'رمز الصنف';
			case 'master.barcode': return 'الباركود';
			case 'master.type': return 'نوع الصنف';
			case 'master.costPrice': return 'سعر التكلفة';
			case 'master.baseUnit': return 'الوحدة الأساسية';
			case 'master.costingMethod': return 'طريقة التكلفة الافتراضية';
			case 'ops.title': return 'عمليات المخزون';
			case 'ops.incoming': return 'إدخال مخزني';
			case 'ops.outgoing': return 'إخراج مخزني';
			case 'ops.transfer': return 'تحويل مخزني';
			case 'ops.opening': return 'الرصيد الافتتاحي';
			case 'ops.quantity': return 'الكمية';
			case 'ops.unitCost': return 'تكلفة الوحدة';
			case 'ops.totalCost': return 'التكلفة الإجمالية';
			case 'params.title': return 'الإعدادات العامة';
			case 'params.defaultLanguage': return 'اللغة الافتراضية';
			case 'params.dateFormat': return 'تنسيق التاريخ';
			case 'params.baseCurrency': return 'العملة الأساسية';
			case 'params.currencies': return 'العملات';
			case 'params.currencyNameAr': return 'اسم العملة (عربي)';
			case 'params.currencyNameEn': return 'اسم العملة (إنجليزي)';
			case 'params.symbol': return 'الرمز';
			case 'params.exchangeRate': return 'سعر الصرف';
			case 'reports.title': return 'التقارير';
			case 'reports.trialBalance': return 'ميزان المراجعة';
			case 'reports.balanceSheet': return 'الميزانية العمومية';
			case 'reports.incomeStatement': return 'قائمة الدخل';
			case 'reports.cashFlow': return 'التدفقات النقدية';
			case 'setup.title': return 'إعدادات الأستاذ العام';
			case 'setup.docTypes': return 'أنواع المستندات';
			case 'setup.docTypeAdd': return 'إضافة نوع مستند';
			case 'setup.docTypeEdit': return 'تعديل نوع مستند';
			case 'setup.docTypeCode': return 'رمز النوع';
			case 'setup.descCoding': return 'ترميز البيانات';
			case 'setup.descCodingAdd': return 'إضافة ترميز بيان';
			case 'setup.descCodingEdit': return 'تعديل ترميز بيان';
			case 'setup.sequenceMethod': return 'طريقة الترقيم';
			case 'transactions.title': return 'الحركات';
			case 'transactions.journalVoucher': return 'سند قيد';
			case 'transactions.receiptVoucher': return 'سند قبض';
			case 'transactions.paymentVoucher': return 'سند صرف';
			case 'transactions.transferVoucher': return 'سند تحويل';
			case 'users.title': return 'إدارة المستخدمين';
			case 'users.add': return 'إضافة مستخدم جديد';
			case 'users.edit': return 'تعديل مستخدم';
			case 'users.fullNameAr': return 'الاسم الكامل (عربي)';
			case 'users.fullNameEn': return 'الاسم الكامل (إنجليزي)';
			case 'users.enableBiometric': return 'تفعيل البصمة';
			case 'users.linkToDevice': return 'ربط الجهاز';
			case 'users.isActive': return 'نشط';
			case 'users.isInactive': return 'غير نشط';
			case 'users.roleManagement': return 'إدارة الأدوار';
			case 'users.roleAdd': return 'إضافة دور جديد';
			case 'users.roleEdit': return 'تعديل دور';
			case 'users.roleName': return 'اسم الدور';
			case 'users.permissions': return 'الصلاحيات';
			case 'vouchers.journal': return 'قيد يومية';
			case 'vouchers.payment': return 'سند صرف';
			case 'vouchers.receipt': return 'سند قبض';
			case 'vouchers.reference': return 'رقم المرجع';
			case 'vouchers.debit': return 'مدين';
			case 'vouchers.credit': return 'دائن';
			case 'vouchers.difference': return 'الفرق';
			case 'vouchers.post': return 'ترحيل';
			case 'vouchers.reverse': return 'عكس القيد';
			case 'vouchers.lines': return 'الأسطر';
			case 'vouchers.addEntry': return 'إضافة قيد';
			case 'vouchers.confirmPost': return 'تأكيد الترحيل';
			case 'vouchers.postedMsg': return 'تم ترحيل السند بنجاح';
			case 'vouchers.paymentMethod': return 'طريقة الدفع';
			case 'vouchers.checkNumber': return 'رقم الشيك';
			case 'vouchers.beneficiary': return 'المستفيد';
			case 'vouchers.payer': return 'الدافع';
			default: return null;
		}
	}
}
