import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @branch.
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get branch;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @warehouseTooltip.
  ///
  /// In en, this message translates to:
  /// **'Will be enabled when Inventory module is active'**
  String get warehouseTooltip;

  /// No description provided for @leaveBlankToKeepUnchanged.
  ///
  /// In en, this message translates to:
  /// **'Leave blank to keep unchanged'**
  String get leaveBlankToKeepUnchanged;

  /// No description provided for @passwordLengthError.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordLengthError;

  /// No description provided for @passwordNumberError.
  ///
  /// In en, this message translates to:
  /// **'Password must contain a number'**
  String get passwordNumberError;

  /// No description provided for @branchGroups.
  ///
  /// In en, this message translates to:
  /// **'Branch Groups'**
  String get branchGroups;

  /// No description provided for @addNewBranchGroup.
  ///
  /// In en, this message translates to:
  /// **'Add New Branch Group'**
  String get addNewBranchGroup;

  /// No description provided for @editBranchGroup.
  ///
  /// In en, this message translates to:
  /// **'Edit Branch Group'**
  String get editBranchGroup;

  /// No description provided for @areYouSureYouWantToDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete?'**
  String get areYouSureYouWantToDelete;

  /// No description provided for @activate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get activate;

  /// No description provided for @uploadLogo.
  ///
  /// In en, this message translates to:
  /// **'Upload Logo'**
  String get uploadLogo;

  /// No description provided for @mainCompany.
  ///
  /// In en, this message translates to:
  /// **'Main Company'**
  String get mainCompany;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @noDenominations.
  ///
  /// In en, this message translates to:
  /// **'No Denominations'**
  String get noDenominations;

  /// No description provided for @viewCompanyInfo.
  ///
  /// In en, this message translates to:
  /// **'View Company Info'**
  String get viewCompanyInfo;

  /// No description provided for @viewBranches.
  ///
  /// In en, this message translates to:
  /// **'View Branches'**
  String get viewBranches;

  /// No description provided for @viewCOA.
  ///
  /// In en, this message translates to:
  /// **'View Chart of Accounts'**
  String get viewCOA;

  /// No description provided for @viewGeographicalData.
  ///
  /// In en, this message translates to:
  /// **'View Geographical Data'**
  String get viewGeographicalData;

  /// No description provided for @viewGeneralParameters.
  ///
  /// In en, this message translates to:
  /// **'View General Parameters'**
  String get viewGeneralParameters;

  /// No description provided for @viewCurrencies.
  ///
  /// In en, this message translates to:
  /// **'View Currencies'**
  String get viewCurrencies;

  /// No description provided for @viewTaxSettings.
  ///
  /// In en, this message translates to:
  /// **'View Tax Settings'**
  String get viewTaxSettings;

  /// No description provided for @systemSetup.
  ///
  /// In en, this message translates to:
  /// **'System Setup'**
  String get systemSetup;

  /// No description provided for @generalLedger.
  ///
  /// In en, this message translates to:
  /// **'General Ledger'**
  String get generalLedger;

  /// No description provided for @inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventory;

  /// No description provided for @vendors.
  ///
  /// In en, this message translates to:
  /// **'Vendors'**
  String get vendors;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required Field'**
  String get requiredField;

  /// No description provided for @saveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Save Successful'**
  String get saveSuccess;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Save Failed'**
  String get saveFailed;

  /// No description provided for @deactivateBranchConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Deactivate Branch'**
  String get deactivateBranchConfirmationTitle;

  /// No description provided for @deactivateBranchConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to deactivate this branch?'**
  String get deactivateBranchConfirmationMessage;

  /// No description provided for @deactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get deactivate;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @chartOfAccounts.
  ///
  /// In en, this message translates to:
  /// **'Chart of Accounts'**
  String get chartOfAccounts;

  /// No description provided for @addNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Add New Account'**
  String get addNewAccount;

  /// No description provided for @editAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit Account'**
  String get editAccount;

  /// No description provided for @companyCode.
  ///
  /// In en, this message translates to:
  /// **'Company Code'**
  String get companyCode;

  /// No description provided for @companyNameAr.
  ///
  /// In en, this message translates to:
  /// **'Company Name (Arabic)'**
  String get companyNameAr;

  /// No description provided for @companyNameEn.
  ///
  /// In en, this message translates to:
  /// **'Company Name (English)'**
  String get companyNameEn;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @taxNumber.
  ///
  /// In en, this message translates to:
  /// **'Tax Number'**
  String get taxNumber;

  /// No description provided for @commercialRegNo.
  ///
  /// In en, this message translates to:
  /// **'Commercial Registration No.'**
  String get commercialRegNo;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @remarks.
  ///
  /// In en, this message translates to:
  /// **'Remarks'**
  String get remarks;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @currencies.
  ///
  /// In en, this message translates to:
  /// **'Currencies'**
  String get currencies;

  /// No description provided for @addNewCurrency.
  ///
  /// In en, this message translates to:
  /// **'Add New Currency'**
  String get addNewCurrency;

  /// No description provided for @editCurrency.
  ///
  /// In en, this message translates to:
  /// **'Edit Currency'**
  String get editCurrency;

  /// No description provided for @selectCurrencyPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select a currency to view details'**
  String get selectCurrencyPrompt;

  /// No description provided for @addNewDenomination.
  ///
  /// In en, this message translates to:
  /// **'Add New Denomination'**
  String get addNewDenomination;

  /// No description provided for @editDenomination.
  ///
  /// In en, this message translates to:
  /// **'Edit Denomination'**
  String get editDenomination;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @generalParameters.
  ///
  /// In en, this message translates to:
  /// **'General Parameters'**
  String get generalParameters;

  /// No description provided for @resetToDefaults.
  ///
  /// In en, this message translates to:
  /// **'Reset to Defaults'**
  String get resetToDefaults;

  /// No description provided for @confirmReset.
  ///
  /// In en, this message translates to:
  /// **'Confirm Reset'**
  String get confirmReset;

  /// No description provided for @confirmResetMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset all general parameters to their default values?'**
  String get confirmResetMessage;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @accounting.
  ///
  /// In en, this message translates to:
  /// **'Accounting'**
  String get accounting;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @ui.
  ///
  /// In en, this message translates to:
  /// **'UI'**
  String get ui;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// No description provided for @cannotChangeAccountSettings.
  ///
  /// In en, this message translates to:
  /// **'Cannot change account settings while transactions exist'**
  String get cannotChangeAccountSettings;

  /// No description provided for @geographicalData.
  ///
  /// In en, this message translates to:
  /// **'Geographical Data'**
  String get geographicalData;

  /// No description provided for @zones.
  ///
  /// In en, this message translates to:
  /// **'Zones'**
  String get zones;

  /// No description provided for @countries.
  ///
  /// In en, this message translates to:
  /// **'Countries'**
  String get countries;

  /// No description provided for @governorates.
  ///
  /// In en, this message translates to:
  /// **'Governorates'**
  String get governorates;

  /// No description provided for @cities.
  ///
  /// In en, this message translates to:
  /// **'Cities'**
  String get cities;

  /// No description provided for @regions.
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get regions;

  /// No description provided for @selectParentPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select a parent to add a new item'**
  String get selectParentPrompt;

  /// No description provided for @addNew.
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get addNew;

  /// No description provided for @confirmDeletion.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get confirmDeletion;

  /// No description provided for @confirmDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this item?'**
  String get confirmDeleteMessage;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Delete failed'**
  String get deleteFailed;

  /// No description provided for @addNewZone.
  ///
  /// In en, this message translates to:
  /// **'Add New Zone'**
  String get addNewZone;

  /// No description provided for @editZone.
  ///
  /// In en, this message translates to:
  /// **'Edit Zone'**
  String get editZone;

  /// No description provided for @addNewCountry.
  ///
  /// In en, this message translates to:
  /// **'Add New Country'**
  String get addNewCountry;

  /// No description provided for @editCountry.
  ///
  /// In en, this message translates to:
  /// **'Edit Country'**
  String get editCountry;

  /// No description provided for @addNewGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Add New Governorate'**
  String get addNewGovernorate;

  /// No description provided for @editGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Edit Governorate'**
  String get editGovernorate;

  /// No description provided for @addNewCity.
  ///
  /// In en, this message translates to:
  /// **'Add New City'**
  String get addNewCity;

  /// No description provided for @editCity.
  ///
  /// In en, this message translates to:
  /// **'Edit City'**
  String get editCity;

  /// No description provided for @addNewRegion.
  ///
  /// In en, this message translates to:
  /// **'Add New Region'**
  String get addNewRegion;

  /// No description provided for @editRegion.
  ///
  /// In en, this message translates to:
  /// **'Edit Region'**
  String get editRegion;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @nationalityAr.
  ///
  /// In en, this message translates to:
  /// **'Nationality (Arabic)'**
  String get nationalityAr;

  /// No description provided for @nationalityEn.
  ///
  /// In en, this message translates to:
  /// **'Nationality (English)'**
  String get nationalityEn;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @roleManagement.
  ///
  /// In en, this message translates to:
  /// **'Role Management'**
  String get roleManagement;

  /// No description provided for @addNewRole.
  ///
  /// In en, this message translates to:
  /// **'Add New Role'**
  String get addNewRole;

  /// No description provided for @editRole.
  ///
  /// In en, this message translates to:
  /// **'Edit Role'**
  String get editRole;

  /// No description provided for @taxSettings.
  ///
  /// In en, this message translates to:
  /// **'Tax Settings'**
  String get taxSettings;

  /// No description provided for @taxBrackets.
  ///
  /// In en, this message translates to:
  /// **'Tax Brackets'**
  String get taxBrackets;

  /// No description provided for @taxTypes.
  ///
  /// In en, this message translates to:
  /// **'Tax Types'**
  String get taxTypes;

  /// No description provided for @taxCalculationMethods.
  ///
  /// In en, this message translates to:
  /// **'Tax Calculation Methods'**
  String get taxCalculationMethods;

  /// No description provided for @userManagement.
  ///
  /// In en, this message translates to:
  /// **'User Management'**
  String get userManagement;

  /// No description provided for @userIsActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get userIsActive;

  /// No description provided for @userIsInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get userIsInactive;

  /// No description provided for @addNewUser.
  ///
  /// In en, this message translates to:
  /// **'Add New User'**
  String get addNewUser;

  /// No description provided for @editUser.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get editUser;

  /// No description provided for @accountNumberType.
  ///
  /// In en, this message translates to:
  /// **'Account Number Type'**
  String get accountNumberType;

  /// No description provided for @accountNumberLength.
  ///
  /// In en, this message translates to:
  /// **'Account Number Length'**
  String get accountNumberLength;

  /// No description provided for @costCenterPolicy.
  ///
  /// In en, this message translates to:
  /// **'Cost Center Policy'**
  String get costCenterPolicy;

  /// No description provided for @projectPolicy.
  ///
  /// In en, this message translates to:
  /// **'Project Policy'**
  String get projectPolicy;

  /// No description provided for @noParent.
  ///
  /// In en, this message translates to:
  /// **'No Parent'**
  String get noParent;

  /// No description provided for @parentAccount.
  ///
  /// In en, this message translates to:
  /// **'Parent Account'**
  String get parentAccount;

  /// No description provided for @nature.
  ///
  /// In en, this message translates to:
  /// **'Nature'**
  String get nature;

  /// No description provided for @reportType.
  ///
  /// In en, this message translates to:
  /// **'Report Type'**
  String get reportType;

  /// No description provided for @detailAccountType.
  ///
  /// In en, this message translates to:
  /// **'Detail Account Type'**
  String get detailAccountType;

  /// No description provided for @cashFlowType.
  ///
  /// In en, this message translates to:
  /// **'Cash Flow Type'**
  String get cashFlowType;

  /// No description provided for @addNewBranch.
  ///
  /// In en, this message translates to:
  /// **'Add New Branch'**
  String get addNewBranch;

  /// No description provided for @editBranch.
  ///
  /// In en, this message translates to:
  /// **'Edit Branch'**
  String get editBranch;

  /// No description provided for @branchCode.
  ///
  /// In en, this message translates to:
  /// **'Branch Code'**
  String get branchCode;

  /// No description provided for @branchName.
  ///
  /// In en, this message translates to:
  /// **'{name}'**
  String branchName(String name);

  /// No description provided for @branchNameEn.
  ///
  /// In en, this message translates to:
  /// **'Branch Name (English)'**
  String get branchNameEn;

  /// No description provided for @branchNameAr.
  ///
  /// In en, this message translates to:
  /// **'Branch Name (Arabic)'**
  String get branchNameAr;

  /// No description provided for @branchGroup.
  ///
  /// In en, this message translates to:
  /// **'Branch Group'**
  String get branchGroup;

  /// No description provided for @defaultWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Default Warehouse'**
  String get defaultWarehouse;

  /// No description provided for @logo.
  ///
  /// In en, this message translates to:
  /// **'Logo'**
  String get logo;

  /// No description provided for @currencyCode.
  ///
  /// In en, this message translates to:
  /// **'Currency Code'**
  String get currencyCode;

  /// No description provided for @fractionNameEn.
  ///
  /// In en, this message translates to:
  /// **'Fraction Name (English)'**
  String get fractionNameEn;

  /// No description provided for @fractionNameAr.
  ///
  /// In en, this message translates to:
  /// **'Fraction Name (Arabic)'**
  String get fractionNameAr;

  /// No description provided for @exchangeRate.
  ///
  /// In en, this message translates to:
  /// **'Exchange Rate'**
  String get exchangeRate;

  /// No description provided for @decimalPlaces.
  ///
  /// In en, this message translates to:
  /// **'Decimal Places'**
  String get decimalPlaces;

  /// No description provided for @baseCurrency.
  ///
  /// In en, this message translates to:
  /// **'Base Currency'**
  String get baseCurrency;

  /// No description provided for @denominations.
  ///
  /// In en, this message translates to:
  /// **'Denominations'**
  String get denominations;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @dateFormat.
  ///
  /// In en, this message translates to:
  /// **'Date Format'**
  String get dateFormat;

  /// No description provided for @calendarType.
  ///
  /// In en, this message translates to:
  /// **'Calendar Type'**
  String get calendarType;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password Minimum Length'**
  String get passwordMinLength;

  /// No description provided for @autoLockTimeout.
  ///
  /// In en, this message translates to:
  /// **'Auto Lock Timeout'**
  String get autoLockTimeout;

  /// No description provided for @inMinutes.
  ///
  /// In en, this message translates to:
  /// **'in minutes'**
  String get inMinutes;

  /// No description provided for @useVAT.
  ///
  /// In en, this message translates to:
  /// **'Use VAT'**
  String get useVAT;

  /// No description provided for @useTDS.
  ///
  /// In en, this message translates to:
  /// **'Use TDS'**
  String get useTDS;

  /// No description provided for @useEInvoice.
  ///
  /// In en, this message translates to:
  /// **'Use E-Invoice'**
  String get useEInvoice;

  /// No description provided for @priceIncludesTax.
  ///
  /// In en, this message translates to:
  /// **'Price Includes Tax'**
  String get priceIncludesTax;

  /// No description provided for @addNewTaxBracket.
  ///
  /// In en, this message translates to:
  /// **'Add New Tax Bracket'**
  String get addNewTaxBracket;

  /// No description provided for @taxRate.
  ///
  /// In en, this message translates to:
  /// **'Tax Rate'**
  String get taxRate;

  /// No description provided for @isDefault.
  ///
  /// In en, this message translates to:
  /// **'Is Default'**
  String get isDefault;

  /// No description provided for @addNewTaxCalculationMethod.
  ///
  /// In en, this message translates to:
  /// **'Add New Tax Calculation Method'**
  String get addNewTaxCalculationMethod;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @addNewTaxType.
  ///
  /// In en, this message translates to:
  /// **'Add New Tax Type'**
  String get addNewTaxType;

  /// No description provided for @calculationMethod.
  ///
  /// In en, this message translates to:
  /// **'Calculation Method'**
  String get calculationMethod;

  /// No description provided for @salesAccount.
  ///
  /// In en, this message translates to:
  /// **'Sales Account'**
  String get salesAccount;

  /// No description provided for @purchasesAccount.
  ///
  /// In en, this message translates to:
  /// **'Purchases Account'**
  String get purchasesAccount;

  /// No description provided for @uiTheme.
  ///
  /// In en, this message translates to:
  /// **'UI Theme'**
  String get uiTheme;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @fontSize.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get fontSize;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @usernameRequired.
  ///
  /// In en, this message translates to:
  /// **'Username is required'**
  String get usernameRequired;

  /// No description provided for @fullNameEn.
  ///
  /// In en, this message translates to:
  /// **'Full Name (English)'**
  String get fullNameEn;

  /// No description provided for @fullNameAr.
  ///
  /// In en, this message translates to:
  /// **'Full Name (Arabic)'**
  String get fullNameAr;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatch;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @enableBiometric.
  ///
  /// In en, this message translates to:
  /// **'Enable Biometric Authentication'**
  String get enableBiometric;

  /// No description provided for @linkToDevice.
  ///
  /// In en, this message translates to:
  /// **'Link to Device'**
  String get linkToDevice;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon!'**
  String get comingSoon;

  /// No description provided for @featureUnderDevelopment.
  ///
  /// In en, this message translates to:
  /// **'This feature is currently under development. Please check back later.'**
  String get featureUnderDevelopment;

  /// No description provided for @branchGroupNameEn.
  ///
  /// In en, this message translates to:
  /// **'Branch Group Name (English)'**
  String get branchGroupNameEn;

  /// No description provided for @branchGroupNameAr.
  ///
  /// In en, this message translates to:
  /// **'Branch Group Name (Arabic)'**
  String get branchGroupNameAr;

  /// No description provided for @branchesModule.
  ///
  /// In en, this message translates to:
  /// **'Branches'**
  String get branchesModule;

  /// No description provided for @companyInfo.
  ///
  /// In en, this message translates to:
  /// **'Company Info'**
  String get companyInfo;

  /// No description provided for @nameEn.
  ///
  /// In en, this message translates to:
  /// **'Name (English)'**
  String get nameEn;

  /// No description provided for @nameAr.
  ///
  /// In en, this message translates to:
  /// **'Name (Arabic)'**
  String get nameAr;

  /// No description provided for @accountCode.
  ///
  /// In en, this message translates to:
  /// **'Account Code'**
  String get accountCode;

  /// No description provided for @accountNameAr.
  ///
  /// In en, this message translates to:
  /// **'Account Name (Arabic)'**
  String get accountNameAr;

  /// No description provided for @accountNameEn.
  ///
  /// In en, this message translates to:
  /// **'Account Name (English)'**
  String get accountNameEn;

  /// No description provided for @roleNameEn.
  ///
  /// In en, this message translates to:
  /// **'Role Name (English)'**
  String get roleNameEn;

  /// No description provided for @roleNameAr.
  ///
  /// In en, this message translates to:
  /// **'Role Name (Arabic)'**
  String get roleNameAr;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @backupFrequency.
  ///
  /// In en, this message translates to:
  /// **'Backup Frequency'**
  String get backupFrequency;

  /// No description provided for @cloudBackup.
  ///
  /// In en, this message translates to:
  /// **'Cloud Backup'**
  String get cloudBackup;

  /// No description provided for @cloudBackupHint.
  ///
  /// In en, this message translates to:
  /// **'Hint: Cloud backup is important.'**
  String get cloudBackupHint;

  /// No description provided for @editTaxBracket.
  ///
  /// In en, this message translates to:
  /// **'Edit Tax Bracket'**
  String get editTaxBracket;

  /// No description provided for @editTaxCalculationMethod.
  ///
  /// In en, this message translates to:
  /// **'Edit Tax Calculation Method'**
  String get editTaxCalculationMethod;

  /// No description provided for @editTaxType.
  ///
  /// In en, this message translates to:
  /// **'Edit Tax Type'**
  String get editTaxType;

  /// No description provided for @branches.
  ///
  /// In en, this message translates to:
  /// **'Branches'**
  String get branches;

  /// No description provided for @addNewCompany.
  ///
  /// In en, this message translates to:
  /// **'Add New Company'**
  String get addNewCompany;

  /// No description provided for @noCompaniesYet.
  ///
  /// In en, this message translates to:
  /// **'No companies created yet. Add your first company!'**
  String get noCompaniesYet;

  /// No description provided for @selectCompanyPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select a company from the list to view/edit its details.'**
  String get selectCompanyPrompt;

  /// No description provided for @noBranchesYet.
  ///
  /// In en, this message translates to:
  /// **'No branches created yet. Add your first branch!'**
  String get noBranchesYet;

  /// No description provided for @selectBranchPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select a branch from the list to view/edit its details.'**
  String get selectBranchPrompt;

  /// No description provided for @branchStatusUpdated.
  ///
  /// In en, this message translates to:
  /// **'Branch status updated successfully.'**
  String get branchStatusUpdated;

  /// No description provided for @branchDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Branch {branchName} deleted successfully.'**
  String branchDeletedSuccessfully(String branchName);

  /// No description provided for @notProvided.
  ///
  /// In en, this message translates to:
  /// **'Not Provided'**
  String get notProvided;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @systemPeriods.
  ///
  /// In en, this message translates to:
  /// **'System Periods'**
  String get systemPeriods;

  /// No description provided for @fiscalYear.
  ///
  /// In en, this message translates to:
  /// **'Fiscal Year'**
  String get fiscalYear;

  /// No description provided for @periodsType.
  ///
  /// In en, this message translates to:
  /// **'Periods Type'**
  String get periodsType;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @quarterly.
  ///
  /// In en, this message translates to:
  /// **'Quarterly'**
  String get quarterly;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @numberOfPeriods.
  ///
  /// In en, this message translates to:
  /// **'Number of Periods'**
  String get numberOfPeriods;

  /// No description provided for @periodCode.
  ///
  /// In en, this message translates to:
  /// **'Period Code'**
  String get periodCode;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// No description provided for @generatePeriods.
  ///
  /// In en, this message translates to:
  /// **'Generate Periods'**
  String get generatePeriods;

  /// No description provided for @lockPeriod.
  ///
  /// In en, this message translates to:
  /// **'Lock Period'**
  String get lockPeriod;

  /// No description provided for @newPeriodOverlap.
  ///
  /// In en, this message translates to:
  /// **'New period overlaps with existing periods.'**
  String get newPeriodOverlap;

  /// No description provided for @periodDatesCannotBeModifiedWithTransactions.
  ///
  /// In en, this message translates to:
  /// **'Period dates cannot be modified if transactions exist.'**
  String get periodDatesCannotBeModifiedWithTransactions;

  /// No description provided for @cannotDeleteClosedLockedPeriod.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete a closed or locked period.'**
  String get cannotDeleteClosedLockedPeriod;

  /// No description provided for @cannotDeletePeriodWithTransactions.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete period with existing transactions.'**
  String get cannotDeletePeriodWithTransactions;

  /// No description provided for @periodAlreadyLocked.
  ///
  /// In en, this message translates to:
  /// **'Period is already locked.'**
  String get periodAlreadyLocked;

  /// No description provided for @periodCodeRequiredForUpdate.
  ///
  /// In en, this message translates to:
  /// **'Period code is required for update.'**
  String get periodCodeRequiredForUpdate;

  /// No description provided for @financialPeriodNotFound.
  ///
  /// In en, this message translates to:
  /// **'Financial period not found.'**
  String get financialPeriodNotFound;

  /// No description provided for @financialPeriodAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Financial period with this code already exists.'**
  String get financialPeriodAlreadyExists;

  /// No description provided for @invalidPeriodType.
  ///
  /// In en, this message translates to:
  /// **'Invalid period type.'**
  String get invalidPeriodType;

  /// No description provided for @numberOfPeriodsRequiredForCustom.
  ///
  /// In en, this message translates to:
  /// **'Number of periods is required for Custom type.'**
  String get numberOfPeriodsRequiredForCustom;

  /// No description provided for @updatedPeriodOverlap.
  ///
  /// In en, this message translates to:
  /// **'Updated period overlaps with other periods.'**
  String get updatedPeriodOverlap;

  /// No description provided for @cannotLockPeriodUnfinalizedTransactions.
  ///
  /// In en, this message translates to:
  /// **'Cannot lock period with unfinalized transactions.'**
  String get cannotLockPeriodUnfinalizedTransactions;

  /// No description provided for @noRowsAffectedUpdate.
  ///
  /// In en, this message translates to:
  /// **'No rows affected during update. Period might not exist.'**
  String get noRowsAffectedUpdate;

  /// No description provided for @noRowsAffectedDelete.
  ///
  /// In en, this message translates to:
  /// **'No rows affected during delete. Period might not exist.'**
  String get noRowsAffectedDelete;

  /// No description provided for @financialPeriodsTitle.
  ///
  /// In en, this message translates to:
  /// **'Financial Periods'**
  String get financialPeriodsTitle;

  /// No description provided for @noFinancialPeriodsYet.
  ///
  /// In en, this message translates to:
  /// **'No financial periods created yet. Add or generate your first periods! '**
  String get noFinancialPeriodsYet;

  /// No description provided for @addFinancialPeriodButton.
  ///
  /// In en, this message translates to:
  /// **'Add Financial Period'**
  String get addFinancialPeriodButton;

  /// No description provided for @generateFinancialPeriodsButton.
  ///
  /// In en, this message translates to:
  /// **'Generate Financial Periods'**
  String get generateFinancialPeriodsButton;

  /// No description provided for @addFinancialPeriod.
  ///
  /// In en, this message translates to:
  /// **'Add Financial Period'**
  String get addFinancialPeriod;

  /// No description provided for @editFinancialPeriod.
  ///
  /// In en, this message translates to:
  /// **'Edit Financial Period'**
  String get editFinancialPeriod;

  /// No description provided for @periodName.
  ///
  /// In en, this message translates to:
  /// **'Period Name'**
  String get periodName;

  /// No description provided for @periodNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Period name is required'**
  String get periodNameRequired;

  /// No description provided for @isLocked.
  ///
  /// In en, this message translates to:
  /// **'Is Locked'**
  String get isLocked;

  /// No description provided for @unlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get unlocked;

  /// No description provided for @generateFinancialPeriods.
  ///
  /// In en, this message translates to:
  /// **'Generate Financial Periods'**
  String get generateFinancialPeriods;

  /// No description provided for @startYear.
  ///
  /// In en, this message translates to:
  /// **'Start Year'**
  String get startYear;

  /// No description provided for @invalidYear.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid year'**
  String get invalidYear;

  /// No description provided for @invalidNumberOfYears.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number of years'**
  String get invalidNumberOfYears;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'MuhasebPro'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account'**
  String get loginSubtitle;

  /// No description provided for @invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid username or password'**
  String get invalidCredentials;

  /// No description provided for @userInactive.
  ///
  /// In en, this message translates to:
  /// **'This account is inactive'**
  String get userInactive;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get loginSuccess;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @registrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration successful'**
  String get registrationSuccess;

  /// No description provided for @fullNameArRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name in Arabic is required'**
  String get fullNameArRequired;

  /// No description provided for @fullNameEnRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name in English is required'**
  String get fullNameEnRequired;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Login'**
  String get alreadyHaveAccount;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get passwordResetSuccess;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backToLogin;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @selectOrCreateBranch.
  ///
  /// In en, this message translates to:
  /// **'Select a branch or create a new one'**
  String get selectOrCreateBranch;

  /// No description provided for @branchCodeExists.
  ///
  /// In en, this message translates to:
  /// **'Branch code already exists'**
  String get branchCodeExists;

  /// No description provided for @branchStatus.
  ///
  /// In en, this message translates to:
  /// **'Branch Status'**
  String get branchStatus;

  /// No description provided for @usernameExists.
  ///
  /// In en, this message translates to:
  /// **'Username already exists'**
  String get usernameExists;

  /// No description provided for @invalidPhoneNumberFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format'**
  String get invalidPhoneNumberFormat;

  /// No description provided for @symbol.
  ///
  /// In en, this message translates to:
  /// **'Symbol'**
  String get symbol;

  /// No description provided for @isCompound.
  ///
  /// In en, this message translates to:
  /// **'Is Compound'**
  String get isCompound;

  /// No description provided for @glSetup.
  ///
  /// In en, this message translates to:
  /// **'GL Setup'**
  String get glSetup;

  /// No description provided for @glSetupConfiguration.
  ///
  /// In en, this message translates to:
  /// **'General Ledger Setup & Configuration'**
  String get glSetupConfiguration;

  /// No description provided for @documentTypes.
  ///
  /// In en, this message translates to:
  /// **'Document Types'**
  String get documentTypes;

  /// No description provided for @descriptionCoding.
  ///
  /// In en, this message translates to:
  /// **'Description Coding'**
  String get descriptionCoding;

  /// No description provided for @docTypeCode.
  ///
  /// In en, this message translates to:
  /// **'Type Code'**
  String get docTypeCode;

  /// No description provided for @nameArabic.
  ///
  /// In en, this message translates to:
  /// **'Name (Arabic)'**
  String get nameArabic;

  /// No description provided for @nameEnglish.
  ///
  /// In en, this message translates to:
  /// **'Name (English)'**
  String get nameEnglish;

  /// No description provided for @sequenceMethod.
  ///
  /// In en, this message translates to:
  /// **'Sequence Method'**
  String get sequenceMethod;

  /// No description provided for @sequenceBehavior.
  ///
  /// In en, this message translates to:
  /// **'Sequence Behavior'**
  String get sequenceBehavior;

  /// No description provided for @specific.
  ///
  /// In en, this message translates to:
  /// **'Specific'**
  String get specific;

  /// No description provided for @autoUnchangeable.
  ///
  /// In en, this message translates to:
  /// **'Auto-Unchangeable'**
  String get autoUnchangeable;

  /// No description provided for @autoChangeable.
  ///
  /// In en, this message translates to:
  /// **'Auto-Changeable'**
  String get autoChangeable;

  /// No description provided for @manual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manual;

  /// No description provided for @descCode.
  ///
  /// In en, this message translates to:
  /// **'Description Code'**
  String get descCode;

  /// No description provided for @descriptionArabic.
  ///
  /// In en, this message translates to:
  /// **'Description (Arabic)'**
  String get descriptionArabic;

  /// No description provided for @descriptionEnglish.
  ///
  /// In en, this message translates to:
  /// **'Description (English)'**
  String get descriptionEnglish;

  /// No description provided for @linkedAccount.
  ///
  /// In en, this message translates to:
  /// **'Linked Account'**
  String get linkedAccount;

  /// No description provided for @addDocumentType.
  ///
  /// In en, this message translates to:
  /// **'Add Document Type'**
  String get addDocumentType;

  /// No description provided for @editDocumentType.
  ///
  /// In en, this message translates to:
  /// **'Edit Document Type'**
  String get editDocumentType;

  /// No description provided for @addDescriptionCoding.
  ///
  /// In en, this message translates to:
  /// **'Add Description Coding'**
  String get addDescriptionCoding;

  /// No description provided for @editDescriptionCoding.
  ///
  /// In en, this message translates to:
  /// **'Edit Description Coding'**
  String get editDescriptionCoding;

  /// No description provided for @documentTypeCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Document type code is required'**
  String get documentTypeCodeRequired;

  /// No description provided for @documentTypeCodeTooLong.
  ///
  /// In en, this message translates to:
  /// **'Document type code must not exceed 10 characters'**
  String get documentTypeCodeTooLong;

  /// No description provided for @nameArabicRequired.
  ///
  /// In en, this message translates to:
  /// **'Arabic name is required'**
  String get nameArabicRequired;

  /// No description provided for @nameArabicTooLong.
  ///
  /// In en, this message translates to:
  /// **'Arabic name must not exceed 50 characters'**
  String get nameArabicTooLong;

  /// No description provided for @nameEnglishRequired.
  ///
  /// In en, this message translates to:
  /// **'English name is required'**
  String get nameEnglishRequired;

  /// No description provided for @nameEnglishTooLong.
  ///
  /// In en, this message translates to:
  /// **'English name must not exceed 50 characters'**
  String get nameEnglishTooLong;

  /// No description provided for @descriptionCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Description code is required'**
  String get descriptionCodeRequired;

  /// No description provided for @descriptionCodeTooLong.
  ///
  /// In en, this message translates to:
  /// **'Description code must not exceed 10 characters'**
  String get descriptionCodeTooLong;

  /// No description provided for @descriptionArabicRequired.
  ///
  /// In en, this message translates to:
  /// **'Arabic description is required'**
  String get descriptionArabicRequired;

  /// No description provided for @descriptionArabicTooLong.
  ///
  /// In en, this message translates to:
  /// **'Arabic description must not exceed 250 characters'**
  String get descriptionArabicTooLong;

  /// No description provided for @descriptionEnglishRequired.
  ///
  /// In en, this message translates to:
  /// **'English description is required'**
  String get descriptionEnglishRequired;

  /// No description provided for @descriptionEnglishTooLong.
  ///
  /// In en, this message translates to:
  /// **'English description must not exceed 250 characters'**
  String get descriptionEnglishTooLong;

  /// No description provided for @documentTypeAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Document type with this code already exists'**
  String get documentTypeAlreadyExists;

  /// No description provided for @descriptionCodingAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Description coding with this code already exists'**
  String get descriptionCodingAlreadyExists;

  /// No description provided for @documentTypeNotFound.
  ///
  /// In en, this message translates to:
  /// **'Document type not found'**
  String get documentTypeNotFound;

  /// No description provided for @descriptionCodingNotFound.
  ///
  /// In en, this message translates to:
  /// **'Description coding not found'**
  String get descriptionCodingNotFound;

  /// No description provided for @cannotDeleteDocumentTypeInUse.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete document type as it is used in transactions'**
  String get cannotDeleteDocumentTypeInUse;

  /// No description provided for @documentTypeCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Document type created successfully'**
  String get documentTypeCreatedSuccessfully;

  /// No description provided for @documentTypeUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Document type updated successfully'**
  String get documentTypeUpdatedSuccessfully;

  /// No description provided for @documentTypeDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Document type deleted successfully'**
  String get documentTypeDeletedSuccessfully;

  /// No description provided for @descriptionCodingCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Description coding created successfully'**
  String get descriptionCodingCreatedSuccessfully;

  /// No description provided for @descriptionCodingUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Description coding updated successfully'**
  String get descriptionCodingUpdatedSuccessfully;

  /// No description provided for @descriptionCodingDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Description coding deleted successfully'**
  String get descriptionCodingDeletedSuccessfully;

  /// No description provided for @failedToDeleteDescriptionCoding.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete description coding'**
  String get failedToDeleteDescriptionCoding;

  /// No description provided for @noDocumentTypesYet.
  ///
  /// In en, this message translates to:
  /// **'No document types created yet. Add your first document type!'**
  String get noDocumentTypesYet;

  /// No description provided for @noDescriptionCodingYet.
  ///
  /// In en, this message translates to:
  /// **'No description coding created yet. Add your first description coding!'**
  String get noDescriptionCodingYet;

  /// No description provided for @searchDocumentTypes.
  ///
  /// In en, this message translates to:
  /// **'Search document types...'**
  String get searchDocumentTypes;

  /// No description provided for @searchDescriptionCoding.
  ///
  /// In en, this message translates to:
  /// **'Search description coding...'**
  String get searchDescriptionCoding;

  /// No description provided for @selectAccount.
  ///
  /// In en, this message translates to:
  /// **'Select Account'**
  String get selectAccount;

  /// No description provided for @noAccountSelected.
  ///
  /// In en, this message translates to:
  /// **'No account selected'**
  String get noAccountSelected;

  /// No description provided for @accessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access denied. You don\'t have permission to view this page.'**
  String get accessDenied;

  /// No description provided for @searchAccounts.
  ///
  /// In en, this message translates to:
  /// **'Search accounts...'**
  String get searchAccounts;

  /// No description provided for @noAccountsYet.
  ///
  /// In en, this message translates to:
  /// **'No accounts created yet.'**
  String get noAccountsYet;

  /// No description provided for @noAccountsFound.
  ///
  /// In en, this message translates to:
  /// **'No accounts found matching your search.'**
  String get noAccountsFound;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @journalVouchers.
  ///
  /// In en, this message translates to:
  /// **'Journal Vouchers'**
  String get journalVouchers;

  /// No description provided for @viewList.
  ///
  /// In en, this message translates to:
  /// **'View List'**
  String get viewList;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @voucherSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Voucher saved successfully'**
  String get voucherSavedSuccessfully;

  /// No description provided for @searchQuery.
  ///
  /// In en, this message translates to:
  /// **'Search Query'**
  String get searchQuery;

  /// No description provided for @enterSearchTerm.
  ///
  /// In en, this message translates to:
  /// **'Enter search term'**
  String get enterSearchTerm;

  /// No description provided for @filterOptions.
  ///
  /// In en, this message translates to:
  /// **'Filter Options'**
  String get filterOptions;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @draft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get draft;

  /// No description provided for @posted.
  ///
  /// In en, this message translates to:
  /// **'Posted'**
  String get posted;

  /// No description provided for @reversed.
  ///
  /// In en, this message translates to:
  /// **'Reversed'**
  String get reversed;

  /// No description provided for @searchVouchers.
  ///
  /// In en, this message translates to:
  /// **'Search vouchers...'**
  String get searchVouchers;

  /// No description provided for @noVouchersFound.
  ///
  /// In en, this message translates to:
  /// **'No vouchers found'**
  String get noVouchersFound;

  /// No description provided for @createFirstVoucher.
  ///
  /// In en, this message translates to:
  /// **'Create your first voucher!'**
  String get createFirstVoucher;

  /// No description provided for @confirmPost.
  ///
  /// In en, this message translates to:
  /// **'Confirm Post'**
  String get confirmPost;

  /// No description provided for @confirmPostVoucher.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to post voucher {voucherName}?'**
  String confirmPostVoucher(String voucherName);

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @voucherPostedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Voucher posted successfully'**
  String get voucherPostedSuccessfully;

  /// No description provided for @confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDelete;

  /// No description provided for @confirmDeleteVoucher.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete voucher {voucherName}?'**
  String confirmDeleteVoucher(String voucherName);

  /// No description provided for @voucherDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Voucher deleted successfully'**
  String get voucherDeletedSuccessfully;

  /// No description provided for @debit.
  ///
  /// In en, this message translates to:
  /// **'Debit'**
  String get debit;

  /// No description provided for @credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get credit;

  /// No description provided for @reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get reference;

  /// No description provided for @reversing.
  ///
  /// In en, this message translates to:
  /// **'Reversing'**
  String get reversing;

  /// No description provided for @periodic.
  ///
  /// In en, this message translates to:
  /// **'Periodic'**
  String get periodic;

  /// No description provided for @documentType.
  ///
  /// In en, this message translates to:
  /// **'Document Type'**
  String get documentType;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @referenceCode.
  ///
  /// In en, this message translates to:
  /// **'Reference Code'**
  String get referenceCode;

  /// No description provided for @pleaseSelectDocumentType.
  ///
  /// In en, this message translates to:
  /// **'Please select a document type'**
  String get pleaseSelectDocumentType;

  /// No description provided for @pleaseSelectBranch.
  ///
  /// In en, this message translates to:
  /// **'Please select a branch'**
  String get pleaseSelectBranch;

  /// No description provided for @pleaseEnterDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter description'**
  String get pleaseEnterDescription;

  /// No description provided for @journalEntries.
  ///
  /// In en, this message translates to:
  /// **'Journal Entries'**
  String get journalEntries;

  /// No description provided for @addLine.
  ///
  /// In en, this message translates to:
  /// **'Add Line'**
  String get addLine;

  /// No description provided for @noEntriesAdded.
  ///
  /// In en, this message translates to:
  /// **'No entries added yet'**
  String get noEntriesAdded;

  /// No description provided for @addFirstEntry.
  ///
  /// In en, this message translates to:
  /// **'Add your first journal entry'**
  String get addFirstEntry;

  /// No description provided for @addJournalEntry.
  ///
  /// In en, this message translates to:
  /// **'Add Journal Entry'**
  String get addJournalEntry;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @totalDebit.
  ///
  /// In en, this message translates to:
  /// **'Total Debit'**
  String get totalDebit;

  /// No description provided for @totalCredit.
  ///
  /// In en, this message translates to:
  /// **'Total Credit'**
  String get totalCredit;

  /// No description provided for @difference.
  ///
  /// In en, this message translates to:
  /// **'Difference'**
  String get difference;

  /// No description provided for @paymentVouchers.
  ///
  /// In en, this message translates to:
  /// **'Payment Vouchers'**
  String get paymentVouchers;

  /// No description provided for @searchPaymentVouchers.
  ///
  /// In en, this message translates to:
  /// **'Search payment vouchers...'**
  String get searchPaymentVouchers;

  /// No description provided for @paymentFromAccount.
  ///
  /// In en, this message translates to:
  /// **'Payment From Account'**
  String get paymentFromAccount;

  /// No description provided for @pleaseSelectPaymentAccount.
  ///
  /// In en, this message translates to:
  /// **'Please select a payment account'**
  String get pleaseSelectPaymentAccount;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @check.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get check;

  /// No description provided for @bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get bankTransfer;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCard;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @checkNumber.
  ///
  /// In en, this message translates to:
  /// **'Check Number'**
  String get checkNumber;

  /// No description provided for @beneficiary.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary'**
  String get beneficiary;

  /// No description provided for @paymentLines.
  ///
  /// In en, this message translates to:
  /// **'Payment Lines'**
  String get paymentLines;

  /// No description provided for @noPaymentLinesAdded.
  ///
  /// In en, this message translates to:
  /// **'No payment lines added yet'**
  String get noPaymentLinesAdded;

  /// No description provided for @addFirstPaymentLine.
  ///
  /// In en, this message translates to:
  /// **'Add your first payment line'**
  String get addFirstPaymentLine;

  /// No description provided for @addPaymentLine.
  ///
  /// In en, this message translates to:
  /// **'Add Payment Line'**
  String get addPaymentLine;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// No description provided for @paymentFrom.
  ///
  /// In en, this message translates to:
  /// **'Payment From'**
  String get paymentFrom;

  /// No description provided for @line.
  ///
  /// In en, this message translates to:
  /// **'line'**
  String get line;

  /// No description provided for @lines.
  ///
  /// In en, this message translates to:
  /// **'lines'**
  String get lines;

  /// No description provided for @receiptVouchers.
  ///
  /// In en, this message translates to:
  /// **'Receipt Vouchers'**
  String get receiptVouchers;

  /// No description provided for @searchReceiptVouchers.
  ///
  /// In en, this message translates to:
  /// **'Search receipt vouchers...'**
  String get searchReceiptVouchers;

  /// No description provided for @receiptToAccount.
  ///
  /// In en, this message translates to:
  /// **'Receipt To Account'**
  String get receiptToAccount;

  /// No description provided for @pleaseSelectReceiptAccount.
  ///
  /// In en, this message translates to:
  /// **'Please select a receipt account'**
  String get pleaseSelectReceiptAccount;

  /// No description provided for @receiptMethod.
  ///
  /// In en, this message translates to:
  /// **'Receipt Method'**
  String get receiptMethod;

  /// No description provided for @payer.
  ///
  /// In en, this message translates to:
  /// **'Payer'**
  String get payer;

  /// No description provided for @receiptLines.
  ///
  /// In en, this message translates to:
  /// **'Receipt Lines'**
  String get receiptLines;

  /// No description provided for @noReceiptLinesAdded.
  ///
  /// In en, this message translates to:
  /// **'No receipt lines added yet'**
  String get noReceiptLinesAdded;

  /// No description provided for @addFirstReceiptLine.
  ///
  /// In en, this message translates to:
  /// **'Add your first receipt line'**
  String get addFirstReceiptLine;

  /// No description provided for @addReceiptLine.
  ///
  /// In en, this message translates to:
  /// **'Add Receipt Line'**
  String get addReceiptLine;

  /// No description provided for @receiptTo.
  ///
  /// In en, this message translates to:
  /// **'Receipt To'**
  String get receiptTo;

  /// No description provided for @cashBankManagement.
  ///
  /// In en, this message translates to:
  /// **'Cash & Bank Management'**
  String get cashBankManagement;

  /// No description provided for @bankReconciliation.
  ///
  /// In en, this message translates to:
  /// **'Bank Reconciliation'**
  String get bankReconciliation;

  /// No description provided for @cashDeposits.
  ///
  /// In en, this message translates to:
  /// **'Cash Deposits'**
  String get cashDeposits;

  /// No description provided for @bankStatements.
  ///
  /// In en, this message translates to:
  /// **'Bank Statements'**
  String get bankStatements;

  /// No description provided for @adjustmentEntries.
  ///
  /// In en, this message translates to:
  /// **'Adjustment Entries'**
  String get adjustmentEntries;

  /// No description provided for @bankAccount.
  ///
  /// In en, this message translates to:
  /// **'Bank Account'**
  String get bankAccount;

  /// No description provided for @reconciliationDate.
  ///
  /// In en, this message translates to:
  /// **'Reconciliation Date'**
  String get reconciliationDate;

  /// No description provided for @bankStatementBalance.
  ///
  /// In en, this message translates to:
  /// **'Bank Statement Balance'**
  String get bankStatementBalance;

  /// No description provided for @bookBalance.
  ///
  /// In en, this message translates to:
  /// **'Book Balance'**
  String get bookBalance;

  /// No description provided for @adjustedBankBalance.
  ///
  /// In en, this message translates to:
  /// **'Adjusted Bank Balance'**
  String get adjustedBankBalance;

  /// No description provided for @outstandingDeposits.
  ///
  /// In en, this message translates to:
  /// **'Outstanding Deposits'**
  String get outstandingDeposits;

  /// No description provided for @outstandingChecks.
  ///
  /// In en, this message translates to:
  /// **'Outstanding Checks'**
  String get outstandingChecks;

  /// No description provided for @addOutstandingDeposit.
  ///
  /// In en, this message translates to:
  /// **'Add Outstanding Deposit'**
  String get addOutstandingDeposit;

  /// No description provided for @addOutstandingCheck.
  ///
  /// In en, this message translates to:
  /// **'Add Outstanding Check'**
  String get addOutstandingCheck;

  /// No description provided for @reconciled.
  ///
  /// In en, this message translates to:
  /// **'Reconciled'**
  String get reconciled;

  /// No description provided for @notReconciled.
  ///
  /// In en, this message translates to:
  /// **'Not Reconciled'**
  String get notReconciled;

  /// No description provided for @saveReconciliation.
  ///
  /// In en, this message translates to:
  /// **'Save Reconciliation'**
  String get saveReconciliation;

  /// No description provided for @reconciliationNotBalanced.
  ///
  /// In en, this message translates to:
  /// **'Reconciliation is not balanced'**
  String get reconciliationNotBalanced;

  /// No description provided for @reconciliationSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Reconciliation saved successfully'**
  String get reconciliationSavedSuccessfully;

  /// No description provided for @noOutstandingDeposits.
  ///
  /// In en, this message translates to:
  /// **'No outstanding deposits'**
  String get noOutstandingDeposits;

  /// No description provided for @noOutstandingChecks.
  ///
  /// In en, this message translates to:
  /// **'No outstanding checks'**
  String get noOutstandingChecks;

  /// No description provided for @newDeposit.
  ///
  /// In en, this message translates to:
  /// **'New Deposit'**
  String get newDeposit;

  /// No description provided for @noDepositsFound.
  ///
  /// In en, this message translates to:
  /// **'No deposits found'**
  String get noDepositsFound;

  /// No description provided for @createFirstDeposit.
  ///
  /// In en, this message translates to:
  /// **'Create your first deposit'**
  String get createFirstDeposit;

  /// No description provided for @fromAccount.
  ///
  /// In en, this message translates to:
  /// **'From Account'**
  String get fromAccount;

  /// No description provided for @toAccount.
  ///
  /// In en, this message translates to:
  /// **'To Account'**
  String get toAccount;

  /// No description provided for @depositSlipNumber.
  ///
  /// In en, this message translates to:
  /// **'Deposit Slip Number'**
  String get depositSlipNumber;

  /// No description provided for @bankConfirmationNumber.
  ///
  /// In en, this message translates to:
  /// **'Bank Confirmation Number'**
  String get bankConfirmationNumber;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get confirmed;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @depositSubmittedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Deposit submitted successfully'**
  String get depositSubmittedSuccessfully;

  /// No description provided for @confirmDeposit.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deposit'**
  String get confirmDeposit;

  /// No description provided for @confirmDepositMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter the bank confirmation number to confirm this deposit'**
  String get confirmDepositMessage;

  /// No description provided for @depositConfirmedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Deposit confirmed successfully'**
  String get depositConfirmedSuccessfully;

  /// No description provided for @editDepositNotImplemented.
  ///
  /// In en, this message translates to:
  /// **'Edit deposit functionality not implemented yet'**
  String get editDepositNotImplemented;

  /// No description provided for @confirmDeleteDeposit.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this deposit?'**
  String get confirmDeleteDeposit;

  /// No description provided for @depositDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Deposit deleted successfully'**
  String get depositDeletedSuccessfully;

  /// No description provided for @importStatement.
  ///
  /// In en, this message translates to:
  /// **'Import Statement'**
  String get importStatement;

  /// No description provided for @fromDate.
  ///
  /// In en, this message translates to:
  /// **'From Date'**
  String get fromDate;

  /// No description provided for @toDate.
  ///
  /// In en, this message translates to:
  /// **'To Date'**
  String get toDate;

  /// No description provided for @noStatementsFound.
  ///
  /// In en, this message translates to:
  /// **'No statements found'**
  String get noStatementsFound;

  /// No description provided for @importFirstStatement.
  ///
  /// In en, this message translates to:
  /// **'Import your first statement'**
  String get importFirstStatement;

  /// No description provided for @openingBalance.
  ///
  /// In en, this message translates to:
  /// **'Opening Balance'**
  String get openingBalance;

  /// No description provided for @closingBalance.
  ///
  /// In en, this message translates to:
  /// **'Closing Balance'**
  String get closingBalance;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @reconcile.
  ///
  /// In en, this message translates to:
  /// **'Reconcile'**
  String get reconcile;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @statementReconciledSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Statement reconciled successfully'**
  String get statementReconciledSuccessfully;

  /// No description provided for @statementDetailsNotImplemented.
  ///
  /// In en, this message translates to:
  /// **'Statement details not implemented yet'**
  String get statementDetailsNotImplemented;

  /// No description provided for @statementsFiltered.
  ///
  /// In en, this message translates to:
  /// **'Statements filtered'**
  String get statementsFiltered;

  /// No description provided for @import.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get import;

  /// No description provided for @adjustmentType.
  ///
  /// In en, this message translates to:
  /// **'Adjustment Type'**
  String get adjustmentType;

  /// No description provided for @bankCharges.
  ///
  /// In en, this message translates to:
  /// **'Bank Charges'**
  String get bankCharges;

  /// No description provided for @interestEarned.
  ///
  /// In en, this message translates to:
  /// **'Interest Earned'**
  String get interestEarned;

  /// No description provided for @errorCorrection.
  ///
  /// In en, this message translates to:
  /// **'Error Correction'**
  String get errorCorrection;

  /// No description provided for @newAdjustment.
  ///
  /// In en, this message translates to:
  /// **'New Adjustment'**
  String get newAdjustment;

  /// No description provided for @noAdjustmentsFound.
  ///
  /// In en, this message translates to:
  /// **'No adjustments found'**
  String get noAdjustmentsFound;

  /// No description provided for @createFirstAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Create your first adjustment'**
  String get createFirstAdjustment;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @contraAccount.
  ///
  /// In en, this message translates to:
  /// **'Contra Account'**
  String get contraAccount;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @approvedBy.
  ///
  /// In en, this message translates to:
  /// **'Approved By'**
  String get approvedBy;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @adjustmentSubmittedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Adjustment submitted successfully'**
  String get adjustmentSubmittedSuccessfully;

  /// No description provided for @adjustmentApprovedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Adjustment approved successfully'**
  String get adjustmentApprovedSuccessfully;

  /// No description provided for @editAdjustmentNotImplemented.
  ///
  /// In en, this message translates to:
  /// **'Edit adjustment functionality not implemented yet'**
  String get editAdjustmentNotImplemented;

  /// No description provided for @confirmDeleteAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this adjustment?'**
  String get confirmDeleteAdjustment;

  /// No description provided for @adjustmentDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Adjustment deleted successfully'**
  String get adjustmentDeletedSuccessfully;

  /// No description provided for @cashBankManagementHelp.
  ///
  /// In en, this message translates to:
  /// **'Manage cash and bank operations including reconciliation, deposits, and adjustments.'**
  String get cashBankManagementHelp;

  /// No description provided for @bankReconciliationHelp.
  ///
  /// In en, this message translates to:
  /// **'Compare bank statements with book records to identify discrepancies.'**
  String get bankReconciliationHelp;

  /// No description provided for @cashDepositsHelp.
  ///
  /// In en, this message translates to:
  /// **'Track and confirm cash deposits to bank accounts.'**
  String get cashDepositsHelp;

  /// No description provided for @bankStatementsHelp.
  ///
  /// In en, this message translates to:
  /// **'Import and review bank statements for reconciliation.'**
  String get bankStatementsHelp;

  /// No description provided for @adjustmentEntriesHelp.
  ///
  /// In en, this message translates to:
  /// **'Create adjustment entries for bank charges, interest, and corrections.'**
  String get adjustmentEntriesHelp;

  /// No description provided for @dataRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Data refreshed'**
  String get dataRefreshed;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @financialReports.
  ///
  /// In en, this message translates to:
  /// **'Financial Reports'**
  String get financialReports;

  /// No description provided for @selectReport.
  ///
  /// In en, this message translates to:
  /// **'Select Report'**
  String get selectReport;

  /// No description provided for @trialBalance.
  ///
  /// In en, this message translates to:
  /// **'Trial Balance'**
  String get trialBalance;

  /// No description provided for @trialBalanceDescription.
  ///
  /// In en, this message translates to:
  /// **'List of all accounts with their debit and credit balances'**
  String get trialBalanceDescription;

  /// No description provided for @incomeStatement.
  ///
  /// In en, this message translates to:
  /// **'Income Statement'**
  String get incomeStatement;

  /// No description provided for @incomeStatementDescription.
  ///
  /// In en, this message translates to:
  /// **'Revenue and expenses for a specific period'**
  String get incomeStatementDescription;

  /// No description provided for @balanceSheet.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet'**
  String get balanceSheet;

  /// No description provided for @balanceSheetDescription.
  ///
  /// In en, this message translates to:
  /// **'Assets, liabilities, and equity at a specific date'**
  String get balanceSheetDescription;

  /// No description provided for @cashFlowStatement.
  ///
  /// In en, this message translates to:
  /// **'Cash Flow Statement'**
  String get cashFlowStatement;

  /// No description provided for @cashFlowDescription.
  ///
  /// In en, this message translates to:
  /// **'Cash inflows and outflows for a specific period'**
  String get cashFlowDescription;

  /// No description provided for @accountStatement.
  ///
  /// In en, this message translates to:
  /// **'Account Statement'**
  String get accountStatement;

  /// No description provided for @accountStatementDescription.
  ///
  /// In en, this message translates to:
  /// **'Detailed transactions for a specific account'**
  String get accountStatementDescription;

  /// No description provided for @generalLedgerReport.
  ///
  /// In en, this message translates to:
  /// **'General Ledger'**
  String get generalLedgerReport;

  /// No description provided for @generalLedgerDescription.
  ///
  /// In en, this message translates to:
  /// **'Complete transaction history for all accounts'**
  String get generalLedgerDescription;

  /// No description provided for @asOfDate.
  ///
  /// In en, this message translates to:
  /// **'As of Date'**
  String get asOfDate;

  /// No description provided for @asOf.
  ///
  /// In en, this message translates to:
  /// **'As of'**
  String get asOf;

  /// No description provided for @allBranches.
  ///
  /// In en, this message translates to:
  /// **'All Branches'**
  String get allBranches;

  /// No description provided for @showZeroBalances.
  ///
  /// In en, this message translates to:
  /// **'Show Zero Balances'**
  String get showZeroBalances;

  /// No description provided for @accountName.
  ///
  /// In en, this message translates to:
  /// **'Account Name'**
  String get accountName;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @trialBalanceIsBalanced.
  ///
  /// In en, this message translates to:
  /// **'Trial Balance is Balanced'**
  String get trialBalanceIsBalanced;

  /// No description provided for @trialBalanceNotBalanced.
  ///
  /// In en, this message translates to:
  /// **'Trial Balance is Not Balanced'**
  String get trialBalanceNotBalanced;

  /// No description provided for @balanceSheetIsBalanced.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet is Balanced'**
  String get balanceSheetIsBalanced;

  /// No description provided for @balanceSheetNotBalanced.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet is Not Balanced'**
  String get balanceSheetNotBalanced;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @exportReport.
  ///
  /// In en, this message translates to:
  /// **'Export Report'**
  String get exportReport;

  /// No description provided for @exportToPdf.
  ///
  /// In en, this message translates to:
  /// **'Export to PDF'**
  String get exportToPdf;

  /// No description provided for @exportToExcel.
  ///
  /// In en, this message translates to:
  /// **'Export to Excel'**
  String get exportToExcel;

  /// No description provided for @exportToCsv.
  ///
  /// In en, this message translates to:
  /// **'Export to CSV'**
  String get exportToCsv;

  /// No description provided for @reportRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Report refreshed'**
  String get reportRefreshed;

  /// No description provided for @reportExportedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Report exported to {format} successfully'**
  String reportExportedSuccessfully(String format);

  /// No description provided for @reportSentToPrinter.
  ///
  /// In en, this message translates to:
  /// **'Report sent to printer'**
  String get reportSentToPrinter;

  /// No description provided for @selectAccountToViewStatement.
  ///
  /// In en, this message translates to:
  /// **'Select an account to view its statement'**
  String get selectAccountToViewStatement;

  /// No description provided for @selectAccountToViewLedger.
  ///
  /// In en, this message translates to:
  /// **'Select an account to view its ledger'**
  String get selectAccountToViewLedger;

  /// No description provided for @cashFlowReportComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Cash Flow Report coming soon'**
  String get cashFlowReportComingSoon;

  /// No description provided for @accountStatementComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Account Statement coming soon'**
  String get accountStatementComingSoon;

  /// No description provided for @generalLedgerComingSoon.
  ///
  /// In en, this message translates to:
  /// **'General Ledger Report coming soon'**
  String get generalLedgerComingSoon;

  /// No description provided for @transactionRequests.
  ///
  /// In en, this message translates to:
  /// **'Transaction Requests'**
  String get transactionRequests;

  /// No description provided for @allRequests.
  ///
  /// In en, this message translates to:
  /// **'All Requests'**
  String get allRequests;

  /// No description provided for @pendingApprovals.
  ///
  /// In en, this message translates to:
  /// **'Pending Approvals'**
  String get pendingApprovals;

  /// No description provided for @myRequests.
  ///
  /// In en, this message translates to:
  /// **'My Requests'**
  String get myRequests;

  /// No description provided for @createRequest.
  ///
  /// In en, this message translates to:
  /// **'Create Request'**
  String get createRequest;

  /// No description provided for @editRequest.
  ///
  /// In en, this message translates to:
  /// **'Edit Request'**
  String get editRequest;

  /// No description provided for @requestType.
  ///
  /// In en, this message translates to:
  /// **'Request Type'**
  String get requestType;

  /// No description provided for @requestDetails.
  ///
  /// In en, this message translates to:
  /// **'Request Details'**
  String get requestDetails;

  /// No description provided for @requester.
  ///
  /// In en, this message translates to:
  /// **'Requester'**
  String get requester;

  /// No description provided for @requestDate.
  ///
  /// In en, this message translates to:
  /// **'Request Date'**
  String get requestDate;

  /// No description provided for @approver.
  ///
  /// In en, this message translates to:
  /// **'Approver'**
  String get approver;

  /// No description provided for @approvalDate.
  ///
  /// In en, this message translates to:
  /// **'Approval Date'**
  String get approvalDate;

  /// No description provided for @rejectionReason.
  ///
  /// In en, this message translates to:
  /// **'Rejection Reason'**
  String get rejectionReason;

  /// No description provided for @requestNumber.
  ///
  /// In en, this message translates to:
  /// **'Request Number'**
  String get requestNumber;

  /// No description provided for @adjustmentEntry.
  ///
  /// In en, this message translates to:
  /// **'Adjustment Entry'**
  String get adjustmentEntry;

  /// No description provided for @pendingApproval.
  ///
  /// In en, this message translates to:
  /// **'Pending Approval'**
  String get pendingApproval;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @pleaseEnterAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter amount'**
  String get pleaseEnterAmount;

  /// No description provided for @pleaseEnterValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid amount'**
  String get pleaseEnterValidAmount;

  /// No description provided for @requestCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Request created successfully'**
  String get requestCreatedSuccessfully;

  /// No description provided for @requestUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Request updated successfully'**
  String get requestUpdatedSuccessfully;

  /// No description provided for @requestApprovedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Request approved successfully'**
  String get requestApprovedSuccessfully;

  /// No description provided for @requestRejectedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Request rejected successfully'**
  String get requestRejectedSuccessfully;

  /// No description provided for @failedToLoadRequests.
  ///
  /// In en, this message translates to:
  /// **'Failed to load requests'**
  String get failedToLoadRequests;

  /// No description provided for @failedToLoadPendingApprovals.
  ///
  /// In en, this message translates to:
  /// **'Failed to load pending approvals'**
  String get failedToLoadPendingApprovals;

  /// No description provided for @noRequestsFound.
  ///
  /// In en, this message translates to:
  /// **'No requests found'**
  String get noRequestsFound;

  /// No description provided for @youHaveNotCreatedAnyRequests.
  ///
  /// In en, this message translates to:
  /// **'You have not created any requests yet'**
  String get youHaveNotCreatedAnyRequests;

  /// No description provided for @noTransactionRequestsFound.
  ///
  /// In en, this message translates to:
  /// **'No transaction requests found'**
  String get noTransactionRequestsFound;

  /// No description provided for @noPendingApprovals.
  ///
  /// In en, this message translates to:
  /// **'No pending approvals'**
  String get noPendingApprovals;

  /// No description provided for @allRequestsHaveBeenProcessed.
  ///
  /// In en, this message translates to:
  /// **'All requests have been processed'**
  String get allRequestsHaveBeenProcessed;

  /// No description provided for @rejectRequest.
  ///
  /// In en, this message translates to:
  /// **'Reject Request'**
  String get rejectRequest;

  /// No description provided for @pleaseProvideRejectionReason.
  ///
  /// In en, this message translates to:
  /// **'Please provide rejection reason'**
  String get pleaseProvideRejectionReason;

  /// No description provided for @reviewPostingClosing.
  ///
  /// In en, this message translates to:
  /// **'Review, Posting & Closing'**
  String get reviewPostingClosing;

  /// No description provided for @postingBatches.
  ///
  /// In en, this message translates to:
  /// **'Posting Batches'**
  String get postingBatches;

  /// No description provided for @periodClosing.
  ///
  /// In en, this message translates to:
  /// **'Period Closing'**
  String get periodClosing;

  /// No description provided for @auditTrail.
  ///
  /// In en, this message translates to:
  /// **'Audit Trail'**
  String get auditTrail;

  /// No description provided for @createBatch.
  ///
  /// In en, this message translates to:
  /// **'Create Batch'**
  String get createBatch;

  /// No description provided for @startPosting.
  ///
  /// In en, this message translates to:
  /// **'Start Posting'**
  String get startPosting;

  /// No description provided for @noPostingBatches.
  ///
  /// In en, this message translates to:
  /// **'No posting batches'**
  String get noPostingBatches;

  /// No description provided for @createBatchToStartPosting.
  ///
  /// In en, this message translates to:
  /// **'Create a batch to start posting vouchers'**
  String get createBatchToStartPosting;

  /// No description provided for @totalVouchers.
  ///
  /// In en, this message translates to:
  /// **'Total Vouchers'**
  String get totalVouchers;

  /// No description provided for @processed.
  ///
  /// In en, this message translates to:
  /// **'Processed'**
  String get processed;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @startingBatch.
  ///
  /// In en, this message translates to:
  /// **'Starting batch'**
  String get startingBatch;

  /// No description provided for @cancellingBatch.
  ///
  /// In en, this message translates to:
  /// **'Cancelling batch'**
  String get cancellingBatch;

  /// No description provided for @batchDetails.
  ///
  /// In en, this message translates to:
  /// **'Batch Details'**
  String get batchDetails;

  /// No description provided for @createdBy.
  ///
  /// In en, this message translates to:
  /// **'Created By'**
  String get createdBy;

  /// No description provided for @createdAt.
  ///
  /// In en, this message translates to:
  /// **'Created At'**
  String get createdAt;

  /// No description provided for @startedAt.
  ///
  /// In en, this message translates to:
  /// **'Started At'**
  String get startedAt;

  /// No description provided for @completedAt.
  ///
  /// In en, this message translates to:
  /// **'Completed At'**
  String get completedAt;

  /// No description provided for @createPostingBatch.
  ///
  /// In en, this message translates to:
  /// **'Create Posting Batch'**
  String get createPostingBatch;

  /// No description provided for @selectVouchersToInclude.
  ///
  /// In en, this message translates to:
  /// **'Select vouchers to include in this batch'**
  String get selectVouchersToInclude;

  /// No description provided for @batchCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Batch created successfully'**
  String get batchCreatedSuccessfully;

  /// No description provided for @startBatchPosting.
  ///
  /// In en, this message translates to:
  /// **'Start Batch Posting'**
  String get startBatchPosting;

  /// No description provided for @confirmStartBatchPosting.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to start batch posting? This action cannot be undone.'**
  String get confirmStartBatchPosting;

  /// No description provided for @batchPostingStarted.
  ///
  /// In en, this message translates to:
  /// **'Batch posting started'**
  String get batchPostingStarted;

  /// No description provided for @createPeriod.
  ///
  /// In en, this message translates to:
  /// **'Create Period'**
  String get createPeriod;

  /// No description provided for @runChecks.
  ///
  /// In en, this message translates to:
  /// **'Run Checks'**
  String get runChecks;

  /// No description provided for @noPeriods.
  ///
  /// In en, this message translates to:
  /// **'No periods'**
  String get noPeriods;

  /// No description provided for @createPeriodToStartClosing.
  ///
  /// In en, this message translates to:
  /// **'Create a period to start closing process'**
  String get createPeriodToStartClosing;

  /// No description provided for @checks.
  ///
  /// In en, this message translates to:
  /// **'Checks'**
  String get checks;

  /// No description provided for @closedDate.
  ///
  /// In en, this message translates to:
  /// **'Closed Date'**
  String get closedDate;

  /// No description provided for @checksCompleted.
  ///
  /// In en, this message translates to:
  /// **'Checks Completed'**
  String get checksCompleted;

  /// No description provided for @failedChecks.
  ///
  /// In en, this message translates to:
  /// **'Failed Checks'**
  String get failedChecks;

  /// No description provided for @closePeriod.
  ///
  /// In en, this message translates to:
  /// **'Close Period'**
  String get closePeriod;

  /// No description provided for @reopenPeriod.
  ///
  /// In en, this message translates to:
  /// **'Reopen Period'**
  String get reopenPeriod;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @yearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearly;

  /// No description provided for @periodType.
  ///
  /// In en, this message translates to:
  /// **'Period Type'**
  String get periodType;

  /// No description provided for @periodCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Period created successfully'**
  String get periodCreatedSuccessfully;

  /// No description provided for @preClosingChecks.
  ///
  /// In en, this message translates to:
  /// **'Pre-closing Checks'**
  String get preClosingChecks;

  /// No description provided for @checksRunSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Checks run successfully'**
  String get checksRunSuccessfully;

  /// No description provided for @confirmClosePeriod.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to close this period? This action cannot be undone.'**
  String get confirmClosePeriod;

  /// No description provided for @periodClosed.
  ///
  /// In en, this message translates to:
  /// **'Period closed:'**
  String get periodClosed;

  /// No description provided for @periodReopened.
  ///
  /// In en, this message translates to:
  /// **'Period reopened:'**
  String get periodReopened;

  /// No description provided for @runningChecksFor.
  ///
  /// In en, this message translates to:
  /// **'Running checks for'**
  String get runningChecksFor;

  /// No description provided for @periodDetails.
  ///
  /// In en, this message translates to:
  /// **'Period Details'**
  String get periodDetails;

  /// No description provided for @closedBy.
  ///
  /// In en, this message translates to:
  /// **'Closed By'**
  String get closedBy;

  /// No description provided for @closingDate.
  ///
  /// In en, this message translates to:
  /// **'Closing Date'**
  String get closingDate;

  /// No description provided for @searchAuditTrail.
  ///
  /// In en, this message translates to:
  /// **'Search audit trail'**
  String get searchAuditTrail;

  /// No description provided for @noAuditEntries.
  ///
  /// In en, this message translates to:
  /// **'No audit entries'**
  String get noAuditEntries;

  /// No description provided for @auditTrailWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Audit trail entries will appear here'**
  String get auditTrailWillAppearHere;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @module.
  ///
  /// In en, this message translates to:
  /// **'Module'**
  String get module;

  /// No description provided for @entityId.
  ///
  /// In en, this message translates to:
  /// **'Entity ID'**
  String get entityId;

  /// No description provided for @action.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// No description provided for @filterAuditTrail.
  ///
  /// In en, this message translates to:
  /// **'Filter Audit Trail'**
  String get filterAuditTrail;

  /// No description provided for @dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get dateRange;

  /// No description provided for @filtersApplied.
  ///
  /// In en, this message translates to:
  /// **'Filters applied'**
  String get filtersApplied;

  /// No description provided for @auditEntryDetails.
  ///
  /// In en, this message translates to:
  /// **'Audit Entry Details'**
  String get auditEntryDetails;

  /// No description provided for @timestamp.
  ///
  /// In en, this message translates to:
  /// **'Timestamp'**
  String get timestamp;

  /// No description provided for @ipAddress.
  ///
  /// In en, this message translates to:
  /// **'IP Address'**
  String get ipAddress;

  /// No description provided for @changes.
  ///
  /// In en, this message translates to:
  /// **'Changes'**
  String get changes;

  /// No description provided for @enhancedCOAFeatures.
  ///
  /// In en, this message translates to:
  /// **'Enhanced COA Features'**
  String get enhancedCOAFeatures;

  /// No description provided for @accountStatements.
  ///
  /// In en, this message translates to:
  /// **'Account Statements'**
  String get accountStatements;

  /// No description provided for @openingBalances.
  ///
  /// In en, this message translates to:
  /// **'Opening Balances'**
  String get openingBalances;

  /// No description provided for @hierarchyManagement.
  ///
  /// In en, this message translates to:
  /// **'Hierarchy Management'**
  String get hierarchyManagement;

  /// No description provided for @documentTypesAndDescriptionCoding.
  ///
  /// In en, this message translates to:
  /// **'Document types and description coding'**
  String get documentTypesAndDescriptionCoding;

  /// No description provided for @createAndManageJournalVouchers.
  ///
  /// In en, this message translates to:
  /// **'Create and manage journal vouchers'**
  String get createAndManageJournalVouchers;

  /// No description provided for @managePaymentVouchers.
  ///
  /// In en, this message translates to:
  /// **'Manage payment vouchers'**
  String get managePaymentVouchers;

  /// No description provided for @manageReceiptVouchers.
  ///
  /// In en, this message translates to:
  /// **'Manage receipt vouchers'**
  String get manageReceiptVouchers;

  /// No description provided for @manageCashAndBankAccounts.
  ///
  /// In en, this message translates to:
  /// **'Manage cash and bank accounts'**
  String get manageCashAndBankAccounts;

  /// No description provided for @viewFinancialReportsAndStatements.
  ///
  /// In en, this message translates to:
  /// **'View financial reports and statements'**
  String get viewFinancialReportsAndStatements;

  /// No description provided for @manageTransactionRequests.
  ///
  /// In en, this message translates to:
  /// **'Manage transaction requests'**
  String get manageTransactionRequests;

  /// No description provided for @reviewPostAndClosePeriods.
  ///
  /// In en, this message translates to:
  /// **'Review, post and close periods'**
  String get reviewPostAndClosePeriods;

  /// No description provided for @inventorySetup.
  ///
  /// In en, this message translates to:
  /// **'Inventory Setup'**
  String get inventorySetup;

  /// No description provided for @inventoryVariables.
  ///
  /// In en, this message translates to:
  /// **'Inventory Variables'**
  String get inventoryVariables;

  /// No description provided for @warehouses.
  ///
  /// In en, this message translates to:
  /// **'Warehouses'**
  String get warehouses;

  /// No description provided for @itemGroups.
  ///
  /// In en, this message translates to:
  /// **'Item Groups'**
  String get itemGroups;

  /// No description provided for @defaultCostingMethod.
  ///
  /// In en, this message translates to:
  /// **'Default Costing Method'**
  String get defaultCostingMethod;

  /// No description provided for @allowItemLevelOverride.
  ///
  /// In en, this message translates to:
  /// **'Allow Item-Level Override'**
  String get allowItemLevelOverride;

  /// No description provided for @allowItemLevelOverrideDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow items to override the default costing method'**
  String get allowItemLevelOverrideDesc;

  /// No description provided for @enableMultipleWarehouses.
  ///
  /// In en, this message translates to:
  /// **'Enable Multiple Warehouses'**
  String get enableMultipleWarehouses;

  /// No description provided for @enableMultipleWarehousesDesc.
  ///
  /// In en, this message translates to:
  /// **'Enable management of multiple warehouse locations'**
  String get enableMultipleWarehousesDesc;

  /// No description provided for @enableExpiryDateTracking.
  ///
  /// In en, this message translates to:
  /// **'Enable Expiry Date Tracking'**
  String get enableExpiryDateTracking;

  /// No description provided for @enableExpiryDateTrackingDesc.
  ///
  /// In en, this message translates to:
  /// **'Track expiry dates for items'**
  String get enableExpiryDateTrackingDesc;

  /// No description provided for @enableBatchTracking.
  ///
  /// In en, this message translates to:
  /// **'Enable Batch Tracking'**
  String get enableBatchTracking;

  /// No description provided for @enableBatchTrackingDesc.
  ///
  /// In en, this message translates to:
  /// **'Track batch numbers for items'**
  String get enableBatchTrackingDesc;

  /// No description provided for @saveSettings.
  ///
  /// In en, this message translates to:
  /// **'Save Settings'**
  String get saveSettings;

  /// No description provided for @noWarehousesFound.
  ///
  /// In en, this message translates to:
  /// **'No Warehouses Found'**
  String get noWarehousesFound;

  /// No description provided for @addWarehouseToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Add a warehouse to get started'**
  String get addWarehouseToGetStarted;

  /// No description provided for @addWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Add Warehouse'**
  String get addWarehouse;

  /// No description provided for @editWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Edit Warehouse'**
  String get editWarehouse;

  /// No description provided for @warehouseCode.
  ///
  /// In en, this message translates to:
  /// **'Warehouse Code'**
  String get warehouseCode;

  /// No description provided for @inventoryAccount.
  ///
  /// In en, this message translates to:
  /// **'Inventory Account'**
  String get inventoryAccount;

  /// No description provided for @deleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Deleted successfully'**
  String get deleteSuccess;

  /// No description provided for @noItemGroupsFound.
  ///
  /// In en, this message translates to:
  /// **'No Item Groups Found'**
  String get noItemGroupsFound;

  /// No description provided for @addItemGroupToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Add an item group to get started'**
  String get addItemGroupToGetStarted;

  /// No description provided for @addItemGroup.
  ///
  /// In en, this message translates to:
  /// **'Add Item Group'**
  String get addItemGroup;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @noItemsFound.
  ///
  /// In en, this message translates to:
  /// **'No Items Found'**
  String get noItemsFound;

  /// No description provided for @addItemToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Add an item to get started'**
  String get addItemToGetStarted;

  /// No description provided for @addItem.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get addItem;

  /// No description provided for @editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit Item'**
  String get editItem;

  /// No description provided for @itemCode.
  ///
  /// In en, this message translates to:
  /// **'Item Code'**
  String get itemCode;

  /// No description provided for @barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcode;

  /// No description provided for @basicData.
  ///
  /// In en, this message translates to:
  /// **'Basic Data'**
  String get basicData;

  /// No description provided for @classification.
  ///
  /// In en, this message translates to:
  /// **'Classification'**
  String get classification;

  /// No description provided for @costAndPrices.
  ///
  /// In en, this message translates to:
  /// **'Cost & Prices'**
  String get costAndPrices;

  /// No description provided for @itemType.
  ///
  /// In en, this message translates to:
  /// **'Item Type'**
  String get itemType;

  /// No description provided for @itemGroup.
  ///
  /// In en, this message translates to:
  /// **'Item Group'**
  String get itemGroup;

  /// No description provided for @baseUnit.
  ///
  /// In en, this message translates to:
  /// **'Base Unit'**
  String get baseUnit;

  /// No description provided for @costPrice.
  ///
  /// In en, this message translates to:
  /// **'Cost Price'**
  String get costPrice;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get invalidNumber;

  /// No description provided for @openingStock.
  ///
  /// In en, this message translates to:
  /// **'Opening Stock'**
  String get openingStock;

  /// No description provided for @openingStockInfo.
  ///
  /// In en, this message translates to:
  /// **'Opening stock is a one-time operation to set initial inventory levels'**
  String get openingStockInfo;

  /// No description provided for @noOpeningStockEntries.
  ///
  /// In en, this message translates to:
  /// **'No opening stock entries'**
  String get noOpeningStockEntries;

  /// No description provided for @clickAddToStart.
  ///
  /// In en, this message translates to:
  /// **'Click add to start entering opening stock'**
  String get clickAddToStart;

  /// No description provided for @addEntry.
  ///
  /// In en, this message translates to:
  /// **'Add Entry'**
  String get addEntry;

  /// No description provided for @addOpeningStock.
  ///
  /// In en, this message translates to:
  /// **'Add Opening Stock'**
  String get addOpeningStock;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get item;

  /// No description provided for @warehouse.
  ///
  /// In en, this message translates to:
  /// **'Warehouse'**
  String get warehouse;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @unitCost.
  ///
  /// In en, this message translates to:
  /// **'Unit Cost'**
  String get unitCost;

  /// No description provided for @totalCost.
  ///
  /// In en, this message translates to:
  /// **'Total Cost'**
  String get totalCost;

  /// No description provided for @openingStockSaved.
  ///
  /// In en, this message translates to:
  /// **'Opening stock saved successfully'**
  String get openingStockSaved;

  /// No description provided for @stockOperations.
  ///
  /// In en, this message translates to:
  /// **'Stock Operations'**
  String get stockOperations;

  /// No description provided for @incomingStock.
  ///
  /// In en, this message translates to:
  /// **'Incoming Stock'**
  String get incomingStock;

  /// No description provided for @outgoingStock.
  ///
  /// In en, this message translates to:
  /// **'Outgoing Stock'**
  String get outgoingStock;

  /// No description provided for @transfers.
  ///
  /// In en, this message translates to:
  /// **'Transfers'**
  String get transfers;

  /// No description provided for @incomingStockOrders.
  ///
  /// In en, this message translates to:
  /// **'Incoming Stock Orders'**
  String get incomingStockOrders;

  /// No description provided for @outgoingStockOrders.
  ///
  /// In en, this message translates to:
  /// **'Outgoing Stock Orders'**
  String get outgoingStockOrders;

  /// No description provided for @warehouseTransfers.
  ///
  /// In en, this message translates to:
  /// **'Warehouse Transfers'**
  String get warehouseTransfers;

  /// No description provided for @manageIncomingStock.
  ///
  /// In en, this message translates to:
  /// **'Manage incoming stock orders'**
  String get manageIncomingStock;

  /// No description provided for @manageOutgoingStock.
  ///
  /// In en, this message translates to:
  /// **'Manage outgoing stock orders'**
  String get manageOutgoingStock;

  /// No description provided for @manageWarehouseTransfers.
  ///
  /// In en, this message translates to:
  /// **'Manage warehouse transfers'**
  String get manageWarehouseTransfers;

  /// No description provided for @createIncomingOrder.
  ///
  /// In en, this message translates to:
  /// **'Create Incoming Order'**
  String get createIncomingOrder;

  /// No description provided for @createOutgoingOrder.
  ///
  /// In en, this message translates to:
  /// **'Create Outgoing Order'**
  String get createOutgoingOrder;

  /// No description provided for @createTransfer.
  ///
  /// In en, this message translates to:
  /// **'Create Transfer'**
  String get createTransfer;

  /// No description provided for @inventoryControl.
  ///
  /// In en, this message translates to:
  /// **'Inventory Control'**
  String get inventoryControl;

  /// No description provided for @stocktaking.
  ///
  /// In en, this message translates to:
  /// **'Stocktaking'**
  String get stocktaking;

  /// No description provided for @reservations.
  ///
  /// In en, this message translates to:
  /// **'Reservations'**
  String get reservations;

  /// No description provided for @stocktakingSessions.
  ///
  /// In en, this message translates to:
  /// **'Stocktaking Sessions'**
  String get stocktakingSessions;

  /// No description provided for @stockReservations.
  ///
  /// In en, this message translates to:
  /// **'Stock Reservations'**
  String get stockReservations;

  /// No description provided for @manageStocktaking.
  ///
  /// In en, this message translates to:
  /// **'Manage physical inventory counts and adjustments'**
  String get manageStocktaking;

  /// No description provided for @manageReservations.
  ///
  /// In en, this message translates to:
  /// **'Reserve stock for specific purposes'**
  String get manageReservations;

  /// No description provided for @startStocktaking.
  ///
  /// In en, this message translates to:
  /// **'Start Stocktaking'**
  String get startStocktaking;

  /// No description provided for @createReservation.
  ///
  /// In en, this message translates to:
  /// **'Create Reservation'**
  String get createReservation;

  /// No description provided for @stocktakingInfo.
  ///
  /// In en, this message translates to:
  /// **'Stocktaking compares physical counts with system records and adjusts discrepancies'**
  String get stocktakingInfo;

  /// No description provided for @reservationInfo.
  ///
  /// In en, this message translates to:
  /// **'Reservations prevent allocated stock from being used elsewhere'**
  String get reservationInfo;

  /// No description provided for @inventoryReports.
  ///
  /// In en, this message translates to:
  /// **'Inventory Reports'**
  String get inventoryReports;

  /// No description provided for @inventoryBalancesReport.
  ///
  /// In en, this message translates to:
  /// **'Inventory Balances Report'**
  String get inventoryBalancesReport;

  /// No description provided for @inventoryBalancesReportDesc.
  ///
  /// In en, this message translates to:
  /// **'Current stock levels and values'**
  String get inventoryBalancesReportDesc;

  /// No description provided for @itemTransactionReport.
  ///
  /// In en, this message translates to:
  /// **'Item Transaction Report'**
  String get itemTransactionReport;

  /// No description provided for @itemTransactionReportDesc.
  ///
  /// In en, this message translates to:
  /// **'Detailed movement history for items'**
  String get itemTransactionReportDesc;

  /// No description provided for @inventoryValuationReport.
  ///
  /// In en, this message translates to:
  /// **'Inventory Valuation Report'**
  String get inventoryValuationReport;

  /// No description provided for @inventoryValuationReportDesc.
  ///
  /// In en, this message translates to:
  /// **'Financial summary of inventory value'**
  String get inventoryValuationReportDesc;

  /// No description provided for @staleInventoryReport.
  ///
  /// In en, this message translates to:
  /// **'Stale Inventory Report'**
  String get staleInventoryReport;

  /// No description provided for @staleInventoryReportDesc.
  ///
  /// In en, this message translates to:
  /// **'Non-moving items for obsolescence management'**
  String get staleInventoryReportDesc;

  /// No description provided for @lowStockReport.
  ///
  /// In en, this message translates to:
  /// **'Low Stock Report'**
  String get lowStockReport;

  /// No description provided for @lowStockReportDesc.
  ///
  /// In en, this message translates to:
  /// **'Items below reorder level'**
  String get lowStockReportDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
