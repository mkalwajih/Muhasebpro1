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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
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

  /// No description provided for @muhasebPro.
  ///
  /// In en, this message translates to:
  /// **'MuhasebPro'**
  String get muhasebPro;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @usernameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get usernameHint;

  /// No description provided for @usernameRequired.
  ///
  /// In en, this message translates to:
  /// **'Username is required'**
  String get usernameRequired;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login Failed'**
  String get loginFailed;

  /// No description provided for @invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid username or password.'**
  String get invalidCredentials;

  /// No description provided for @anErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get anErrorOccurred;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

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
  /// **'Inventory Management'**
  String get inventory;

  /// No description provided for @vendors.
  ///
  /// In en, this message translates to:
  /// **'Vendors & Purchases'**
  String get vendors;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers & Sales'**
  String get customers;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports & Analytics'**
  String get reports;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// No description provided for @featureUnderDevelopment.
  ///
  /// In en, this message translates to:
  /// **'This feature is currently under development.'**
  String get featureUnderDevelopment;

  /// No description provided for @companyInfo.
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get companyInfo;

  /// No description provided for @branches.
  ///
  /// In en, this message translates to:
  /// **'Branches'**
  String get branches;

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

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @taxNumber.
  ///
  /// In en, this message translates to:
  /// **'Tax Number'**
  String get taxNumber;

  /// No description provided for @commercialRegNo.
  ///
  /// In en, this message translates to:
  /// **'Commercial Reg. No.'**
  String get commercialRegNo;

  /// No description provided for @remarks.
  ///
  /// In en, this message translates to:
  /// **'Remarks'**
  String get remarks;

  /// No description provided for @isMainCompany.
  ///
  /// In en, this message translates to:
  /// **'Is Main Company'**
  String get isMainCompany;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @saveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Information saved successfully.'**
  String get saveSuccess;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save information.'**
  String get saveFailed;

  /// No description provided for @chartOfAccounts.
  ///
  /// In en, this message translates to:
  /// **'Chart of Accounts'**
  String get chartOfAccounts;

  /// No description provided for @accountCode.
  ///
  /// In en, this message translates to:
  /// **'Account Code'**
  String get accountCode;

  /// No description provided for @accountName.
  ///
  /// In en, this message translates to:
  /// **'Account Name'**
  String get accountName;

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

  /// No description provided for @parentAccount.
  ///
  /// In en, this message translates to:
  /// **'Parent Account'**
  String get parentAccount;

  /// No description provided for @accountType.
  ///
  /// In en, this message translates to:
  /// **'Account Type'**
  String get accountType;

  /// No description provided for @header.
  ///
  /// In en, this message translates to:
  /// **'Header'**
  String get header;

  /// No description provided for @transactional.
  ///
  /// In en, this message translates to:
  /// **'Transactional'**
  String get transactional;

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

  /// No description provided for @noParent.
  ///
  /// In en, this message translates to:
  /// **'No Parent (Root)'**
  String get noParent;

  /// No description provided for @selectParent.
  ///
  /// In en, this message translates to:
  /// **'Select Parent Account'**
  String get selectParent;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @nature.
  ///
  /// In en, this message translates to:
  /// **'Nature'**
  String get nature;

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

  /// No description provided for @reportType.
  ///
  /// In en, this message translates to:
  /// **'Report Type'**
  String get reportType;

  /// No description provided for @balanceSheet.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet'**
  String get balanceSheet;

  /// No description provided for @incomeStatement.
  ///
  /// In en, this message translates to:
  /// **'Income Statement'**
  String get incomeStatement;

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

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @bank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get bank;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @vendor.
  ///
  /// In en, this message translates to:
  /// **'Vendor'**
  String get vendor;

  /// No description provided for @employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get employee;

  /// No description provided for @otherDebit.
  ///
  /// In en, this message translates to:
  /// **'Other Debit'**
  String get otherDebit;

  /// No description provided for @otherCredit.
  ///
  /// In en, this message translates to:
  /// **'Other Credit'**
  String get otherCredit;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @operating.
  ///
  /// In en, this message translates to:
  /// **'Operating'**
  String get operating;

  /// No description provided for @investing.
  ///
  /// In en, this message translates to:
  /// **'Investing'**
  String get investing;

  /// No description provided for @financing.
  ///
  /// In en, this message translates to:
  /// **'Financing'**
  String get financing;

  /// No description provided for @userManagement.
  ///
  /// In en, this message translates to:
  /// **'User Management'**
  String get userManagement;

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

  /// No description provided for @fullNameAr.
  ///
  /// In en, this message translates to:
  /// **'Full Name (Arabic)'**
  String get fullNameAr;

  /// No description provided for @fullNameEn.
  ///
  /// In en, this message translates to:
  /// **'Full Name (English)'**
  String get fullNameEn;

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

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatch;

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

  /// No description provided for @roleNameAr.
  ///
  /// In en, this message translates to:
  /// **'Role Name (Arabic)'**
  String get roleNameAr;

  /// No description provided for @roleNameEn.
  ///
  /// In en, this message translates to:
  /// **'Role Name (English)'**
  String get roleNameEn;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @generalParameters.
  ///
  /// In en, this message translates to:
  /// **'General Parameters'**
  String get generalParameters;

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

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password Min Length'**
  String get passwordMinLength;

  /// No description provided for @autoLockTimeout.
  ///
  /// In en, this message translates to:
  /// **'Auto-Lock Timeout (Minutes)'**
  String get autoLockTimeout;

  /// No description provided for @useVAT.
  ///
  /// In en, this message translates to:
  /// **'Use VAT'**
  String get useVAT;

  /// No description provided for @useTDS.
  ///
  /// In en, this message translates to:
  /// **'Use Tax Deduction at Source'**
  String get useTDS;

  /// No description provided for @useEInvoice.
  ///
  /// In en, this message translates to:
  /// **'Use Electronic Invoice'**
  String get useEInvoice;

  /// No description provided for @priceIncludesTax.
  ///
  /// In en, this message translates to:
  /// **'Price Includes Sales Tax'**
  String get priceIncludesTax;

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

  /// No description provided for @uiTheme.
  ///
  /// In en, this message translates to:
  /// **'UI Theme'**
  String get uiTheme;

  /// No description provided for @fontSize.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get fontSize;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @gregorian.
  ///
  /// In en, this message translates to:
  /// **'Gregorian'**
  String get gregorian;

  /// No description provided for @hijri.
  ///
  /// In en, this message translates to:
  /// **'Hijri'**
  String get hijri;

  /// No description provided for @both.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get both;

  /// No description provided for @numeric.
  ///
  /// In en, this message translates to:
  /// **'Numeric'**
  String get numeric;

  /// No description provided for @alphanumeric.
  ///
  /// In en, this message translates to:
  /// **'Alphanumeric'**
  String get alphanumeric;

  /// No description provided for @notUsed.
  ///
  /// In en, this message translates to:
  /// **'Not Used'**
  String get notUsed;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @mandatory.
  ///
  /// In en, this message translates to:
  /// **'Mandatory'**
  String get mandatory;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @small.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get small;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @large.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get large;

  /// No description provided for @resetToDefaults.
  ///
  /// In en, this message translates to:
  /// **'Reset to Defaults'**
  String get resetToDefaults;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @invalidLengthRange.
  ///
  /// In en, this message translates to:
  /// **'Value must be between {min} and {max} characters'**
  String invalidLengthRange(Object min, Object max);

  /// No description provided for @invalidRange.
  ///
  /// In en, this message translates to:
  /// **'Value must be between {min} and {max}'**
  String invalidRange(Object min, Object max);

  /// No description provided for @resetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Defaults have been reset successfully.'**
  String get resetSuccess;

  /// No description provided for @resetFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to reset defaults.'**
  String get resetFailed;

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

  /// No description provided for @addNew.
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get addNew;

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

  /// No description provided for @zoneCode.
  ///
  /// In en, this message translates to:
  /// **'Zone Code'**
  String get zoneCode;

  /// No description provided for @zoneNameAr.
  ///
  /// In en, this message translates to:
  /// **'Zone Name (Arabic)'**
  String get zoneNameAr;

  /// No description provided for @zoneNameEn.
  ///
  /// In en, this message translates to:
  /// **'Zone Name (English)'**
  String get zoneNameEn;

  /// No description provided for @selectZonePrompt.
  ///
  /// In en, this message translates to:
  /// **'Select a zone to view its countries.'**
  String get selectZonePrompt;

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

  /// No description provided for @countryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get countryCode;

  /// No description provided for @countryNameAr.
  ///
  /// In en, this message translates to:
  /// **'Country Name (Arabic)'**
  String get countryNameAr;

  /// No description provided for @countryNameEn.
  ///
  /// In en, this message translates to:
  /// **'Country Name (English)'**
  String get countryNameEn;

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

  /// No description provided for @selectCountryPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select a country to view its governorates.'**
  String get selectCountryPrompt;

  /// No description provided for @selectParentPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select Parent'**
  String get selectParentPrompt;

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

  /// No description provided for @deleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Delete Failed'**
  String get deleteFailed;

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

  /// No description provided for @currencyCode.
  ///
  /// In en, this message translates to:
  /// **'Currency Code'**
  String get currencyCode;

  /// No description provided for @currencyNameAr.
  ///
  /// In en, this message translates to:
  /// **'Currency Name (Arabic)'**
  String get currencyNameAr;

  /// No description provided for @currencyNameEn.
  ///
  /// In en, this message translates to:
  /// **'Currency Name (English)'**
  String get currencyNameEn;

  /// No description provided for @fractionNameAr.
  ///
  /// In en, this message translates to:
  /// **'Fraction Name (Arabic)'**
  String get fractionNameAr;

  /// No description provided for @fractionNameEn.
  ///
  /// In en, this message translates to:
  /// **'Fraction Name (English)'**
  String get fractionNameEn;

  /// No description provided for @exchangeRate.
  ///
  /// In en, this message translates to:
  /// **'Exchange Rate'**
  String get exchangeRate;

  /// No description provided for @isBaseCurrency.
  ///
  /// In en, this message translates to:
  /// **'Base Currency'**
  String get isBaseCurrency;

  /// No description provided for @decimalPlaces.
  ///
  /// In en, this message translates to:
  /// **'Decimal Places'**
  String get decimalPlaces;

  /// No description provided for @minRateLimit.
  ///
  /// In en, this message translates to:
  /// **'Min Exchange Rate'**
  String get minRateLimit;

  /// No description provided for @maxRateLimit.
  ///
  /// In en, this message translates to:
  /// **'Max Exchange Rate'**
  String get maxRateLimit;

  /// No description provided for @denominations.
  ///
  /// In en, this message translates to:
  /// **'Denominations'**
  String get denominations;

  /// No description provided for @denominationValue.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get denominationValue;

  /// No description provided for @denominationNameAr.
  ///
  /// In en, this message translates to:
  /// **'Name (Arabic)'**
  String get denominationNameAr;

  /// No description provided for @denominationNameEn.
  ///
  /// In en, this message translates to:
  /// **'Name (English)'**
  String get denominationNameEn;

  /// No description provided for @denominationType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get denominationType;

  /// No description provided for @banknote.
  ///
  /// In en, this message translates to:
  /// **'Banknote'**
  String get banknote;

  /// No description provided for @coin.
  ///
  /// In en, this message translates to:
  /// **'Coin'**
  String get coin;

  /// No description provided for @selectCurrencyPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select a currency to view its details and denominations.'**
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

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @baseCurrency.
  ///
  /// In en, this message translates to:
  /// **'Base Currency'**
  String get baseCurrency;

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
  /// **'Calculation Methods'**
  String get taxCalculationMethods;

  /// No description provided for @addNewTaxBracket.
  ///
  /// In en, this message translates to:
  /// **'Add New Tax Bracket'**
  String get addNewTaxBracket;

  /// No description provided for @editTaxBracket.
  ///
  /// In en, this message translates to:
  /// **'Edit Tax Bracket'**
  String get editTaxBracket;

  /// No description provided for @bracketCode.
  ///
  /// In en, this message translates to:
  /// **'Bracket Code'**
  String get bracketCode;

  /// No description provided for @taxRate.
  ///
  /// In en, this message translates to:
  /// **'Tax Rate (%)'**
  String get taxRate;

  /// No description provided for @isDefault.
  ///
  /// In en, this message translates to:
  /// **'Is Default'**
  String get isDefault;

  /// No description provided for @addNewTaxType.
  ///
  /// In en, this message translates to:
  /// **'Add New Tax Type'**
  String get addNewTaxType;

  /// No description provided for @editTaxType.
  ///
  /// In en, this message translates to:
  /// **'Edit Tax Type'**
  String get editTaxType;

  /// No description provided for @typeCode.
  ///
  /// In en, this message translates to:
  /// **'Type Code'**
  String get typeCode;

  /// No description provided for @calcMethod.
  ///
  /// In en, this message translates to:
  /// **'Calculation Method'**
  String get calcMethod;

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

  /// No description provided for @addNewTaxCalculationMethod.
  ///
  /// In en, this message translates to:
  /// **'Add New Calc Method'**
  String get addNewTaxCalculationMethod;

  /// No description provided for @editTaxCalculationMethod.
  ///
  /// In en, this message translates to:
  /// **'Edit Calc Method'**
  String get editTaxCalculationMethod;

  /// No description provided for @methodCode.
  ///
  /// In en, this message translates to:
  /// **'Method Code'**
  String get methodCode;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @taxable.
  ///
  /// In en, this message translates to:
  /// **'Taxable'**
  String get taxable;

  /// No description provided for @exempted.
  ///
  /// In en, this message translates to:
  /// **'Exempted'**
  String get exempted;

  /// No description provided for @zeroTax.
  ///
  /// In en, this message translates to:
  /// **'Zero Tax'**
  String get zeroTax;

  /// No description provided for @calculationMethod.
  ///
  /// In en, this message translates to:
  /// **'Calculation Method'**
  String get calculationMethod;

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
  /// **'Cannot change account number settings when accounts exist.'**
  String get cannotChangeAccountSettings;

  /// No description provided for @branchCode.
  ///
  /// In en, this message translates to:
  /// **'Branch Code'**
  String get branchCode;

  /// No description provided for @branchNameAr.
  ///
  /// In en, this message translates to:
  /// **'Branch Name (Arabic)'**
  String get branchNameAr;

  /// No description provided for @branchNameEn.
  ///
  /// In en, this message translates to:
  /// **'Branch Name (English)'**
  String get branchNameEn;

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

  /// No description provided for @branchStatus.
  ///
  /// In en, this message translates to:
  /// **'Branch Status'**
  String get branchStatus;

  /// No description provided for @logo.
  ///
  /// In en, this message translates to:
  /// **'Logo'**
  String get logo;

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

  /// No description provided for @deleteBranch.
  ///
  /// In en, this message translates to:
  /// **'Delete Branch'**
  String get deleteBranch;

  /// No description provided for @deleteBranchConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this branch?'**
  String get deleteBranchConfirm;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deactivateBranchConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deactivation'**
  String get deactivateBranchConfirmationTitle;

  /// No description provided for @deactivateBranchConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to deactivate this branch? Deactivated branches will not be available for new transactions.'**
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

  /// No description provided for @cloudBackupHint.
  ///
  /// In en, this message translates to:
  /// **'Enables synchronization of data to cloud storage (e.g., Firebase, Google Drive).'**
  String get cloudBackupHint;

  /// No description provided for @inMinutes.
  ///
  /// In en, this message translates to:
  /// **'(in minutes)'**
  String get inMinutes;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

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

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @confirmReset.
  ///
  /// In en, this message translates to:
  /// **'Confirm Reset'**
  String get confirmReset;

  /// No description provided for @confirmResetMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset all general parameters to their default values? This action cannot be undone.'**
  String get confirmResetMessage;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
