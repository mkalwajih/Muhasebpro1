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
	late final TranslationsTranslationsArEn translations_ar = TranslationsTranslationsArEn.internal(_root);
	late final TranslationsTranslationsEnEn translations_en = TranslationsTranslationsEnEn.internal(_root);
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

	/// en: 'View List'
	String get viewList => 'View List';

	/// en: 'Filter Options'
	String get filterOptions => 'Filter Options';

	/// en: 'Search Query'
	String get searchQuery => 'Search Query';

	/// en: 'Enter search term'
	String get enterSearchTerm => 'Enter search term';

	/// en: 'Voucher saved successfully'
	String get voucherSavedSuccessfully => 'Voucher saved successfully';

	/// en: 'Confirm Deletion'
	String get confirmDeletion => 'Confirm Deletion';

	/// en: 'Are you sure you want to delete this item?'
	String get confirmDeleteMessage => 'Are you sure you want to delete this item?';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'Approved'
	String get approved => 'Approved';

	/// en: 'Rejected'
	String get rejected => 'Rejected';

	/// en: 'Pending'
	String get pending => 'Pending';

	/// en: 'Draft'
	String get draft => 'Draft';

	/// en: 'Cancelled'
	String get cancelled => 'Cancelled';

	/// en: 'Posted'
	String get posted => 'Posted';

	/// en: 'Reversed'
	String get reversed => 'Reversed';

	/// en: 'All'
	String get all => 'All';

	/// en: 'Approve'
	String get approve => 'Approve';

	/// en: 'Reject'
	String get reject => 'Reject';

	/// en: 'Approved By'
	String get approvedBy => 'Approved By';
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

	/// en: 'Journal Vouchers'
	String get journalVouchers => 'Journal Vouchers';

	/// en: 'Payment Vouchers'
	String get paymentVouchers => 'Payment Vouchers';

	/// en: 'Receipt Vouchers'
	String get receiptVouchers => 'Receipt Vouchers';

	/// en: 'Transaction Requests'
	String get transactionRequests => 'Transaction Requests';

	/// en: 'All Requests'
	String get allRequests => 'All Requests';

	/// en: 'My Requests'
	String get myRequests => 'My Requests';

	/// en: 'Pending Approvals'
	String get pendingApprovals => 'Pending Approvals';

	/// en: 'Create Request'
	String get createRequest => 'Create Request';

	/// en: 'Edit Request'
	String get editRequest => 'Edit Request';

	/// en: 'Request Type'
	String get requestType => 'Request Type';

	/// en: 'Request Date'
	String get requestDate => 'Request Date';

	/// en: 'Requester'
	String get requester => 'Requester';

	/// en: 'Approver'
	String get approver => 'Approver';

	/// en: 'Approval Date'
	String get approvalDate => 'Approval Date';

	/// en: 'Rejection Reason'
	String get rejectionReason => 'Rejection Reason';

	/// en: 'Please enter amount'
	String get pleaseEnterAmount => 'Please enter amount';

	/// en: 'Please enter valid amount'
	String get pleaseEnterValidAmount => 'Please enter valid amount';

	/// en: 'Please enter description'
	String get pleaseEnterDescription => 'Please enter description';

	/// en: 'Request created successfully'
	String get requestCreatedSuccessfully => 'Request created successfully';

	/// en: 'Request updated successfully'
	String get requestUpdatedSuccessfully => 'Request updated successfully';

	/// en: 'Request approved successfully'
	String get requestApprovedSuccessfully => 'Request approved successfully';

	/// en: 'Request rejected successfully'
	String get requestRejectedSuccessfully => 'Request rejected successfully';

	/// en: 'No requests found'
	String get noRequestsFound => 'No requests found';

	/// en: 'You have not created any requests'
	String get youHaveNotCreatedAnyRequests => 'You have not created any requests';

	/// en: 'No transaction requests found'
	String get noTransactionRequestsFound => 'No transaction requests found';

	/// en: 'Failed to load requests'
	String get failedToLoadRequests => 'Failed to load requests';

	/// en: 'Request Details'
	String get requestDetails => 'Request Details';

	/// en: 'No pending approvals'
	String get noPendingApprovals => 'No pending approvals';

	/// en: 'All requests have been processed'
	String get allRequestsHaveBeenProcessed => 'All requests have been processed';

	/// en: 'Failed to load pending approvals'
	String get failedToLoadPendingApprovals => 'Failed to load pending approvals';

	/// en: 'Reject Request'
	String get rejectRequest => 'Reject Request';

	/// en: 'Please provide rejection reason'
	String get pleaseProvideRejectionReason => 'Please provide rejection reason';

	/// en: 'Adjustment Entry'
	String get adjustmentEntry => 'Adjustment Entry';
}

// Path: translations_ar
class TranslationsTranslationsArEn {
	TranslationsTranslationsArEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'إعدادات النظام'
	String get systemSetup => 'إعدادات النظام';

	/// en: 'دفتر الأستاذ العام'
	String get generalLedger => 'دفتر الأستاذ العام';

	/// en: 'المخزون'
	String get inventory => 'المخزون';

	/// en: 'الموردون'
	String get vendors => 'الموردون';

	/// en: 'العملاء'
	String get customers => 'العملاء';

	/// en: 'تقارير المخزون'
	String get reports => 'تقارير المخزون';

	/// en: 'قيد يومية'
	String get journal => 'قيد يومية';

	/// en: 'سند صرف'
	String get payment => 'سند صرف';

	/// en: 'سند قبض'
	String get receipt => 'سند قبض';

	/// en: 'مرجع'
	String get reference => 'مرجع';

	/// en: 'مدين'
	String get debit => 'مدين';

	/// en: 'دائن'
	String get credit => 'دائن';

	/// en: 'الفرق'
	String get difference => 'الفرق';

	/// en: 'ترحيل'
	String get post => 'ترحيل';

	/// en: 'عكس'
	String get reverse => 'عكس';

	/// en: 'الأسطر'
	String get lines => 'الأسطر';

	/// en: 'إضافة قيد'
	String get addEntry => 'إضافة قيد';

	/// en: 'تأكيد الترحيل'
	String get confirmPost => 'تأكيد الترحيل';

	/// en: 'تم ترحيل السند بنجاح'
	String get postedMsg => 'تم ترحيل السند بنجاح';

	/// en: 'طريقة الدفع'
	String get paymentMethod => 'طريقة الدفع';

	/// en: 'رقم الشيك'
	String get checkNumber => 'رقم الشيك';

	/// en: 'المستفيد'
	String get beneficiary => 'المستفيد';

	/// en: 'الدافع'
	String get payer => 'الدافع';

	/// en: 'ميزان المراجعة'
	String get trialBalance => 'ميزان المراجعة';

	/// en: 'قائمة الدخل'
	String get incomeStatement => 'قائمة الدخل';

	/// en: 'الميزانية العمومية'
	String get balanceSheet => 'الميزانية العمومية';

	/// en: 'التدفقات النقدية'
	String get cashFlow => 'التدفقات النقدية';

	/// en: 'كشف حساب'
	String get accountStatement => 'كشف حساب';

	/// en: 'اختر حساب'
	String get selectAccount => 'اختر حساب';

	/// en: 'بتاريخ'
	String get asOfDate => 'بتاريخ';

	/// en: 'اختر التقرير'
	String get selectReport => 'اختر التقرير';

	/// en: 'عرض تقرير ميزان المراجعة'
	String get trialBalanceDescription => 'عرض تقرير ميزان المراجعة';

	/// en: 'عرض قائمة الدخل'
	String get incomeStatementDescription => 'عرض قائمة الدخل';

	/// en: 'عرض الميزانية العمومية'
	String get balanceSheetDescription => 'عرض الميزانية العمومية';

	/// en: 'عرض قائمة التدفقات النقدية'
	String get cashFlowDescription => 'عرض قائمة التدفقات النقدية';

	/// en: 'عرض كشف حساب'
	String get accountStatementDescription => 'عرض كشف حساب';

	/// en: 'دفتر الأستاذ العام'
	String get generalLedgerReport => 'دفتر الأستاذ العام';

	/// en: 'عرض دفتر الأستاذ العام'
	String get generalLedgerDescription => 'عرض دفتر الأستاذ العام';

	/// en: 'تم تحديث التقرير'
	String get reportRefreshed => 'تم تحديث التقرير';

	/// en: 'تصدير التقرير'
	String get exportReport => 'تصدير التقرير';

	/// en: 'تصدير إلى PDF'
	String get exportToPdf => 'تصدير إلى PDF';

	/// en: 'تصدير إلى Excel'
	String get exportToExcel => 'تصدير إلى Excel';

	/// en: 'تصدير إلى CSV'
	String get exportToCsv => 'تصدير إلى CSV';

	/// en: 'تم تصدير التقرير إلى {format: String}'
	String reportExportedSuccessfully({required String format}) => 'تم تصدير التقرير إلى ${format}';

	/// en: 'تم إرسال التقرير للطباعة'
	String get reportSentToPrinter => 'تم إرسال التقرير للطباعة';

	/// en: 'قائمة التدفقات النقدية'
	String get cashFlowStatement => 'قائمة التدفقات النقدية';

	/// en: 'التقارير المالية'
	String get reportsTitle => 'التقارير المالية';

	/// en: 'قيد يومية'
	String get journalVoucher => 'قيد يومية';

	/// en: 'سند قبض'
	String get receiptVoucher => 'سند قبض';

	/// en: 'سند صرف'
	String get paymentVoucher => 'سند صرف';

	/// en: 'سند تحويل'
	String get transferVoucher => 'سند تحويل';

	/// en: 'إنشاء وإدارة قيود اليومية'
	String get createAndManageJournalVouchers => 'إنشاء وإدارة قيود اليومية';

	/// en: 'إدارة سندات الصرف'
	String get managePaymentVouchers => 'إدارة سندات الصرف';

	/// en: 'إدارة سندات القبض'
	String get manageReceiptVouchers => 'إدارة سندات القبض';

	/// en: 'إدارة حسابات النقدية والبنوك'
	String get manageCashAndBankAccounts => 'إدارة حسابات النقدية والبنوك';

	/// en: 'عرض التقارير والقوائم المالية'
	String get viewFinancialReportsAndStatements => 'عرض التقارير والقوائم المالية';

	/// en: 'إدارة طلبات المعاملات'
	String get manageTransactionRequests => 'إدارة طلبات المعاملات';

	/// en: 'مراجعة وترحيل وإغلاق الفترات'
	String get reviewPostAndClosePeriods => 'مراجعة وترحيل وإغلاق الفترات';

	/// en: 'قيود اليومية'
	String get journalVouchers => 'قيود اليومية';

	/// en: 'سندات الصرف'
	String get paymentVouchers => 'سندات الصرف';

	/// en: 'سندات القبض'
	String get receiptVouchers => 'سندات القبض';

	/// en: 'طلبات المعاملات'
	String get transactionRequests => 'طلبات المعاملات';

	/// en: 'جميع الطلبات'
	String get allRequests => 'جميع الطلبات';

	/// en: 'طلباتي'
	String get myRequests => 'طلباتي';

	/// en: 'الموافقات المعلقة'
	String get pendingApprovals => 'الموافقات المعلقة';

	/// en: 'إنشاء طلب'
	String get createRequest => 'إنشاء طلب';

	/// en: 'تعديل طلب'
	String get editRequest => 'تعديل طلب';

	/// en: 'نوع الطلب'
	String get requestType => 'نوع الطلب';

	/// en: 'تاريخ الطلب'
	String get requestDate => 'تاريخ الطلب';

	/// en: 'مقدم الطلب'
	String get requester => 'مقدم الطلب';

	/// en: 'الموافق'
	String get approver => 'الموافق';

	/// en: 'تاريخ الموافقة'
	String get approvalDate => 'تاريخ الموافقة';

	/// en: 'سبب الرفض'
	String get rejectionReason => 'سبب الرفض';

	/// en: 'الرجاء إدخال المبلغ'
	String get pleaseEnterAmount => 'الرجاء إدخال المبلغ';

	/// en: 'الرجاء إدخال مبلغ صحيح'
	String get pleaseEnterValidAmount => 'الرجاء إدخال مبلغ صحيح';

	/// en: 'الرجاء إدخال الوصف'
	String get pleaseEnterDescription => 'الرجاء إدخال الوصف';

	/// en: 'تم إنشاء الطلب بنجاح'
	String get requestCreatedSuccessfully => 'تم إنشاء الطلب بنجاح';

	/// en: 'تم تحديث الطلب بنجاح'
	String get requestUpdatedSuccessfully => 'تم تحديث الطلب بنجاح';

	/// en: 'تمت الموافقة على الطلب بنجاح'
	String get requestApprovedSuccessfully => 'تمت الموافقة على الطلب بنجاح';

	/// en: 'تم رفض الطلب بنجاح'
	String get requestRejectedSuccessfully => 'تم رفض الطلب بنجاح';

	/// en: 'لم يتم العثور على طلبات'
	String get noRequestsFound => 'لم يتم العثور على طلبات';

	/// en: 'لم تقم بإنشاء أي طلبات'
	String get youHaveNotCreatedAnyRequests => 'لم تقم بإنشاء أي طلبات';

	/// en: 'لم يتم العثور على طلبات معاملات'
	String get noTransactionRequestsFound => 'لم يتم العثور على طلبات معاملات';

	/// en: 'فشل تحميل الطلبات'
	String get failedToLoadRequests => 'فشل تحميل الطلبات';

	/// en: 'تفاصيل الطلب'
	String get requestDetails => 'تفاصيل الطلب';

	/// en: 'لا توجد موافقات معلقة'
	String get noPendingApprovals => 'لا توجد موافقات معلقة';

	/// en: 'تمت معالجة جميع الطلبات'
	String get allRequestsHaveBeenProcessed => 'تمت معالجة جميع الطلبات';

	/// en: 'فشل تحميل الموافقات المعلقة'
	String get failedToLoadPendingApprovals => 'فشل تحميل الموافقات المعلقة';

	/// en: 'رفض الطلب'
	String get rejectRequest => 'رفض الطلب';

	/// en: 'الرجاء تقديم سبب الرفض'
	String get pleaseProvideRejectionReason => 'الرجاء تقديم سبب الرفض';

	/// en: 'قيد تسوية'
	String get adjustmentEntry => 'قيد تسوية';

	/// en: 'أنواع المستندات'
	String get docTypes => 'أنواع المستندات';

	/// en: 'إضافة نوع مستند'
	String get docTypeAdd => 'إضافة نوع مستند';

	/// en: 'تعديل نوع مستند'
	String get docTypeEdit => 'تعديل نوع مستند';

	/// en: 'رمز النوع'
	String get docTypeCode => 'رمز النوع';

	/// en: 'ترميز البيانات'
	String get descCoding => 'ترميز البيانات';

	/// en: 'إضافة ترميز بيان'
	String get descCodingAdd => 'إضافة ترميز بيان';

	/// en: 'تعديل ترميز بيان'
	String get descCodingEdit => 'تعديل ترميز بيان';

	/// en: 'طريقة الترقيم'
	String get sequenceMethod => 'طريقة الترقيم';

	/// en: 'إعدادات الأستاذ العام'
	String get setupTitle => 'إعدادات الأستاذ العام';

	/// en: 'اللغة الافتراضية'
	String get defaultLanguage => 'اللغة الافتراضية';

	/// en: 'تنسيق التاريخ'
	String get dateFormat => 'تنسيق التاريخ';

	/// en: 'العملة الأساسية'
	String get baseCurrency => 'العملة الأساسية';

	/// en: 'العملات'
	String get currencies => 'العملات';

	/// en: 'اسم العملة (عربي)'
	String get currencyNameAr => 'اسم العملة (عربي)';

	/// en: 'اسم العملة (إنجليزي)'
	String get currencyNameEn => 'اسم العملة (إنجليزي)';

	/// en: 'الرمز'
	String get symbol => 'الرمز';

	/// en: 'سعر الصرف'
	String get exchangeRate => 'سعر الصرف';

	/// en: 'الإعدادات العامة'
	String get paramsTitle => 'الإعدادات العامة';

	/// en: 'الحسابات الافتراضية'
	String get defaultAccounts => 'الحسابات الافتراضية';

	/// en: 'الأصناف الافتراضية'
	String get defaultItems => 'الأصناف الافتراضية';

	/// en: 'الوحدات الافتراضية'
	String get defaultUnits => 'الوحدات الافتراضية';

	/// en: 'طرق الدفع الافتراضية'
	String get defaultPayment => 'طرق الدفع الافتراضية';

	/// en: 'حسابات المبيعات الافتراضية'
	String get defaultSales => 'حسابات المبيعات الافتراضية';

	/// en: 'حسابات المشتريات الافتراضية'
	String get defaultPurchases => 'حسابات المشتريات الافتراضية';

	/// en: 'الإعدادات الافتراضية'
	String get defaultsTitle => 'الإعدادات الافتراضية';

	/// en: 'رمز الحساب'
	String get accountCode => 'رمز الحساب';

	/// en: 'الحساب الرئيسي'
	String get parentAccount => 'الحساب الرئيسي';

	/// en: 'طبيعة الحساب'
	String get nature => 'طبيعة الحساب';

	/// en: 'نوع التقرير'
	String get reportType => 'نوع التقرير';

	/// en: 'المستوى'
	String get level => 'المستوى';

	/// en: 'نوع الحساب التفصيلي'
	String get detailType => 'نوع الحساب التفصيلي';

	/// en: 'نوع التدفق النقدي'
	String get cashFlowType => 'نوع التدفق النقدي';

	/// en: 'لا يوجد أصل'
	String get noParent => 'لا يوجد أصل';

	/// en: 'دليل الحسابات'
	String get coa_setupTitle => 'دليل الحسابات';

	/// en: 'رمز الشركة'
	String get companyCode => 'رمز الشركة';

	/// en: 'الرقم الضريبي'
	String get taxNumber => 'الرقم الضريبي';

	/// en: 'رقم السجل التجاري'
	String get regNumber => 'رقم السجل التجاري';

	/// en: 'الشركة الرئيسية'
	String get isMainCompany => 'الشركة الرئيسية';

	/// en: 'العنوان'
	String get address => 'العنوان';

	/// en: 'الهاتف'
	String get phone => 'الهاتف';

	/// en: 'البريد الإلكتروني'
	String get email => 'البريد الإلكتروني';

	/// en: 'اختر شركة من القائمة لعرض التفاصيل.'
	String get selectPrompt => 'اختر شركة من القائمة لعرض التفاصيل.';

	/// en: 'لم يتم إنشاء شركات بعد.'
	String get noCompanies => 'لم يتم إنشاء شركات بعد.';

	/// en: 'الفروع'
	String get branchTitle => 'الفروع';

	/// en: 'إضافة فرع جديد'
	String get branchAdd => 'إضافة فرع جديد';

	/// en: 'تعديل فرع'
	String get branchEdit => 'تعديل فرع';

	/// en: 'رمز الفرع'
	String get branchCode => 'رمز الفرع';

	/// en: 'مجموعة الفرع'
	String get branchGroup => 'مجموعة الفرع';

	/// en: 'المستودع الافتراضي'
	String get defaultWarehouse => 'المستودع الافتراضي';

	/// en: 'اختر فرعاً أو أنشئ واحداً جديداً'
	String get selectOrCreateBranch => 'اختر فرعاً أو أنشئ واحداً جديداً';

	/// en: 'معلومات الشركة'
	String get companyTitle => 'معلومات الشركة';

	/// en: 'اللغة'
	String get language => 'اللغة';

	/// en: 'نوع التقويم'
	String get calendarType => 'نوع التقويم';

	/// en: 'إعدادات النسخ الاحتياطي'
	String get backupSettings => 'إعدادات النسخ الاحتياطي';

	/// en: 'العملات'
	String get currencyTitle => 'العملات';

	/// en: 'إضافة عملة جديدة'
	String get currencyAdd => 'إضافة عملة جديدة';

	/// en: 'تعديل عملة'
	String get currencyEdit => 'تعديل عملة';

	/// en: 'الخانات العشرية'
	String get decimalPlaces => 'الخانات العشرية';

	/// en: 'الفئات'
	String get denominations => 'الفئات';

	/// en: 'إضافة فئة جديدة'
	String get denomAdd => 'إضافة فئة جديدة';

	/// en: 'تعديل فئة'
	String get denomEdit => 'تعديل فئة';

	/// en: 'إعدادات الضرائب'
	String get taxTitle => 'إعدادات الضرائب';

	/// en: 'الشرائح الضريبية'
	String get taxBrackets => 'الشرائح الضريبية';

	/// en: 'إضافة شريحة ضريبية جديدة'
	String get taxBracketAdd => 'إضافة شريحة ضريبية جديدة';

	/// en: 'تعديل الشريحة الضريبية'
	String get taxBracketEdit => 'تعديل الشريحة الضريبية';

	/// en: 'أنواع الضرائب'
	String get taxTypes => 'أنواع الضرائب';

	/// en: 'إضافة نوع ضريبة جديد'
	String get taxTypeAdd => 'إضافة نوع ضريبة جديد';

	/// en: 'تعديل نوع الضريبة'
	String get taxTypeEdit => 'تعديل نوع الضريبة';

	/// en: 'المعدل'
	String get taxRate => 'المعدل';

	/// en: 'ضريبة مركبة'
	String get isCompound => 'ضريبة مركبة';

	/// en: 'طريقة الحساب'
	String get calcMethod => 'طريقة الحساب';

	/// en: 'إضافة طريقة حساب جديدة'
	String get calcMethodAdd => 'إضافة طريقة حساب جديدة';

	/// en: 'تعديل طريقة الحساب'
	String get calcMethodEdit => 'تعديل طريقة الحساب';

	/// en: 'الفترات المالية'
	String get periodTitle => 'الفترات المالية';

	/// en: 'إضافة فترة مالية'
	String get periodAdd => 'إضافة فترة مالية';

	/// en: 'تعديل فترة مالية'
	String get periodEdit => 'تعديل فترة مالية';

	/// en: 'السنة المالية'
	String get fiscalYear => 'السنة المالية';

	/// en: 'إنشاء الفترات'
	String get generatePeriods => 'إنشاء الفترات';

	/// en: 'قفل الفترة'
	String get lockPeriod => 'قفل الفترة';

	/// en: 'مقفلة'
	String get isLocked => 'مقفلة';

	/// en: 'مفتوحة'
	String get unlocked => 'مفتوحة';

	/// en: 'تفعيل البصمة'
	String get enableBiometric => 'تفعيل البصمة';

	/// en: 'ربط الجهاز'
	String get linkToDevice => 'ربط الجهاز';

	/// en: 'نشط'
	String get isActive => 'نشط';

	/// en: 'غير نشط'
	String get isInactive => 'غير نشط';

	/// en: 'إدارة الأدوار'
	String get roleManagement => 'إدارة الأدوار';

	/// en: 'إضافة دور جديد'
	String get roleAdd => 'إضافة دور جديد';

	/// en: 'تعديل دور'
	String get roleEdit => 'تعديل دور';

	/// en: 'اسم الدور'
	String get roleName => 'اسم الدور';

	/// en: 'الصلاحيات'
	String get permissions => 'الصلاحيات';

	/// en: 'إدارة المستخدمين'
	String get usersTitle => 'إدارة المستخدمين';

	/// en: 'المناطق'
	String get zones => 'المناطق';

	/// en: 'إضافة منطقة جديدة'
	String get zoneAdd => 'إضافة منطقة جديدة';

	/// en: 'تعديل منطقة'
	String get zoneEdit => 'تعديل منطقة';

	/// en: 'الدول'
	String get countries => 'الدول';

	/// en: 'إضافة دولة جديدة'
	String get countryAdd => 'إضافة دولة جديدة';

	/// en: 'تعديل دولة'
	String get countryEdit => 'تعديل دولة';

	/// en: 'المحافظات'
	String get governorates => 'المحافظات';

	/// en: 'إضافة محافظة جديدة'
	String get governorateAdd => 'إضافة محافظة جديدة';

	/// en: 'تعديل محافظة'
	String get governorateEdit => 'تعديل محافظة';

	/// en: 'المدن'
	String get cities => 'المدن';

	/// en: 'إضافة مدينة جديدة'
	String get cityAdd => 'إضافة مدينة جديدة';

	/// en: 'تعديل مدينة'
	String get cityEdit => 'تعديل مدينة';

	/// en: 'الأحياء'
	String get regions => 'الأحياء';

	/// en: 'إضافة حي جديد'
	String get regionAdd => 'إضافة حي جديد';

	/// en: 'تعديل حي'
	String get regionEdit => 'تعديل حي';

	/// en: 'الجنسية (عربي)'
	String get nationalityAr => 'الجنسية (عربي)';

	/// en: 'الجنسية (إنجليزي)'
	String get nationalityEn => 'الجنسية (إنجليزي)';

	/// en: 'حدد عنصراً رئيسياً لإضافة سجل جديد'
	String get selectParentPrompt => 'حدد عنصراً رئيسياً لإضافة سجل جديد';

	/// en: 'البيانات الجغرافية'
	String get geoTitle => 'البيانات الجغرافية';

	/// en: 'اسم الحساب (عربي)'
	String get accountNameAr => 'اسم الحساب (عربي)';

	/// en: 'اسم الحساب (إنجليزي)'
	String get accountNameEn => 'اسم الحساب (إنجليزي)';

	/// en: 'طبيعة الحساب'
	String get accountNature => 'طبيعة الحساب';

	/// en: 'اختر حساباً لعرض التفاصيل'
	String get selectAccountPrompt => 'اختر حساباً لعرض التفاصيل';

	/// en: 'دليل الحسابات'
	String get coaTitle => 'دليل الحسابات';

	/// en: 'حفظ'
	String get save => 'حفظ';

	/// en: 'إلغاء'
	String get cancel => 'إلغاء';

	/// en: 'حذف'
	String get delete => 'حذف';

	/// en: 'تعديل'
	String get edit => 'تعديل';

	/// en: 'إضافة'
	String get add => 'إضافة';

	/// en: 'إضافة جديد'
	String get addNew => 'إضافة جديد';

	/// en: 'تحديث'
	String get update => 'تحديث';

	/// en: 'إرسال'
	String get submit => 'إرسال';

	/// en: 'تأكيد'
	String get confirm => 'تأكيد';

	/// en: 'إغلاق'
	String get close => 'إغلاق';

	/// en: 'بحث'
	String get search => 'بحث';

	/// en: 'تصفية'
	String get filter => 'تصفية';

	/// en: 'تطبيق'
	String get apply => 'تطبيق';

	/// en: 'إعادة تعيين'
	String get reset => 'إعادة تعيين';

	/// en: 'تحديث'
	String get refresh => 'تحديث';

	/// en: 'التفاصيل'
	String get details => 'التفاصيل';

	/// en: 'إجراءات'
	String get actions => 'إجراءات';

	/// en: 'نعم'
	String get yes => 'نعم';

	/// en: 'لا'
	String get no => 'لا';

	/// en: 'نشط'
	String get active => 'نشط';

	/// en: 'غير نشط'
	String get inactive => 'غير نشط';

	/// en: 'جاري التحميل...'
	String get loading => 'جاري التحميل...';

	/// en: 'خطأ'
	String get error => 'خطأ';

	/// en: 'نجاح'
	String get success => 'نجاح';

	/// en: 'الحالة'
	String get status => 'الحالة';

	/// en: 'الوصف'
	String get description => 'الوصف';

	/// en: 'ملاحظات'
	String get notes => 'ملاحظات';

	/// en: 'التاريخ'
	String get date => 'التاريخ';

	/// en: 'المبلغ'
	String get amount => 'المبلغ';

	/// en: 'الإجمالي'
	String get total => 'الإجمالي';

	/// en: 'الرمز'
	String get code => 'الرمز';

	/// en: 'الاسم (عربي)'
	String get nameAr => 'الاسم (عربي)';

	/// en: 'الاسم (إنجليزي)'
	String get nameEn => 'الاسم (إنجليزي)';

	/// en: 'الاسم الكامل (عربي)'
	String get fullNameAr => 'الاسم الكامل (عربي)';

	/// en: 'الاسم الكامل (إنجليزي)'
	String get fullNameEn => 'الاسم الكامل (إنجليزي)';

	/// en: 'الشعار'
	String get logo => 'الشعار';

	/// en: 'رفع الشعار'
	String get uploadLogo => 'رفع الشعار';

	/// en: 'تصدير'
	String get export => 'تصدير';

	/// en: 'طباعة'
	String get print => 'طباعة';

	/// en: 'من تاريخ'
	String get fromDate => 'من تاريخ';

	/// en: 'إلى تاريخ'
	String get toDate => 'إلى تاريخ';

	/// en: 'حقل مطلوب'
	String get requiredField => 'حقل مطلوب';

	/// en: 'قريباً!'
	String get comingSoon => 'قريباً!';

	/// en: 'تم الحفظ بنجاح'
	String get saveSuccess => 'تم الحفظ بنجاح';

	/// en: 'فشل الحفظ'
	String get saveFailed => 'فشل الحفظ';

	/// en: 'تم الحذف بنجاح'
	String get deleteSuccess => 'تم الحذف بنجاح';

	/// en: 'فشل الحذف'
	String get deleteFailed => 'فشل الحذف';

	/// en: 'هل أنت متأكد أنك تريد حذف هذا العنصر؟'
	String get confirmDelete => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟';

	/// en: 'تم رفض الوصول'
	String get accessDenied => 'تم رفض الوصول';

	/// en: 'عرض القائمة'
	String get viewList => 'عرض القائمة';

	/// en: 'خيارات التصفية'
	String get filterOptions => 'خيارات التصفية';

	/// en: 'استعلام البحث'
	String get searchQuery => 'استعلام البحث';

	/// en: 'أدخل عبارة البحث'
	String get enterSearchTerm => 'أدخل عبارة البحث';

	/// en: 'تم حفظ القسيمة بنجاح'
	String get voucherSavedSuccessfully => 'تم حفظ القسيمة بنجاح';

	/// en: 'تأكيد الحذف'
	String get confirmDeletion => 'تأكيد الحذف';

	/// en: 'هل أنت متأكد أنك تريد حذف هذا العنصر؟'
	String get confirmDeleteMessage => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟';

	/// en: 'إنشاء'
	String get create => 'إنشاء';

	/// en: 'موافق عليه'
	String get approved => 'موافق عليه';

	/// en: 'مرفوض'
	String get rejected => 'مرفوض';

	/// en: 'قيد الانتظار'
	String get pending => 'قيد الانتظار';

	/// en: 'مسودة'
	String get draft => 'مسودة';

	/// en: 'ملغى'
	String get cancelled => 'ملغى';

	/// en: 'مرحل'
	String get posted => 'مرحل';

	/// en: 'معكوس'
	String get reversed => 'معكوس';

	/// en: 'الكل'
	String get all => 'الكل';

	/// en: 'موافقة'
	String get approve => 'موافقة';

	/// en: 'رفض'
	String get reject => 'رفض';

	/// en: 'وافق عليه'
	String get approvedBy => 'وافق عليه';

	/// en: 'إعدادات المخزون'
	String get setup => 'إعدادات المخزون';

	/// en: 'مجموعات الأصناف'
	String get itemGroups => 'مجموعات الأصناف';

	/// en: 'المستودعات'
	String get warehouses => 'المستودعات';

	/// en: 'باركود'
	String get barcode => 'باركود';

	/// en: 'نوع الصنف'
	String get type => 'نوع الصنف';

	/// en: 'سعر التكلفة'
	String get costPrice => 'سعر التكلفة';

	/// en: 'الوحدة الأساسية'
	String get baseUnit => 'الوحدة الأساسية';

	/// en: 'طريقة التكلفة الافتراضية'
	String get costingMethod => 'طريقة التكلفة الافتراضية';

	/// en: 'متغيرات المخزون'
	String get inventoryVariables => 'متغيرات المخزون';

	/// en: 'الأصناف'
	String get masterTitle => 'الأصناف';

	/// en: 'الجرد'
	String get stocktaking => 'الجرد';

	/// en: 'بدء الجرد'
	String get startSession => 'بدء الجرد';

	/// en: 'الحجوزات'
	String get reservations => 'الحجوزات';

	/// en: 'أرصدة المخزون'
	String get balances => 'أرصدة المخزون';

	/// en: 'تقييم المخزون'
	String get valuation => 'تقييم المخزون';

	/// en: 'حركة الأصناف'
	String get movement => 'حركة الأصناف';

	/// en: 'جلسات الجرد'
	String get stocktakingSessions => 'جلسات الجرد';

	/// en: 'إدارة جلسات الجرد'
	String get manageStocktaking => 'إدارة جلسات الجرد';

	/// en: 'عرض وإدارة جلسات الجرد'
	String get stocktakingInfo => 'عرض وإدارة جلسات الجرد';

	/// en: 'حجوزات المخزون'
	String get stockReservations => 'حجوزات المخزون';

	/// en: 'إدارة حجوزات المخزون'
	String get manageReservations => 'إدارة حجوزات المخزون';

	/// en: 'إنشاء حجز'
	String get createReservation => 'إنشاء حجز';

	/// en: 'إنشاء وإدارة حجوزات الأصناف'
	String get reservationInfo => 'إنشاء وإدارة حجوزات الأصناف';

	/// en: 'مراقبة المخزون'
	String get controlTitle => 'مراقبة المخزون';

	/// en: 'الوارد'
	String get incoming => 'الوارد';

	/// en: 'الصادر'
	String get outgoing => 'الصادر';

	/// en: 'تحويل'
	String get transfer => 'تحويل';

	/// en: 'رصيد افتتاحي'
	String get opening => 'رصيد افتتاحي';

	/// en: 'الكمية'
	String get quantity => 'الكمية';

	/// en: 'سعر الوحدة'
	String get unitCost => 'سعر الوحدة';

	/// en: 'إجمالي التكلفة'
	String get totalCost => 'إجمالي التكلفة';

	/// en: 'إدارة الوارد'
	String get manageIncomingStock => 'إدارة الوارد';

	/// en: 'إدارة الصادر'
	String get manageOutgoingStock => 'إدارة الصادر';

	/// en: 'إضافة رصيد افتتاحي'
	String get addOpeningStock => 'إضافة رصيد افتتاحي';

	/// en: 'إدارة تحويلات المستودعات'
	String get manageWarehouseTransfers => 'إدارة تحويلات المستودعات';

	/// en: 'إنشاء أمر توريد'
	String get createIncomingOrder => 'إنشاء أمر توريد';

	/// en: 'إنشاء أمر صرف'
	String get createOutgoingOrder => 'إنشاء أمر صرف';

	/// en: 'إنشاء تحويل'
	String get createTransfer => 'إنشاء تحويل';

	/// en: 'أوامر التوريد'
	String get incomingStockOrders => 'أوامر التوريد';

	/// en: 'أوامر الصرف'
	String get outgoingStockOrders => 'أوامر الصرف';

	/// en: 'تحويلات المستودعات'
	String get warehouseTransfers => 'تحويلات المستودعات';

	/// en: 'التحويلات'
	String get transfers => 'التحويلات';

	/// en: 'عمليات المخزون'
	String get opsTitle => 'عمليات المخزون';

	/// en: 'سجل الدخول إلى حسابك'
	String get subtitle => 'سجل الدخول إلى حسابك';

	/// en: 'اسم المستخدم'
	String get username => 'اسم المستخدم';

	/// en: 'كلمة المرور'
	String get password => 'كلمة المرور';

	/// en: 'كلمة المرور الجديدة'
	String get newPassword => 'كلمة المرور الجديدة';

	/// en: 'تأكيد كلمة المرور'
	String get confirmPassword => 'تأكيد كلمة المرور';

	/// en: 'تسجيل الدخول'
	String get login => 'تسجيل الدخول';

	/// en: 'تسجيل الخروج'
	String get logout => 'تسجيل الخروج';

	/// en: 'تسجيل'
	String get register => 'تسجيل';

	/// en: 'نسيت كلمة المرور؟'
	String get forgotPassword => 'نسيت كلمة المرور؟';

	/// en: 'إعادة تعيين كلمة المرور'
	String get resetPassword => 'إعادة تعيين كلمة المرور';

	/// en: 'تم إعادة تعيين كلمة المرور بنجاح'
	String get resetPasswordSuccess => 'تم إعادة تعيين كلمة المرور بنجاح';

	/// en: 'العودة لتسجيل الدخول'
	String get backToLogin => 'العودة لتسجيل الدخول';

	/// en: 'مرحباً'
	String get welcome => 'مرحباً';

	/// en: 'تم التسجيل بنجاح'
	String get registrationSuccess => 'تم التسجيل بنجاح';

	/// en: 'هذا الحساب غير نشط'
	String get userInactive => 'هذا الحساب غير نشط';

	/// en: 'اسم المستخدم أو كلمة المرور غير صحيحة'
	String get invalidCredentials => 'اسم المستخدم أو كلمة المرور غير صحيحة';

	/// en: 'كلمات المرور غير متطابقة'
	String get passwordMismatch => 'كلمات المرور غير متطابقة';

	/// en: 'يجب أن تكون كلمة المرور 6 أحرف على الأقل'
	String get passwordLength => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

	/// en: 'محاسب برو'
	String get authTitle => 'محاسب برو';
}

// Path: translations_en
class TranslationsTranslationsEnEn {
	TranslationsTranslationsEnEn.internal(this._root);

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

	/// en: 'Inventory Reports'
	String get reports => 'Inventory Reports';

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

	/// en: 'Trial Balance'
	String get trialBalance => 'Trial Balance';

	/// en: 'Income Statement'
	String get incomeStatement => 'Income Statement';

	/// en: 'Balance Sheet'
	String get balanceSheet => 'Balance Sheet';

	/// en: 'Cash Flow'
	String get cashFlow => 'Cash Flow';

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

	/// en: 'Financial Reports'
	String get reportsTitle => 'Financial Reports';

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

	/// en: 'Journal Vouchers'
	String get journalVouchers => 'Journal Vouchers';

	/// en: 'Payment Vouchers'
	String get paymentVouchers => 'Payment Vouchers';

	/// en: 'Receipt Vouchers'
	String get receiptVouchers => 'Receipt Vouchers';

	/// en: 'Transaction Requests'
	String get transactionRequests => 'Transaction Requests';

	/// en: 'All Requests'
	String get allRequests => 'All Requests';

	/// en: 'My Requests'
	String get myRequests => 'My Requests';

	/// en: 'Pending Approvals'
	String get pendingApprovals => 'Pending Approvals';

	/// en: 'Create Request'
	String get createRequest => 'Create Request';

	/// en: 'Edit Request'
	String get editRequest => 'Edit Request';

	/// en: 'Request Type'
	String get requestType => 'Request Type';

	/// en: 'Request Date'
	String get requestDate => 'Request Date';

	/// en: 'Requester'
	String get requester => 'Requester';

	/// en: 'Approver'
	String get approver => 'Approver';

	/// en: 'Approval Date'
	String get approvalDate => 'Approval Date';

	/// en: 'Rejection Reason'
	String get rejectionReason => 'Rejection Reason';

	/// en: 'Please enter amount'
	String get pleaseEnterAmount => 'Please enter amount';

	/// en: 'Please enter valid amount'
	String get pleaseEnterValidAmount => 'Please enter valid amount';

	/// en: 'Please enter description'
	String get pleaseEnterDescription => 'Please enter description';

	/// en: 'Request created successfully'
	String get requestCreatedSuccessfully => 'Request created successfully';

	/// en: 'Request updated successfully'
	String get requestUpdatedSuccessfully => 'Request updated successfully';

	/// en: 'Request approved successfully'
	String get requestApprovedSuccessfully => 'Request approved successfully';

	/// en: 'Request rejected successfully'
	String get requestRejectedSuccessfully => 'Request rejected successfully';

	/// en: 'No requests found'
	String get noRequestsFound => 'No requests found';

	/// en: 'You have not created any requests'
	String get youHaveNotCreatedAnyRequests => 'You have not created any requests';

	/// en: 'No transaction requests found'
	String get noTransactionRequestsFound => 'No transaction requests found';

	/// en: 'Failed to load requests'
	String get failedToLoadRequests => 'Failed to load requests';

	/// en: 'Request Details'
	String get requestDetails => 'Request Details';

	/// en: 'No pending approvals'
	String get noPendingApprovals => 'No pending approvals';

	/// en: 'All requests have been processed'
	String get allRequestsHaveBeenProcessed => 'All requests have been processed';

	/// en: 'Failed to load pending approvals'
	String get failedToLoadPendingApprovals => 'Failed to load pending approvals';

	/// en: 'Reject Request'
	String get rejectRequest => 'Reject Request';

	/// en: 'Please provide rejection reason'
	String get pleaseProvideRejectionReason => 'Please provide rejection reason';

	/// en: 'Adjustment Entry'
	String get adjustmentEntry => 'Adjustment Entry';

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

	/// en: 'GL Setup & Config'
	String get setupTitle => 'GL Setup & Config';

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

	/// en: 'Cash & Bank Management'
	String get cashbankTitle => 'Cash & Bank Management';

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

	/// en: 'General Parameters'
	String get paramsTitle => 'General Parameters';

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

	/// en: 'Defaults'
	String get defaultsTitle => 'Defaults';

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

	/// en: 'Chart of Accounts'
	String get coa_setupTitle => 'Chart of Accounts';

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

	/// en: 'Company Info'
	String get companyTitle => 'Company Info';

	/// en: 'Language'
	String get language => 'Language';

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

	/// en: 'Decimal Places'
	String get decimalPlaces => 'Decimal Places';

	/// en: 'Denominations'
	String get denominations => 'Denominations';

	/// en: 'Add New Denomination'
	String get denomAdd => 'Add New Denomination';

	/// en: 'Edit Denomination'
	String get denomEdit => 'Edit Denomination';

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

	/// en: 'User Management'
	String get usersTitle => 'User Management';

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

	/// en: 'Geographical Data'
	String get geoTitle => 'Geographical Data';

	/// en: 'Account Name (Arabic)'
	String get accountNameAr => 'Account Name (Arabic)';

	/// en: 'Account Name (English)'
	String get accountNameEn => 'Account Name (English)';

	/// en: 'Account Nature'
	String get accountNature => 'Account Nature';

	/// en: 'Select an account to view details'
	String get selectAccountPrompt => 'Select an account to view details';

	/// en: 'Chart of Accounts'
	String get coaTitle => 'Chart of Accounts';

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

	/// en: 'View List'
	String get viewList => 'View List';

	/// en: 'Filter Options'
	String get filterOptions => 'Filter Options';

	/// en: 'Search Query'
	String get searchQuery => 'Search Query';

	/// en: 'Enter search term'
	String get enterSearchTerm => 'Enter search term';

	/// en: 'Voucher saved successfully'
	String get voucherSavedSuccessfully => 'Voucher saved successfully';

	/// en: 'Confirm Deletion'
	String get confirmDeletion => 'Confirm Deletion';

	/// en: 'Are you sure you want to delete this item?'
	String get confirmDeleteMessage => 'Are you sure you want to delete this item?';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'Approved'
	String get approved => 'Approved';

	/// en: 'Rejected'
	String get rejected => 'Rejected';

	/// en: 'Pending'
	String get pending => 'Pending';

	/// en: 'Draft'
	String get draft => 'Draft';

	/// en: 'Cancelled'
	String get cancelled => 'Cancelled';

	/// en: 'Posted'
	String get posted => 'Posted';

	/// en: 'Reversed'
	String get reversed => 'Reversed';

	/// en: 'All'
	String get all => 'All';

	/// en: 'Approve'
	String get approve => 'Approve';

	/// en: 'Reject'
	String get reject => 'Reject';

	/// en: 'Approved By'
	String get approvedBy => 'Approved By';

	/// en: 'Inventory Setup'
	String get setup => 'Inventory Setup';

	/// en: 'Item Groups'
	String get itemGroups => 'Item Groups';

	/// en: 'Warehouses'
	String get warehouses => 'Warehouses';

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

	/// en: 'Items'
	String get masterTitle => 'Items';

	/// en: 'Stocktaking'
	String get stocktaking => 'Stocktaking';

	/// en: 'Start Stocktaking'
	String get startSession => 'Start Stocktaking';

	/// en: 'Reservations'
	String get reservations => 'Reservations';

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

	/// en: 'Inventory Control'
	String get controlTitle => 'Inventory Control';

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

	/// en: 'Stock Operations'
	String get opsTitle => 'Stock Operations';

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

	/// en: 'MuhasebPro'
	String get authTitle => 'MuhasebPro';
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
			'common.viewList' => 'View List',
			'common.filterOptions' => 'Filter Options',
			'common.searchQuery' => 'Search Query',
			'common.enterSearchTerm' => 'Enter search term',
			'common.voucherSavedSuccessfully' => 'Voucher saved successfully',
			'common.confirmDeletion' => 'Confirm Deletion',
			'common.confirmDeleteMessage' => 'Are you sure you want to delete this item?',
			'common.create' => 'Create',
			'common.approved' => 'Approved',
			'common.rejected' => 'Rejected',
			'common.pending' => 'Pending',
			'common.draft' => 'Draft',
			'common.cancelled' => 'Cancelled',
			'common.posted' => 'Posted',
			'common.reversed' => 'Reversed',
			'common.all' => 'All',
			'common.approve' => 'Approve',
			'common.reject' => 'Reject',
			'common.approvedBy' => 'Approved By',
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
			'transactions.journalVouchers' => 'Journal Vouchers',
			'transactions.paymentVouchers' => 'Payment Vouchers',
			'transactions.receiptVouchers' => 'Receipt Vouchers',
			'transactions.transactionRequests' => 'Transaction Requests',
			'transactions.allRequests' => 'All Requests',
			'transactions.myRequests' => 'My Requests',
			'transactions.pendingApprovals' => 'Pending Approvals',
			'transactions.createRequest' => 'Create Request',
			'transactions.editRequest' => 'Edit Request',
			'transactions.requestType' => 'Request Type',
			'transactions.requestDate' => 'Request Date',
			'transactions.requester' => 'Requester',
			'transactions.approver' => 'Approver',
			'transactions.approvalDate' => 'Approval Date',
			'transactions.rejectionReason' => 'Rejection Reason',
			'transactions.pleaseEnterAmount' => 'Please enter amount',
			'transactions.pleaseEnterValidAmount' => 'Please enter valid amount',
			'transactions.pleaseEnterDescription' => 'Please enter description',
			'transactions.requestCreatedSuccessfully' => 'Request created successfully',
			'transactions.requestUpdatedSuccessfully' => 'Request updated successfully',
			'transactions.requestApprovedSuccessfully' => 'Request approved successfully',
			'transactions.requestRejectedSuccessfully' => 'Request rejected successfully',
			'transactions.noRequestsFound' => 'No requests found',
			'transactions.youHaveNotCreatedAnyRequests' => 'You have not created any requests',
			'transactions.noTransactionRequestsFound' => 'No transaction requests found',
			'transactions.failedToLoadRequests' => 'Failed to load requests',
			'transactions.requestDetails' => 'Request Details',
			'transactions.noPendingApprovals' => 'No pending approvals',
			'transactions.allRequestsHaveBeenProcessed' => 'All requests have been processed',
			'transactions.failedToLoadPendingApprovals' => 'Failed to load pending approvals',
			'transactions.rejectRequest' => 'Reject Request',
			'transactions.pleaseProvideRejectionReason' => 'Please provide rejection reason',
			'transactions.adjustmentEntry' => 'Adjustment Entry',
			'translations_ar.systemSetup' => 'إعدادات النظام',
			'translations_ar.generalLedger' => 'دفتر الأستاذ العام',
			'translations_ar.inventory' => 'المخزون',
			'translations_ar.vendors' => 'الموردون',
			'translations_ar.customers' => 'العملاء',
			'translations_ar.reports' => 'تقارير المخزون',
			'translations_ar.journal' => 'قيد يومية',
			'translations_ar.payment' => 'سند صرف',
			'translations_ar.receipt' => 'سند قبض',
			'translations_ar.reference' => 'مرجع',
			'translations_ar.debit' => 'مدين',
			'translations_ar.credit' => 'دائن',
			'translations_ar.difference' => 'الفرق',
			'translations_ar.post' => 'ترحيل',
			'translations_ar.reverse' => 'عكس',
			'translations_ar.lines' => 'الأسطر',
			'translations_ar.addEntry' => 'إضافة قيد',
			'translations_ar.confirmPost' => 'تأكيد الترحيل',
			'translations_ar.postedMsg' => 'تم ترحيل السند بنجاح',
			'translations_ar.paymentMethod' => 'طريقة الدفع',
			'translations_ar.checkNumber' => 'رقم الشيك',
			'translations_ar.beneficiary' => 'المستفيد',
			'translations_ar.payer' => 'الدافع',
			'translations_ar.trialBalance' => 'ميزان المراجعة',
			'translations_ar.incomeStatement' => 'قائمة الدخل',
			'translations_ar.balanceSheet' => 'الميزانية العمومية',
			'translations_ar.cashFlow' => 'التدفقات النقدية',
			'translations_ar.accountStatement' => 'كشف حساب',
			'translations_ar.selectAccount' => 'اختر حساب',
			'translations_ar.asOfDate' => 'بتاريخ',
			'translations_ar.selectReport' => 'اختر التقرير',
			'translations_ar.trialBalanceDescription' => 'عرض تقرير ميزان المراجعة',
			'translations_ar.incomeStatementDescription' => 'عرض قائمة الدخل',
			'translations_ar.balanceSheetDescription' => 'عرض الميزانية العمومية',
			'translations_ar.cashFlowDescription' => 'عرض قائمة التدفقات النقدية',
			'translations_ar.accountStatementDescription' => 'عرض كشف حساب',
			'translations_ar.generalLedgerReport' => 'دفتر الأستاذ العام',
			'translations_ar.generalLedgerDescription' => 'عرض دفتر الأستاذ العام',
			'translations_ar.reportRefreshed' => 'تم تحديث التقرير',
			'translations_ar.exportReport' => 'تصدير التقرير',
			'translations_ar.exportToPdf' => 'تصدير إلى PDF',
			'translations_ar.exportToExcel' => 'تصدير إلى Excel',
			'translations_ar.exportToCsv' => 'تصدير إلى CSV',
			'translations_ar.reportExportedSuccessfully' => ({required String format}) => 'تم تصدير التقرير إلى ${format}',
			'translations_ar.reportSentToPrinter' => 'تم إرسال التقرير للطباعة',
			'translations_ar.cashFlowStatement' => 'قائمة التدفقات النقدية',
			'translations_ar.reportsTitle' => 'التقارير المالية',
			'translations_ar.journalVoucher' => 'قيد يومية',
			'translations_ar.receiptVoucher' => 'سند قبض',
			'translations_ar.paymentVoucher' => 'سند صرف',
			'translations_ar.transferVoucher' => 'سند تحويل',
			'translations_ar.createAndManageJournalVouchers' => 'إنشاء وإدارة قيود اليومية',
			'translations_ar.managePaymentVouchers' => 'إدارة سندات الصرف',
			'translations_ar.manageReceiptVouchers' => 'إدارة سندات القبض',
			'translations_ar.manageCashAndBankAccounts' => 'إدارة حسابات النقدية والبنوك',
			'translations_ar.viewFinancialReportsAndStatements' => 'عرض التقارير والقوائم المالية',
			'translations_ar.manageTransactionRequests' => 'إدارة طلبات المعاملات',
			'translations_ar.reviewPostAndClosePeriods' => 'مراجعة وترحيل وإغلاق الفترات',
			'translations_ar.journalVouchers' => 'قيود اليومية',
			'translations_ar.paymentVouchers' => 'سندات الصرف',
			'translations_ar.receiptVouchers' => 'سندات القبض',
			'translations_ar.transactionRequests' => 'طلبات المعاملات',
			'translations_ar.allRequests' => 'جميع الطلبات',
			'translations_ar.myRequests' => 'طلباتي',
			'translations_ar.pendingApprovals' => 'الموافقات المعلقة',
			'translations_ar.createRequest' => 'إنشاء طلب',
			'translations_ar.editRequest' => 'تعديل طلب',
			'translations_ar.requestType' => 'نوع الطلب',
			'translations_ar.requestDate' => 'تاريخ الطلب',
			'translations_ar.requester' => 'مقدم الطلب',
			'translations_ar.approver' => 'الموافق',
			'translations_ar.approvalDate' => 'تاريخ الموافقة',
			'translations_ar.rejectionReason' => 'سبب الرفض',
			'translations_ar.pleaseEnterAmount' => 'الرجاء إدخال المبلغ',
			'translations_ar.pleaseEnterValidAmount' => 'الرجاء إدخال مبلغ صحيح',
			'translations_ar.pleaseEnterDescription' => 'الرجاء إدخال الوصف',
			'translations_ar.requestCreatedSuccessfully' => 'تم إنشاء الطلب بنجاح',
			'translations_ar.requestUpdatedSuccessfully' => 'تم تحديث الطلب بنجاح',
			'translations_ar.requestApprovedSuccessfully' => 'تمت الموافقة على الطلب بنجاح',
			'translations_ar.requestRejectedSuccessfully' => 'تم رفض الطلب بنجاح',
			'translations_ar.noRequestsFound' => 'لم يتم العثور على طلبات',
			'translations_ar.youHaveNotCreatedAnyRequests' => 'لم تقم بإنشاء أي طلبات',
			'translations_ar.noTransactionRequestsFound' => 'لم يتم العثور على طلبات معاملات',
			'translations_ar.failedToLoadRequests' => 'فشل تحميل الطلبات',
			'translations_ar.requestDetails' => 'تفاصيل الطلب',
			'translations_ar.noPendingApprovals' => 'لا توجد موافقات معلقة',
			'translations_ar.allRequestsHaveBeenProcessed' => 'تمت معالجة جميع الطلبات',
			'translations_ar.failedToLoadPendingApprovals' => 'فشل تحميل الموافقات المعلقة',
			'translations_ar.rejectRequest' => 'رفض الطلب',
			'translations_ar.pleaseProvideRejectionReason' => 'الرجاء تقديم سبب الرفض',
			'translations_ar.adjustmentEntry' => 'قيد تسوية',
			'translations_ar.docTypes' => 'أنواع المستندات',
			'translations_ar.docTypeAdd' => 'إضافة نوع مستند',
			'translations_ar.docTypeEdit' => 'تعديل نوع مستند',
			'translations_ar.docTypeCode' => 'رمز النوع',
			'translations_ar.descCoding' => 'ترميز البيانات',
			'translations_ar.descCodingAdd' => 'إضافة ترميز بيان',
			'translations_ar.descCodingEdit' => 'تعديل ترميز بيان',
			'translations_ar.sequenceMethod' => 'طريقة الترقيم',
			'translations_ar.setupTitle' => 'إعدادات الأستاذ العام',
			'translations_ar.defaultLanguage' => 'اللغة الافتراضية',
			'translations_ar.dateFormat' => 'تنسيق التاريخ',
			'translations_ar.baseCurrency' => 'العملة الأساسية',
			'translations_ar.currencies' => 'العملات',
			'translations_ar.currencyNameAr' => 'اسم العملة (عربي)',
			'translations_ar.currencyNameEn' => 'اسم العملة (إنجليزي)',
			'translations_ar.symbol' => 'الرمز',
			'translations_ar.exchangeRate' => 'سعر الصرف',
			'translations_ar.paramsTitle' => 'الإعدادات العامة',
			'translations_ar.defaultAccounts' => 'الحسابات الافتراضية',
			'translations_ar.defaultItems' => 'الأصناف الافتراضية',
			'translations_ar.defaultUnits' => 'الوحدات الافتراضية',
			'translations_ar.defaultPayment' => 'طرق الدفع الافتراضية',
			'translations_ar.defaultSales' => 'حسابات المبيعات الافتراضية',
			'translations_ar.defaultPurchases' => 'حسابات المشتريات الافتراضية',
			'translations_ar.defaultsTitle' => 'الإعدادات الافتراضية',
			'translations_ar.accountCode' => 'رمز الحساب',
			'translations_ar.parentAccount' => 'الحساب الرئيسي',
			'translations_ar.nature' => 'طبيعة الحساب',
			'translations_ar.reportType' => 'نوع التقرير',
			'translations_ar.level' => 'المستوى',
			'translations_ar.detailType' => 'نوع الحساب التفصيلي',
			'translations_ar.cashFlowType' => 'نوع التدفق النقدي',
			'translations_ar.noParent' => 'لا يوجد أصل',
			'translations_ar.coa_setupTitle' => 'دليل الحسابات',
			'translations_ar.companyCode' => 'رمز الشركة',
			'translations_ar.taxNumber' => 'الرقم الضريبي',
			'translations_ar.regNumber' => 'رقم السجل التجاري',
			'translations_ar.isMainCompany' => 'الشركة الرئيسية',
			'translations_ar.address' => 'العنوان',
			'translations_ar.phone' => 'الهاتف',
			'translations_ar.email' => 'البريد الإلكتروني',
			'translations_ar.selectPrompt' => 'اختر شركة من القائمة لعرض التفاصيل.',
			'translations_ar.noCompanies' => 'لم يتم إنشاء شركات بعد.',
			'translations_ar.branchTitle' => 'الفروع',
			'translations_ar.branchAdd' => 'إضافة فرع جديد',
			'translations_ar.branchEdit' => 'تعديل فرع',
			'translations_ar.branchCode' => 'رمز الفرع',
			'translations_ar.branchGroup' => 'مجموعة الفرع',
			'translations_ar.defaultWarehouse' => 'المستودع الافتراضي',
			'translations_ar.selectOrCreateBranch' => 'اختر فرعاً أو أنشئ واحداً جديداً',
			'translations_ar.companyTitle' => 'معلومات الشركة',
			'translations_ar.language' => 'اللغة',
			'translations_ar.calendarType' => 'نوع التقويم',
			'translations_ar.backupSettings' => 'إعدادات النسخ الاحتياطي',
			'translations_ar.currencyTitle' => 'العملات',
			'translations_ar.currencyAdd' => 'إضافة عملة جديدة',
			'translations_ar.currencyEdit' => 'تعديل عملة',
			'translations_ar.decimalPlaces' => 'الخانات العشرية',
			'translations_ar.denominations' => 'الفئات',
			'translations_ar.denomAdd' => 'إضافة فئة جديدة',
			'translations_ar.denomEdit' => 'تعديل فئة',
			'translations_ar.taxTitle' => 'إعدادات الضرائب',
			'translations_ar.taxBrackets' => 'الشرائح الضريبية',
			'translations_ar.taxBracketAdd' => 'إضافة شريحة ضريبية جديدة',
			'translations_ar.taxBracketEdit' => 'تعديل الشريحة الضريبية',
			'translations_ar.taxTypes' => 'أنواع الضرائب',
			'translations_ar.taxTypeAdd' => 'إضافة نوع ضريبة جديد',
			'translations_ar.taxTypeEdit' => 'تعديل نوع الضريبة',
			'translations_ar.taxRate' => 'المعدل',
			'translations_ar.isCompound' => 'ضريبة مركبة',
			_ => null,
		} ?? switch (path) {
			'translations_ar.calcMethod' => 'طريقة الحساب',
			'translations_ar.calcMethodAdd' => 'إضافة طريقة حساب جديدة',
			'translations_ar.calcMethodEdit' => 'تعديل طريقة الحساب',
			'translations_ar.periodTitle' => 'الفترات المالية',
			'translations_ar.periodAdd' => 'إضافة فترة مالية',
			'translations_ar.periodEdit' => 'تعديل فترة مالية',
			'translations_ar.fiscalYear' => 'السنة المالية',
			'translations_ar.generatePeriods' => 'إنشاء الفترات',
			'translations_ar.lockPeriod' => 'قفل الفترة',
			'translations_ar.isLocked' => 'مقفلة',
			'translations_ar.unlocked' => 'مفتوحة',
			'translations_ar.enableBiometric' => 'تفعيل البصمة',
			'translations_ar.linkToDevice' => 'ربط الجهاز',
			'translations_ar.isActive' => 'نشط',
			'translations_ar.isInactive' => 'غير نشط',
			'translations_ar.roleManagement' => 'إدارة الأدوار',
			'translations_ar.roleAdd' => 'إضافة دور جديد',
			'translations_ar.roleEdit' => 'تعديل دور',
			'translations_ar.roleName' => 'اسم الدور',
			'translations_ar.permissions' => 'الصلاحيات',
			'translations_ar.usersTitle' => 'إدارة المستخدمين',
			'translations_ar.zones' => 'المناطق',
			'translations_ar.zoneAdd' => 'إضافة منطقة جديدة',
			'translations_ar.zoneEdit' => 'تعديل منطقة',
			'translations_ar.countries' => 'الدول',
			'translations_ar.countryAdd' => 'إضافة دولة جديدة',
			'translations_ar.countryEdit' => 'تعديل دولة',
			'translations_ar.governorates' => 'المحافظات',
			'translations_ar.governorateAdd' => 'إضافة محافظة جديدة',
			'translations_ar.governorateEdit' => 'تعديل محافظة',
			'translations_ar.cities' => 'المدن',
			'translations_ar.cityAdd' => 'إضافة مدينة جديدة',
			'translations_ar.cityEdit' => 'تعديل مدينة',
			'translations_ar.regions' => 'الأحياء',
			'translations_ar.regionAdd' => 'إضافة حي جديد',
			'translations_ar.regionEdit' => 'تعديل حي',
			'translations_ar.nationalityAr' => 'الجنسية (عربي)',
			'translations_ar.nationalityEn' => 'الجنسية (إنجليزي)',
			'translations_ar.selectParentPrompt' => 'حدد عنصراً رئيسياً لإضافة سجل جديد',
			'translations_ar.geoTitle' => 'البيانات الجغرافية',
			'translations_ar.accountNameAr' => 'اسم الحساب (عربي)',
			'translations_ar.accountNameEn' => 'اسم الحساب (إنجليزي)',
			'translations_ar.accountNature' => 'طبيعة الحساب',
			'translations_ar.selectAccountPrompt' => 'اختر حساباً لعرض التفاصيل',
			'translations_ar.coaTitle' => 'دليل الحسابات',
			'translations_ar.save' => 'حفظ',
			'translations_ar.cancel' => 'إلغاء',
			'translations_ar.delete' => 'حذف',
			'translations_ar.edit' => 'تعديل',
			'translations_ar.add' => 'إضافة',
			'translations_ar.addNew' => 'إضافة جديد',
			'translations_ar.update' => 'تحديث',
			'translations_ar.submit' => 'إرسال',
			'translations_ar.confirm' => 'تأكيد',
			'translations_ar.close' => 'إغلاق',
			'translations_ar.search' => 'بحث',
			'translations_ar.filter' => 'تصفية',
			'translations_ar.apply' => 'تطبيق',
			'translations_ar.reset' => 'إعادة تعيين',
			'translations_ar.refresh' => 'تحديث',
			'translations_ar.details' => 'التفاصيل',
			'translations_ar.actions' => 'إجراءات',
			'translations_ar.yes' => 'نعم',
			'translations_ar.no' => 'لا',
			'translations_ar.active' => 'نشط',
			'translations_ar.inactive' => 'غير نشط',
			'translations_ar.loading' => 'جاري التحميل...',
			'translations_ar.error' => 'خطأ',
			'translations_ar.success' => 'نجاح',
			'translations_ar.status' => 'الحالة',
			'translations_ar.description' => 'الوصف',
			'translations_ar.notes' => 'ملاحظات',
			'translations_ar.date' => 'التاريخ',
			'translations_ar.amount' => 'المبلغ',
			'translations_ar.total' => 'الإجمالي',
			'translations_ar.code' => 'الرمز',
			'translations_ar.nameAr' => 'الاسم (عربي)',
			'translations_ar.nameEn' => 'الاسم (إنجليزي)',
			'translations_ar.fullNameAr' => 'الاسم الكامل (عربي)',
			'translations_ar.fullNameEn' => 'الاسم الكامل (إنجليزي)',
			'translations_ar.logo' => 'الشعار',
			'translations_ar.uploadLogo' => 'رفع الشعار',
			'translations_ar.export' => 'تصدير',
			'translations_ar.print' => 'طباعة',
			'translations_ar.fromDate' => 'من تاريخ',
			'translations_ar.toDate' => 'إلى تاريخ',
			'translations_ar.requiredField' => 'حقل مطلوب',
			'translations_ar.comingSoon' => 'قريباً!',
			'translations_ar.saveSuccess' => 'تم الحفظ بنجاح',
			'translations_ar.saveFailed' => 'فشل الحفظ',
			'translations_ar.deleteSuccess' => 'تم الحذف بنجاح',
			'translations_ar.deleteFailed' => 'فشل الحذف',
			'translations_ar.confirmDelete' => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟',
			'translations_ar.accessDenied' => 'تم رفض الوصول',
			'translations_ar.viewList' => 'عرض القائمة',
			'translations_ar.filterOptions' => 'خيارات التصفية',
			'translations_ar.searchQuery' => 'استعلام البحث',
			'translations_ar.enterSearchTerm' => 'أدخل عبارة البحث',
			'translations_ar.voucherSavedSuccessfully' => 'تم حفظ القسيمة بنجاح',
			'translations_ar.confirmDeletion' => 'تأكيد الحذف',
			'translations_ar.confirmDeleteMessage' => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟',
			'translations_ar.create' => 'إنشاء',
			'translations_ar.approved' => 'موافق عليه',
			'translations_ar.rejected' => 'مرفوض',
			'translations_ar.pending' => 'قيد الانتظار',
			'translations_ar.draft' => 'مسودة',
			'translations_ar.cancelled' => 'ملغى',
			'translations_ar.posted' => 'مرحل',
			'translations_ar.reversed' => 'معكوس',
			'translations_ar.all' => 'الكل',
			'translations_ar.approve' => 'موافقة',
			'translations_ar.reject' => 'رفض',
			'translations_ar.approvedBy' => 'وافق عليه',
			'translations_ar.setup' => 'إعدادات المخزون',
			'translations_ar.itemGroups' => 'مجموعات الأصناف',
			'translations_ar.warehouses' => 'المستودعات',
			'translations_ar.barcode' => 'باركود',
			'translations_ar.type' => 'نوع الصنف',
			'translations_ar.costPrice' => 'سعر التكلفة',
			'translations_ar.baseUnit' => 'الوحدة الأساسية',
			'translations_ar.costingMethod' => 'طريقة التكلفة الافتراضية',
			'translations_ar.inventoryVariables' => 'متغيرات المخزون',
			'translations_ar.masterTitle' => 'الأصناف',
			'translations_ar.stocktaking' => 'الجرد',
			'translations_ar.startSession' => 'بدء الجرد',
			'translations_ar.reservations' => 'الحجوزات',
			'translations_ar.balances' => 'أرصدة المخزون',
			'translations_ar.valuation' => 'تقييم المخزون',
			'translations_ar.movement' => 'حركة الأصناف',
			'translations_ar.stocktakingSessions' => 'جلسات الجرد',
			'translations_ar.manageStocktaking' => 'إدارة جلسات الجرد',
			'translations_ar.stocktakingInfo' => 'عرض وإدارة جلسات الجرد',
			'translations_ar.stockReservations' => 'حجوزات المخزون',
			'translations_ar.manageReservations' => 'إدارة حجوزات المخزون',
			'translations_ar.createReservation' => 'إنشاء حجز',
			'translations_ar.reservationInfo' => 'إنشاء وإدارة حجوزات الأصناف',
			'translations_ar.controlTitle' => 'مراقبة المخزون',
			'translations_ar.incoming' => 'الوارد',
			'translations_ar.outgoing' => 'الصادر',
			'translations_ar.transfer' => 'تحويل',
			'translations_ar.opening' => 'رصيد افتتاحي',
			'translations_ar.quantity' => 'الكمية',
			'translations_ar.unitCost' => 'سعر الوحدة',
			'translations_ar.totalCost' => 'إجمالي التكلفة',
			'translations_ar.manageIncomingStock' => 'إدارة الوارد',
			'translations_ar.manageOutgoingStock' => 'إدارة الصادر',
			'translations_ar.addOpeningStock' => 'إضافة رصيد افتتاحي',
			'translations_ar.manageWarehouseTransfers' => 'إدارة تحويلات المستودعات',
			'translations_ar.createIncomingOrder' => 'إنشاء أمر توريد',
			'translations_ar.createOutgoingOrder' => 'إنشاء أمر صرف',
			'translations_ar.createTransfer' => 'إنشاء تحويل',
			'translations_ar.incomingStockOrders' => 'أوامر التوريد',
			'translations_ar.outgoingStockOrders' => 'أوامر الصرف',
			'translations_ar.warehouseTransfers' => 'تحويلات المستودعات',
			'translations_ar.transfers' => 'التحويلات',
			'translations_ar.opsTitle' => 'عمليات المخزون',
			'translations_ar.subtitle' => 'سجل الدخول إلى حسابك',
			'translations_ar.username' => 'اسم المستخدم',
			'translations_ar.password' => 'كلمة المرور',
			'translations_ar.newPassword' => 'كلمة المرور الجديدة',
			'translations_ar.confirmPassword' => 'تأكيد كلمة المرور',
			'translations_ar.login' => 'تسجيل الدخول',
			'translations_ar.logout' => 'تسجيل الخروج',
			'translations_ar.register' => 'تسجيل',
			'translations_ar.forgotPassword' => 'نسيت كلمة المرور؟',
			'translations_ar.resetPassword' => 'إعادة تعيين كلمة المرور',
			'translations_ar.resetPasswordSuccess' => 'تم إعادة تعيين كلمة المرور بنجاح',
			'translations_ar.backToLogin' => 'العودة لتسجيل الدخول',
			'translations_ar.welcome' => 'مرحباً',
			'translations_ar.registrationSuccess' => 'تم التسجيل بنجاح',
			'translations_ar.userInactive' => 'هذا الحساب غير نشط',
			'translations_ar.invalidCredentials' => 'اسم المستخدم أو كلمة المرور غير صحيحة',
			'translations_ar.passwordMismatch' => 'كلمات المرور غير متطابقة',
			'translations_ar.passwordLength' => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
			'translations_ar.authTitle' => 'محاسب برو',
			'translations_en.systemSetup' => 'System Setup',
			'translations_en.generalLedger' => 'General Ledger',
			'translations_en.inventory' => 'Inventory',
			'translations_en.vendors' => 'Vendors',
			'translations_en.customers' => 'Customers',
			'translations_en.reports' => 'Inventory Reports',
			'translations_en.journal' => 'Journal Voucher',
			'translations_en.payment' => 'Payment Voucher',
			'translations_en.receipt' => 'Receipt Voucher',
			'translations_en.reference' => 'Reference No',
			'translations_en.debit' => 'Debit',
			'translations_en.credit' => 'Credit',
			'translations_en.difference' => 'Difference',
			'translations_en.post' => 'Post',
			'translations_en.reverse' => 'Reverse',
			'translations_en.lines' => 'Lines',
			'translations_en.addEntry' => 'Add Entry',
			'translations_en.confirmPost' => 'Confirm Posting',
			'translations_en.postedMsg' => 'Voucher posted successfully',
			'translations_en.paymentMethod' => 'Payment Method',
			'translations_en.checkNumber' => 'Check Number',
			'translations_en.beneficiary' => 'Beneficiary',
			'translations_en.payer' => 'Payer',
			'translations_en.trialBalance' => 'Trial Balance',
			'translations_en.incomeStatement' => 'Income Statement',
			'translations_en.balanceSheet' => 'Balance Sheet',
			'translations_en.cashFlow' => 'Cash Flow',
			'translations_en.accountStatement' => 'Account Statement',
			'translations_en.selectAccount' => 'Select Account',
			'translations_en.asOfDate' => 'As of Date',
			'translations_en.selectReport' => 'Select Report',
			'translations_en.trialBalanceDescription' => 'View trial balance report',
			'translations_en.incomeStatementDescription' => 'View income statement',
			'translations_en.balanceSheetDescription' => 'View balance sheet',
			'translations_en.cashFlowDescription' => 'View cash flow statement',
			'translations_en.accountStatementDescription' => 'View account statement',
			'translations_en.generalLedgerReport' => 'General Ledger',
			'translations_en.generalLedgerDescription' => 'View general ledger',
			'translations_en.reportRefreshed' => 'Report refreshed',
			'translations_en.exportReport' => 'Export Report',
			'translations_en.exportToPdf' => 'Export to PDF',
			'translations_en.exportToExcel' => 'Export to Excel',
			'translations_en.exportToCsv' => 'Export to CSV',
			'translations_en.reportExportedSuccessfully' => ({required String format}) => 'Report exported to ${format}',
			'translations_en.reportSentToPrinter' => 'Report sent to printer',
			'translations_en.cashFlowStatement' => 'Cash Flow Statement',
			'translations_en.reportsTitle' => 'Financial Reports',
			'translations_en.journalVoucher' => 'Journal Voucher',
			'translations_en.receiptVoucher' => 'Receipt Voucher',
			'translations_en.paymentVoucher' => 'Payment Voucher',
			'translations_en.transferVoucher' => 'Transfer Voucher',
			'translations_en.createAndManageJournalVouchers' => 'Create and manage journal vouchers',
			'translations_en.managePaymentVouchers' => 'Manage payment vouchers',
			'translations_en.manageReceiptVouchers' => 'Manage receipt vouchers',
			'translations_en.manageCashAndBankAccounts' => 'Manage cash and bank accounts',
			'translations_en.viewFinancialReportsAndStatements' => 'View financial reports and statements',
			'translations_en.manageTransactionRequests' => 'Manage transaction requests',
			'translations_en.reviewPostAndClosePeriods' => 'Review, post, and close periods',
			'translations_en.journalVouchers' => 'Journal Vouchers',
			'translations_en.paymentVouchers' => 'Payment Vouchers',
			'translations_en.receiptVouchers' => 'Receipt Vouchers',
			'translations_en.transactionRequests' => 'Transaction Requests',
			'translations_en.allRequests' => 'All Requests',
			'translations_en.myRequests' => 'My Requests',
			'translations_en.pendingApprovals' => 'Pending Approvals',
			'translations_en.createRequest' => 'Create Request',
			'translations_en.editRequest' => 'Edit Request',
			'translations_en.requestType' => 'Request Type',
			'translations_en.requestDate' => 'Request Date',
			'translations_en.requester' => 'Requester',
			'translations_en.approver' => 'Approver',
			'translations_en.approvalDate' => 'Approval Date',
			'translations_en.rejectionReason' => 'Rejection Reason',
			'translations_en.pleaseEnterAmount' => 'Please enter amount',
			'translations_en.pleaseEnterValidAmount' => 'Please enter valid amount',
			'translations_en.pleaseEnterDescription' => 'Please enter description',
			'translations_en.requestCreatedSuccessfully' => 'Request created successfully',
			'translations_en.requestUpdatedSuccessfully' => 'Request updated successfully',
			'translations_en.requestApprovedSuccessfully' => 'Request approved successfully',
			'translations_en.requestRejectedSuccessfully' => 'Request rejected successfully',
			'translations_en.noRequestsFound' => 'No requests found',
			'translations_en.youHaveNotCreatedAnyRequests' => 'You have not created any requests',
			'translations_en.noTransactionRequestsFound' => 'No transaction requests found',
			'translations_en.failedToLoadRequests' => 'Failed to load requests',
			'translations_en.requestDetails' => 'Request Details',
			'translations_en.noPendingApprovals' => 'No pending approvals',
			'translations_en.allRequestsHaveBeenProcessed' => 'All requests have been processed',
			'translations_en.failedToLoadPendingApprovals' => 'Failed to load pending approvals',
			'translations_en.rejectRequest' => 'Reject Request',
			'translations_en.pleaseProvideRejectionReason' => 'Please provide rejection reason',
			'translations_en.adjustmentEntry' => 'Adjustment Entry',
			'translations_en.docTypes' => 'Document Types',
			'translations_en.docTypeAdd' => 'Add Document Type',
			'translations_en.docTypeEdit' => 'Edit Document Type',
			'translations_en.docTypeCode' => 'Type Code',
			'translations_en.descCoding' => 'Description Coding',
			'translations_en.descCodingAdd' => 'Add Description Coding',
			'translations_en.descCodingEdit' => 'Edit Description Coding',
			'translations_en.sequenceMethod' => 'Sequence Method',
			'translations_en.documentTypesAndDescriptionCoding' => 'Document Types and Description Coding',
			'translations_en.setupTitle' => 'GL Setup & Config',
			'translations_en.bankReconciliation' => 'Bank Reconciliation',
			'translations_en.cashDeposits' => 'Cash Deposits',
			'translations_en.bankStatements' => 'Bank Statements',
			'translations_en.adjustmentEntries' => 'Adjustment Entries',
			'translations_en.manageCashAndBank' => 'Manage your cash and bank accounts, reconcile statements, and handle deposits.',
			'translations_en.bankReconciliationDesc' => 'Reconcile your bank statements with system records.',
			'translations_en.cashDepositsDesc' => 'Manage cash deposits and track their status.',
			'translations_en.bankStatementsDesc' => 'Import and view bank statements.',
			'translations_en.adjustmentEntriesDesc' => 'Create and manage adjustment entries for bank fees, interest, etc.',
			'translations_en.noAdjustmentsFound' => 'No adjustment entries found',
			'translations_en.createFirstAdjustment' => 'Create your first adjustment entry',
			'translations_en.adjustmentType' => 'Adjustment Type',
			'translations_en.bankCharges' => 'Bank Charges',
			'translations_en.interestEarned' => 'Interest Earned',
			'translations_en.errorCorrection' => 'Error Correction',
			'translations_en.newAdjustment' => 'New Adjustment',
			'translations_en.adjustmentSubmittedSuccessfully' => 'Adjustment submitted successfully',
			'translations_en.adjustmentApprovedSuccessfully' => 'Adjustment approved successfully',
			'translations_en.editAdjustmentNotImplemented' => 'Edit adjustment is not implemented yet',
			'translations_en.confirmDeleteAdjustment' => 'Are you sure you want to delete this adjustment?',
			'translations_en.adjustmentDeletedSuccessfully' => 'Adjustment deleted successfully',
			'translations_en.cashBankManagement' => 'Cash & Bank Management',
			'translations_en.cashbankTitle' => 'Cash & Bank Management',
			'translations_en.defaultLanguage' => 'Default Language',
			'translations_en.dateFormat' => 'Date Format',
			'translations_en.baseCurrency' => 'Base Currency',
			'translations_en.currencies' => 'Currencies',
			'translations_en.currencyNameAr' => 'Currency Name (Arabic)',
			'translations_en.currencyNameEn' => 'Currency Name (English)',
			'translations_en.symbol' => 'Symbol',
			'translations_en.exchangeRate' => 'Exchange Rate',
			'translations_en.paramsTitle' => 'General Parameters',
			'translations_en.defaultAccounts' => 'Default Accounts',
			'translations_en.defaultItems' => 'Default Items',
			'translations_en.defaultUnits' => 'Default Units',
			'translations_en.defaultPayment' => 'Default Payment Methods',
			'translations_en.defaultSales' => 'Default Sales Accounts',
			'translations_en.defaultPurchases' => 'Default Purchases Accounts',
			'translations_en.defaultsTitle' => 'Defaults',
			'translations_en.accountCode' => 'Account Code',
			'translations_en.parentAccount' => 'Parent Account',
			'translations_en.nature' => 'Nature',
			'translations_en.reportType' => 'Report Type',
			'translations_en.level' => 'Level',
			'translations_en.detailType' => 'Detail Account Type',
			'translations_en.cashFlowType' => 'Cash Flow Type',
			'translations_en.noParent' => 'No Parent',
			'translations_en.coa_setupTitle' => 'Chart of Accounts',
			'translations_en.companyCode' => 'Company Code',
			'translations_en.taxNumber' => 'Tax Number',
			'translations_en.regNumber' => 'Commercial Registration No.',
			'translations_en.isMainCompany' => 'Main Company',
			'translations_en.address' => 'Address',
			'translations_en.phone' => 'Phone',
			'translations_en.email' => 'Email',
			'translations_en.selectPrompt' => 'Select a company from the list to view details.',
			'translations_en.noCompanies' => 'No companies created yet.',
			'translations_en.branchTitle' => 'Branches',
			'translations_en.branchAdd' => 'Add New Branch',
			'translations_en.branchEdit' => 'Edit Branch',
			'translations_en.branchCode' => 'Branch Code',
			'translations_en.branchGroup' => 'Branch Group',
			'translations_en.defaultWarehouse' => 'Default Warehouse',
			'translations_en.selectOrCreateBranch' => 'Select a branch or create a new one',
			'translations_en.companyTitle' => 'Company Info',
			'translations_en.language' => 'Language',
			'translations_en.calendarType' => 'Calendar Type',
			'translations_en.backupSettings' => 'Backup Settings',
			'translations_en.currencyTitle' => 'Currencies',
			'translations_en.currencyAdd' => 'Add New Currency',
			'translations_en.currencyEdit' => 'Edit Currency',
			'translations_en.decimalPlaces' => 'Decimal Places',
			'translations_en.denominations' => 'Denominations',
			'translations_en.denomAdd' => 'Add New Denomination',
			'translations_en.denomEdit' => 'Edit Denomination',
			'translations_en.taxTitle' => 'Tax Settings',
			'translations_en.taxBrackets' => 'Tax Brackets',
			'translations_en.taxBracketAdd' => 'Add New Tax Bracket',
			'translations_en.taxBracketEdit' => 'Edit Tax Bracket',
			'translations_en.taxTypes' => 'Tax Types',
			'translations_en.taxTypeAdd' => 'Add New Tax Type',
			'translations_en.taxTypeEdit' => 'Edit Tax Type',
			'translations_en.taxRate' => 'Tax Rate',
			'translations_en.isCompound' => 'Is Compound',
			'translations_en.calcMethod' => 'Calculation Method',
			'translations_en.calcMethodAdd' => 'Add New Calculation Method',
			'translations_en.calcMethodEdit' => 'Edit Calculation Method',
			'translations_en.periodTitle' => 'Financial Periods',
			'translations_en.periodAdd' => 'Add Financial Period',
			'translations_en.periodEdit' => 'Edit Financial Period',
			'translations_en.fiscalYear' => 'Fiscal Year',
			'translations_en.generatePeriods' => 'Generate Periods',
			'translations_en.lockPeriod' => 'Lock Period',
			'translations_en.isLocked' => 'Locked',
			'translations_en.unlocked' => 'Unlocked',
			'translations_en.enableBiometric' => 'Enable Biometric',
			'translations_en.linkToDevice' => 'Link to Device',
			'translations_en.isActive' => 'Active',
			'translations_en.isInactive' => 'Inactive',
			'translations_en.roleManagement' => 'Role Management',
			'translations_en.roleAdd' => 'Add New Role',
			'translations_en.roleEdit' => 'Edit Role',
			'translations_en.roleName' => 'Role Name',
			'translations_en.permissions' => 'Permissions',
			'translations_en.usersTitle' => 'User Management',
			'translations_en.zones' => 'Zones',
			'translations_en.zoneAdd' => 'Add New Zone',
			'translations_en.zoneEdit' => 'Edit Zone',
			'translations_en.countries' => 'Countries',
			'translations_en.countryAdd' => 'Add New Country',
			'translations_en.countryEdit' => 'Edit Country',
			'translations_en.governorates' => 'Governorates',
			'translations_en.governorateAdd' => 'Add New Governorate',
			'translations_en.governorateEdit' => 'Edit Governorate',
			'translations_en.cities' => 'Cities',
			'translations_en.cityAdd' => 'Add New City',
			'translations_en.cityEdit' => 'Edit City',
			'translations_en.regions' => 'Regions',
			'translations_en.regionAdd' => 'Add New Region',
			'translations_en.regionEdit' => 'Edit Region',
			'translations_en.nationalityAr' => 'Nationality (Arabic)',
			'translations_en.nationalityEn' => 'Nationality (English)',
			'translations_en.selectParentPrompt' => 'Select a parent item to add new record',
			'translations_en.geoTitle' => 'Geographical Data',
			'translations_en.accountNameAr' => 'Account Name (Arabic)',
			'translations_en.accountNameEn' => 'Account Name (English)',
			'translations_en.accountNature' => 'Account Nature',
			'translations_en.selectAccountPrompt' => 'Select an account to view details',
			'translations_en.coaTitle' => 'Chart of Accounts',
			'translations_en.save' => 'Save',
			'translations_en.cancel' => 'Cancel',
			'translations_en.delete' => 'Delete',
			'translations_en.edit' => 'Edit',
			'translations_en.add' => 'Add',
			'translations_en.addNew' => 'Add New',
			'translations_en.update' => 'Update',
			'translations_en.submit' => 'Submit',
			'translations_en.confirm' => 'Confirm',
			'translations_en.close' => 'Close',
			'translations_en.search' => 'Search',
			'translations_en.filter' => 'Filter',
			'translations_en.apply' => 'Apply',
			'translations_en.reset' => 'Reset',
			'translations_en.refresh' => 'Refresh',
			'translations_en.details' => 'Details',
			'translations_en.actions' => 'Actions',
			'translations_en.yes' => 'Yes',
			'translations_en.no' => 'No',
			'translations_en.active' => 'Active',
			'translations_en.inactive' => 'Inactive',
			'translations_en.loading' => 'Loading...',
			'translations_en.error' => 'Error',
			'translations_en.success' => 'Success',
			'translations_en.status' => 'Status',
			'translations_en.description' => 'Description',
			'translations_en.notes' => 'Notes',
			'translations_en.date' => 'Date',
			'translations_en.amount' => 'Amount',
			'translations_en.total' => 'Total',
			'translations_en.code' => 'Code',
			'translations_en.nameAr' => 'Name (Arabic)',
			'translations_en.nameEn' => 'Name (English)',
			'translations_en.fullNameAr' => 'Full Name (Arabic)',
			'translations_en.fullNameEn' => 'Full Name (English)',
			'translations_en.logo' => 'Logo',
			'translations_en.uploadLogo' => 'Upload Logo',
			'translations_en.export' => 'Export',
			'translations_en.print' => 'Print',
			'translations_en.fromDate' => 'From Date',
			'translations_en.toDate' => 'To Date',
			'translations_en.requiredField' => 'Required Field',
			'translations_en.comingSoon' => 'Coming Soon!',
			'translations_en.saveSuccess' => 'Saved successfully',
			'translations_en.saveFailed' => 'Failed to save',
			'translations_en.deleteSuccess' => 'Deleted successfully',
			'translations_en.deleteFailed' => 'Failed to delete',
			'translations_en.confirmDelete' => 'Are you sure you want to delete this item?',
			'translations_en.accessDenied' => 'Access Denied',
			'translations_en.viewList' => 'View List',
			'translations_en.filterOptions' => 'Filter Options',
			'translations_en.searchQuery' => 'Search Query',
			'translations_en.enterSearchTerm' => 'Enter search term',
			'translations_en.voucherSavedSuccessfully' => 'Voucher saved successfully',
			'translations_en.confirmDeletion' => 'Confirm Deletion',
			'translations_en.confirmDeleteMessage' => 'Are you sure you want to delete this item?',
			'translations_en.create' => 'Create',
			'translations_en.approved' => 'Approved',
			'translations_en.rejected' => 'Rejected',
			'translations_en.pending' => 'Pending',
			'translations_en.draft' => 'Draft',
			'translations_en.cancelled' => 'Cancelled',
			'translations_en.posted' => 'Posted',
			'translations_en.reversed' => 'Reversed',
			'translations_en.all' => 'All',
			'translations_en.approve' => 'Approve',
			'translations_en.reject' => 'Reject',
			'translations_en.approvedBy' => 'Approved By',
			'translations_en.setup' => 'Inventory Setup',
			'translations_en.itemGroups' => 'Item Groups',
			'translations_en.warehouses' => 'Warehouses',
			'translations_en.barcode' => 'Barcode',
			'translations_en.type' => 'Item Type',
			'translations_en.costPrice' => 'Cost Price',
			'translations_en.baseUnit' => 'Base Unit',
			'translations_en.costingMethod' => 'Default Costing Method',
			'translations_en.inventoryVariables' => 'Inventory Variables',
			'translations_en.masterTitle' => 'Items',
			'translations_en.stocktaking' => 'Stocktaking',
			'translations_en.startSession' => 'Start Stocktaking',
			'translations_en.reservations' => 'Reservations',
			'translations_en.balances' => 'Stock Balances',
			'translations_en.valuation' => 'Stock Valuation',
			'translations_en.movement' => 'Item Movement',
			'translations_en.stocktakingSessions' => 'Stocktaking Sessions',
			'translations_en.manageStocktaking' => 'Manage stocktaking sessions',
			'translations_en.stocktakingInfo' => 'View and manage stocktaking sessions',
			'translations_en.stockReservations' => 'Stock Reservations',
			'translations_en.manageReservations' => 'Manage stock reservations',
			'translations_en.createReservation' => 'Create Reservation',
			'translations_en.reservationInfo' => 'Create and manage item reservations',
			'translations_en.controlTitle' => 'Inventory Control',
			'translations_en.incoming' => 'Incoming Stock',
			'translations_en.outgoing' => 'Outgoing Stock',
			'translations_en.transfer' => 'Transfer',
			'translations_en.opening' => 'Opening Stock',
			'translations_en.quantity' => 'Quantity',
			'translations_en.unitCost' => 'Unit Cost',
			'translations_en.totalCost' => 'Total Cost',
			'translations_en.manageIncomingStock' => 'Manage incoming stock orders',
			'translations_en.manageOutgoingStock' => 'Manage outgoing stock orders',
			'translations_en.addOpeningStock' => 'Add Opening Stock',
			'translations_en.manageWarehouseTransfers' => 'Manage warehouse transfers',
			'translations_en.createIncomingOrder' => 'Create Incoming Order',
			'translations_en.createOutgoingOrder' => 'Create Outgoing Order',
			'translations_en.createTransfer' => 'Create Transfer',
			'translations_en.incomingStockOrders' => 'Incoming Stock Orders',
			_ => null,
		} ?? switch (path) {
			'translations_en.outgoingStockOrders' => 'Outgoing Stock Orders',
			'translations_en.warehouseTransfers' => 'Warehouse Transfers',
			'translations_en.transfers' => 'Transfers',
			'translations_en.opsTitle' => 'Stock Operations',
			'translations_en.subtitle' => 'Sign in to your account',
			'translations_en.username' => 'Username',
			'translations_en.password' => 'Password',
			'translations_en.newPassword' => 'New Password',
			'translations_en.confirmPassword' => 'Confirm Password',
			'translations_en.login' => 'Login',
			'translations_en.logout' => 'Logout',
			'translations_en.register' => 'Register',
			'translations_en.forgotPassword' => 'Forgot Password?',
			'translations_en.resetPassword' => 'Reset Password',
			'translations_en.resetPasswordSuccess' => 'Password reset successfully',
			'translations_en.backToLogin' => 'Back to Login',
			'translations_en.welcome' => 'Welcome',
			'translations_en.registrationSuccess' => 'Registration successful',
			'translations_en.userInactive' => 'This account is inactive',
			'translations_en.invalidCredentials' => 'Invalid username or password',
			'translations_en.passwordMismatch' => 'Passwords do not match',
			'translations_en.passwordLength' => 'Password must be at least 6 characters',
			'translations_en.authTitle' => 'MuhasebPro',
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
