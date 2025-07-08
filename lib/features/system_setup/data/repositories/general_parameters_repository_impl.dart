import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/general_parameters_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/general_parameters_repository.dart';

class GeneralParametersRepositoryImpl implements GeneralParametersRepository {
  final GeneralParametersLocalDataSource localDataSource;
  final AppDatabase db;

  GeneralParametersRepositoryImpl(this.localDataSource, this.db);

  @override
  Future<GeneralParametersEntity> getGeneralParameters() async {
    final data = await localDataSource.getGeneralParameters();
    if (data == null) {
      // Return default values if no configuration exists yet
      return GeneralParametersEntity.defaults();
    }

    // Map from SystemConfigData (Drift) to GeneralParametersEntity
    return _mapDataToEntity(data);
  }

  @override
  Future<void> saveGeneralParameters(GeneralParametersEntity params) async {
    // Business rule: Check if accounts exist before changing account number settings
    final currentParams = await getGeneralParameters();
    if (params.accountNumberLength != currentParams.accountNumberLength ||
        params.accountNumberType != currentParams.accountNumberType) {
      final accountsCount = await (db.select(db.accounts)..limit(1)).get();
      if (accountsCount.isNotEmpty) {
        throw Exception(
            'Cannot change account number settings when accounts exist.');
      }
    }

    final companion = _mapEntityToCompanion(params);
    return localDataSource.saveGeneralParameters(companion);
  }

  // --- Mapping Helper Methods --- //

  GeneralParametersEntity _mapDataToEntity(SystemConfigData data) {
    return GeneralParametersEntity(
      language: _mapStringToLanguageOption(data.language),
      dateFormat: _mapStringToDateFormatOption(data.dateFormat),
      calendarType: _mapStringToCalendarTypeOption(data.calendarType),
      accountNumberType:
          _mapStringToAccountNumberTypeOption(data.accountNumberType),
      accountNumberLength: data.accountNumberLength,
      costCenterPolicy: _mapStringToPolicyOption(data.costCenterPolicy),
      projectPolicy: _mapStringToPolicyOption(data.projectPolicy),
      passwordMinLength: data.passwordMinLength,
      autoLockTimeout: data.autoLockTimeout,
      useVAT: data.useVat,
      useTDS: data.useTds,
      useEInvoice: data.useEInvoice,
      priceIncludesTax: data.priceIncludesTax,
      backupFrequency: _mapStringToBackupFrequencyOption(data.backupFrequency),
      cloudBackup: data.cloudBackup,
      uiTheme: _mapStringToUIThemeOption(data.uiTheme),
      fontSize: _mapStringToFontSizeOption(data.fontSize),
    );
  }

  SystemConfigCompanion _mapEntityToCompanion(GeneralParametersEntity params) {
    return SystemConfigCompanion(
      id: const Value(1), // Assuming a single row for system config
      language: Value(_mapLanguageOptionToString(params.language)),
      dateFormat: Value(_mapDateFormatOptionToString(params.dateFormat)),
      calendarType: Value(_mapCalendarTypeOptionToString(params.calendarType)),
      accountNumberType:
          Value(_mapAccountNumberTypeOptionToString(params.accountNumberType)),
      accountNumberLength: Value(params.accountNumberLength),
      costCenterPolicy: Value(_mapPolicyOptionToString(params.costCenterPolicy)),
      projectPolicy: Value(_mapPolicyOptionToString(params.projectPolicy)),
      passwordMinLength: Value(params.passwordMinLength),
      autoLockTimeout: Value(params.autoLockTimeout),
      useVat: Value(params.useVAT),
      useTds: Value(params.useTDS),
      useEInvoice: Value(params.useEInvoice),
      priceIncludesTax: Value(params.priceIncludesTax),
      backupFrequency:
          Value(_mapBackupFrequencyOptionToString(params.backupFrequency)),
      cloudBackup: Value(params.cloudBackup),
      uiTheme: Value(_mapUIThemeOptionToString(params.uiTheme)),
      fontSize: Value(_mapFontSizeOptionToString(params.fontSize)),
    );
  }

  LanguageOption _mapStringToLanguageOption(String value) {
    return LanguageOption.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => LanguageOption.english);
  }

  String _mapLanguageOptionToString(LanguageOption option) {
    return option.toString().split('.').last;
  }

  DateFormatOption _mapStringToDateFormatOption(String value) {
    return DateFormatOption.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => DateFormatOption.ddMMyyyy);
  }

  String _mapDateFormatOptionToString(DateFormatOption option) {
    return option.toString().split('.').last;
  }

  CalendarTypeOption _mapStringToCalendarTypeOption(String value) {
    return CalendarTypeOption.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => CalendarTypeOption.gregorian);
  }

  String _mapCalendarTypeOptionToString(CalendarTypeOption option) {
    return option.toString().split('.').last;
  }

  AccountNumberTypeOption _mapStringToAccountNumberTypeOption(String value) {
    return AccountNumberTypeOption.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => AccountNumberTypeOption.numeric);
  }

  String _mapAccountNumberTypeOptionToString(AccountNumberTypeOption option) {
    return option.toString().split('.').last;
  }

  PolicyOption _mapStringToPolicyOption(String value) {
    return PolicyOption.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => PolicyOption.optional);
  }

  String _mapPolicyOptionToString(PolicyOption option) {
    return option.toString().split('.').last;
  }

  BackupFrequencyOption _mapStringToBackupFrequencyOption(String value) {
    return BackupFrequencyOption.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => BackupFrequencyOption.weekly);
  }

  String _mapBackupFrequencyOptionToString(BackupFrequencyOption option) {
    return option.toString().split('.').last;
  }

  UIThemeOption _mapStringToUIThemeOption(String value) {
    return UIThemeOption.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => UIThemeOption.light);
  }

  String _mapUIThemeOptionToString(UIThemeOption option) {
    return option.toString().split('.').last;
  }

  FontSizeOption _mapStringToFontSizeOption(String value) {
    return FontSizeOption.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => FontSizeOption.medium);
  }

  String _mapFontSizeOptionToString(FontSizeOption option) {
    return option.toString().split('.').last;
  }
}
