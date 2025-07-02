// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class SystemConfig extends Table
    with TableInfo<SystemConfig, SystemConfigData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SystemConfig(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT 1',
    defaultValue: const CustomExpression('1'),
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'en\'',
    defaultValue: const CustomExpression('\'en\''),
  );
  static const VerificationMeta _dateFormatMeta = const VerificationMeta(
    'dateFormat',
  );
  late final GeneratedColumn<String> dateFormat = GeneratedColumn<String>(
    'date_format',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'DD/MM/YYYY\'',
    defaultValue: const CustomExpression('\'DD/MM/YYYY\''),
  );
  static const VerificationMeta _calendarTypeMeta = const VerificationMeta(
    'calendarType',
  );
  late final GeneratedColumn<String> calendarType = GeneratedColumn<String>(
    'calendar_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'Gregorian\'',
    defaultValue: const CustomExpression('\'Gregorian\''),
  );
  static const VerificationMeta _accountNumberTypeMeta = const VerificationMeta(
    'accountNumberType',
  );
  late final GeneratedColumn<String> accountNumberType =
      GeneratedColumn<String>(
        'account_number_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NOT NULL DEFAULT \'Numeric\'',
        defaultValue: const CustomExpression('\'Numeric\''),
      );
  static const VerificationMeta _accountNumberLengthMeta =
      const VerificationMeta('accountNumberLength');
  late final GeneratedColumn<int> accountNumberLength = GeneratedColumn<int>(
    'account_number_length',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 8',
    defaultValue: const CustomExpression('8'),
  );
  static const VerificationMeta _costCenterPolicyMeta = const VerificationMeta(
    'costCenterPolicy',
  );
  late final GeneratedColumn<String> costCenterPolicy = GeneratedColumn<String>(
    'cost_center_policy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'Optional\'',
    defaultValue: const CustomExpression('\'Optional\''),
  );
  static const VerificationMeta _projectPolicyMeta = const VerificationMeta(
    'projectPolicy',
  );
  late final GeneratedColumn<String> projectPolicy = GeneratedColumn<String>(
    'project_policy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'Optional\'',
    defaultValue: const CustomExpression('\'Optional\''),
  );
  static const VerificationMeta _passwordMinLengthMeta = const VerificationMeta(
    'passwordMinLength',
  );
  late final GeneratedColumn<int> passwordMinLength = GeneratedColumn<int>(
    'password_min_length',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 8',
    defaultValue: const CustomExpression('8'),
  );
  static const VerificationMeta _autoLockTimeoutMeta = const VerificationMeta(
    'autoLockTimeout',
  );
  late final GeneratedColumn<int> autoLockTimeout = GeneratedColumn<int>(
    'auto_lock_timeout',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 15',
    defaultValue: const CustomExpression('15'),
  );
  static const VerificationMeta _useVatMeta = const VerificationMeta('useVat');
  late final GeneratedColumn<bool> useVat = GeneratedColumn<bool>(
    'use_vat',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _useTdsMeta = const VerificationMeta('useTds');
  late final GeneratedColumn<bool> useTds = GeneratedColumn<bool>(
    'use_tds',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _useEInvoiceMeta = const VerificationMeta(
    'useEInvoice',
  );
  late final GeneratedColumn<bool> useEInvoice = GeneratedColumn<bool>(
    'use_e_invoice',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _priceIncludesTaxMeta = const VerificationMeta(
    'priceIncludesTax',
  );
  late final GeneratedColumn<bool> priceIncludesTax = GeneratedColumn<bool>(
    'price_includes_tax',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _backupFrequencyMeta = const VerificationMeta(
    'backupFrequency',
  );
  late final GeneratedColumn<String> backupFrequency = GeneratedColumn<String>(
    'backup_frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'Weekly\'',
    defaultValue: const CustomExpression('\'Weekly\''),
  );
  static const VerificationMeta _cloudBackupMeta = const VerificationMeta(
    'cloudBackup',
  );
  late final GeneratedColumn<bool> cloudBackup = GeneratedColumn<bool>(
    'cloud_backup',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _uiThemeMeta = const VerificationMeta(
    'uiTheme',
  );
  late final GeneratedColumn<String> uiTheme = GeneratedColumn<String>(
    'ui_theme',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'Light\'',
    defaultValue: const CustomExpression('\'Light\''),
  );
  static const VerificationMeta _fontSizeMeta = const VerificationMeta(
    'fontSize',
  );
  late final GeneratedColumn<String> fontSize = GeneratedColumn<String>(
    'font_size',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'Medium\'',
    defaultValue: const CustomExpression('\'Medium\''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    language,
    dateFormat,
    calendarType,
    accountNumberType,
    accountNumberLength,
    costCenterPolicy,
    projectPolicy,
    passwordMinLength,
    autoLockTimeout,
    useVat,
    useTds,
    useEInvoice,
    priceIncludesTax,
    backupFrequency,
    cloudBackup,
    uiTheme,
    fontSize,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'system_config';
  @override
  VerificationContext validateIntegrity(
    Insertable<SystemConfigData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('date_format')) {
      context.handle(
        _dateFormatMeta,
        dateFormat.isAcceptableOrUnknown(data['date_format']!, _dateFormatMeta),
      );
    }
    if (data.containsKey('calendar_type')) {
      context.handle(
        _calendarTypeMeta,
        calendarType.isAcceptableOrUnknown(
          data['calendar_type']!,
          _calendarTypeMeta,
        ),
      );
    }
    if (data.containsKey('account_number_type')) {
      context.handle(
        _accountNumberTypeMeta,
        accountNumberType.isAcceptableOrUnknown(
          data['account_number_type']!,
          _accountNumberTypeMeta,
        ),
      );
    }
    if (data.containsKey('account_number_length')) {
      context.handle(
        _accountNumberLengthMeta,
        accountNumberLength.isAcceptableOrUnknown(
          data['account_number_length']!,
          _accountNumberLengthMeta,
        ),
      );
    }
    if (data.containsKey('cost_center_policy')) {
      context.handle(
        _costCenterPolicyMeta,
        costCenterPolicy.isAcceptableOrUnknown(
          data['cost_center_policy']!,
          _costCenterPolicyMeta,
        ),
      );
    }
    if (data.containsKey('project_policy')) {
      context.handle(
        _projectPolicyMeta,
        projectPolicy.isAcceptableOrUnknown(
          data['project_policy']!,
          _projectPolicyMeta,
        ),
      );
    }
    if (data.containsKey('password_min_length')) {
      context.handle(
        _passwordMinLengthMeta,
        passwordMinLength.isAcceptableOrUnknown(
          data['password_min_length']!,
          _passwordMinLengthMeta,
        ),
      );
    }
    if (data.containsKey('auto_lock_timeout')) {
      context.handle(
        _autoLockTimeoutMeta,
        autoLockTimeout.isAcceptableOrUnknown(
          data['auto_lock_timeout']!,
          _autoLockTimeoutMeta,
        ),
      );
    }
    if (data.containsKey('use_vat')) {
      context.handle(
        _useVatMeta,
        useVat.isAcceptableOrUnknown(data['use_vat']!, _useVatMeta),
      );
    }
    if (data.containsKey('use_tds')) {
      context.handle(
        _useTdsMeta,
        useTds.isAcceptableOrUnknown(data['use_tds']!, _useTdsMeta),
      );
    }
    if (data.containsKey('use_e_invoice')) {
      context.handle(
        _useEInvoiceMeta,
        useEInvoice.isAcceptableOrUnknown(
          data['use_e_invoice']!,
          _useEInvoiceMeta,
        ),
      );
    }
    if (data.containsKey('price_includes_tax')) {
      context.handle(
        _priceIncludesTaxMeta,
        priceIncludesTax.isAcceptableOrUnknown(
          data['price_includes_tax']!,
          _priceIncludesTaxMeta,
        ),
      );
    }
    if (data.containsKey('backup_frequency')) {
      context.handle(
        _backupFrequencyMeta,
        backupFrequency.isAcceptableOrUnknown(
          data['backup_frequency']!,
          _backupFrequencyMeta,
        ),
      );
    }
    if (data.containsKey('cloud_backup')) {
      context.handle(
        _cloudBackupMeta,
        cloudBackup.isAcceptableOrUnknown(
          data['cloud_backup']!,
          _cloudBackupMeta,
        ),
      );
    }
    if (data.containsKey('ui_theme')) {
      context.handle(
        _uiThemeMeta,
        uiTheme.isAcceptableOrUnknown(data['ui_theme']!, _uiThemeMeta),
      );
    }
    if (data.containsKey('font_size')) {
      context.handle(
        _fontSizeMeta,
        fontSize.isAcceptableOrUnknown(data['font_size']!, _fontSizeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SystemConfigData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SystemConfigData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      dateFormat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_format'],
      )!,
      calendarType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calendar_type'],
      )!,
      accountNumberType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_number_type'],
      )!,
      accountNumberLength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_number_length'],
      )!,
      costCenterPolicy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cost_center_policy'],
      )!,
      projectPolicy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_policy'],
      )!,
      passwordMinLength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}password_min_length'],
      )!,
      autoLockTimeout: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}auto_lock_timeout'],
      )!,
      useVat: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}use_vat'],
      )!,
      useTds: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}use_tds'],
      )!,
      useEInvoice: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}use_e_invoice'],
      )!,
      priceIncludesTax: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}price_includes_tax'],
      )!,
      backupFrequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backup_frequency'],
      )!,
      cloudBackup: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}cloud_backup'],
      )!,
      uiTheme: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ui_theme'],
      )!,
      fontSize: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}font_size'],
      )!,
    );
  }

  @override
  SystemConfig createAlias(String alias) {
    return SystemConfig(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SystemConfigData extends DataClass
    implements Insertable<SystemConfigData> {
  final int id;
  final String language;
  final String dateFormat;
  final String calendarType;
  final String accountNumberType;
  final int accountNumberLength;
  final String costCenterPolicy;
  final String projectPolicy;
  final int passwordMinLength;
  final int autoLockTimeout;
  final bool useVat;
  final bool useTds;
  final bool useEInvoice;
  final bool priceIncludesTax;
  final String backupFrequency;
  final bool cloudBackup;
  final String uiTheme;
  final String fontSize;
  const SystemConfigData({
    required this.id,
    required this.language,
    required this.dateFormat,
    required this.calendarType,
    required this.accountNumberType,
    required this.accountNumberLength,
    required this.costCenterPolicy,
    required this.projectPolicy,
    required this.passwordMinLength,
    required this.autoLockTimeout,
    required this.useVat,
    required this.useTds,
    required this.useEInvoice,
    required this.priceIncludesTax,
    required this.backupFrequency,
    required this.cloudBackup,
    required this.uiTheme,
    required this.fontSize,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['language'] = Variable<String>(language);
    map['date_format'] = Variable<String>(dateFormat);
    map['calendar_type'] = Variable<String>(calendarType);
    map['account_number_type'] = Variable<String>(accountNumberType);
    map['account_number_length'] = Variable<int>(accountNumberLength);
    map['cost_center_policy'] = Variable<String>(costCenterPolicy);
    map['project_policy'] = Variable<String>(projectPolicy);
    map['password_min_length'] = Variable<int>(passwordMinLength);
    map['auto_lock_timeout'] = Variable<int>(autoLockTimeout);
    map['use_vat'] = Variable<bool>(useVat);
    map['use_tds'] = Variable<bool>(useTds);
    map['use_e_invoice'] = Variable<bool>(useEInvoice);
    map['price_includes_tax'] = Variable<bool>(priceIncludesTax);
    map['backup_frequency'] = Variable<String>(backupFrequency);
    map['cloud_backup'] = Variable<bool>(cloudBackup);
    map['ui_theme'] = Variable<String>(uiTheme);
    map['font_size'] = Variable<String>(fontSize);
    return map;
  }

  SystemConfigCompanion toCompanion(bool nullToAbsent) {
    return SystemConfigCompanion(
      id: Value(id),
      language: Value(language),
      dateFormat: Value(dateFormat),
      calendarType: Value(calendarType),
      accountNumberType: Value(accountNumberType),
      accountNumberLength: Value(accountNumberLength),
      costCenterPolicy: Value(costCenterPolicy),
      projectPolicy: Value(projectPolicy),
      passwordMinLength: Value(passwordMinLength),
      autoLockTimeout: Value(autoLockTimeout),
      useVat: Value(useVat),
      useTds: Value(useTds),
      useEInvoice: Value(useEInvoice),
      priceIncludesTax: Value(priceIncludesTax),
      backupFrequency: Value(backupFrequency),
      cloudBackup: Value(cloudBackup),
      uiTheme: Value(uiTheme),
      fontSize: Value(fontSize),
    );
  }

  factory SystemConfigData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SystemConfigData(
      id: serializer.fromJson<int>(json['id']),
      language: serializer.fromJson<String>(json['language']),
      dateFormat: serializer.fromJson<String>(json['date_format']),
      calendarType: serializer.fromJson<String>(json['calendar_type']),
      accountNumberType: serializer.fromJson<String>(
        json['account_number_type'],
      ),
      accountNumberLength: serializer.fromJson<int>(
        json['account_number_length'],
      ),
      costCenterPolicy: serializer.fromJson<String>(json['cost_center_policy']),
      projectPolicy: serializer.fromJson<String>(json['project_policy']),
      passwordMinLength: serializer.fromJson<int>(json['password_min_length']),
      autoLockTimeout: serializer.fromJson<int>(json['auto_lock_timeout']),
      useVat: serializer.fromJson<bool>(json['use_vat']),
      useTds: serializer.fromJson<bool>(json['use_tds']),
      useEInvoice: serializer.fromJson<bool>(json['use_e_invoice']),
      priceIncludesTax: serializer.fromJson<bool>(json['price_includes_tax']),
      backupFrequency: serializer.fromJson<String>(json['backup_frequency']),
      cloudBackup: serializer.fromJson<bool>(json['cloud_backup']),
      uiTheme: serializer.fromJson<String>(json['ui_theme']),
      fontSize: serializer.fromJson<String>(json['font_size']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'language': serializer.toJson<String>(language),
      'date_format': serializer.toJson<String>(dateFormat),
      'calendar_type': serializer.toJson<String>(calendarType),
      'account_number_type': serializer.toJson<String>(accountNumberType),
      'account_number_length': serializer.toJson<int>(accountNumberLength),
      'cost_center_policy': serializer.toJson<String>(costCenterPolicy),
      'project_policy': serializer.toJson<String>(projectPolicy),
      'password_min_length': serializer.toJson<int>(passwordMinLength),
      'auto_lock_timeout': serializer.toJson<int>(autoLockTimeout),
      'use_vat': serializer.toJson<bool>(useVat),
      'use_tds': serializer.toJson<bool>(useTds),
      'use_e_invoice': serializer.toJson<bool>(useEInvoice),
      'price_includes_tax': serializer.toJson<bool>(priceIncludesTax),
      'backup_frequency': serializer.toJson<String>(backupFrequency),
      'cloud_backup': serializer.toJson<bool>(cloudBackup),
      'ui_theme': serializer.toJson<String>(uiTheme),
      'font_size': serializer.toJson<String>(fontSize),
    };
  }

  SystemConfigData copyWith({
    int? id,
    String? language,
    String? dateFormat,
    String? calendarType,
    String? accountNumberType,
    int? accountNumberLength,
    String? costCenterPolicy,
    String? projectPolicy,
    int? passwordMinLength,
    int? autoLockTimeout,
    bool? useVat,
    bool? useTds,
    bool? useEInvoice,
    bool? priceIncludesTax,
    String? backupFrequency,
    bool? cloudBackup,
    String? uiTheme,
    String? fontSize,
  }) => SystemConfigData(
    id: id ?? this.id,
    language: language ?? this.language,
    dateFormat: dateFormat ?? this.dateFormat,
    calendarType: calendarType ?? this.calendarType,
    accountNumberType: accountNumberType ?? this.accountNumberType,
    accountNumberLength: accountNumberLength ?? this.accountNumberLength,
    costCenterPolicy: costCenterPolicy ?? this.costCenterPolicy,
    projectPolicy: projectPolicy ?? this.projectPolicy,
    passwordMinLength: passwordMinLength ?? this.passwordMinLength,
    autoLockTimeout: autoLockTimeout ?? this.autoLockTimeout,
    useVat: useVat ?? this.useVat,
    useTds: useTds ?? this.useTds,
    useEInvoice: useEInvoice ?? this.useEInvoice,
    priceIncludesTax: priceIncludesTax ?? this.priceIncludesTax,
    backupFrequency: backupFrequency ?? this.backupFrequency,
    cloudBackup: cloudBackup ?? this.cloudBackup,
    uiTheme: uiTheme ?? this.uiTheme,
    fontSize: fontSize ?? this.fontSize,
  );
  SystemConfigData copyWithCompanion(SystemConfigCompanion data) {
    return SystemConfigData(
      id: data.id.present ? data.id.value : this.id,
      language: data.language.present ? data.language.value : this.language,
      dateFormat: data.dateFormat.present
          ? data.dateFormat.value
          : this.dateFormat,
      calendarType: data.calendarType.present
          ? data.calendarType.value
          : this.calendarType,
      accountNumberType: data.accountNumberType.present
          ? data.accountNumberType.value
          : this.accountNumberType,
      accountNumberLength: data.accountNumberLength.present
          ? data.accountNumberLength.value
          : this.accountNumberLength,
      costCenterPolicy: data.costCenterPolicy.present
          ? data.costCenterPolicy.value
          : this.costCenterPolicy,
      projectPolicy: data.projectPolicy.present
          ? data.projectPolicy.value
          : this.projectPolicy,
      passwordMinLength: data.passwordMinLength.present
          ? data.passwordMinLength.value
          : this.passwordMinLength,
      autoLockTimeout: data.autoLockTimeout.present
          ? data.autoLockTimeout.value
          : this.autoLockTimeout,
      useVat: data.useVat.present ? data.useVat.value : this.useVat,
      useTds: data.useTds.present ? data.useTds.value : this.useTds,
      useEInvoice: data.useEInvoice.present
          ? data.useEInvoice.value
          : this.useEInvoice,
      priceIncludesTax: data.priceIncludesTax.present
          ? data.priceIncludesTax.value
          : this.priceIncludesTax,
      backupFrequency: data.backupFrequency.present
          ? data.backupFrequency.value
          : this.backupFrequency,
      cloudBackup: data.cloudBackup.present
          ? data.cloudBackup.value
          : this.cloudBackup,
      uiTheme: data.uiTheme.present ? data.uiTheme.value : this.uiTheme,
      fontSize: data.fontSize.present ? data.fontSize.value : this.fontSize,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SystemConfigData(')
          ..write('id: $id, ')
          ..write('language: $language, ')
          ..write('dateFormat: $dateFormat, ')
          ..write('calendarType: $calendarType, ')
          ..write('accountNumberType: $accountNumberType, ')
          ..write('accountNumberLength: $accountNumberLength, ')
          ..write('costCenterPolicy: $costCenterPolicy, ')
          ..write('projectPolicy: $projectPolicy, ')
          ..write('passwordMinLength: $passwordMinLength, ')
          ..write('autoLockTimeout: $autoLockTimeout, ')
          ..write('useVat: $useVat, ')
          ..write('useTds: $useTds, ')
          ..write('useEInvoice: $useEInvoice, ')
          ..write('priceIncludesTax: $priceIncludesTax, ')
          ..write('backupFrequency: $backupFrequency, ')
          ..write('cloudBackup: $cloudBackup, ')
          ..write('uiTheme: $uiTheme, ')
          ..write('fontSize: $fontSize')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    language,
    dateFormat,
    calendarType,
    accountNumberType,
    accountNumberLength,
    costCenterPolicy,
    projectPolicy,
    passwordMinLength,
    autoLockTimeout,
    useVat,
    useTds,
    useEInvoice,
    priceIncludesTax,
    backupFrequency,
    cloudBackup,
    uiTheme,
    fontSize,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SystemConfigData &&
          other.id == this.id &&
          other.language == this.language &&
          other.dateFormat == this.dateFormat &&
          other.calendarType == this.calendarType &&
          other.accountNumberType == this.accountNumberType &&
          other.accountNumberLength == this.accountNumberLength &&
          other.costCenterPolicy == this.costCenterPolicy &&
          other.projectPolicy == this.projectPolicy &&
          other.passwordMinLength == this.passwordMinLength &&
          other.autoLockTimeout == this.autoLockTimeout &&
          other.useVat == this.useVat &&
          other.useTds == this.useTds &&
          other.useEInvoice == this.useEInvoice &&
          other.priceIncludesTax == this.priceIncludesTax &&
          other.backupFrequency == this.backupFrequency &&
          other.cloudBackup == this.cloudBackup &&
          other.uiTheme == this.uiTheme &&
          other.fontSize == this.fontSize);
}

class SystemConfigCompanion extends UpdateCompanion<SystemConfigData> {
  final Value<int> id;
  final Value<String> language;
  final Value<String> dateFormat;
  final Value<String> calendarType;
  final Value<String> accountNumberType;
  final Value<int> accountNumberLength;
  final Value<String> costCenterPolicy;
  final Value<String> projectPolicy;
  final Value<int> passwordMinLength;
  final Value<int> autoLockTimeout;
  final Value<bool> useVat;
  final Value<bool> useTds;
  final Value<bool> useEInvoice;
  final Value<bool> priceIncludesTax;
  final Value<String> backupFrequency;
  final Value<bool> cloudBackup;
  final Value<String> uiTheme;
  final Value<String> fontSize;
  const SystemConfigCompanion({
    this.id = const Value.absent(),
    this.language = const Value.absent(),
    this.dateFormat = const Value.absent(),
    this.calendarType = const Value.absent(),
    this.accountNumberType = const Value.absent(),
    this.accountNumberLength = const Value.absent(),
    this.costCenterPolicy = const Value.absent(),
    this.projectPolicy = const Value.absent(),
    this.passwordMinLength = const Value.absent(),
    this.autoLockTimeout = const Value.absent(),
    this.useVat = const Value.absent(),
    this.useTds = const Value.absent(),
    this.useEInvoice = const Value.absent(),
    this.priceIncludesTax = const Value.absent(),
    this.backupFrequency = const Value.absent(),
    this.cloudBackup = const Value.absent(),
    this.uiTheme = const Value.absent(),
    this.fontSize = const Value.absent(),
  });
  SystemConfigCompanion.insert({
    this.id = const Value.absent(),
    this.language = const Value.absent(),
    this.dateFormat = const Value.absent(),
    this.calendarType = const Value.absent(),
    this.accountNumberType = const Value.absent(),
    this.accountNumberLength = const Value.absent(),
    this.costCenterPolicy = const Value.absent(),
    this.projectPolicy = const Value.absent(),
    this.passwordMinLength = const Value.absent(),
    this.autoLockTimeout = const Value.absent(),
    this.useVat = const Value.absent(),
    this.useTds = const Value.absent(),
    this.useEInvoice = const Value.absent(),
    this.priceIncludesTax = const Value.absent(),
    this.backupFrequency = const Value.absent(),
    this.cloudBackup = const Value.absent(),
    this.uiTheme = const Value.absent(),
    this.fontSize = const Value.absent(),
  });
  static Insertable<SystemConfigData> custom({
    Expression<int>? id,
    Expression<String>? language,
    Expression<String>? dateFormat,
    Expression<String>? calendarType,
    Expression<String>? accountNumberType,
    Expression<int>? accountNumberLength,
    Expression<String>? costCenterPolicy,
    Expression<String>? projectPolicy,
    Expression<int>? passwordMinLength,
    Expression<int>? autoLockTimeout,
    Expression<bool>? useVat,
    Expression<bool>? useTds,
    Expression<bool>? useEInvoice,
    Expression<bool>? priceIncludesTax,
    Expression<String>? backupFrequency,
    Expression<bool>? cloudBackup,
    Expression<String>? uiTheme,
    Expression<String>? fontSize,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (language != null) 'language': language,
      if (dateFormat != null) 'date_format': dateFormat,
      if (calendarType != null) 'calendar_type': calendarType,
      if (accountNumberType != null) 'account_number_type': accountNumberType,
      if (accountNumberLength != null)
        'account_number_length': accountNumberLength,
      if (costCenterPolicy != null) 'cost_center_policy': costCenterPolicy,
      if (projectPolicy != null) 'project_policy': projectPolicy,
      if (passwordMinLength != null) 'password_min_length': passwordMinLength,
      if (autoLockTimeout != null) 'auto_lock_timeout': autoLockTimeout,
      if (useVat != null) 'use_vat': useVat,
      if (useTds != null) 'use_tds': useTds,
      if (useEInvoice != null) 'use_e_invoice': useEInvoice,
      if (priceIncludesTax != null) 'price_includes_tax': priceIncludesTax,
      if (backupFrequency != null) 'backup_frequency': backupFrequency,
      if (cloudBackup != null) 'cloud_backup': cloudBackup,
      if (uiTheme != null) 'ui_theme': uiTheme,
      if (fontSize != null) 'font_size': fontSize,
    });
  }

  SystemConfigCompanion copyWith({
    Value<int>? id,
    Value<String>? language,
    Value<String>? dateFormat,
    Value<String>? calendarType,
    Value<String>? accountNumberType,
    Value<int>? accountNumberLength,
    Value<String>? costCenterPolicy,
    Value<String>? projectPolicy,
    Value<int>? passwordMinLength,
    Value<int>? autoLockTimeout,
    Value<bool>? useVat,
    Value<bool>? useTds,
    Value<bool>? useEInvoice,
    Value<bool>? priceIncludesTax,
    Value<String>? backupFrequency,
    Value<bool>? cloudBackup,
    Value<String>? uiTheme,
    Value<String>? fontSize,
  }) {
    return SystemConfigCompanion(
      id: id ?? this.id,
      language: language ?? this.language,
      dateFormat: dateFormat ?? this.dateFormat,
      calendarType: calendarType ?? this.calendarType,
      accountNumberType: accountNumberType ?? this.accountNumberType,
      accountNumberLength: accountNumberLength ?? this.accountNumberLength,
      costCenterPolicy: costCenterPolicy ?? this.costCenterPolicy,
      projectPolicy: projectPolicy ?? this.projectPolicy,
      passwordMinLength: passwordMinLength ?? this.passwordMinLength,
      autoLockTimeout: autoLockTimeout ?? this.autoLockTimeout,
      useVat: useVat ?? this.useVat,
      useTds: useTds ?? this.useTds,
      useEInvoice: useEInvoice ?? this.useEInvoice,
      priceIncludesTax: priceIncludesTax ?? this.priceIncludesTax,
      backupFrequency: backupFrequency ?? this.backupFrequency,
      cloudBackup: cloudBackup ?? this.cloudBackup,
      uiTheme: uiTheme ?? this.uiTheme,
      fontSize: fontSize ?? this.fontSize,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (dateFormat.present) {
      map['date_format'] = Variable<String>(dateFormat.value);
    }
    if (calendarType.present) {
      map['calendar_type'] = Variable<String>(calendarType.value);
    }
    if (accountNumberType.present) {
      map['account_number_type'] = Variable<String>(accountNumberType.value);
    }
    if (accountNumberLength.present) {
      map['account_number_length'] = Variable<int>(accountNumberLength.value);
    }
    if (costCenterPolicy.present) {
      map['cost_center_policy'] = Variable<String>(costCenterPolicy.value);
    }
    if (projectPolicy.present) {
      map['project_policy'] = Variable<String>(projectPolicy.value);
    }
    if (passwordMinLength.present) {
      map['password_min_length'] = Variable<int>(passwordMinLength.value);
    }
    if (autoLockTimeout.present) {
      map['auto_lock_timeout'] = Variable<int>(autoLockTimeout.value);
    }
    if (useVat.present) {
      map['use_vat'] = Variable<bool>(useVat.value);
    }
    if (useTds.present) {
      map['use_tds'] = Variable<bool>(useTds.value);
    }
    if (useEInvoice.present) {
      map['use_e_invoice'] = Variable<bool>(useEInvoice.value);
    }
    if (priceIncludesTax.present) {
      map['price_includes_tax'] = Variable<bool>(priceIncludesTax.value);
    }
    if (backupFrequency.present) {
      map['backup_frequency'] = Variable<String>(backupFrequency.value);
    }
    if (cloudBackup.present) {
      map['cloud_backup'] = Variable<bool>(cloudBackup.value);
    }
    if (uiTheme.present) {
      map['ui_theme'] = Variable<String>(uiTheme.value);
    }
    if (fontSize.present) {
      map['font_size'] = Variable<String>(fontSize.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SystemConfigCompanion(')
          ..write('id: $id, ')
          ..write('language: $language, ')
          ..write('dateFormat: $dateFormat, ')
          ..write('calendarType: $calendarType, ')
          ..write('accountNumberType: $accountNumberType, ')
          ..write('accountNumberLength: $accountNumberLength, ')
          ..write('costCenterPolicy: $costCenterPolicy, ')
          ..write('projectPolicy: $projectPolicy, ')
          ..write('passwordMinLength: $passwordMinLength, ')
          ..write('autoLockTimeout: $autoLockTimeout, ')
          ..write('useVat: $useVat, ')
          ..write('useTds: $useTds, ')
          ..write('useEInvoice: $useEInvoice, ')
          ..write('priceIncludesTax: $priceIncludesTax, ')
          ..write('backupFrequency: $backupFrequency, ')
          ..write('cloudBackup: $cloudBackup, ')
          ..write('uiTheme: $uiTheme, ')
          ..write('fontSize: $fontSize')
          ..write(')'))
        .toString();
  }
}

class CompanyInfo extends Table with TableInfo<CompanyInfo, CompanyInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CompanyInfo(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT 1',
    defaultValue: const CustomExpression('1'),
  );
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
    'name_ar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _addressArMeta = const VerificationMeta(
    'addressAr',
  );
  late final GeneratedColumn<String> addressAr = GeneratedColumn<String>(
    'address_ar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _addressEnMeta = const VerificationMeta(
    'addressEn',
  );
  late final GeneratedColumn<String> addressEn = GeneratedColumn<String>(
    'address_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _websiteMeta = const VerificationMeta(
    'website',
  );
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
    'website',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _taxNumberMeta = const VerificationMeta(
    'taxNumber',
  );
  late final GeneratedColumn<String> taxNumber = GeneratedColumn<String>(
    'tax_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _commercialRegNoMeta = const VerificationMeta(
    'commercialRegNo',
  );
  late final GeneratedColumn<String> commercialRegNo = GeneratedColumn<String>(
    'commercial_reg_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nameAr,
    nameEn,
    addressAr,
    addressEn,
    phone,
    email,
    website,
    taxNumber,
    commercialRegNo,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'company_info';
  @override
  VerificationContext validateIntegrity(
    Insertable<CompanyInfoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_ar')) {
      context.handle(
        _nameArMeta,
        nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta),
      );
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('address_ar')) {
      context.handle(
        _addressArMeta,
        addressAr.isAcceptableOrUnknown(data['address_ar']!, _addressArMeta),
      );
    }
    if (data.containsKey('address_en')) {
      context.handle(
        _addressEnMeta,
        addressEn.isAcceptableOrUnknown(data['address_en']!, _addressEnMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('website')) {
      context.handle(
        _websiteMeta,
        website.isAcceptableOrUnknown(data['website']!, _websiteMeta),
      );
    }
    if (data.containsKey('tax_number')) {
      context.handle(
        _taxNumberMeta,
        taxNumber.isAcceptableOrUnknown(data['tax_number']!, _taxNumberMeta),
      );
    }
    if (data.containsKey('commercial_reg_no')) {
      context.handle(
        _commercialRegNoMeta,
        commercialRegNo.isAcceptableOrUnknown(
          data['commercial_reg_no']!,
          _commercialRegNoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompanyInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanyInfoData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nameAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ar'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      addressAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_ar'],
      ),
      addressEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_en'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      website: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}website'],
      ),
      taxNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_number'],
      ),
      commercialRegNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}commercial_reg_no'],
      ),
    );
  }

  @override
  CompanyInfo createAlias(String alias) {
    return CompanyInfo(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CompanyInfoData extends DataClass implements Insertable<CompanyInfoData> {
  final int id;
  final String nameAr;
  final String nameEn;
  final String? addressAr;
  final String? addressEn;
  final String? phone;
  final String? email;
  final String? website;
  final String? taxNumber;
  final String? commercialRegNo;
  const CompanyInfoData({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.addressAr,
    this.addressEn,
    this.phone,
    this.email,
    this.website,
    this.taxNumber,
    this.commercialRegNo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    if (!nullToAbsent || addressAr != null) {
      map['address_ar'] = Variable<String>(addressAr);
    }
    if (!nullToAbsent || addressEn != null) {
      map['address_en'] = Variable<String>(addressEn);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || taxNumber != null) {
      map['tax_number'] = Variable<String>(taxNumber);
    }
    if (!nullToAbsent || commercialRegNo != null) {
      map['commercial_reg_no'] = Variable<String>(commercialRegNo);
    }
    return map;
  }

  CompanyInfoCompanion toCompanion(bool nullToAbsent) {
    return CompanyInfoCompanion(
      id: Value(id),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      addressAr: addressAr == null && nullToAbsent
          ? const Value.absent()
          : Value(addressAr),
      addressEn: addressEn == null && nullToAbsent
          ? const Value.absent()
          : Value(addressEn),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      taxNumber: taxNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(taxNumber),
      commercialRegNo: commercialRegNo == null && nullToAbsent
          ? const Value.absent()
          : Value(commercialRegNo),
    );
  }

  factory CompanyInfoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanyInfoData(
      id: serializer.fromJson<int>(json['id']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      addressAr: serializer.fromJson<String?>(json['address_ar']),
      addressEn: serializer.fromJson<String?>(json['address_en']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      website: serializer.fromJson<String?>(json['website']),
      taxNumber: serializer.fromJson<String?>(json['tax_number']),
      commercialRegNo: serializer.fromJson<String?>(json['commercial_reg_no']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'address_ar': serializer.toJson<String?>(addressAr),
      'address_en': serializer.toJson<String?>(addressEn),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'website': serializer.toJson<String?>(website),
      'tax_number': serializer.toJson<String?>(taxNumber),
      'commercial_reg_no': serializer.toJson<String?>(commercialRegNo),
    };
  }

  CompanyInfoData copyWith({
    int? id,
    String? nameAr,
    String? nameEn,
    Value<String?> addressAr = const Value.absent(),
    Value<String?> addressEn = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> website = const Value.absent(),
    Value<String?> taxNumber = const Value.absent(),
    Value<String?> commercialRegNo = const Value.absent(),
  }) => CompanyInfoData(
    id: id ?? this.id,
    nameAr: nameAr ?? this.nameAr,
    nameEn: nameEn ?? this.nameEn,
    addressAr: addressAr.present ? addressAr.value : this.addressAr,
    addressEn: addressEn.present ? addressEn.value : this.addressEn,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    website: website.present ? website.value : this.website,
    taxNumber: taxNumber.present ? taxNumber.value : this.taxNumber,
    commercialRegNo: commercialRegNo.present
        ? commercialRegNo.value
        : this.commercialRegNo,
  );
  CompanyInfoData copyWithCompanion(CompanyInfoCompanion data) {
    return CompanyInfoData(
      id: data.id.present ? data.id.value : this.id,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      addressAr: data.addressAr.present ? data.addressAr.value : this.addressAr,
      addressEn: data.addressEn.present ? data.addressEn.value : this.addressEn,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      website: data.website.present ? data.website.value : this.website,
      taxNumber: data.taxNumber.present ? data.taxNumber.value : this.taxNumber,
      commercialRegNo: data.commercialRegNo.present
          ? data.commercialRegNo.value
          : this.commercialRegNo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CompanyInfoData(')
          ..write('id: $id, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('addressAr: $addressAr, ')
          ..write('addressEn: $addressEn, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('commercialRegNo: $commercialRegNo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nameAr,
    nameEn,
    addressAr,
    addressEn,
    phone,
    email,
    website,
    taxNumber,
    commercialRegNo,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyInfoData &&
          other.id == this.id &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.addressAr == this.addressAr &&
          other.addressEn == this.addressEn &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.website == this.website &&
          other.taxNumber == this.taxNumber &&
          other.commercialRegNo == this.commercialRegNo);
}

class CompanyInfoCompanion extends UpdateCompanion<CompanyInfoData> {
  final Value<int> id;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String?> addressAr;
  final Value<String?> addressEn;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> website;
  final Value<String?> taxNumber;
  final Value<String?> commercialRegNo;
  const CompanyInfoCompanion({
    this.id = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.addressAr = const Value.absent(),
    this.addressEn = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.commercialRegNo = const Value.absent(),
  });
  CompanyInfoCompanion.insert({
    this.id = const Value.absent(),
    required String nameAr,
    required String nameEn,
    this.addressAr = const Value.absent(),
    this.addressEn = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.commercialRegNo = const Value.absent(),
  }) : nameAr = Value(nameAr),
       nameEn = Value(nameEn);
  static Insertable<CompanyInfoData> custom({
    Expression<int>? id,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? addressAr,
    Expression<String>? addressEn,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? website,
    Expression<String>? taxNumber,
    Expression<String>? commercialRegNo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (addressAr != null) 'address_ar': addressAr,
      if (addressEn != null) 'address_en': addressEn,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (website != null) 'website': website,
      if (taxNumber != null) 'tax_number': taxNumber,
      if (commercialRegNo != null) 'commercial_reg_no': commercialRegNo,
    });
  }

  CompanyInfoCompanion copyWith({
    Value<int>? id,
    Value<String>? nameAr,
    Value<String>? nameEn,
    Value<String?>? addressAr,
    Value<String?>? addressEn,
    Value<String?>? phone,
    Value<String?>? email,
    Value<String?>? website,
    Value<String?>? taxNumber,
    Value<String?>? commercialRegNo,
  }) {
    return CompanyInfoCompanion(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      addressAr: addressAr ?? this.addressAr,
      addressEn: addressEn ?? this.addressEn,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      website: website ?? this.website,
      taxNumber: taxNumber ?? this.taxNumber,
      commercialRegNo: commercialRegNo ?? this.commercialRegNo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (addressAr.present) {
      map['address_ar'] = Variable<String>(addressAr.value);
    }
    if (addressEn.present) {
      map['address_en'] = Variable<String>(addressEn.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (taxNumber.present) {
      map['tax_number'] = Variable<String>(taxNumber.value);
    }
    if (commercialRegNo.present) {
      map['commercial_reg_no'] = Variable<String>(commercialRegNo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyInfoCompanion(')
          ..write('id: $id, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('addressAr: $addressAr, ')
          ..write('addressEn: $addressEn, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('commercialRegNo: $commercialRegNo')
          ..write(')'))
        .toString();
  }
}

class Accounts extends Table with TableInfo<Accounts, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Accounts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _accountCodeMeta = const VerificationMeta(
    'accountCode',
  );
  late final GeneratedColumn<String> accountCode = GeneratedColumn<String>(
    'account_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
    'name_ar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT TRUE',
    defaultValue: const CustomExpression('TRUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentId,
    accountCode,
    nameAr,
    nameEn,
    level,
    type,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Account> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('account_code')) {
      context.handle(
        _accountCodeMeta,
        accountCode.isAcceptableOrUnknown(
          data['account_code']!,
          _accountCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(
        _nameArMeta,
        nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta),
      );
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      ),
      accountCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_code'],
      )!,
      nameAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ar'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  Accounts createAlias(String alias) {
    return Accounts(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(parent_id)REFERENCES accounts(id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Account extends DataClass implements Insertable<Account> {
  final int id;
  final int? parentId;
  final String accountCode;
  final String nameAr;
  final String nameEn;
  final int level;
  final String type;
  final bool isActive;
  const Account({
    required this.id,
    this.parentId,
    required this.accountCode,
    required this.nameAr,
    required this.nameEn,
    required this.level,
    required this.type,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['account_code'] = Variable<String>(accountCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['level'] = Variable<int>(level);
    map['type'] = Variable<String>(type);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      accountCode: Value(accountCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      level: Value(level),
      type: Value(type),
      isActive: Value(isActive),
    );
  }

  factory Account.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int?>(json['parent_id']),
      accountCode: serializer.fromJson<String>(json['account_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      level: serializer.fromJson<int>(json['level']),
      type: serializer.fromJson<String>(json['type']),
      isActive: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parent_id': serializer.toJson<int?>(parentId),
      'account_code': serializer.toJson<String>(accountCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'level': serializer.toJson<int>(level),
      'type': serializer.toJson<String>(type),
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  Account copyWith({
    int? id,
    Value<int?> parentId = const Value.absent(),
    String? accountCode,
    String? nameAr,
    String? nameEn,
    int? level,
    String? type,
    bool? isActive,
  }) => Account(
    id: id ?? this.id,
    parentId: parentId.present ? parentId.value : this.parentId,
    accountCode: accountCode ?? this.accountCode,
    nameAr: nameAr ?? this.nameAr,
    nameEn: nameEn ?? this.nameEn,
    level: level ?? this.level,
    type: type ?? this.type,
    isActive: isActive ?? this.isActive,
  );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      accountCode: data.accountCode.present
          ? data.accountCode.value
          : this.accountCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      level: data.level.present ? data.level.value : this.level,
      type: data.type.present ? data.type.value : this.type,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('accountCode: $accountCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('level: $level, ')
          ..write('type: $type, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    parentId,
    accountCode,
    nameAr,
    nameEn,
    level,
    type,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.accountCode == this.accountCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.level == this.level &&
          other.type == this.type &&
          other.isActive == this.isActive);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<int?> parentId;
  final Value<String> accountCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<int> level;
  final Value<String> type;
  final Value<bool> isActive;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.accountCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.level = const Value.absent(),
    this.type = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    required String accountCode,
    required String nameAr,
    required String nameEn,
    required int level,
    required String type,
    this.isActive = const Value.absent(),
  }) : accountCode = Value(accountCode),
       nameAr = Value(nameAr),
       nameEn = Value(nameEn),
       level = Value(level),
       type = Value(type);
  static Insertable<Account> custom({
    Expression<int>? id,
    Expression<int>? parentId,
    Expression<String>? accountCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<int>? level,
    Expression<String>? type,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (accountCode != null) 'account_code': accountCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (level != null) 'level': level,
      if (type != null) 'type': type,
      if (isActive != null) 'is_active': isActive,
    });
  }

  AccountsCompanion copyWith({
    Value<int>? id,
    Value<int?>? parentId,
    Value<String>? accountCode,
    Value<String>? nameAr,
    Value<String>? nameEn,
    Value<int>? level,
    Value<String>? type,
    Value<bool>? isActive,
  }) {
    return AccountsCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      accountCode: accountCode ?? this.accountCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      level: level ?? this.level,
      type: type ?? this.type,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (accountCode.present) {
      map['account_code'] = Variable<String>(accountCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('accountCode: $accountCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('level: $level, ')
          ..write('type: $type, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class Roles extends Table with TableInfo<Roles, Role> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Roles(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
    'name_ar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT TRUE',
    defaultValue: const CustomExpression('TRUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nameAr,
    nameEn,
    description,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Role> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_ar')) {
      context.handle(
        _nameArMeta,
        nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta),
      );
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Role map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Role(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nameAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ar'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  Roles createAlias(String alias) {
    return Roles(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Role extends DataClass implements Insertable<Role> {
  final int id;
  final String nameAr;
  final String nameEn;
  final String? description;
  final bool isActive;
  const Role({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.description,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  RolesCompanion toCompanion(bool nullToAbsent) {
    return RolesCompanion(
      id: Value(id),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isActive: Value(isActive),
    );
  }

  factory Role.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Role(
      id: serializer.fromJson<int>(json['id']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      description: serializer.fromJson<String?>(json['description']),
      isActive: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'description': serializer.toJson<String?>(description),
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  Role copyWith({
    int? id,
    String? nameAr,
    String? nameEn,
    Value<String?> description = const Value.absent(),
    bool? isActive,
  }) => Role(
    id: id ?? this.id,
    nameAr: nameAr ?? this.nameAr,
    nameEn: nameEn ?? this.nameEn,
    description: description.present ? description.value : this.description,
    isActive: isActive ?? this.isActive,
  );
  Role copyWithCompanion(RolesCompanion data) {
    return Role(
      id: data.id.present ? data.id.value : this.id,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      description: data.description.present
          ? data.description.value
          : this.description,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Role(')
          ..write('id: $id, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameAr, nameEn, description, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Role &&
          other.id == this.id &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.description == this.description &&
          other.isActive == this.isActive);
}

class RolesCompanion extends UpdateCompanion<Role> {
  final Value<int> id;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String?> description;
  final Value<bool> isActive;
  const RolesCompanion({
    this.id = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  RolesCompanion.insert({
    this.id = const Value.absent(),
    required String nameAr,
    required String nameEn,
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : nameAr = Value(nameAr),
       nameEn = Value(nameEn);
  static Insertable<Role> custom({
    Expression<int>? id,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? description,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
    });
  }

  RolesCompanion copyWith({
    Value<int>? id,
    Value<String>? nameAr,
    Value<String>? nameEn,
    Value<String?>? description,
    Value<bool>? isActive,
  }) {
    return RolesCompanion(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolesCompanion(')
          ..write('id: $id, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class Users extends Table with TableInfo<Users, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _fullNameArMeta = const VerificationMeta(
    'fullNameAr',
  );
  late final GeneratedColumn<String> fullNameAr = GeneratedColumn<String>(
    'full_name_ar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _fullNameEnMeta = const VerificationMeta(
    'fullNameEn',
  );
  late final GeneratedColumn<String> fullNameEn = GeneratedColumn<String>(
    'full_name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _assignedBranchIdMeta = const VerificationMeta(
    'assignedBranchId',
  );
  late final GeneratedColumn<int> assignedBranchId = GeneratedColumn<int>(
    'assigned_branch_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _employeeIdMeta = const VerificationMeta(
    'employeeId',
  );
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
    'employee_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT TRUE',
    defaultValue: const CustomExpression('TRUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    username,
    passwordHash,
    fullNameAr,
    fullNameEn,
    email,
    assignedBranchId,
    employeeId,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('full_name_ar')) {
      context.handle(
        _fullNameArMeta,
        fullNameAr.isAcceptableOrUnknown(
          data['full_name_ar']!,
          _fullNameArMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fullNameArMeta);
    }
    if (data.containsKey('full_name_en')) {
      context.handle(
        _fullNameEnMeta,
        fullNameEn.isAcceptableOrUnknown(
          data['full_name_en']!,
          _fullNameEnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fullNameEnMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('assigned_branch_id')) {
      context.handle(
        _assignedBranchIdMeta,
        assignedBranchId.isAcceptableOrUnknown(
          data['assigned_branch_id']!,
          _assignedBranchIdMeta,
        ),
      );
    }
    if (data.containsKey('employee_id')) {
      context.handle(
        _employeeIdMeta,
        employeeId.isAcceptableOrUnknown(data['employee_id']!, _employeeIdMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      fullNameAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name_ar'],
      )!,
      fullNameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name_en'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      assignedBranchId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}assigned_branch_id'],
      ),
      employeeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}employee_id'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class User extends DataClass implements Insertable<User> {
  final int userId;
  final String username;
  final String passwordHash;
  final String fullNameAr;
  final String fullNameEn;
  final String? email;

  /// In a real app, this would be a foreign key to a 'branches' table
  final int? assignedBranchId;

  /// Link to an 'employees' table later
  final int? employeeId;
  final bool isActive;
  const User({
    required this.userId,
    required this.username,
    required this.passwordHash,
    required this.fullNameAr,
    required this.fullNameEn,
    this.email,
    this.assignedBranchId,
    this.employeeId,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['username'] = Variable<String>(username);
    map['password_hash'] = Variable<String>(passwordHash);
    map['full_name_ar'] = Variable<String>(fullNameAr);
    map['full_name_en'] = Variable<String>(fullNameEn);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || assignedBranchId != null) {
      map['assigned_branch_id'] = Variable<int>(assignedBranchId);
    }
    if (!nullToAbsent || employeeId != null) {
      map['employee_id'] = Variable<int>(employeeId);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userId: Value(userId),
      username: Value(username),
      passwordHash: Value(passwordHash),
      fullNameAr: Value(fullNameAr),
      fullNameEn: Value(fullNameEn),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      assignedBranchId: assignedBranchId == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedBranchId),
      employeeId: employeeId == null && nullToAbsent
          ? const Value.absent()
          : Value(employeeId),
      isActive: Value(isActive),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      userId: serializer.fromJson<int>(json['user_id']),
      username: serializer.fromJson<String>(json['username']),
      passwordHash: serializer.fromJson<String>(json['password_hash']),
      fullNameAr: serializer.fromJson<String>(json['full_name_ar']),
      fullNameEn: serializer.fromJson<String>(json['full_name_en']),
      email: serializer.fromJson<String?>(json['email']),
      assignedBranchId: serializer.fromJson<int?>(json['assigned_branch_id']),
      employeeId: serializer.fromJson<int?>(json['employee_id']),
      isActive: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<int>(userId),
      'username': serializer.toJson<String>(username),
      'password_hash': serializer.toJson<String>(passwordHash),
      'full_name_ar': serializer.toJson<String>(fullNameAr),
      'full_name_en': serializer.toJson<String>(fullNameEn),
      'email': serializer.toJson<String?>(email),
      'assigned_branch_id': serializer.toJson<int?>(assignedBranchId),
      'employee_id': serializer.toJson<int?>(employeeId),
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  User copyWith({
    int? userId,
    String? username,
    String? passwordHash,
    String? fullNameAr,
    String? fullNameEn,
    Value<String?> email = const Value.absent(),
    Value<int?> assignedBranchId = const Value.absent(),
    Value<int?> employeeId = const Value.absent(),
    bool? isActive,
  }) => User(
    userId: userId ?? this.userId,
    username: username ?? this.username,
    passwordHash: passwordHash ?? this.passwordHash,
    fullNameAr: fullNameAr ?? this.fullNameAr,
    fullNameEn: fullNameEn ?? this.fullNameEn,
    email: email.present ? email.value : this.email,
    assignedBranchId: assignedBranchId.present
        ? assignedBranchId.value
        : this.assignedBranchId,
    employeeId: employeeId.present ? employeeId.value : this.employeeId,
    isActive: isActive ?? this.isActive,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      userId: data.userId.present ? data.userId.value : this.userId,
      username: data.username.present ? data.username.value : this.username,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      fullNameAr: data.fullNameAr.present
          ? data.fullNameAr.value
          : this.fullNameAr,
      fullNameEn: data.fullNameEn.present
          ? data.fullNameEn.value
          : this.fullNameEn,
      email: data.email.present ? data.email.value : this.email,
      assignedBranchId: data.assignedBranchId.present
          ? data.assignedBranchId.value
          : this.assignedBranchId,
      employeeId: data.employeeId.present
          ? data.employeeId.value
          : this.employeeId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('fullNameAr: $fullNameAr, ')
          ..write('fullNameEn: $fullNameEn, ')
          ..write('email: $email, ')
          ..write('assignedBranchId: $assignedBranchId, ')
          ..write('employeeId: $employeeId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userId,
    username,
    passwordHash,
    fullNameAr,
    fullNameEn,
    email,
    assignedBranchId,
    employeeId,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.userId == this.userId &&
          other.username == this.username &&
          other.passwordHash == this.passwordHash &&
          other.fullNameAr == this.fullNameAr &&
          other.fullNameEn == this.fullNameEn &&
          other.email == this.email &&
          other.assignedBranchId == this.assignedBranchId &&
          other.employeeId == this.employeeId &&
          other.isActive == this.isActive);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> userId;
  final Value<String> username;
  final Value<String> passwordHash;
  final Value<String> fullNameAr;
  final Value<String> fullNameEn;
  final Value<String?> email;
  final Value<int?> assignedBranchId;
  final Value<int?> employeeId;
  final Value<bool> isActive;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.username = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.fullNameAr = const Value.absent(),
    this.fullNameEn = const Value.absent(),
    this.email = const Value.absent(),
    this.assignedBranchId = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userId = const Value.absent(),
    required String username,
    required String passwordHash,
    required String fullNameAr,
    required String fullNameEn,
    this.email = const Value.absent(),
    this.assignedBranchId = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : username = Value(username),
       passwordHash = Value(passwordHash),
       fullNameAr = Value(fullNameAr),
       fullNameEn = Value(fullNameEn);
  static Insertable<User> custom({
    Expression<int>? userId,
    Expression<String>? username,
    Expression<String>? passwordHash,
    Expression<String>? fullNameAr,
    Expression<String>? fullNameEn,
    Expression<String>? email,
    Expression<int>? assignedBranchId,
    Expression<int>? employeeId,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (username != null) 'username': username,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (fullNameAr != null) 'full_name_ar': fullNameAr,
      if (fullNameEn != null) 'full_name_en': fullNameEn,
      if (email != null) 'email': email,
      if (assignedBranchId != null) 'assigned_branch_id': assignedBranchId,
      if (employeeId != null) 'employee_id': employeeId,
      if (isActive != null) 'is_active': isActive,
    });
  }

  UsersCompanion copyWith({
    Value<int>? userId,
    Value<String>? username,
    Value<String>? passwordHash,
    Value<String>? fullNameAr,
    Value<String>? fullNameEn,
    Value<String?>? email,
    Value<int?>? assignedBranchId,
    Value<int?>? employeeId,
    Value<bool>? isActive,
  }) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      passwordHash: passwordHash ?? this.passwordHash,
      fullNameAr: fullNameAr ?? this.fullNameAr,
      fullNameEn: fullNameEn ?? this.fullNameEn,
      email: email ?? this.email,
      assignedBranchId: assignedBranchId ?? this.assignedBranchId,
      employeeId: employeeId ?? this.employeeId,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (fullNameAr.present) {
      map['full_name_ar'] = Variable<String>(fullNameAr.value);
    }
    if (fullNameEn.present) {
      map['full_name_en'] = Variable<String>(fullNameEn.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (assignedBranchId.present) {
      map['assigned_branch_id'] = Variable<int>(assignedBranchId.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('fullNameAr: $fullNameAr, ')
          ..write('fullNameEn: $fullNameEn, ')
          ..write('email: $email, ')
          ..write('assignedBranchId: $assignedBranchId, ')
          ..write('employeeId: $employeeId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class UserRoles extends Table with TableInfo<UserRoles, UserRole> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserRoles(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  late final GeneratedColumn<int> roleId = GeneratedColumn<int>(
    'role_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [userId, roleId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_roles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserRole> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('role_id')) {
      context.handle(
        _roleIdMeta,
        roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, roleId};
  @override
  UserRole map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRole(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      roleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role_id'],
      )!,
    );
  }

  @override
  UserRoles createAlias(String alias) {
    return UserRoles(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(user_id, role_id)',
    'FOREIGN KEY(user_id)REFERENCES users(user_id)ON DELETE CASCADE',
    'FOREIGN KEY(role_id)REFERENCES roles(id)ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class UserRole extends DataClass implements Insertable<UserRole> {
  final int userId;
  final int roleId;
  const UserRole({required this.userId, required this.roleId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['role_id'] = Variable<int>(roleId);
    return map;
  }

  UserRolesCompanion toCompanion(bool nullToAbsent) {
    return UserRolesCompanion(userId: Value(userId), roleId: Value(roleId));
  }

  factory UserRole.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRole(
      userId: serializer.fromJson<int>(json['user_id']),
      roleId: serializer.fromJson<int>(json['role_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<int>(userId),
      'role_id': serializer.toJson<int>(roleId),
    };
  }

  UserRole copyWith({int? userId, int? roleId}) =>
      UserRole(userId: userId ?? this.userId, roleId: roleId ?? this.roleId);
  UserRole copyWithCompanion(UserRolesCompanion data) {
    return UserRole(
      userId: data.userId.present ? data.userId.value : this.userId,
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserRole(')
          ..write('userId: $userId, ')
          ..write('roleId: $roleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, roleId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRole &&
          other.userId == this.userId &&
          other.roleId == this.roleId);
}

class UserRolesCompanion extends UpdateCompanion<UserRole> {
  final Value<int> userId;
  final Value<int> roleId;
  final Value<int> rowid;
  const UserRolesCompanion({
    this.userId = const Value.absent(),
    this.roleId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserRolesCompanion.insert({
    required int userId,
    required int roleId,
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       roleId = Value(roleId);
  static Insertable<UserRole> custom({
    Expression<int>? userId,
    Expression<int>? roleId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (roleId != null) 'role_id': roleId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserRolesCompanion copyWith({
    Value<int>? userId,
    Value<int>? roleId,
    Value<int>? rowid,
  }) {
    return UserRolesCompanion(
      userId: userId ?? this.userId,
      roleId: roleId ?? this.roleId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<int>(roleId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserRolesCompanion(')
          ..write('userId: $userId, ')
          ..write('roleId: $roleId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class RolePermissions extends Table
    with TableInfo<RolePermissions, RolePermission> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RolePermissions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  late final GeneratedColumn<int> roleId = GeneratedColumn<int>(
    'role_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _permissionKeyMeta = const VerificationMeta(
    'permissionKey',
  );
  late final GeneratedColumn<String> permissionKey = GeneratedColumn<String>(
    'permission_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [roleId, permissionKey];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'role_permissions';
  @override
  VerificationContext validateIntegrity(
    Insertable<RolePermission> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('role_id')) {
      context.handle(
        _roleIdMeta,
        roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    if (data.containsKey('permission_key')) {
      context.handle(
        _permissionKeyMeta,
        permissionKey.isAcceptableOrUnknown(
          data['permission_key']!,
          _permissionKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_permissionKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {roleId, permissionKey};
  @override
  RolePermission map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RolePermission(
      roleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role_id'],
      )!,
      permissionKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}permission_key'],
      )!,
    );
  }

  @override
  RolePermissions createAlias(String alias) {
    return RolePermissions(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(role_id, permission_key)',
    'FOREIGN KEY(role_id)REFERENCES roles(id)ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class RolePermission extends DataClass implements Insertable<RolePermission> {
  final int roleId;
  final String permissionKey;
  const RolePermission({required this.roleId, required this.permissionKey});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['role_id'] = Variable<int>(roleId);
    map['permission_key'] = Variable<String>(permissionKey);
    return map;
  }

  RolePermissionsCompanion toCompanion(bool nullToAbsent) {
    return RolePermissionsCompanion(
      roleId: Value(roleId),
      permissionKey: Value(permissionKey),
    );
  }

  factory RolePermission.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RolePermission(
      roleId: serializer.fromJson<int>(json['role_id']),
      permissionKey: serializer.fromJson<String>(json['permission_key']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'role_id': serializer.toJson<int>(roleId),
      'permission_key': serializer.toJson<String>(permissionKey),
    };
  }

  RolePermission copyWith({int? roleId, String? permissionKey}) =>
      RolePermission(
        roleId: roleId ?? this.roleId,
        permissionKey: permissionKey ?? this.permissionKey,
      );
  RolePermission copyWithCompanion(RolePermissionsCompanion data) {
    return RolePermission(
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
      permissionKey: data.permissionKey.present
          ? data.permissionKey.value
          : this.permissionKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RolePermission(')
          ..write('roleId: $roleId, ')
          ..write('permissionKey: $permissionKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(roleId, permissionKey);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RolePermission &&
          other.roleId == this.roleId &&
          other.permissionKey == this.permissionKey);
}

class RolePermissionsCompanion extends UpdateCompanion<RolePermission> {
  final Value<int> roleId;
  final Value<String> permissionKey;
  final Value<int> rowid;
  const RolePermissionsCompanion({
    this.roleId = const Value.absent(),
    this.permissionKey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RolePermissionsCompanion.insert({
    required int roleId,
    required String permissionKey,
    this.rowid = const Value.absent(),
  }) : roleId = Value(roleId),
       permissionKey = Value(permissionKey);
  static Insertable<RolePermission> custom({
    Expression<int>? roleId,
    Expression<String>? permissionKey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (roleId != null) 'role_id': roleId,
      if (permissionKey != null) 'permission_key': permissionKey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RolePermissionsCompanion copyWith({
    Value<int>? roleId,
    Value<String>? permissionKey,
    Value<int>? rowid,
  }) {
    return RolePermissionsCompanion(
      roleId: roleId ?? this.roleId,
      permissionKey: permissionKey ?? this.permissionKey,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (roleId.present) {
      map['role_id'] = Variable<int>(roleId.value);
    }
    if (permissionKey.present) {
      map['permission_key'] = Variable<String>(permissionKey.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolePermissionsCompanion(')
          ..write('roleId: $roleId, ')
          ..write('permissionKey: $permissionKey, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final SystemConfig systemConfig = SystemConfig(this);
  late final CompanyInfo companyInfo = CompanyInfo(this);
  late final Accounts accounts = Accounts(this);
  late final Roles roles = Roles(this);
  late final Users users = Users(this);
  late final UserRoles userRoles = UserRoles(this);
  late final RolePermissions rolePermissions = RolePermissions(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    systemConfig,
    companyInfo,
    accounts,
    roles,
    users,
    userRoles,
    rolePermissions,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('user_roles', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'roles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('user_roles', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'roles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('role_permissions', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $SystemConfigCreateCompanionBuilder =
    SystemConfigCompanion Function({
      Value<int> id,
      Value<String> language,
      Value<String> dateFormat,
      Value<String> calendarType,
      Value<String> accountNumberType,
      Value<int> accountNumberLength,
      Value<String> costCenterPolicy,
      Value<String> projectPolicy,
      Value<int> passwordMinLength,
      Value<int> autoLockTimeout,
      Value<bool> useVat,
      Value<bool> useTds,
      Value<bool> useEInvoice,
      Value<bool> priceIncludesTax,
      Value<String> backupFrequency,
      Value<bool> cloudBackup,
      Value<String> uiTheme,
      Value<String> fontSize,
    });
typedef $SystemConfigUpdateCompanionBuilder =
    SystemConfigCompanion Function({
      Value<int> id,
      Value<String> language,
      Value<String> dateFormat,
      Value<String> calendarType,
      Value<String> accountNumberType,
      Value<int> accountNumberLength,
      Value<String> costCenterPolicy,
      Value<String> projectPolicy,
      Value<int> passwordMinLength,
      Value<int> autoLockTimeout,
      Value<bool> useVat,
      Value<bool> useTds,
      Value<bool> useEInvoice,
      Value<bool> priceIncludesTax,
      Value<String> backupFrequency,
      Value<bool> cloudBackup,
      Value<String> uiTheme,
      Value<String> fontSize,
    });

class $SystemConfigFilterComposer
    extends Composer<_$AppDatabase, SystemConfig> {
  $SystemConfigFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateFormat => $composableBuilder(
    column: $table.dateFormat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calendarType => $composableBuilder(
    column: $table.calendarType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountNumberType => $composableBuilder(
    column: $table.accountNumberType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accountNumberLength => $composableBuilder(
    column: $table.accountNumberLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get costCenterPolicy => $composableBuilder(
    column: $table.costCenterPolicy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectPolicy => $composableBuilder(
    column: $table.projectPolicy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get passwordMinLength => $composableBuilder(
    column: $table.passwordMinLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get autoLockTimeout => $composableBuilder(
    column: $table.autoLockTimeout,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get useVat => $composableBuilder(
    column: $table.useVat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get useTds => $composableBuilder(
    column: $table.useTds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get useEInvoice => $composableBuilder(
    column: $table.useEInvoice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get priceIncludesTax => $composableBuilder(
    column: $table.priceIncludesTax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backupFrequency => $composableBuilder(
    column: $table.backupFrequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get cloudBackup => $composableBuilder(
    column: $table.cloudBackup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uiTheme => $composableBuilder(
    column: $table.uiTheme,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fontSize => $composableBuilder(
    column: $table.fontSize,
    builder: (column) => ColumnFilters(column),
  );
}

class $SystemConfigOrderingComposer
    extends Composer<_$AppDatabase, SystemConfig> {
  $SystemConfigOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateFormat => $composableBuilder(
    column: $table.dateFormat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calendarType => $composableBuilder(
    column: $table.calendarType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountNumberType => $composableBuilder(
    column: $table.accountNumberType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accountNumberLength => $composableBuilder(
    column: $table.accountNumberLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get costCenterPolicy => $composableBuilder(
    column: $table.costCenterPolicy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectPolicy => $composableBuilder(
    column: $table.projectPolicy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get passwordMinLength => $composableBuilder(
    column: $table.passwordMinLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get autoLockTimeout => $composableBuilder(
    column: $table.autoLockTimeout,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get useVat => $composableBuilder(
    column: $table.useVat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get useTds => $composableBuilder(
    column: $table.useTds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get useEInvoice => $composableBuilder(
    column: $table.useEInvoice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get priceIncludesTax => $composableBuilder(
    column: $table.priceIncludesTax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backupFrequency => $composableBuilder(
    column: $table.backupFrequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get cloudBackup => $composableBuilder(
    column: $table.cloudBackup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uiTheme => $composableBuilder(
    column: $table.uiTheme,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fontSize => $composableBuilder(
    column: $table.fontSize,
    builder: (column) => ColumnOrderings(column),
  );
}

class $SystemConfigAnnotationComposer
    extends Composer<_$AppDatabase, SystemConfig> {
  $SystemConfigAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get dateFormat => $composableBuilder(
    column: $table.dateFormat,
    builder: (column) => column,
  );

  GeneratedColumn<String> get calendarType => $composableBuilder(
    column: $table.calendarType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountNumberType => $composableBuilder(
    column: $table.accountNumberType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get accountNumberLength => $composableBuilder(
    column: $table.accountNumberLength,
    builder: (column) => column,
  );

  GeneratedColumn<String> get costCenterPolicy => $composableBuilder(
    column: $table.costCenterPolicy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get projectPolicy => $composableBuilder(
    column: $table.projectPolicy,
    builder: (column) => column,
  );

  GeneratedColumn<int> get passwordMinLength => $composableBuilder(
    column: $table.passwordMinLength,
    builder: (column) => column,
  );

  GeneratedColumn<int> get autoLockTimeout => $composableBuilder(
    column: $table.autoLockTimeout,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get useVat =>
      $composableBuilder(column: $table.useVat, builder: (column) => column);

  GeneratedColumn<bool> get useTds =>
      $composableBuilder(column: $table.useTds, builder: (column) => column);

  GeneratedColumn<bool> get useEInvoice => $composableBuilder(
    column: $table.useEInvoice,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get priceIncludesTax => $composableBuilder(
    column: $table.priceIncludesTax,
    builder: (column) => column,
  );

  GeneratedColumn<String> get backupFrequency => $composableBuilder(
    column: $table.backupFrequency,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get cloudBackup => $composableBuilder(
    column: $table.cloudBackup,
    builder: (column) => column,
  );

  GeneratedColumn<String> get uiTheme =>
      $composableBuilder(column: $table.uiTheme, builder: (column) => column);

  GeneratedColumn<String> get fontSize =>
      $composableBuilder(column: $table.fontSize, builder: (column) => column);
}

class $SystemConfigTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          SystemConfig,
          SystemConfigData,
          $SystemConfigFilterComposer,
          $SystemConfigOrderingComposer,
          $SystemConfigAnnotationComposer,
          $SystemConfigCreateCompanionBuilder,
          $SystemConfigUpdateCompanionBuilder,
          (
            SystemConfigData,
            BaseReferences<_$AppDatabase, SystemConfig, SystemConfigData>,
          ),
          SystemConfigData,
          PrefetchHooks Function()
        > {
  $SystemConfigTableManager(_$AppDatabase db, SystemConfig table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $SystemConfigFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $SystemConfigOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $SystemConfigAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> dateFormat = const Value.absent(),
                Value<String> calendarType = const Value.absent(),
                Value<String> accountNumberType = const Value.absent(),
                Value<int> accountNumberLength = const Value.absent(),
                Value<String> costCenterPolicy = const Value.absent(),
                Value<String> projectPolicy = const Value.absent(),
                Value<int> passwordMinLength = const Value.absent(),
                Value<int> autoLockTimeout = const Value.absent(),
                Value<bool> useVat = const Value.absent(),
                Value<bool> useTds = const Value.absent(),
                Value<bool> useEInvoice = const Value.absent(),
                Value<bool> priceIncludesTax = const Value.absent(),
                Value<String> backupFrequency = const Value.absent(),
                Value<bool> cloudBackup = const Value.absent(),
                Value<String> uiTheme = const Value.absent(),
                Value<String> fontSize = const Value.absent(),
              }) => SystemConfigCompanion(
                id: id,
                language: language,
                dateFormat: dateFormat,
                calendarType: calendarType,
                accountNumberType: accountNumberType,
                accountNumberLength: accountNumberLength,
                costCenterPolicy: costCenterPolicy,
                projectPolicy: projectPolicy,
                passwordMinLength: passwordMinLength,
                autoLockTimeout: autoLockTimeout,
                useVat: useVat,
                useTds: useTds,
                useEInvoice: useEInvoice,
                priceIncludesTax: priceIncludesTax,
                backupFrequency: backupFrequency,
                cloudBackup: cloudBackup,
                uiTheme: uiTheme,
                fontSize: fontSize,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> dateFormat = const Value.absent(),
                Value<String> calendarType = const Value.absent(),
                Value<String> accountNumberType = const Value.absent(),
                Value<int> accountNumberLength = const Value.absent(),
                Value<String> costCenterPolicy = const Value.absent(),
                Value<String> projectPolicy = const Value.absent(),
                Value<int> passwordMinLength = const Value.absent(),
                Value<int> autoLockTimeout = const Value.absent(),
                Value<bool> useVat = const Value.absent(),
                Value<bool> useTds = const Value.absent(),
                Value<bool> useEInvoice = const Value.absent(),
                Value<bool> priceIncludesTax = const Value.absent(),
                Value<String> backupFrequency = const Value.absent(),
                Value<bool> cloudBackup = const Value.absent(),
                Value<String> uiTheme = const Value.absent(),
                Value<String> fontSize = const Value.absent(),
              }) => SystemConfigCompanion.insert(
                id: id,
                language: language,
                dateFormat: dateFormat,
                calendarType: calendarType,
                accountNumberType: accountNumberType,
                accountNumberLength: accountNumberLength,
                costCenterPolicy: costCenterPolicy,
                projectPolicy: projectPolicy,
                passwordMinLength: passwordMinLength,
                autoLockTimeout: autoLockTimeout,
                useVat: useVat,
                useTds: useTds,
                useEInvoice: useEInvoice,
                priceIncludesTax: priceIncludesTax,
                backupFrequency: backupFrequency,
                cloudBackup: cloudBackup,
                uiTheme: uiTheme,
                fontSize: fontSize,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $SystemConfigProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      SystemConfig,
      SystemConfigData,
      $SystemConfigFilterComposer,
      $SystemConfigOrderingComposer,
      $SystemConfigAnnotationComposer,
      $SystemConfigCreateCompanionBuilder,
      $SystemConfigUpdateCompanionBuilder,
      (
        SystemConfigData,
        BaseReferences<_$AppDatabase, SystemConfig, SystemConfigData>,
      ),
      SystemConfigData,
      PrefetchHooks Function()
    >;
typedef $CompanyInfoCreateCompanionBuilder =
    CompanyInfoCompanion Function({
      Value<int> id,
      required String nameAr,
      required String nameEn,
      Value<String?> addressAr,
      Value<String?> addressEn,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> website,
      Value<String?> taxNumber,
      Value<String?> commercialRegNo,
    });
typedef $CompanyInfoUpdateCompanionBuilder =
    CompanyInfoCompanion Function({
      Value<int> id,
      Value<String> nameAr,
      Value<String> nameEn,
      Value<String?> addressAr,
      Value<String?> addressEn,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> website,
      Value<String?> taxNumber,
      Value<String?> commercialRegNo,
    });

class $CompanyInfoFilterComposer extends Composer<_$AppDatabase, CompanyInfo> {
  $CompanyInfoFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressAr => $composableBuilder(
    column: $table.addressAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressEn => $composableBuilder(
    column: $table.addressEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxNumber => $composableBuilder(
    column: $table.taxNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commercialRegNo => $composableBuilder(
    column: $table.commercialRegNo,
    builder: (column) => ColumnFilters(column),
  );
}

class $CompanyInfoOrderingComposer
    extends Composer<_$AppDatabase, CompanyInfo> {
  $CompanyInfoOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressAr => $composableBuilder(
    column: $table.addressAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressEn => $composableBuilder(
    column: $table.addressEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxNumber => $composableBuilder(
    column: $table.taxNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commercialRegNo => $composableBuilder(
    column: $table.commercialRegNo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CompanyInfoAnnotationComposer
    extends Composer<_$AppDatabase, CompanyInfo> {
  $CompanyInfoAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get addressAr =>
      $composableBuilder(column: $table.addressAr, builder: (column) => column);

  GeneratedColumn<String> get addressEn =>
      $composableBuilder(column: $table.addressEn, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get taxNumber =>
      $composableBuilder(column: $table.taxNumber, builder: (column) => column);

  GeneratedColumn<String> get commercialRegNo => $composableBuilder(
    column: $table.commercialRegNo,
    builder: (column) => column,
  );
}

class $CompanyInfoTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          CompanyInfo,
          CompanyInfoData,
          $CompanyInfoFilterComposer,
          $CompanyInfoOrderingComposer,
          $CompanyInfoAnnotationComposer,
          $CompanyInfoCreateCompanionBuilder,
          $CompanyInfoUpdateCompanionBuilder,
          (
            CompanyInfoData,
            BaseReferences<_$AppDatabase, CompanyInfo, CompanyInfoData>,
          ),
          CompanyInfoData,
          PrefetchHooks Function()
        > {
  $CompanyInfoTableManager(_$AppDatabase db, CompanyInfo table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CompanyInfoFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CompanyInfoOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CompanyInfoAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nameAr = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<String?> addressAr = const Value.absent(),
                Value<String?> addressEn = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> website = const Value.absent(),
                Value<String?> taxNumber = const Value.absent(),
                Value<String?> commercialRegNo = const Value.absent(),
              }) => CompanyInfoCompanion(
                id: id,
                nameAr: nameAr,
                nameEn: nameEn,
                addressAr: addressAr,
                addressEn: addressEn,
                phone: phone,
                email: email,
                website: website,
                taxNumber: taxNumber,
                commercialRegNo: commercialRegNo,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nameAr,
                required String nameEn,
                Value<String?> addressAr = const Value.absent(),
                Value<String?> addressEn = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> website = const Value.absent(),
                Value<String?> taxNumber = const Value.absent(),
                Value<String?> commercialRegNo = const Value.absent(),
              }) => CompanyInfoCompanion.insert(
                id: id,
                nameAr: nameAr,
                nameEn: nameEn,
                addressAr: addressAr,
                addressEn: addressEn,
                phone: phone,
                email: email,
                website: website,
                taxNumber: taxNumber,
                commercialRegNo: commercialRegNo,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CompanyInfoProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      CompanyInfo,
      CompanyInfoData,
      $CompanyInfoFilterComposer,
      $CompanyInfoOrderingComposer,
      $CompanyInfoAnnotationComposer,
      $CompanyInfoCreateCompanionBuilder,
      $CompanyInfoUpdateCompanionBuilder,
      (
        CompanyInfoData,
        BaseReferences<_$AppDatabase, CompanyInfo, CompanyInfoData>,
      ),
      CompanyInfoData,
      PrefetchHooks Function()
    >;
typedef $AccountsCreateCompanionBuilder =
    AccountsCompanion Function({
      Value<int> id,
      Value<int?> parentId,
      required String accountCode,
      required String nameAr,
      required String nameEn,
      required int level,
      required String type,
      Value<bool> isActive,
    });
typedef $AccountsUpdateCompanionBuilder =
    AccountsCompanion Function({
      Value<int> id,
      Value<int?> parentId,
      Value<String> accountCode,
      Value<String> nameAr,
      Value<String> nameEn,
      Value<int> level,
      Value<String> type,
      Value<bool> isActive,
    });

class $AccountsFilterComposer extends Composer<_$AppDatabase, Accounts> {
  $AccountsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountCode => $composableBuilder(
    column: $table.accountCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $AccountsOrderingComposer extends Composer<_$AppDatabase, Accounts> {
  $AccountsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountCode => $composableBuilder(
    column: $table.accountCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $AccountsAnnotationComposer extends Composer<_$AppDatabase, Accounts> {
  $AccountsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get accountCode => $composableBuilder(
    column: $table.accountCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $AccountsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Accounts,
          Account,
          $AccountsFilterComposer,
          $AccountsOrderingComposer,
          $AccountsAnnotationComposer,
          $AccountsCreateCompanionBuilder,
          $AccountsUpdateCompanionBuilder,
          (Account, BaseReferences<_$AppDatabase, Accounts, Account>),
          Account,
          PrefetchHooks Function()
        > {
  $AccountsTableManager(_$AppDatabase db, Accounts table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AccountsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AccountsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AccountsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<String> accountCode = const Value.absent(),
                Value<String> nameAr = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => AccountsCompanion(
                id: id,
                parentId: parentId,
                accountCode: accountCode,
                nameAr: nameAr,
                nameEn: nameEn,
                level: level,
                type: type,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                required String accountCode,
                required String nameAr,
                required String nameEn,
                required int level,
                required String type,
                Value<bool> isActive = const Value.absent(),
              }) => AccountsCompanion.insert(
                id: id,
                parentId: parentId,
                accountCode: accountCode,
                nameAr: nameAr,
                nameEn: nameEn,
                level: level,
                type: type,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $AccountsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Accounts,
      Account,
      $AccountsFilterComposer,
      $AccountsOrderingComposer,
      $AccountsAnnotationComposer,
      $AccountsCreateCompanionBuilder,
      $AccountsUpdateCompanionBuilder,
      (Account, BaseReferences<_$AppDatabase, Accounts, Account>),
      Account,
      PrefetchHooks Function()
    >;
typedef $RolesCreateCompanionBuilder =
    RolesCompanion Function({
      Value<int> id,
      required String nameAr,
      required String nameEn,
      Value<String?> description,
      Value<bool> isActive,
    });
typedef $RolesUpdateCompanionBuilder =
    RolesCompanion Function({
      Value<int> id,
      Value<String> nameAr,
      Value<String> nameEn,
      Value<String?> description,
      Value<bool> isActive,
    });

class $RolesFilterComposer extends Composer<_$AppDatabase, Roles> {
  $RolesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $RolesOrderingComposer extends Composer<_$AppDatabase, Roles> {
  $RolesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $RolesAnnotationComposer extends Composer<_$AppDatabase, Roles> {
  $RolesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $RolesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Roles,
          Role,
          $RolesFilterComposer,
          $RolesOrderingComposer,
          $RolesAnnotationComposer,
          $RolesCreateCompanionBuilder,
          $RolesUpdateCompanionBuilder,
          (Role, BaseReferences<_$AppDatabase, Roles, Role>),
          Role,
          PrefetchHooks Function()
        > {
  $RolesTableManager(_$AppDatabase db, Roles table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $RolesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $RolesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $RolesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nameAr = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => RolesCompanion(
                id: id,
                nameAr: nameAr,
                nameEn: nameEn,
                description: description,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nameAr,
                required String nameEn,
                Value<String?> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => RolesCompanion.insert(
                id: id,
                nameAr: nameAr,
                nameEn: nameEn,
                description: description,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $RolesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Roles,
      Role,
      $RolesFilterComposer,
      $RolesOrderingComposer,
      $RolesAnnotationComposer,
      $RolesCreateCompanionBuilder,
      $RolesUpdateCompanionBuilder,
      (Role, BaseReferences<_$AppDatabase, Roles, Role>),
      Role,
      PrefetchHooks Function()
    >;
typedef $UsersCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> userId,
      required String username,
      required String passwordHash,
      required String fullNameAr,
      required String fullNameEn,
      Value<String?> email,
      Value<int?> assignedBranchId,
      Value<int?> employeeId,
      Value<bool> isActive,
    });
typedef $UsersUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> userId,
      Value<String> username,
      Value<String> passwordHash,
      Value<String> fullNameAr,
      Value<String> fullNameEn,
      Value<String?> email,
      Value<int?> assignedBranchId,
      Value<int?> employeeId,
      Value<bool> isActive,
    });

class $UsersFilterComposer extends Composer<_$AppDatabase, Users> {
  $UsersFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullNameAr => $composableBuilder(
    column: $table.fullNameAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullNameEn => $composableBuilder(
    column: $table.fullNameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get assignedBranchId => $composableBuilder(
    column: $table.assignedBranchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get employeeId => $composableBuilder(
    column: $table.employeeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $UsersOrderingComposer extends Composer<_$AppDatabase, Users> {
  $UsersOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullNameAr => $composableBuilder(
    column: $table.fullNameAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullNameEn => $composableBuilder(
    column: $table.fullNameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get assignedBranchId => $composableBuilder(
    column: $table.assignedBranchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get employeeId => $composableBuilder(
    column: $table.employeeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $UsersAnnotationComposer extends Composer<_$AppDatabase, Users> {
  $UsersAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fullNameAr => $composableBuilder(
    column: $table.fullNameAr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fullNameEn => $composableBuilder(
    column: $table.fullNameEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<int> get assignedBranchId => $composableBuilder(
    column: $table.assignedBranchId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get employeeId => $composableBuilder(
    column: $table.employeeId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $UsersTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Users,
          User,
          $UsersFilterComposer,
          $UsersOrderingComposer,
          $UsersAnnotationComposer,
          $UsersCreateCompanionBuilder,
          $UsersUpdateCompanionBuilder,
          (User, BaseReferences<_$AppDatabase, Users, User>),
          User,
          PrefetchHooks Function()
        > {
  $UsersTableManager(_$AppDatabase db, Users table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $UsersFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $UsersOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $UsersAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<String> fullNameAr = const Value.absent(),
                Value<String> fullNameEn = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<int?> assignedBranchId = const Value.absent(),
                Value<int?> employeeId = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => UsersCompanion(
                userId: userId,
                username: username,
                passwordHash: passwordHash,
                fullNameAr: fullNameAr,
                fullNameEn: fullNameEn,
                email: email,
                assignedBranchId: assignedBranchId,
                employeeId: employeeId,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                required String username,
                required String passwordHash,
                required String fullNameAr,
                required String fullNameEn,
                Value<String?> email = const Value.absent(),
                Value<int?> assignedBranchId = const Value.absent(),
                Value<int?> employeeId = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => UsersCompanion.insert(
                userId: userId,
                username: username,
                passwordHash: passwordHash,
                fullNameAr: fullNameAr,
                fullNameEn: fullNameEn,
                email: email,
                assignedBranchId: assignedBranchId,
                employeeId: employeeId,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $UsersProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Users,
      User,
      $UsersFilterComposer,
      $UsersOrderingComposer,
      $UsersAnnotationComposer,
      $UsersCreateCompanionBuilder,
      $UsersUpdateCompanionBuilder,
      (User, BaseReferences<_$AppDatabase, Users, User>),
      User,
      PrefetchHooks Function()
    >;
typedef $UserRolesCreateCompanionBuilder =
    UserRolesCompanion Function({
      required int userId,
      required int roleId,
      Value<int> rowid,
    });
typedef $UserRolesUpdateCompanionBuilder =
    UserRolesCompanion Function({
      Value<int> userId,
      Value<int> roleId,
      Value<int> rowid,
    });

class $UserRolesFilterComposer extends Composer<_$AppDatabase, UserRoles> {
  $UserRolesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get roleId => $composableBuilder(
    column: $table.roleId,
    builder: (column) => ColumnFilters(column),
  );
}

class $UserRolesOrderingComposer extends Composer<_$AppDatabase, UserRoles> {
  $UserRolesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get roleId => $composableBuilder(
    column: $table.roleId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $UserRolesAnnotationComposer extends Composer<_$AppDatabase, UserRoles> {
  $UserRolesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get roleId =>
      $composableBuilder(column: $table.roleId, builder: (column) => column);
}

class $UserRolesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          UserRoles,
          UserRole,
          $UserRolesFilterComposer,
          $UserRolesOrderingComposer,
          $UserRolesAnnotationComposer,
          $UserRolesCreateCompanionBuilder,
          $UserRolesUpdateCompanionBuilder,
          (UserRole, BaseReferences<_$AppDatabase, UserRoles, UserRole>),
          UserRole,
          PrefetchHooks Function()
        > {
  $UserRolesTableManager(_$AppDatabase db, UserRoles table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $UserRolesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $UserRolesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $UserRolesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<int> roleId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserRolesCompanion(
                userId: userId,
                roleId: roleId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int userId,
                required int roleId,
                Value<int> rowid = const Value.absent(),
              }) => UserRolesCompanion.insert(
                userId: userId,
                roleId: roleId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $UserRolesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      UserRoles,
      UserRole,
      $UserRolesFilterComposer,
      $UserRolesOrderingComposer,
      $UserRolesAnnotationComposer,
      $UserRolesCreateCompanionBuilder,
      $UserRolesUpdateCompanionBuilder,
      (UserRole, BaseReferences<_$AppDatabase, UserRoles, UserRole>),
      UserRole,
      PrefetchHooks Function()
    >;
typedef $RolePermissionsCreateCompanionBuilder =
    RolePermissionsCompanion Function({
      required int roleId,
      required String permissionKey,
      Value<int> rowid,
    });
typedef $RolePermissionsUpdateCompanionBuilder =
    RolePermissionsCompanion Function({
      Value<int> roleId,
      Value<String> permissionKey,
      Value<int> rowid,
    });

class $RolePermissionsFilterComposer
    extends Composer<_$AppDatabase, RolePermissions> {
  $RolePermissionsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get roleId => $composableBuilder(
    column: $table.roleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get permissionKey => $composableBuilder(
    column: $table.permissionKey,
    builder: (column) => ColumnFilters(column),
  );
}

class $RolePermissionsOrderingComposer
    extends Composer<_$AppDatabase, RolePermissions> {
  $RolePermissionsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get roleId => $composableBuilder(
    column: $table.roleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get permissionKey => $composableBuilder(
    column: $table.permissionKey,
    builder: (column) => ColumnOrderings(column),
  );
}

class $RolePermissionsAnnotationComposer
    extends Composer<_$AppDatabase, RolePermissions> {
  $RolePermissionsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get roleId =>
      $composableBuilder(column: $table.roleId, builder: (column) => column);

  GeneratedColumn<String> get permissionKey => $composableBuilder(
    column: $table.permissionKey,
    builder: (column) => column,
  );
}

class $RolePermissionsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          RolePermissions,
          RolePermission,
          $RolePermissionsFilterComposer,
          $RolePermissionsOrderingComposer,
          $RolePermissionsAnnotationComposer,
          $RolePermissionsCreateCompanionBuilder,
          $RolePermissionsUpdateCompanionBuilder,
          (
            RolePermission,
            BaseReferences<_$AppDatabase, RolePermissions, RolePermission>,
          ),
          RolePermission,
          PrefetchHooks Function()
        > {
  $RolePermissionsTableManager(_$AppDatabase db, RolePermissions table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $RolePermissionsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $RolePermissionsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $RolePermissionsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> roleId = const Value.absent(),
                Value<String> permissionKey = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RolePermissionsCompanion(
                roleId: roleId,
                permissionKey: permissionKey,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int roleId,
                required String permissionKey,
                Value<int> rowid = const Value.absent(),
              }) => RolePermissionsCompanion.insert(
                roleId: roleId,
                permissionKey: permissionKey,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $RolePermissionsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      RolePermissions,
      RolePermission,
      $RolePermissionsFilterComposer,
      $RolePermissionsOrderingComposer,
      $RolePermissionsAnnotationComposer,
      $RolePermissionsCreateCompanionBuilder,
      $RolePermissionsUpdateCompanionBuilder,
      (
        RolePermission,
        BaseReferences<_$AppDatabase, RolePermissions, RolePermission>,
      ),
      RolePermission,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $SystemConfigTableManager get systemConfig =>
      $SystemConfigTableManager(_db, _db.systemConfig);
  $CompanyInfoTableManager get companyInfo =>
      $CompanyInfoTableManager(_db, _db.companyInfo);
  $AccountsTableManager get accounts =>
      $AccountsTableManager(_db, _db.accounts);
  $RolesTableManager get roles => $RolesTableManager(_db, _db.roles);
  $UsersTableManager get users => $UsersTableManager(_db, _db.users);
  $UserRolesTableManager get userRoles =>
      $UserRolesTableManager(_db, _db.userRoles);
  $RolePermissionsTableManager get rolePermissions =>
      $RolePermissionsTableManager(_db, _db.rolePermissions);
}
