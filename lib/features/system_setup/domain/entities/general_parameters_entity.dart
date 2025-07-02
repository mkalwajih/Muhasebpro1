import 'package:equatable/equatable.dart';

enum LanguageOption { arabic, english }
enum DateFormatOption { ddMMyyyy, mmddyyyy, yyyyMMdd }
enum CalendarTypeOption { gregorian, hijri, both }
enum AccountNumberTypeOption { numeric, alphanumeric }
enum PolicyOption { notUsed, optional, mandatory }
enum BackupFrequencyOption { daily, weekly, monthly }
enum UIThemeOption { light, dark }
enum FontSizeOption { small, medium, large }

class GeneralParametersEntity extends Equatable {
  final LanguageOption language;
  final DateFormatOption dateFormat;
  final CalendarTypeOption calendarType;
  final AccountNumberTypeOption accountNumberType;
  final int accountNumberLength;
  final PolicyOption costCenterPolicy;
  final PolicyOption projectPolicy;
  final int passwordMinLength;
  final int autoLockTimeout;
  final bool useVAT;
  final bool useTDS;
  final bool useEInvoice;
  final bool priceIncludesTax;
  final BackupFrequencyOption backupFrequency;
  final bool cloudBackup;
  final UIThemeOption uiTheme;
  final FontSizeOption fontSize;

  const GeneralParametersEntity({
    required this.language,
    required this.dateFormat,
    required this.calendarType,
    required this.accountNumberType,
    required this.accountNumberLength,
    required this.costCenterPolicy,
    required this.projectPolicy,
    required this.passwordMinLength,
    required this.autoLockTimeout,
    required this.useVAT,
    required this.useTDS,
    required this.useEInvoice,
    required this.priceIncludesTax,
    required this.backupFrequency,
    required this.cloudBackup,
    required this.uiTheme,
    required this.fontSize,
  });

  // Default values constructor
  factory GeneralParametersEntity.defaults() => const GeneralParametersEntity(
        language: LanguageOption.english,
        dateFormat: DateFormatOption.ddMMyyyy,
        calendarType: CalendarTypeOption.gregorian,
        accountNumberType: AccountNumberTypeOption.numeric,
        accountNumberLength: 8,
        costCenterPolicy: PolicyOption.optional,
        projectPolicy: PolicyOption.optional,
        passwordMinLength: 8,
        autoLockTimeout: 15,
        useVAT: false,
        useTDS: false,
        useEInvoice: false,
        priceIncludesTax: false,
        backupFrequency: BackupFrequencyOption.weekly,
        cloudBackup: false,
        uiTheme: UIThemeOption.light,
        fontSize: FontSizeOption.medium,
      );

  @override
  List<Object?> get props => [
        language,
        dateFormat,
        calendarType,
        accountNumberType,
        accountNumberLength,
        costCenterPolicy,
        projectPolicy,
        passwordMinLength,
        autoLockTimeout,
        useVAT,
        useTDS,
        useEInvoice,
        priceIncludesTax,
        backupFrequency,
        cloudBackup,
        uiTheme,
        fontSize,
      ];
}
