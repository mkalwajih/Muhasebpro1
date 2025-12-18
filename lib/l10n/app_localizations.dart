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
  /// **'Deletion Failed'**
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
