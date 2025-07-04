import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/general_parameters_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class GeneralParametersScreen extends ConsumerStatefulWidget {
  const GeneralParametersScreen({super.key});

  @override
  ConsumerState<GeneralParametersScreen> createState() => _GeneralParametersScreenState();
}

class _GeneralParametersScreenState extends ConsumerState<GeneralParametersScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late LanguageOption _language;
  late DateFormatOption _dateFormat;
  late CalendarTypeOption _calendarType;
  late AccountNumberTypeOption _accountNumberType;
  late TextEditingController _accountNumberLengthController;
  late PolicyOption _costCenterPolicy;
  late PolicyOption _projectPolicy;
  late TextEditingController _passwordMinLengthController;
  late TextEditingController _autoLockTimeoutController;
  late bool _useVAT;
  late bool _useTDS;
  late bool _useEInvoice;
  late bool _priceIncludesTax;
  late BackupFrequencyOption _backupFrequency;
  late bool _cloudBackup;
  late UIThemeOption _uiTheme;
  late FontSizeOption _fontSize;

  @override
  void initState() {
    super.initState();
    // Initialize with current values from the provider, or defaults if not loaded yet
    final currentParams = ref.read(generalParametersProvider).value ?? GeneralParametersEntity.defaults();

    _language = currentParams.language;
    _dateFormat = currentParams.dateFormat;
    _calendarType = currentParams.calendarType;
    _accountNumberType = currentParams.accountNumberType;
    _accountNumberLengthController = TextEditingController(text: currentParams.accountNumberLength.toString());
    _costCenterPolicy = currentParams.costCenterPolicy;
    _projectPolicy = currentParams.projectPolicy;
    _passwordMinLengthController = TextEditingController(text: currentParams.passwordMinLength.toString());
    _autoLockTimeoutController = TextEditingController(text: currentParams.autoLockTimeout.toString());
    _useVAT = currentParams.useVAT;
    _useTDS = currentParams.useTDS;
    _useEInvoice = currentParams.useEInvoice;
    _priceIncludesTax = currentParams.priceIncludesTax;
    _backupFrequency = currentParams.backupFrequency;
    _cloudBackup = currentParams.cloudBackup;
    _uiTheme = currentParams.uiTheme;
    _fontSize = currentParams.fontSize;
  }

  @override
  void dispose() {
    _accountNumberLengthController.dispose();
    _passwordMinLengthController.dispose();
    _autoLockTimeoutController.dispose();
    super.dispose();
  }

  void _saveParameters() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final l10n = AppLocalizations.of(context)!;
      try {
        final updatedParams = GeneralParametersEntity(
          language: _language,
          dateFormat: _dateFormat,
          calendarType: _calendarType,
          accountNumberType: _accountNumberType,
          accountNumberLength: int.parse(_accountNumberLengthController.text),
          costCenterPolicy: _costCenterPolicy,
          projectPolicy: _projectPolicy,
          passwordMinLength: int.parse(_passwordMinLengthController.text),
          autoLockTimeout: int.parse(_autoLockTimeoutController.text),
          useVAT: _useVAT,
          useTDS: _useTDS,
          useEInvoice: _useEInvoice,
          priceIncludesTax: _priceIncludesTax,
          backupFrequency: _backupFrequency,
          cloudBackup: _cloudBackup,
          uiTheme: _uiTheme,
          fontSize: _fontSize,
        );
        await ref.read(generalParametersProvider.notifier).saveGeneralParameters(updatedParams);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.saveSuccess)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.saveFailed)),
        );
      }
    }
  }

  void _resetToDefaults() async {
    final l10n = AppLocalizations.of(context)!;
    try {
      await ref.read(generalParametersProvider.notifier).resetToDefaults();
      // Re-initialize state with default values after reset
      final defaultParams = GeneralParametersEntity.defaults();
      setState(() {
        _language = defaultParams.language;
        _dateFormat = defaultParams.dateFormat;
        _calendarType = defaultParams.calendarType;
        _accountNumberType = defaultParams.accountNumberType;
        _accountNumberLengthController.text = defaultParams.accountNumberLength.toString();
        _costCenterPolicy = defaultParams.costCenterPolicy;
        _projectPolicy = defaultParams.projectPolicy;
        _passwordMinLengthController.text = defaultParams.passwordMinLength.toString();
        _autoLockTimeoutController.text = defaultParams.autoLockTimeout.toString();
        _useVAT = defaultParams.useVAT;
        _useTDS = defaultParams.useTDS;
        _useEInvoice = defaultParams.useEInvoice;
        _priceIncludesTax = defaultParams.priceIncludesTax;
        _backupFrequency = defaultParams.backupFrequency;
        _cloudBackup = defaultParams.cloudBackup;
        _uiTheme = defaultParams.uiTheme;
        _fontSize = defaultParams.fontSize;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.resetSuccess)), // Add this key to l10n
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.resetFailed)), // Add this key to l10n
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final paramsAsync = ref.watch(generalParametersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.generalParameters),
      ),
      body: paramsAsync.when(
        data: (params) {
          // Ensure UI reflects the latest loaded data (e.g., after initial load or a reset)
          // Only update controllers if data is actually different to avoid input glitches
          if (params.language != _language) _language = params.language;
          if (params.dateFormat != _dateFormat) _dateFormat = params.dateFormat;
          if (params.calendarType != _calendarType) _calendarType = params.calendarType;
          if (params.accountNumberType != _accountNumberType) _accountNumberType = params.accountNumberType;
          if (int.tryParse(_accountNumberLengthController.text) != params.accountNumberLength) {
            _accountNumberLengthController.text = params.accountNumberLength.toString();
          }
          if (params.costCenterPolicy != _costCenterPolicy) _costCenterPolicy = params.costCenterPolicy;
          if (params.projectPolicy != _projectPolicy) _projectPolicy = params.projectPolicy;
          if (int.tryParse(_passwordMinLengthController.text) != params.passwordMinLength) {
            _passwordMinLengthController.text = params.passwordMinLength.toString();
          }
          if (int.tryParse(_autoLockTimeoutController.text) != params.autoLockTimeout) {
            _autoLockTimeoutController.text = params.autoLockTimeout.toString();
          }
          if (params.useVAT != _useVAT) _useVAT = params.useVAT;
          if (params.useTDS != _useTDS) _useTDS = params.useTDS;
          if (params.useEInvoice != _useEInvoice) _useEInvoice = params.useEInvoice;
          if (params.priceIncludesTax != _priceIncludesTax) _priceIncludesTax = params.priceIncludesTax;
          if (params.backupFrequency != _backupFrequency) _backupFrequency = params.backupFrequency;
          if (params.cloudBackup != _cloudBackup) _cloudBackup = params.cloudBackup;
          if (params.uiTheme != _uiTheme) _uiTheme = params.uiTheme;
          if (params.fontSize != _fontSize) _fontSize = params.fontSize;

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Language
                  DropdownButtonFormField<LanguageOption>(
                    value: _language,
                    decoration: InputDecoration(labelText: l10n.language),
                    items: LanguageOption.values.map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option == LanguageOption.arabic ? l10n.arabic : l10n.english),
                    )).toList(),
                    onChanged: (value) => setState(() => _language = value!),
                  ),
                  const SizedBox(height: 16.0),

                  // Date Format
                  DropdownButtonFormField<DateFormatOption>(
                    value: _dateFormat,
                    decoration: InputDecoration(labelText: l10n.dateFormat),
                    items: DateFormatOption.values.map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.name),
                    )).toList(),
                    onChanged: (value) => setState(() => _dateFormat = value!),
                  ),
                  const SizedBox(height: 16.0),

                  // Calendar Type
                  DropdownButtonFormField<CalendarTypeOption>(
                    value: _calendarType,
                    decoration: InputDecoration(labelText: l10n.calendarType),
                    items: CalendarTypeOption.values.map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.name),
                    )).toList(),
                    onChanged: (value) => setState(() => _calendarType = value!),
                  ),
                  const SizedBox(height: 16.0),

                  // Account Number Type
                  DropdownButtonFormField<AccountNumberTypeOption>(
                    value: _accountNumberType,
                    decoration: InputDecoration(labelText: l10n.accountNumberType),
                    items: AccountNumberTypeOption.values.map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.name),
                    )).toList(),
                    onChanged: (value) => setState(() => _accountNumberType = value!),
                  ),
                  const SizedBox(height: 16.0),

                  // Account Number Length
                  TextFormField(
                    controller: _accountNumberLengthController,
                    decoration: InputDecoration(labelText: l10n.accountNumberLength),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return l10n.requiredField;
                      final length = int.tryParse(value);
                      if (length == null || length < 3 || length > 20) {
                        return l10n.invalidLengthRange(3, 20); // Add this key
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Cost Center Policy
                  DropdownButtonFormField<PolicyOption>(
                    value: _costCenterPolicy,
                    decoration: InputDecoration(labelText: l10n.costCenterPolicy),
                    items: PolicyOption.values.map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.name),
                    )).toList(),
                    onChanged: (value) => setState(() => _costCenterPolicy = value!),
                  ),
                  const SizedBox(height: 16.0),

                  // Project Policy
                  DropdownButtonFormField<PolicyOption>(
                    value: _projectPolicy,
                    decoration: InputDecoration(labelText: l10n.projectPolicy),
                    items: PolicyOption.values.map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.name),
                    )).toList(),
                    onChanged: (value) => setState(() => _projectPolicy = value!),
                  ),
                  const SizedBox(height: 16.0),

                  // Password Minimum Length
                  TextFormField(
                    controller: _passwordMinLengthController,
                    decoration: InputDecoration(labelText: l10n.passwordMinLength),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return l10n.requiredField;
                      final length = int.tryParse(value);
                      if (length == null || length < 6 || length > 32) {
                        return l10n.invalidLengthRange(6, 32); // Reuse key
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Auto Lock Timeout
                  TextFormField(
                    controller: _autoLockTimeoutController,
                    decoration: InputDecoration(labelText: l10n.autoLockTimeout),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return l10n.requiredField;
                      final timeout = int.tryParse(value);
                      if (timeout == null || timeout < 1 || timeout > 60) {
                        return l10n.invalidRange(1, 60); // Add this key
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Use VAT
                  SwitchListTile(
                    title: Text(l10n.useVAT),
                    value: _useVAT,
                    onChanged: (value) => setState(() => _useVAT = value),
                  ),
                  // Use TDS
                  SwitchListTile(
                    title: Text(l10n.useTDS),
                    value: _useTDS,
                    onChanged: (value) => setState(() => _useTDS = value),
                  ),
                  // Use E-Invoice
                  SwitchListTile(
                    title: Text(l10n.useEInvoice),
                    value: _useEInvoice,
                    onChanged: (value) => setState(() => _useEInvoice = value),
                  ),
                  // Price Includes Tax (only visible if Use VAT is true)
                  if (_useVAT) ...[
                    SwitchListTile(
                      title: Text(l10n.priceIncludesTax),
                      value: _priceIncludesTax,
                      onChanged: (value) => setState(() => _priceIncludesTax = value),
                    ),
                  ],
                  const SizedBox(height: 16.0),

                  // Backup Frequency
                  DropdownButtonFormField<BackupFrequencyOption>(
                    value: _backupFrequency,
                    decoration: InputDecoration(labelText: l10n.backupFrequency),
                    items: BackupFrequencyOption.values.map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.name),
                    )).toList(),
                    onChanged: (value) => setState(() => _backupFrequency = value!),
                  ),
                  const SizedBox(height: 16.0),

                  // Cloud Backup
                  SwitchListTile(
                    title: Text(l10n.cloudBackup),
                    value: _cloudBackup,
                    onChanged: (value) => setState(() => _cloudBackup = value),
                  ),
                  const SizedBox(height: 16.0),

                  // UI Theme
                  DropdownButtonFormField<UIThemeOption>(
                    value: _uiTheme,
                    decoration: InputDecoration(labelText: l10n.uiTheme),
                    items: UIThemeOption.values.map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.name),
                    )).toList(),
                    onChanged: (value) => setState(() => _uiTheme = value!),
                  ),
                  const SizedBox(height: 16.0),

                  // Font Size
                  DropdownButtonFormField<FontSizeOption>(
                    value: _fontSize,
                    decoration: InputDecoration(labelText: l10n.fontSize),
                    items: FontSizeOption.values.map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.name),
                    )).toList(),
                    onChanged: (value) => setState(() => _fontSize = value!),
                  ),
                  const SizedBox(height: 32.0),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _resetToDefaults,
                        child: Text(l10n.resetToDefaults),
                      ),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: _saveParameters,
                        child: Text(l10n.save),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Error loading parameters: ${err.toString()}')),
      ),
    );
  }
}
