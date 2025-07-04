import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/general_parameters_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/general_parameters_repository.dart';

class GeneralParametersRepositoryImpl implements GeneralParametersRepository {
  final GeneralParametersLocalDataSource localDataSource;

  GeneralParametersRepositoryImpl(this.localDataSource);

  @override
  Future<GeneralParametersEntity> getGeneralParameters() async {
    final data = await localDataSource.getGeneralParameters();
    if (data == null) {
      // Return default values if no configuration exists yet
      return GeneralParametersEntity.defaults();
    }

    // Map from SystemConfigData (Drift) to GeneralParametersEntity
    return GeneralParametersEntity(
      language: _mapStringToLanguageOption(data.language),
      dateFormat: _mapStringToDateFormatOption(data.date_format),
      calendarType: _mapStringToCalendarTypeOption(data.calendar_type),
      accountNumberType: _mapStringToAccountNumberTypeOption(data.account_number_type),
      accountNumberLength: data.account_number_length,
      costCenterPolicy: _mapStringToPolicyOption(data.cost_center_policy),
      projectPolicy: _mapStringToPolicyOption(data.project_policy),
      passwordMinLength: data.password_min_length,
      autoLockTimeout: data.auto_lock_timeout,
      useVAT: data.use_vat,
      useTDS: data.use_tds,
      useEInvoice: data.use_e_invoice,
      priceIncludesTax: data.price_includes_tax,
      backupFrequency: _mapStringToBackupFrequencyOption(data.backup_frequency),
      cloudBackup: data.cloud_backup,
      uiTheme: _mapStringToUIThemeOption(data.ui_theme),
      fontSize: _mapStringToFontSizeOption(data.font_size),
    );
  }

  @override
  Future<void> saveGeneralParameters(GeneralParametersEntity params) {
    // Map from GeneralParametersEntity to SystemConfigCompanion (Drift)
    final companion = SystemConfigCompanion(
      id: const Value(1), // Assuming a single row for system config
      language: Value(_mapLanguageOptionToString(params.language)),
      date_format: Value(_mapDateFormatOptionToString(params.dateFormat)),
      calendar_type: Value(_mapCalendarTypeOptionToString(params.calendarType)),
      account_number_type: Value(_mapAccountNumberTypeOptionToString(params.accountNumberType)),
      account_number_length: Value(params.accountNumberLength),
      cost_center_policy: Value(_mapPolicyOptionToString(params.costCenterPolicy)),
      project_policy: Value(_mapPolicyOptionToString(params.projectPolicy)),
      password_min_length: Value(params.passwordMinLength),
      auto_lock_timeout: Value(params.autoLockTimeout),
      use_vat: Value(params.useVAT),
      use_tds: Value(params.useTDS),
      use_e_invoice: Value(params.useEInvoice),
      price_includes_tax: Value(params.priceIncludesTax),
      backup_frequency: Value(_mapBackupFrequencyOptionToString(params.backupFrequency)),
      cloud_backup: Value(params.cloudBackup),
      ui_theme: Value(_mapUIThemeOptionToString(params.uiTheme)),
      font_size: Value(_mapFontSizeOptionToString(params.fontSize)),
    );
    return localDataSource.saveGeneralParameters(companion);
  }

  // --- Mapping Helper Methods --- //

  LanguageOption _mapStringToLanguageOption(String value) {
    return LanguageOption.values.firstWhere(
      (e) => e.toString().split('.').last == value,orElse: () => LanguageOption.english);
  }

  String _mapLanguageOptionToString(LanguageOption option) {
    return option.toString().split('.').last;
  }

  DateFormatOption _mapStringToDateFormatOption(String value) {
    return DateFormatOption.values.firstWhere(
      (e) => e.toString().split('.').last == value,orElse: () => DateFormatOption.ddMMyyyy);
  }

  String _mapDateFormatOptionToString(DateFormatOption option) {
    return option.toString().split('.').last;
  }

  CalendarTypeOption _mapStringToCalendarTypeOption(String value) {
    return CalendarTypeOption.values.firstWhere(
      (e) => e.toString().split('.').last == value,orElse: () => CalendarTypeOption.gregorian);
  }

  String _mapCalendarTypeOptionToString(CalendarTypeOption option) {
    return option.toString().split('.').last;
  }

  AccountNumberTypeOption _mapStringToAccountNumberTypeOption(String value) {
    return AccountNumberTypeOption.values.firstWhere(
      (e) => e.toString().split('.').last == value,orElse: () => AccountNumberTypeOption.numeric);
  }

  String _mapAccountNumberTypeOptionToString(AccountNumberTypeOption option) {
    return option.toString().split('.').last;
  }

  PolicyOption _mapStringToPolicyOption(String value) {
    return PolicyOption.values.firstWhere(
      (e) => e.toString().split('.').last == value,orElse: () => PolicyOption.optional);
  }

  String _mapPolicyOptionToString(PolicyOption option) {
    return option.toString().split('.').last;
  }

  BackupFrequencyOption _mapStringToBackupFrequencyOption(String value) {
    return BackupFrequencyOption.values.firstWhere(
      (e) => e.toString().split('.').last == value,orElse: () => BackupFrequencyOption.weekly);
  }

  String _mapBackupFrequencyOptionToString(BackupFrequencyOption option) {
    return option.toString().split('.').last;
  }

  UIThemeOption _mapStringToUIThemeOption(String value) {
    return UIThemeOption.values.firstWhere(
      (e) => e.toString().split('.').last == value,orElse: () => UIThemeOption.light);
  }

  String _mapUIThemeOptionToString(UIThemeOption option) {
    return option.toString().split('.').last;
  }

  FontSizeOption _mapStringToFontSizeOption(String value) {
    return FontSizeOption.values.firstWhere(
      (e) => e.toString().split('.').last == value,orElse: () => FontSizeOption.medium);
  }

  String _mapFontSizeOptionToString(FontSizeOption option) {
    return option.toString().split('.').last;
  }
}
