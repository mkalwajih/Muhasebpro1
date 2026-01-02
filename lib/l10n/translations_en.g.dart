///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAuthEn auth = TranslationsAuthEn.internal(_root);
	late final TranslationsCashbankEn cashbank = TranslationsCashbankEn.internal(_root);
	late final TranslationsCoaEn coa = TranslationsCoaEn.internal(_root);
	late final TranslationsCoaSetupEn coa_setup = TranslationsCoaSetupEn.internal(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsCompanyEn company = TranslationsCompanyEn.internal(_root);
	late final TranslationsControlEn control = TranslationsControlEn.internal(_root);
	late final TranslationsDashboardEn dashboard = TranslationsDashboardEn.internal(_root);
	late final TranslationsDefaultsEn defaults = TranslationsDefaultsEn.internal(_root);
	late final TranslationsFinanceConfigEn finance_config = TranslationsFinanceConfigEn.internal(_root);
	late final TranslationsGeoEn geo = TranslationsGeoEn.internal(_root);
	late final TranslationsMasterEn master = TranslationsMasterEn.internal(_root);
	late final TranslationsOpsEn ops = TranslationsOpsEn.internal(_root);
	late final TranslationsParamsEn params = TranslationsParamsEn.internal(_root);
	late final TranslationsReportsEn reports = TranslationsReportsEn.internal(_root);
	late final TranslationsSetupEn setup = TranslationsSetupEn.internal(_root);
	late final TranslationsTransactionsEn transactions = TranslationsTransactionsEn.internal(_root);
	late final TranslationsUsersEn users = TranslationsUsersEn.internal(_root);
	late final TranslationsVouchersEn vouchers = TranslationsVouchersEn.internal(_root);
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'MuhasebPro'
	String get title => 'MuhasebPro';

	/// en: 'Sign in to your account'
	String get subtitle => 'Sign in to your account';

	/// en: 'Username'
	String get username => 'Username';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'New Password'
	String get newPassword => 'New Password';

	/// en: 'Confirm Password'
	String get confirmPassword => 'Confirm Password';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Forgot Password?'
	String get forgotPassword => 'Forgot Password?';

	/// en: 'Reset Password'
	String get resetPassword => 'Reset Password';

	/// en: 'Password reset successfully'
	String get resetPasswordSuccess => 'Password reset successfully';

	/// en: 'Back to Login'
	String get backToLogin => 'Back to Login';

	/// en: 'Welcome'
	String get welcome => 'Welcome';

	/// en: 'Registration successful'
	String get registrationSuccess => 'Registration successful';

	/// en: 'This account is inactive'
	String get userInactive => 'This account is inactive';

	/// en: 'Invalid username or password'
	String get invalidCredentials => 'Invalid username or password';

	/// en: 'Passwords do not match'
	String get passwordMismatch => 'Passwords do not match';

	/// en: 'Password must be at least 6 characters'
	String get passwordLength => 'Password must be at least 6 characters';
}

// Path: cashbank
class TranslationsCashbankEn {
	TranslationsCashbankEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cash & Bank Management'
	String get title => 'Cash & Bank Management';

	/// en: 'Bank Reconciliation'
	String get bankReconciliation => 'Bank Reconciliation';

	/// en: 'Cash Deposits'
	String get cashDeposits => 'Cash Deposits';

	/// en: 'Bank Statements'
	String get bankStatements => 'Bank Statements';

	/// en: 'Adjustment Entries'
	String get adjustmentEntries => 'Adjustment Entries';

	/// en: 'Manage your cash and bank accounts, reconcile statements, and handle deposits.'
	String get manageCashAndBank => 'Manage your cash and bank accounts, reconcile statements, and handle deposits.';

	/// en: 'Reconcile your bank statements with system records.'
	String get bankReconciliationDesc => 'Reconcile your bank statements with system records.';

	/// en: 'Manage cash deposits and track their status.'
	String get cashDepositsDesc => 'Manage cash deposits and track their status.';

	/// en: 'Import and view bank statements.'
	String get bankStatementsDesc => 'Import and view bank statements.';

	/// en: 'Create and manage adjustment entries for bank fees, interest, etc.'
	String get adjustmentEntriesDesc => 'Create and manage adjustment entries for bank fees, interest, etc.';

	/// en: 'No adjustment entries found'
	String get noAdjustmentsFound => 'No adjustment entries found';

	/// en: 'Create your first adjustment entry'
	String get createFirstAdjustment => 'Create your first adjustment entry';

	/// en: 'Adjustment Type'
	String get adjustmentType => 'Adjustment Type';

	/// en: 'Bank Charges'
	String get bankCharges => 'Bank Charges';

	/// en: 'Interest Earned'
	String get interestEarned => 'Interest Earned';

	/// en: 'Error Correction'
	String get errorCorrection => 'Error Correction';

	/// en: 'New Adjustment'
	String get newAdjustment => 'New Adjustment';

	/// en: 'Adjustment submitted successfully'
	String get adjustmentSubmittedSuccessfully => 'Adjustment submitted successfully';

	/// en: 'Adjustment approved successfully'
	String get adjustmentApprovedSuccessfully => 'Adjustment approved successfully';

	/// en: 'Edit adjustment is not implemented yet'
	String get editAdjustmentNotImplemented => 'Edit adjustment is not implemented yet';

	/// en: 'Are you sure you want to delete this adjustment?'
	String get confirmDeleteAdjustment => 'Are you sure you want to delete this adjustment?';

	/// en: 'Adjustment deleted successfully'
	String get adjustmentDeletedSuccessfully => 'Adjustment deleted successfully';

	/// en: 'Cash & Bank Management'
	String get cashBankManagement => 'Cash & Bank Management';
}

// Path: coa
class TranslationsCoaEn {
	TranslationsCoaEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Chart of Accounts'
	String get title => 'Chart of Accounts';

	/// en: 'Account Code'
	String get accountCode => 'Account Code';

	/// en: 'Account Name (Arabic)'
	String get accountNameAr => 'Account Name (Arabic)';

	/// en: 'Account Name (English)'
	String get accountNameEn => 'Account Name (English)';

	/// en: 'Parent Account'
	String get parentAccount => 'Parent Account';

	/// en: 'Account Nature'
	String get accountNature => 'Account Nature';

	/// en: 'Report Type'
	String get reportType => 'Report Type';

	/// en: 'Select an account to view details'
	String get selectAccountPrompt => 'Select an account to view details';
}

// Path: coa_setup
class TranslationsCoaSetupEn {
	TranslationsCoaSetupEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Chart of Accounts'
	String get title => 'Chart of Accounts';

	/// en: 'Account Code'
	String get accountCode => 'Account Code';

	/// en: 'Parent Account'
	String get parentAccount => 'Parent Account';

	/// en: 'Nature'
	String get nature => 'Nature';

	/// en: 'Report Type'
	String get reportType => 'Report Type';

	/// en: 'Level'
	String get level => 'Level';

	/// en: 'Detail Account Type'
	String get detailType => 'Detail Account Type';

	/// en: 'Cash Flow Type'
	String get cashFlowType => 'Cash Flow Type';

	/// en: 'No Parent'
	String get noParent => 'No Parent';

	/// en: 'Debit'
	String get debit => 'Debit';

	/// en: 'Credit'
	String get credit => 'Credit';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Add New'
	String get addNew => 'Add New';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Filter'
	String get filter => 'Filter';

	/// en: 'Apply'
	String get apply => 'Apply';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Details'
	String get details => 'Details';

	/// en: 'Actions'
	String get actions => 'Actions';

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'No'
	String get no => 'No';

	/// en: 'Active'
	String get active => 'Active';

	/// en: 'Inactive'
	String get inactive => 'Inactive';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Notes'
	String get notes => 'Notes';

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'Amount'
	String get amount => 'Amount';

	/// en: 'Total'
	String get total => 'Total';

	/// en: 'Code'
	String get code => 'Code';

	/// en: 'Name (Arabic)'
	String get nameAr => 'Name (Arabic)';

	/// en: 'Name (English)'
	String get nameEn => 'Name (English)';

	/// en: 'Full Name (Arabic)'
	String get fullNameAr => 'Full Name (Arabic)';

	/// en: 'Full Name (English)'
	String get fullNameEn => 'Full Name (English)';

	/// en: 'Logo'
	String get logo => 'Logo';

	/// en: 'Upload Logo'
	String get uploadLogo => 'Upload Logo';

	/// en: 'Export'
	String get export => 'Export';

	/// en: 'Print'
	String get print => 'Print';

	/// en: 'From Date'
	String get fromDate => 'From Date';

	/// en: 'To Date'
	String get toDate => 'To Date';

	/// en: 'Required Field'
	String get requiredField => 'Required Field';

	/// en: 'Coming Soon!'
	String get comingSoon => 'Coming Soon!';

	/// en: 'Saved successfully'
	String get saveSuccess => 'Saved successfully';

	/// en: 'Failed to save'
	String get saveFailed => 'Failed to save';

	/// en: 'Deleted successfully'
	String get deleteSuccess => 'Deleted successfully';

	/// en: 'Failed to delete'
	String get deleteFailed => 'Failed to delete';

	/// en: 'Are you sure you want to delete this item?'
	String get confirmDelete => 'Are you sure you want to delete this item?';

	/// en: 'Access Denied'
	String get accessDenied => 'Access Denied';
}

// Path: company
class TranslationsCompanyEn {
	TranslationsCompanyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Company Info'
	String get title => 'Company Info';

	/// en: 'Add New Company'
	String get add => 'Add New Company';

	/// en: 'Edit Company'
	String get edit => 'Edit Company';

	/// en: 'Company Code'
	String get companyCode => 'Company Code';

	/// en: 'Tax Number'
	String get taxNumber => 'Tax Number';

	/// en: 'Commercial Registration No.'
	String get regNumber => 'Commercial Registration No.';

	/// en: 'Main Company'
	String get isMainCompany => 'Main Company';

	/// en: 'Address'
	String get address => 'Address';

	/// en: 'Phone'
	String get phone => 'Phone';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Select a company from the list to view details.'
	String get selectPrompt => 'Select a company from the list to view details.';

	/// en: 'No companies created yet.'
	String get noCompanies => 'No companies created yet.';

	/// en: 'Branches'
	String get branchTitle => 'Branches';

	/// en: 'Add New Branch'
	String get branchAdd => 'Add New Branch';

	/// en: 'Edit Branch'
	String get branchEdit => 'Edit Branch';

	/// en: 'Branch Code'
	String get branchCode => 'Branch Code';

	/// en: 'Branch Group'
	String get branchGroup => 'Branch Group';

	/// en: 'Default Warehouse'
	String get defaultWarehouse => 'Default Warehouse';

	/// en: 'Select a branch or create a new one'
	String get selectOrCreateBranch => 'Select a branch or create a new one';
}

// Path: control
class TranslationsControlEn {
	TranslationsControlEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Inventory Control'
	String get title => 'Inventory Control';

	/// en: 'Stocktaking'
	String get stocktaking => 'Stocktaking';

	/// en: 'Start Stocktaking'
	String get startSession => 'Start Stocktaking';

	/// en: 'Reservations'
	String get reservations => 'Reservations';

	/// en: 'Inventory Reports'
	String get reports => 'Inventory Reports';

	/// en: 'Stock Balances'
	String get balances => 'Stock Balances';

	/// en: 'Stock Valuation'
	String get valuation => 'Stock Valuation';

	/// en: 'Item Movement'
	String get movement => 'Item Movement';

	/// en: 'Stocktaking Sessions'
	String get stocktakingSessions => 'Stocktaking Sessions';

	/// en: 'Manage stocktaking sessions'
	String get manageStocktaking => 'Manage stocktaking sessions';

	/// en: 'View and manage stocktaking sessions'
	String get stocktakingInfo => 'View and manage stocktaking sessions';

	/// en: 'Stock Reservations'
	String get stockReservations => 'Stock Reservations';

	/// en: 'Manage stock reservations'
	String get manageReservations => 'Manage stock reservations';

	/// en: 'Create Reservation'
	String get createReservation => 'Create Reservation';

	/// en: 'Create and manage item reservations'
	String get reservationInfo => 'Create and manage item reservations';
}

// Path: dashboard
class TranslationsDashboardEn {
	TranslationsDashboardEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'System Setup'
	String get systemSetup => 'System Setup';

	/// en: 'General Ledger'
	String get generalLedger => 'General Ledger';

	/// en: 'Inventory'
	String get inventory => 'Inventory';

	/// en: 'Vendors'
	String get vendors => 'Vendors';

	/// en: 'Customers'
	String get customers => 'Customers';

	/// en: 'Reports'
	String get reports => 'Reports';
}

// Path: defaults
class TranslationsDefaultsEn {
	TranslationsDefaultsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Defaults'
	String get title => 'Defaults';

	/// en: 'Default Accounts'
	String get defaultAccounts => 'Default Accounts';

	/// en: 'Default Items'
	String get defaultItems => 'Default Items';

	/// en: 'Default Units'
	String get defaultUnits => 'Default Units';

	/// en: 'Default Payment Methods'
	String get defaultPayment => 'Default Payment Methods';

	/// en: 'Default Sales Accounts'
	String get defaultSales => 'Default Sales Accounts';

	/// en: 'Default Purchases Accounts'
	String get defaultPurchases => 'Default Purchases Accounts';
}

// Path: finance_config
class TranslationsFinanceConfigEn {
	TranslationsFinanceConfigEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'General Parameters'
	String get paramsTitle => 'General Parameters';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Date Format'
	String get dateFormat => 'Date Format';

	/// en: 'Calendar Type'
	String get calendarType => 'Calendar Type';

	/// en: 'Backup Settings'
	String get backupSettings => 'Backup Settings';

	/// en: 'Currencies'
	String get currencyTitle => 'Currencies';

	/// en: 'Add New Currency'
	String get currencyAdd => 'Add New Currency';

	/// en: 'Edit Currency'
	String get currencyEdit => 'Edit Currency';

	/// en: 'Base Currency'
	String get baseCurrency => 'Base Currency';

	/// en: 'Exchange Rate'
	String get exchangeRate => 'Exchange Rate';

	/// en: 'Decimal Places'
	String get decimalPlaces => 'Decimal Places';

	/// en: 'Denominations'
	String get denominations => 'Denominations';

	/// en: 'Add New Denomination'
	String get denomAdd => 'Add New Denomination';

	/// en: 'Edit Denomination'
	String get denomEdit => 'Edit Denomination';

	/// en: 'Symbol'
	String get symbol => 'Symbol';

	/// en: 'Tax Settings'
	String get taxTitle => 'Tax Settings';

	/// en: 'Tax Brackets'
	String get taxBrackets => 'Tax Brackets';

	/// en: 'Add New Tax Bracket'
	String get taxBracketAdd => 'Add New Tax Bracket';

	/// en: 'Edit Tax Bracket'
	String get taxBracketEdit => 'Edit Tax Bracket';

	/// en: 'Tax Types'
	String get taxTypes => 'Tax Types';

	/// en: 'Add New Tax Type'
	String get taxTypeAdd => 'Add New Tax Type';

	/// en: 'Edit Tax Type'
	String get taxTypeEdit => 'Edit Tax Type';

	/// en: 'Tax Rate'
	String get taxRate => 'Tax Rate';

	/// en: 'Is Compound'
	String get isCompound => 'Is Compound';

	/// en: 'Calculation Method'
	String get calcMethod => 'Calculation Method';

	/// en: 'Add New Calculation Method'
	String get calcMethodAdd => 'Add New Calculation Method';

	/// en: 'Edit Calculation Method'
	String get calcMethodEdit => 'Edit Calculation Method';

	/// en: 'Financial Periods'
	String get periodTitle => 'Financial Periods';

	/// en: 'Add Financial Period'
	String get periodAdd => 'Add Financial Period';

	/// en: 'Edit Financial Period'
	String get periodEdit => 'Edit Financial Period';

	/// en: 'Fiscal Year'
	String get fiscalYear => 'Fiscal Year';

	/// en: 'Generate Periods'
	String get generatePeriods => 'Generate Periods';

	/// en: 'Lock Period'
	String get lockPeriod => 'Lock Period';

	/// en: 'Locked'
	String get isLocked => 'Locked';

	/// en: 'Unlocked'
	String get unlocked => 'Unlocked';
}

// Path: geo
class TranslationsGeoEn {
	TranslationsGeoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Geographical Data'
	String get title => 'Geographical Data';

	/// en: 'Zones'
	String get zones => 'Zones';

	/// en: 'Add New Zone'
	String get zoneAdd => 'Add New Zone';

	/// en: 'Edit Zone'
	String get zoneEdit => 'Edit Zone';

	/// en: 'Countries'
	String get countries => 'Countries';

	/// en: 'Add New Country'
	String get countryAdd => 'Add New Country';

	/// en: 'Edit Country'
	String get countryEdit => 'Edit Country';

	/// en: 'Governorates'
	String get governorates => 'Governorates';

	/// en: 'Add New Governorate'
	String get governorateAdd => 'Add New Governorate';

	/// en: 'Edit Governorate'
	String get governorateEdit => 'Edit Governorate';

	/// en: 'Cities'
	String get cities => 'Cities';

	/// en: 'Add New City'
	String get cityAdd => 'Add New City';

	/// en: 'Edit City'
	String get cityEdit => 'Edit City';

	/// en: 'Regions'
	String get regions => 'Regions';

	/// en: 'Add New Region'
	String get regionAdd => 'Add New Region';

	/// en: 'Edit Region'
	String get regionEdit => 'Edit Region';

	/// en: 'Nationality (Arabic)'
	String get nationalityAr => 'Nationality (Arabic)';

	/// en: 'Nationality (English)'
	String get nationalityEn => 'Nationality (English)';

	/// en: 'Select a parent item to add new record'
	String get selectParentPrompt => 'Select a parent item to add new record';
}

// Path: master
class TranslationsMasterEn {
	TranslationsMasterEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Items'
	String get title => 'Items';

	/// en: 'Inventory Setup'
	String get setup => 'Inventory Setup';

	/// en: 'Item Groups'
	String get itemGroups => 'Item Groups';

	/// en: 'Warehouses'
	String get warehouses => 'Warehouses';

	/// en: 'Add Item'
	String get add => 'Add Item';

	/// en: 'Item Code'
	String get code => 'Item Code';

	/// en: 'Barcode'
	String get barcode => 'Barcode';

	/// en: 'Item Type'
	String get type => 'Item Type';

	/// en: 'Cost Price'
	String get costPrice => 'Cost Price';

	/// en: 'Base Unit'
	String get baseUnit => 'Base Unit';

	/// en: 'Default Costing Method'
	String get costingMethod => 'Default Costing Method';

	/// en: 'Inventory Variables'
	String get inventoryVariables => 'Inventory Variables';
}

// Path: ops
class TranslationsOpsEn {
	TranslationsOpsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Stock Operations'
	String get title => 'Stock Operations';

	/// en: 'Incoming Stock'
	String get incoming => 'Incoming Stock';

	/// en: 'Outgoing Stock'
	String get outgoing => 'Outgoing Stock';

	/// en: 'Transfer'
	String get transfer => 'Transfer';

	/// en: 'Opening Stock'
	String get opening => 'Opening Stock';

	/// en: 'Quantity'
	String get quantity => 'Quantity';

	/// en: 'Unit Cost'
	String get unitCost => 'Unit Cost';

	/// en: 'Total Cost'
	String get totalCost => 'Total Cost';

	/// en: 'Manage incoming stock orders'
	String get manageIncomingStock => 'Manage incoming stock orders';

	/// en: 'Manage outgoing stock orders'
	String get manageOutgoingStock => 'Manage outgoing stock orders';

	/// en: 'Add Opening Stock'
	String get addOpeningStock => 'Add Opening Stock';

	/// en: 'Manage warehouse transfers'
	String get manageWarehouseTransfers => 'Manage warehouse transfers';

	/// en: 'Create Incoming Order'
	String get createIncomingOrder => 'Create Incoming Order';

	/// en: 'Create Outgoing Order'
	String get createOutgoingOrder => 'Create Outgoing Order';

	/// en: 'Create Transfer'
	String get createTransfer => 'Create Transfer';

	/// en: 'Incoming Stock Orders'
	String get incomingStockOrders => 'Incoming Stock Orders';

	/// en: 'Outgoing Stock Orders'
	String get outgoingStockOrders => 'Outgoing Stock Orders';

	/// en: 'Warehouse Transfers'
	String get warehouseTransfers => 'Warehouse Transfers';

	/// en: 'Transfers'
	String get transfers => 'Transfers';
}

// Path: params
class TranslationsParamsEn {
	TranslationsParamsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'General Parameters'
	String get title => 'General Parameters';

	/// en: 'Default Language'
	String get defaultLanguage => 'Default Language';

	/// en: 'Date Format'
	String get dateFormat => 'Date Format';

	/// en: 'Base Currency'
	String get baseCurrency => 'Base Currency';

	/// en: 'Currencies'
	String get currencies => 'Currencies';

	/// en: 'Currency Name (Arabic)'
	String get currencyNameAr => 'Currency Name (Arabic)';

	/// en: 'Currency Name (English)'
	String get currencyNameEn => 'Currency Name (English)';

	/// en: 'Symbol'
	String get symbol => 'Symbol';

	/// en: 'Exchange Rate'
	String get exchangeRate => 'Exchange Rate';
}

// Path: reports
class TranslationsReportsEn {
	TranslationsReportsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Financial Reports'
	String get title => 'Financial Reports';

	/// en: 'Trial Balance'
	String get trialBalance => 'Trial Balance';

	/// en: 'Income Statement'
	String get incomeStatement => 'Income Statement';

	/// en: 'Balance Sheet'
	String get balanceSheet => 'Balance Sheet';

	/// en: 'Cash Flow'
	String get cashFlow => 'Cash Flow';

	/// en: 'General Ledger'
	String get generalLedger => 'General Ledger';

	/// en: 'Account Statement'
	String get accountStatement => 'Account Statement';

	/// en: 'Select Account'
	String get selectAccount => 'Select Account';

	/// en: 'As of Date'
	String get asOfDate => 'As of Date';

	/// en: 'Select Report'
	String get selectReport => 'Select Report';

	/// en: 'View trial balance report'
	String get trialBalanceDescription => 'View trial balance report';

	/// en: 'View income statement'
	String get incomeStatementDescription => 'View income statement';

	/// en: 'View balance sheet'
	String get balanceSheetDescription => 'View balance sheet';

	/// en: 'View cash flow statement'
	String get cashFlowDescription => 'View cash flow statement';

	/// en: 'View account statement'
	String get accountStatementDescription => 'View account statement';

	/// en: 'General Ledger'
	String get generalLedgerReport => 'General Ledger';

	/// en: 'View general ledger'
	String get generalLedgerDescription => 'View general ledger';

	/// en: 'Report refreshed'
	String get reportRefreshed => 'Report refreshed';

	/// en: 'Export Report'
	String get exportReport => 'Export Report';

	/// en: 'Export to PDF'
	String get exportToPdf => 'Export to PDF';

	/// en: 'Export to Excel'
	String get exportToExcel => 'Export to Excel';

	/// en: 'Export to CSV'
	String get exportToCsv => 'Export to CSV';

	/// en: 'Report exported to {format: String}'
	String reportExportedSuccessfully({required String format}) => 'Report exported to ${format}';

	/// en: 'Report sent to printer'
	String get reportSentToPrinter => 'Report sent to printer';

	/// en: 'Cash Flow Statement'
	String get cashFlowStatement => 'Cash Flow Statement';

	/// en: 'To Date'
	String get toDate => 'To Date';

	/// en: 'From Date'
	String get fromDate => 'From Date';
}

// Path: setup
class TranslationsSetupEn {
	TranslationsSetupEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'GL Setup & Config'
	String get title => 'GL Setup & Config';

	/// en: 'Document Types'
	String get docTypes => 'Document Types';

	/// en: 'Add Document Type'
	String get docTypeAdd => 'Add Document Type';

	/// en: 'Edit Document Type'
	String get docTypeEdit => 'Edit Document Type';

	/// en: 'Type Code'
	String get docTypeCode => 'Type Code';

	/// en: 'Description Coding'
	String get descCoding => 'Description Coding';

	/// en: 'Add Description Coding'
	String get descCodingAdd => 'Add Description Coding';

	/// en: 'Edit Description Coding'
	String get descCodingEdit => 'Edit Description Coding';

	/// en: 'Sequence Method'
	String get sequenceMethod => 'Sequence Method';

	/// en: 'Document Types and Description Coding'
	String get documentTypesAndDescriptionCoding => 'Document Types and Description Coding';
}

// Path: transactions
class TranslationsTransactionsEn {
	TranslationsTransactionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Transactions'
	String get title => 'Transactions';

	/// en: 'Journal Voucher'
	String get journalVoucher => 'Journal Voucher';

	/// en: 'Receipt Voucher'
	String get receiptVoucher => 'Receipt Voucher';

	/// en: 'Payment Voucher'
	String get paymentVoucher => 'Payment Voucher';

	/// en: 'Transfer Voucher'
	String get transferVoucher => 'Transfer Voucher';

	/// en: 'Create and manage journal vouchers'
	String get createAndManageJournalVouchers => 'Create and manage journal vouchers';

	/// en: 'Manage payment vouchers'
	String get managePaymentVouchers => 'Manage payment vouchers';

	/// en: 'Manage receipt vouchers'
	String get manageReceiptVouchers => 'Manage receipt vouchers';

	/// en: 'Manage cash and bank accounts'
	String get manageCashAndBankAccounts => 'Manage cash and bank accounts';

	/// en: 'View financial reports and statements'
	String get viewFinancialReportsAndStatements => 'View financial reports and statements';

	/// en: 'Manage transaction requests'
	String get manageTransactionRequests => 'Manage transaction requests';

	/// en: 'Review, post, and close periods'
	String get reviewPostAndClosePeriods => 'Review, post, and close periods';
}

// Path: users
class TranslationsUsersEn {
	TranslationsUsersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'User Management'
	String get title => 'User Management';

	/// en: 'Add New User'
	String get add => 'Add New User';

	/// en: 'Edit User'
	String get edit => 'Edit User';

	/// en: 'Full Name (Arabic)'
	String get fullNameAr => 'Full Name (Arabic)';

	/// en: 'Full Name (English)'
	String get fullNameEn => 'Full Name (English)';

	/// en: 'Enable Biometric'
	String get enableBiometric => 'Enable Biometric';

	/// en: 'Link to Device'
	String get linkToDevice => 'Link to Device';

	/// en: 'Active'
	String get isActive => 'Active';

	/// en: 'Inactive'
	String get isInactive => 'Inactive';

	/// en: 'Role Management'
	String get roleManagement => 'Role Management';

	/// en: 'Add New Role'
	String get roleAdd => 'Add New Role';

	/// en: 'Edit Role'
	String get roleEdit => 'Edit Role';

	/// en: 'Role Name'
	String get roleName => 'Role Name';

	/// en: 'Permissions'
	String get permissions => 'Permissions';
}

// Path: vouchers
class TranslationsVouchersEn {
	TranslationsVouchersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Journal Voucher'
	String get journal => 'Journal Voucher';

	/// en: 'Payment Voucher'
	String get payment => 'Payment Voucher';

	/// en: 'Receipt Voucher'
	String get receipt => 'Receipt Voucher';

	/// en: 'Reference No'
	String get reference => 'Reference No';

	/// en: 'Debit'
	String get debit => 'Debit';

	/// en: 'Credit'
	String get credit => 'Credit';

	/// en: 'Difference'
	String get difference => 'Difference';

	/// en: 'Post'
	String get post => 'Post';

	/// en: 'Reverse'
	String get reverse => 'Reverse';

	/// en: 'Lines'
	String get lines => 'Lines';

	/// en: 'Add Entry'
	String get addEntry => 'Add Entry';

	/// en: 'Confirm Posting'
	String get confirmPost => 'Confirm Posting';

	/// en: 'Voucher posted successfully'
	String get postedMsg => 'Voucher posted successfully';

	/// en: 'Payment Method'
	String get paymentMethod => 'Payment Method';

	/// en: 'Check Number'
	String get checkNumber => 'Check Number';

	/// en: 'Beneficiary'
	String get beneficiary => 'Beneficiary';

	/// en: 'Payer'
	String get payer => 'Payer';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'auth.title' => 'MuhasebPro',
			'auth.subtitle' => 'Sign in to your account',
			'auth.username' => 'Username',
			'auth.password' => 'Password',
			'auth.newPassword' => 'New Password',
			'auth.confirmPassword' => 'Confirm Password',
			'auth.login' => 'Login',
			'auth.logout' => 'Logout',
			'auth.register' => 'Register',
			'auth.forgotPassword' => 'Forgot Password?',
			'auth.resetPassword' => 'Reset Password',
			'auth.resetPasswordSuccess' => 'Password reset successfully',
			'auth.backToLogin' => 'Back to Login',
			'auth.welcome' => 'Welcome',
			'auth.registrationSuccess' => 'Registration successful',
			'auth.userInactive' => 'This account is inactive',
			'auth.invalidCredentials' => 'Invalid username or password',
			'auth.passwordMismatch' => 'Passwords do not match',
			'auth.passwordLength' => 'Password must be at least 6 characters',
			'cashbank.title' => 'Cash & Bank Management',
			'cashbank.bankReconciliation' => 'Bank Reconciliation',
			'cashbank.cashDeposits' => 'Cash Deposits',
			'cashbank.bankStatements' => 'Bank Statements',
			'cashbank.adjustmentEntries' => 'Adjustment Entries',
			'cashbank.manageCashAndBank' => 'Manage your cash and bank accounts, reconcile statements, and handle deposits.',
			'cashbank.bankReconciliationDesc' => 'Reconcile your bank statements with system records.',
			'cashbank.cashDepositsDesc' => 'Manage cash deposits and track their status.',
			'cashbank.bankStatementsDesc' => 'Import and view bank statements.',
			'cashbank.adjustmentEntriesDesc' => 'Create and manage adjustment entries for bank fees, interest, etc.',
			'cashbank.noAdjustmentsFound' => 'No adjustment entries found',
			'cashbank.createFirstAdjustment' => 'Create your first adjustment entry',
			'cashbank.adjustmentType' => 'Adjustment Type',
			'cashbank.bankCharges' => 'Bank Charges',
			'cashbank.interestEarned' => 'Interest Earned',
			'cashbank.errorCorrection' => 'Error Correction',
			'cashbank.newAdjustment' => 'New Adjustment',
			'cashbank.adjustmentSubmittedSuccessfully' => 'Adjustment submitted successfully',
			'cashbank.adjustmentApprovedSuccessfully' => 'Adjustment approved successfully',
			'cashbank.editAdjustmentNotImplemented' => 'Edit adjustment is not implemented yet',
			'cashbank.confirmDeleteAdjustment' => 'Are you sure you want to delete this adjustment?',
			'cashbank.adjustmentDeletedSuccessfully' => 'Adjustment deleted successfully',
			'cashbank.cashBankManagement' => 'Cash & Bank Management',
			'coa.title' => 'Chart of Accounts',
			'coa.accountCode' => 'Account Code',
			'coa.accountNameAr' => 'Account Name (Arabic)',
			'coa.accountNameEn' => 'Account Name (English)',
			'coa.parentAccount' => 'Parent Account',
			'coa.accountNature' => 'Account Nature',
			'coa.reportType' => 'Report Type',
			'coa.selectAccountPrompt' => 'Select an account to view details',
			'coa_setup.title' => 'Chart of Accounts',
			'coa_setup.accountCode' => 'Account Code',
			'coa_setup.parentAccount' => 'Parent Account',
			'coa_setup.nature' => 'Nature',
			'coa_setup.reportType' => 'Report Type',
			'coa_setup.level' => 'Level',
			'coa_setup.detailType' => 'Detail Account Type',
			'coa_setup.cashFlowType' => 'Cash Flow Type',
			'coa_setup.noParent' => 'No Parent',
			'coa_setup.debit' => 'Debit',
			'coa_setup.credit' => 'Credit',
			'common.save' => 'Save',
			'common.cancel' => 'Cancel',
			'common.delete' => 'Delete',
			'common.edit' => 'Edit',
			'common.add' => 'Add',
			'common.addNew' => 'Add New',
			'common.update' => 'Update',
			'common.submit' => 'Submit',
			'common.confirm' => 'Confirm',
			'common.close' => 'Close',
			'common.search' => 'Search',
			'common.filter' => 'Filter',
			'common.apply' => 'Apply',
			'common.reset' => 'Reset',
			'common.refresh' => 'Refresh',
			'common.details' => 'Details',
			'common.actions' => 'Actions',
			'common.yes' => 'Yes',
			'common.no' => 'No',
			'common.active' => 'Active',
			'common.inactive' => 'Inactive',
			'common.loading' => 'Loading...',
			'common.error' => 'Error',
			'common.success' => 'Success',
			'common.status' => 'Status',
			'common.description' => 'Description',
			'common.notes' => 'Notes',
			'common.date' => 'Date',
			'common.amount' => 'Amount',
			'common.total' => 'Total',
			'common.code' => 'Code',
			'common.nameAr' => 'Name (Arabic)',
			'common.nameEn' => 'Name (English)',
			'common.fullNameAr' => 'Full Name (Arabic)',
			'common.fullNameEn' => 'Full Name (English)',
			'common.logo' => 'Logo',
			'common.uploadLogo' => 'Upload Logo',
			'common.export' => 'Export',
			'common.print' => 'Print',
			'common.fromDate' => 'From Date',
			'common.toDate' => 'To Date',
			'common.requiredField' => 'Required Field',
			'common.comingSoon' => 'Coming Soon!',
			'common.saveSuccess' => 'Saved successfully',
			'common.saveFailed' => 'Failed to save',
			'common.deleteSuccess' => 'Deleted successfully',
			'common.deleteFailed' => 'Failed to delete',
			'common.confirmDelete' => 'Are you sure you want to delete this item?',
			'common.accessDenied' => 'Access Denied',
			'company.title' => 'Company Info',
			'company.add' => 'Add New Company',
			'company.edit' => 'Edit Company',
			'company.companyCode' => 'Company Code',
			'company.taxNumber' => 'Tax Number',
			'company.regNumber' => 'Commercial Registration No.',
			'company.isMainCompany' => 'Main Company',
			'company.address' => 'Address',
			'company.phone' => 'Phone',
			'company.email' => 'Email',
			'company.selectPrompt' => 'Select a company from the list to view details.',
			'company.noCompanies' => 'No companies created yet.',
			'company.branchTitle' => 'Branches',
			'company.branchAdd' => 'Add New Branch',
			'company.branchEdit' => 'Edit Branch',
			'company.branchCode' => 'Branch Code',
			'company.branchGroup' => 'Branch Group',
			'company.defaultWarehouse' => 'Default Warehouse',
			'company.selectOrCreateBranch' => 'Select a branch or create a new one',
			'control.title' => 'Inventory Control',
			'control.stocktaking' => 'Stocktaking',
			'control.startSession' => 'Start Stocktaking',
			'control.reservations' => 'Reservations',
			'control.reports' => 'Inventory Reports',
			'control.balances' => 'Stock Balances',
			'control.valuation' => 'Stock Valuation',
			'control.movement' => 'Item Movement',
			'control.stocktakingSessions' => 'Stocktaking Sessions',
			'control.manageStocktaking' => 'Manage stocktaking sessions',
			'control.stocktakingInfo' => 'View and manage stocktaking sessions',
			'control.stockReservations' => 'Stock Reservations',
			'control.manageReservations' => 'Manage stock reservations',
			'control.createReservation' => 'Create Reservation',
			'control.reservationInfo' => 'Create and manage item reservations',
			'dashboard.systemSetup' => 'System Setup',
			'dashboard.generalLedger' => 'General Ledger',
			'dashboard.inventory' => 'Inventory',
			'dashboard.vendors' => 'Vendors',
			'dashboard.customers' => 'Customers',
			'dashboard.reports' => 'Reports',
			'defaults.title' => 'Defaults',
			'defaults.defaultAccounts' => 'Default Accounts',
			'defaults.defaultItems' => 'Default Items',
			'defaults.defaultUnits' => 'Default Units',
			'defaults.defaultPayment' => 'Default Payment Methods',
			'defaults.defaultSales' => 'Default Sales Accounts',
			'defaults.defaultPurchases' => 'Default Purchases Accounts',
			'finance_config.paramsTitle' => 'General Parameters',
			'finance_config.language' => 'Language',
			'finance_config.dateFormat' => 'Date Format',
			'finance_config.calendarType' => 'Calendar Type',
			'finance_config.backupSettings' => 'Backup Settings',
			'finance_config.currencyTitle' => 'Currencies',
			'finance_config.currencyAdd' => 'Add New Currency',
			'finance_config.currencyEdit' => 'Edit Currency',
			'finance_config.baseCurrency' => 'Base Currency',
			'finance_config.exchangeRate' => 'Exchange Rate',
			'finance_config.decimalPlaces' => 'Decimal Places',
			'finance_config.denominations' => 'Denominations',
			'finance_config.denomAdd' => 'Add New Denomination',
			'finance_config.denomEdit' => 'Edit Denomination',
			'finance_config.symbol' => 'Symbol',
			'finance_config.taxTitle' => 'Tax Settings',
			'finance_config.taxBrackets' => 'Tax Brackets',
			'finance_config.taxBracketAdd' => 'Add New Tax Bracket',
			'finance_config.taxBracketEdit' => 'Edit Tax Bracket',
			'finance_config.taxTypes' => 'Tax Types',
			'finance_config.taxTypeAdd' => 'Add New Tax Type',
			'finance_config.taxTypeEdit' => 'Edit Tax Type',
			'finance_config.taxRate' => 'Tax Rate',
			'finance_config.isCompound' => 'Is Compound',
			'finance_config.calcMethod' => 'Calculation Method',
			'finance_config.calcMethodAdd' => 'Add New Calculation Method',
			'finance_config.calcMethodEdit' => 'Edit Calculation Method',
			'finance_config.periodTitle' => 'Financial Periods',
			'finance_config.periodAdd' => 'Add Financial Period',
			'finance_config.periodEdit' => 'Edit Financial Period',
			'finance_config.fiscalYear' => 'Fiscal Year',
			'finance_config.generatePeriods' => 'Generate Periods',
			'finance_config.lockPeriod' => 'Lock Period',
			'finance_config.isLocked' => 'Locked',
			'finance_config.unlocked' => 'Unlocked',
			'geo.title' => 'Geographical Data',
			'geo.zones' => 'Zones',
			'geo.zoneAdd' => 'Add New Zone',
			'geo.zoneEdit' => 'Edit Zone',
			'geo.countries' => 'Countries',
			'geo.countryAdd' => 'Add New Country',
			'geo.countryEdit' => 'Edit Country',
			'geo.governorates' => 'Governorates',
			'geo.governorateAdd' => 'Add New Governorate',
			'geo.governorateEdit' => 'Edit Governorate',
			'geo.cities' => 'Cities',
			'geo.cityAdd' => 'Add New City',
			'geo.cityEdit' => 'Edit City',
			'geo.regions' => 'Regions',
			'geo.regionAdd' => 'Add New Region',
			'geo.regionEdit' => 'Edit Region',
			'geo.nationalityAr' => 'Nationality (Arabic)',
			'geo.nationalityEn' => 'Nationality (English)',
			'geo.selectParentPrompt' => 'Select a parent item to add new record',
			'master.title' => 'Items',
			'master.setup' => 'Inventory Setup',
			'master.itemGroups' => 'Item Groups',
			'master.warehouses' => 'Warehouses',
			'master.add' => 'Add Item',
			'master.code' => 'Item Code',
			'master.barcode' => 'Barcode',
			'master.type' => 'Item Type',
			'master.costPrice' => 'Cost Price',
			'master.baseUnit' => 'Base Unit',
			'master.costingMethod' => 'Default Costing Method',
			'master.inventoryVariables' => 'Inventory Variables',
			'ops.title' => 'Stock Operations',
			'ops.incoming' => 'Incoming Stock',
			'ops.outgoing' => 'Outgoing Stock',
			'ops.transfer' => 'Transfer',
			'ops.opening' => 'Opening Stock',
			'ops.quantity' => 'Quantity',
			'ops.unitCost' => 'Unit Cost',
			'ops.totalCost' => 'Total Cost',
			'ops.manageIncomingStock' => 'Manage incoming stock orders',
			'ops.manageOutgoingStock' => 'Manage outgoing stock orders',
			'ops.addOpeningStock' => 'Add Opening Stock',
			'ops.manageWarehouseTransfers' => 'Manage warehouse transfers',
			'ops.createIncomingOrder' => 'Create Incoming Order',
			'ops.createOutgoingOrder' => 'Create Outgoing Order',
			'ops.createTransfer' => 'Create Transfer',
			'ops.incomingStockOrders' => 'Incoming Stock Orders',
			'ops.outgoingStockOrders' => 'Outgoing Stock Orders',
			'ops.warehouseTransfers' => 'Warehouse Transfers',
			'ops.transfers' => 'Transfers',
			'params.title' => 'General Parameters',
			'params.defaultLanguage' => 'Default Language',
			'params.dateFormat' => 'Date Format',
			'params.baseCurrency' => 'Base Currency',
			'params.currencies' => 'Currencies',
			'params.currencyNameAr' => 'Currency Name (Arabic)',
			'params.currencyNameEn' => 'Currency Name (English)',
			'params.symbol' => 'Symbol',
			'params.exchangeRate' => 'Exchange Rate',
			'reports.title' => 'Financial Reports',
			'reports.trialBalance' => 'Trial Balance',
			'reports.incomeStatement' => 'Income Statement',
			'reports.balanceSheet' => 'Balance Sheet',
			'reports.cashFlow' => 'Cash Flow',
			'reports.generalLedger' => 'General Ledger',
			'reports.accountStatement' => 'Account Statement',
			'reports.selectAccount' => 'Select Account',
			'reports.asOfDate' => 'As of Date',
			'reports.selectReport' => 'Select Report',
			'reports.trialBalanceDescription' => 'View trial balance report',
			'reports.incomeStatementDescription' => 'View income statement',
			'reports.balanceSheetDescription' => 'View balance sheet',
			'reports.cashFlowDescription' => 'View cash flow statement',
			'reports.accountStatementDescription' => 'View account statement',
			'reports.generalLedgerReport' => 'General Ledger',
			'reports.generalLedgerDescription' => 'View general ledger',
			'reports.reportRefreshed' => 'Report refreshed',
			'reports.exportReport' => 'Export Report',
			'reports.exportToPdf' => 'Export to PDF',
			'reports.exportToExcel' => 'Export to Excel',
			'reports.exportToCsv' => 'Export to CSV',
			'reports.reportExportedSuccessfully' => ({required String format}) => 'Report exported to ${format}',
			'reports.reportSentToPrinter' => 'Report sent to printer',
			'reports.cashFlowStatement' => 'Cash Flow Statement',
			'reports.toDate' => 'To Date',
			'reports.fromDate' => 'From Date',
			'setup.title' => 'GL Setup & Config',
			'setup.docTypes' => 'Document Types',
			'setup.docTypeAdd' => 'Add Document Type',
			'setup.docTypeEdit' => 'Edit Document Type',
			'setup.docTypeCode' => 'Type Code',
			'setup.descCoding' => 'Description Coding',
			'setup.descCodingAdd' => 'Add Description Coding',
			'setup.descCodingEdit' => 'Edit Description Coding',
			'setup.sequenceMethod' => 'Sequence Method',
			'setup.documentTypesAndDescriptionCoding' => 'Document Types and Description Coding',
			'transactions.title' => 'Transactions',
			'transactions.journalVoucher' => 'Journal Voucher',
			'transactions.receiptVoucher' => 'Receipt Voucher',
			'transactions.paymentVoucher' => 'Payment Voucher',
			'transactions.transferVoucher' => 'Transfer Voucher',
			'transactions.createAndManageJournalVouchers' => 'Create and manage journal vouchers',
			'transactions.managePaymentVouchers' => 'Manage payment vouchers',
			'transactions.manageReceiptVouchers' => 'Manage receipt vouchers',
			'transactions.manageCashAndBankAccounts' => 'Manage cash and bank accounts',
			'transactions.viewFinancialReportsAndStatements' => 'View financial reports and statements',
			'transactions.manageTransactionRequests' => 'Manage transaction requests',
			'transactions.reviewPostAndClosePeriods' => 'Review, post, and close periods',
			'users.title' => 'User Management',
			'users.add' => 'Add New User',
			'users.edit' => 'Edit User',
			'users.fullNameAr' => 'Full Name (Arabic)',
			'users.fullNameEn' => 'Full Name (English)',
			'users.enableBiometric' => 'Enable Biometric',
			'users.linkToDevice' => 'Link to Device',
			'users.isActive' => 'Active',
			'users.isInactive' => 'Inactive',
			'users.roleManagement' => 'Role Management',
			'users.roleAdd' => 'Add New Role',
			'users.roleEdit' => 'Edit Role',
			'users.roleName' => 'Role Name',
			'users.permissions' => 'Permissions',
			'vouchers.journal' => 'Journal Voucher',
			'vouchers.payment' => 'Payment Voucher',
			'vouchers.receipt' => 'Receipt Voucher',
			'vouchers.reference' => 'Reference No',
			'vouchers.debit' => 'Debit',
			'vouchers.credit' => 'Credit',
			'vouchers.difference' => 'Difference',
			'vouchers.post' => 'Post',
			'vouchers.reverse' => 'Reverse',
			'vouchers.lines' => 'Lines',
			'vouchers.addEntry' => 'Add Entry',
			'vouchers.confirmPost' => 'Confirm Posting',
			'vouchers.postedMsg' => 'Voucher posted successfully',
			'vouchers.paymentMethod' => 'Payment Method',
			'vouchers.checkNumber' => 'Check Number',
			'vouchers.beneficiary' => 'Beneficiary',
			'vouchers.payer' => 'Payer',
			_ => null,
		};
	}
}
