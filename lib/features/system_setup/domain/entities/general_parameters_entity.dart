enum LanguageOption { arabic, english }
enum DateFormatOption { ddMMyyyy, mmDDyyyy, yyyyMMdd }
enum CalendarTypeOption { gregorian, hijri, both }
enum AccountNumberTypeOption { numeric, alphanumeric }
enum PolicyOption { notUsed, optional, mandatory }
enum BackupFrequencyOption { daily, weekly, monthly }
enum UIThemeOption { light, dark }
enum FontSizeOption { small, medium, large }

class GeneralParametersEntity {
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

  GeneralParametersEntity({
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

  factory GeneralParametersEntity.defaults() => GeneralParametersEntity(
        language: LanguageOption.arabic,
        dateFormat: DateFormatOption.ddMMyyyy,
        calendarType: CalendarTypeOption.gregorian,
        accountNumberType: AccountNumberTypeOption.numeric,
        accountNumberLength: 10,
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

  GeneralParametersEntity copyWith({
    LanguageOption? language,
    DateFormatOption? dateFormat,
    CalendarTypeOption? calendarType,
    AccountNumberTypeOption? accountNumberType,
    int? accountNumberLength,
    PolicyOption? costCenterPolicy,
    PolicyOption? projectPolicy,
    int? passwordMinLength,
    int? autoLockTimeout,
    bool? useVAT,
    bool? useTDS,
    bool? useEInvoice,
    bool? priceIncludesTax,
    BackupFrequencyOption? backupFrequency,
    bool? cloudBackup,
    UIThemeOption? uiTheme,
    FontSizeOption? fontSize,
  }) {
    return GeneralParametersEntity(
      language: language ?? this.language,
      dateFormat: dateFormat ?? this.dateFormat,
      calendarType: calendarType ?? this.calendarType,
      accountNumberType: accountNumberType ?? this.accountNumberType,
      accountNumberLength: accountNumberLength ?? this.accountNumberLength,
      costCenterPolicy: costCenterPolicy ?? this.costCenterPolicy,
      projectPolicy: projectPolicy ?? this.projectPolicy,
      passwordMinLength: passwordMinLength ?? this.passwordMinLength,
      autoLockTimeout: autoLockTimeout ?? this.autoLockTimeout,
      useVAT: useVAT ?? this.useVAT,
      useTDS: useTDS ?? this.useTDS,
      useEInvoice: useEInvoice ?? this.useEInvoice,
      priceIncludesTax: priceIncludesTax ?? this.priceIncludesTax,
      backupFrequency: backupFrequency ?? this.backupFrequency,
      cloudBackup: cloudBackup ?? this.cloudBackup,
      uiTheme: uiTheme ?? this.uiTheme,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
