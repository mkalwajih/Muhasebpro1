// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class AccountTypes extends Table with TableInfo<AccountTypes, AccountType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AccountTypes(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _typeCodeMeta =
      const VerificationMeta('typeCode');
  late final GeneratedColumn<String> typeCode = GeneratedColumn<String>(
      'type_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _isTransactionLevelMeta =
      const VerificationMeta('isTransactionLevel');
  late final GeneratedColumn<bool> isTransactionLevel = GeneratedColumn<bool>(
      'is_transaction_level', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  @override
  List<GeneratedColumn> get $columns =>
      [typeCode, nameAr, nameEn, level, isTransactionLevel];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_types';
  @override
  VerificationContext validateIntegrity(Insertable<AccountType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('type_code')) {
      context.handle(_typeCodeMeta,
          typeCode.isAcceptableOrUnknown(data['type_code']!, _typeCodeMeta));
    } else if (isInserting) {
      context.missing(_typeCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('is_transaction_level')) {
      context.handle(
          _isTransactionLevelMeta,
          isTransactionLevel.isAcceptableOrUnknown(
              data['is_transaction_level']!, _isTransactionLevelMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {typeCode};
  @override
  AccountType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountType(
      typeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      isTransactionLevel: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_transaction_level'])!,
    );
  }

  @override
  AccountTypes createAlias(String alias) {
    return AccountTypes(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AccountType extends DataClass implements Insertable<AccountType> {
  final String typeCode;
  final String nameAr;
  final String nameEn;
  final int level;
  final bool isTransactionLevel;
  const AccountType(
      {required this.typeCode,
      required this.nameAr,
      required this.nameEn,
      required this.level,
      required this.isTransactionLevel});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['type_code'] = Variable<String>(typeCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['level'] = Variable<int>(level);
    map['is_transaction_level'] = Variable<bool>(isTransactionLevel);
    return map;
  }

  AccountTypesCompanion toCompanion(bool nullToAbsent) {
    return AccountTypesCompanion(
      typeCode: Value(typeCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      level: Value(level),
      isTransactionLevel: Value(isTransactionLevel),
    );
  }

  factory AccountType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountType(
      typeCode: serializer.fromJson<String>(json['type_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      level: serializer.fromJson<int>(json['level']),
      isTransactionLevel:
          serializer.fromJson<bool>(json['is_transaction_level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type_code': serializer.toJson<String>(typeCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'level': serializer.toJson<int>(level),
      'is_transaction_level': serializer.toJson<bool>(isTransactionLevel),
    };
  }

  AccountType copyWith(
          {String? typeCode,
          String? nameAr,
          String? nameEn,
          int? level,
          bool? isTransactionLevel}) =>
      AccountType(
        typeCode: typeCode ?? this.typeCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        level: level ?? this.level,
        isTransactionLevel: isTransactionLevel ?? this.isTransactionLevel,
      );
  AccountType copyWithCompanion(AccountTypesCompanion data) {
    return AccountType(
      typeCode: data.typeCode.present ? data.typeCode.value : this.typeCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      level: data.level.present ? data.level.value : this.level,
      isTransactionLevel: data.isTransactionLevel.present
          ? data.isTransactionLevel.value
          : this.isTransactionLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountType(')
          ..write('typeCode: $typeCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('level: $level, ')
          ..write('isTransactionLevel: $isTransactionLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(typeCode, nameAr, nameEn, level, isTransactionLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountType &&
          other.typeCode == this.typeCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.level == this.level &&
          other.isTransactionLevel == this.isTransactionLevel);
}

class AccountTypesCompanion extends UpdateCompanion<AccountType> {
  final Value<String> typeCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<int> level;
  final Value<bool> isTransactionLevel;
  final Value<int> rowid;
  const AccountTypesCompanion({
    this.typeCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.level = const Value.absent(),
    this.isTransactionLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountTypesCompanion.insert({
    required String typeCode,
    required String nameAr,
    required String nameEn,
    required int level,
    this.isTransactionLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : typeCode = Value(typeCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        level = Value(level);
  static Insertable<AccountType> custom({
    Expression<String>? typeCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<int>? level,
    Expression<bool>? isTransactionLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (typeCode != null) 'type_code': typeCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (level != null) 'level': level,
      if (isTransactionLevel != null)
        'is_transaction_level': isTransactionLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountTypesCompanion copyWith(
      {Value<String>? typeCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<int>? level,
      Value<bool>? isTransactionLevel,
      Value<int>? rowid}) {
    return AccountTypesCompanion(
      typeCode: typeCode ?? this.typeCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      level: level ?? this.level,
      isTransactionLevel: isTransactionLevel ?? this.isTransactionLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (typeCode.present) {
      map['type_code'] = Variable<String>(typeCode.value);
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
    if (isTransactionLevel.present) {
      map['is_transaction_level'] = Variable<bool>(isTransactionLevel.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountTypesCompanion(')
          ..write('typeCode: $typeCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('level: $level, ')
          ..write('isTransactionLevel: $isTransactionLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class AccountGroups extends Table with TableInfo<AccountGroups, AccountGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AccountGroups(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupCodeMeta =
      const VerificationMeta('groupCode');
  late final GeneratedColumn<String> groupCode = GeneratedColumn<String>(
      'group_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [groupCode, nameAr, nameEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_groups';
  @override
  VerificationContext validateIntegrity(Insertable<AccountGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group_code')) {
      context.handle(_groupCodeMeta,
          groupCode.isAcceptableOrUnknown(data['group_code']!, _groupCodeMeta));
    } else if (isInserting) {
      context.missing(_groupCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {groupCode};
  @override
  AccountGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountGroup(
      groupCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
    );
  }

  @override
  AccountGroups createAlias(String alias) {
    return AccountGroups(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AccountGroup extends DataClass implements Insertable<AccountGroup> {
  final String groupCode;
  final String nameAr;
  final String nameEn;
  const AccountGroup(
      {required this.groupCode, required this.nameAr, required this.nameEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group_code'] = Variable<String>(groupCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    return map;
  }

  AccountGroupsCompanion toCompanion(bool nullToAbsent) {
    return AccountGroupsCompanion(
      groupCode: Value(groupCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
    );
  }

  factory AccountGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountGroup(
      groupCode: serializer.fromJson<String>(json['group_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'group_code': serializer.toJson<String>(groupCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
    };
  }

  AccountGroup copyWith({String? groupCode, String? nameAr, String? nameEn}) =>
      AccountGroup(
        groupCode: groupCode ?? this.groupCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
      );
  AccountGroup copyWithCompanion(AccountGroupsCompanion data) {
    return AccountGroup(
      groupCode: data.groupCode.present ? data.groupCode.value : this.groupCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountGroup(')
          ..write('groupCode: $groupCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(groupCode, nameAr, nameEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountGroup &&
          other.groupCode == this.groupCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn);
}

class AccountGroupsCompanion extends UpdateCompanion<AccountGroup> {
  final Value<String> groupCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<int> rowid;
  const AccountGroupsCompanion({
    this.groupCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountGroupsCompanion.insert({
    required String groupCode,
    required String nameAr,
    required String nameEn,
    this.rowid = const Value.absent(),
  })  : groupCode = Value(groupCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn);
  static Insertable<AccountGroup> custom({
    Expression<String>? groupCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (groupCode != null) 'group_code': groupCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountGroupsCompanion copyWith(
      {Value<String>? groupCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<int>? rowid}) {
    return AccountGroupsCompanion(
      groupCode: groupCode ?? this.groupCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (groupCode.present) {
      map['group_code'] = Variable<String>(groupCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountGroupsCompanion(')
          ..write('groupCode: $groupCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Classifications extends Table
    with TableInfo<Classifications, Classification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Classifications(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _classCodeMeta =
      const VerificationMeta('classCode');
  late final GeneratedColumn<String> classCode = GeneratedColumn<String>(
      'class_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [classCode, nameAr, nameEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'classifications';
  @override
  VerificationContext validateIntegrity(Insertable<Classification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('class_code')) {
      context.handle(_classCodeMeta,
          classCode.isAcceptableOrUnknown(data['class_code']!, _classCodeMeta));
    } else if (isInserting) {
      context.missing(_classCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {classCode};
  @override
  Classification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Classification(
      classCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}class_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
    );
  }

  @override
  Classifications createAlias(String alias) {
    return Classifications(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Classification extends DataClass implements Insertable<Classification> {
  final String classCode;
  final String nameAr;
  final String nameEn;
  const Classification(
      {required this.classCode, required this.nameAr, required this.nameEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['class_code'] = Variable<String>(classCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    return map;
  }

  ClassificationsCompanion toCompanion(bool nullToAbsent) {
    return ClassificationsCompanion(
      classCode: Value(classCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
    );
  }

  factory Classification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Classification(
      classCode: serializer.fromJson<String>(json['class_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'class_code': serializer.toJson<String>(classCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
    };
  }

  Classification copyWith(
          {String? classCode, String? nameAr, String? nameEn}) =>
      Classification(
        classCode: classCode ?? this.classCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
      );
  Classification copyWithCompanion(ClassificationsCompanion data) {
    return Classification(
      classCode: data.classCode.present ? data.classCode.value : this.classCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Classification(')
          ..write('classCode: $classCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(classCode, nameAr, nameEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Classification &&
          other.classCode == this.classCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn);
}

class ClassificationsCompanion extends UpdateCompanion<Classification> {
  final Value<String> classCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<int> rowid;
  const ClassificationsCompanion({
    this.classCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClassificationsCompanion.insert({
    required String classCode,
    required String nameAr,
    required String nameEn,
    this.rowid = const Value.absent(),
  })  : classCode = Value(classCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn);
  static Insertable<Classification> custom({
    Expression<String>? classCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (classCode != null) 'class_code': classCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClassificationsCompanion copyWith(
      {Value<String>? classCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<int>? rowid}) {
    return ClassificationsCompanion(
      classCode: classCode ?? this.classCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (classCode.present) {
      map['class_code'] = Variable<String>(classCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClassificationsCompanion(')
          ..write('classCode: $classCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ReportTypes extends Table with TableInfo<ReportTypes, ReportType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ReportTypes(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _reportCodeMeta =
      const VerificationMeta('reportCode');
  late final GeneratedColumn<String> reportCode = GeneratedColumn<String>(
      'report_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [reportCode, nameAr, nameEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'report_types';
  @override
  VerificationContext validateIntegrity(Insertable<ReportType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('report_code')) {
      context.handle(
          _reportCodeMeta,
          reportCode.isAcceptableOrUnknown(
              data['report_code']!, _reportCodeMeta));
    } else if (isInserting) {
      context.missing(_reportCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reportCode};
  @override
  ReportType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReportType(
      reportCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}report_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
    );
  }

  @override
  ReportTypes createAlias(String alias) {
    return ReportTypes(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ReportType extends DataClass implements Insertable<ReportType> {
  final String reportCode;
  final String nameAr;
  final String nameEn;
  const ReportType(
      {required this.reportCode, required this.nameAr, required this.nameEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['report_code'] = Variable<String>(reportCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    return map;
  }

  ReportTypesCompanion toCompanion(bool nullToAbsent) {
    return ReportTypesCompanion(
      reportCode: Value(reportCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
    );
  }

  factory ReportType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReportType(
      reportCode: serializer.fromJson<String>(json['report_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'report_code': serializer.toJson<String>(reportCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
    };
  }

  ReportType copyWith({String? reportCode, String? nameAr, String? nameEn}) =>
      ReportType(
        reportCode: reportCode ?? this.reportCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
      );
  ReportType copyWithCompanion(ReportTypesCompanion data) {
    return ReportType(
      reportCode:
          data.reportCode.present ? data.reportCode.value : this.reportCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReportType(')
          ..write('reportCode: $reportCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(reportCode, nameAr, nameEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReportType &&
          other.reportCode == this.reportCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn);
}

class ReportTypesCompanion extends UpdateCompanion<ReportType> {
  final Value<String> reportCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<int> rowid;
  const ReportTypesCompanion({
    this.reportCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReportTypesCompanion.insert({
    required String reportCode,
    required String nameAr,
    required String nameEn,
    this.rowid = const Value.absent(),
  })  : reportCode = Value(reportCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn);
  static Insertable<ReportType> custom({
    Expression<String>? reportCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (reportCode != null) 'report_code': reportCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReportTypesCompanion copyWith(
      {Value<String>? reportCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<int>? rowid}) {
    return ReportTypesCompanion(
      reportCode: reportCode ?? this.reportCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (reportCode.present) {
      map['report_code'] = Variable<String>(reportCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportTypesCompanion(')
          ..write('reportCode: $reportCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ChartOfAccounts extends Table
    with TableInfo<ChartOfAccounts, ChartOfAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ChartOfAccounts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _accountCodeMeta =
      const VerificationMeta('accountCode');
  late final GeneratedColumn<String> accountCode = GeneratedColumn<String>(
      'account_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _accountNameArMeta =
      const VerificationMeta('accountNameAr');
  late final GeneratedColumn<String> accountNameAr = GeneratedColumn<String>(
      'account_name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _accountNameEnMeta =
      const VerificationMeta('accountNameEn');
  late final GeneratedColumn<String> accountNameEn = GeneratedColumn<String>(
      'account_name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _accountTypeCodeMeta =
      const VerificationMeta('accountTypeCode');
  late final GeneratedColumn<String> accountTypeCode = GeneratedColumn<String>(
      'account_type_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES account_types(type_code)');
  static const VerificationMeta _accountGroupCodeMeta =
      const VerificationMeta('accountGroupCode');
  late final GeneratedColumn<String> accountGroupCode = GeneratedColumn<String>(
      'account_group_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES account_groups(group_code)');
  static const VerificationMeta _classificationCodeMeta =
      const VerificationMeta('classificationCode');
  late final GeneratedColumn<String> classificationCode =
      GeneratedColumn<String>('classification_code', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: 'REFERENCES classifications(class_code)');
  static const VerificationMeta _reportTypeCodeMeta =
      const VerificationMeta('reportTypeCode');
  late final GeneratedColumn<String> reportTypeCode = GeneratedColumn<String>(
      'report_type_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES report_types(report_code)');
  static const VerificationMeta _parentAccountIdMeta =
      const VerificationMeta('parentAccountId');
  late final GeneratedColumn<int> parentAccountId = GeneratedColumn<int>(
      'parent_account_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES chart_of_accounts(id)');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        accountCode,
        accountNameAr,
        accountNameEn,
        accountTypeCode,
        accountGroupCode,
        classificationCode,
        reportTypeCode,
        parentAccountId,
        isActive
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chart_of_accounts';
  @override
  VerificationContext validateIntegrity(Insertable<ChartOfAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_code')) {
      context.handle(
          _accountCodeMeta,
          accountCode.isAcceptableOrUnknown(
              data['account_code']!, _accountCodeMeta));
    } else if (isInserting) {
      context.missing(_accountCodeMeta);
    }
    if (data.containsKey('account_name_ar')) {
      context.handle(
          _accountNameArMeta,
          accountNameAr.isAcceptableOrUnknown(
              data['account_name_ar']!, _accountNameArMeta));
    } else if (isInserting) {
      context.missing(_accountNameArMeta);
    }
    if (data.containsKey('account_name_en')) {
      context.handle(
          _accountNameEnMeta,
          accountNameEn.isAcceptableOrUnknown(
              data['account_name_en']!, _accountNameEnMeta));
    } else if (isInserting) {
      context.missing(_accountNameEnMeta);
    }
    if (data.containsKey('account_type_code')) {
      context.handle(
          _accountTypeCodeMeta,
          accountTypeCode.isAcceptableOrUnknown(
              data['account_type_code']!, _accountTypeCodeMeta));
    } else if (isInserting) {
      context.missing(_accountTypeCodeMeta);
    }
    if (data.containsKey('account_group_code')) {
      context.handle(
          _accountGroupCodeMeta,
          accountGroupCode.isAcceptableOrUnknown(
              data['account_group_code']!, _accountGroupCodeMeta));
    }
    if (data.containsKey('classification_code')) {
      context.handle(
          _classificationCodeMeta,
          classificationCode.isAcceptableOrUnknown(
              data['classification_code']!, _classificationCodeMeta));
    }
    if (data.containsKey('report_type_code')) {
      context.handle(
          _reportTypeCodeMeta,
          reportTypeCode.isAcceptableOrUnknown(
              data['report_type_code']!, _reportTypeCodeMeta));
    }
    if (data.containsKey('parent_account_id')) {
      context.handle(
          _parentAccountIdMeta,
          parentAccountId.isAcceptableOrUnknown(
              data['parent_account_id']!, _parentAccountIdMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChartOfAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChartOfAccount(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accountCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_code'])!,
      accountNameAr: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}account_name_ar'])!,
      accountNameEn: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}account_name_en'])!,
      accountTypeCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}account_type_code'])!,
      accountGroupCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}account_group_code']),
      classificationCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}classification_code']),
      reportTypeCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}report_type_code']),
      parentAccountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_account_id']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  ChartOfAccounts createAlias(String alias) {
    return ChartOfAccounts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ChartOfAccount extends DataClass implements Insertable<ChartOfAccount> {
  final int id;
  final String accountCode;
  final String accountNameAr;
  final String accountNameEn;
  final String accountTypeCode;
  final String? accountGroupCode;
  final String? classificationCode;
  final String? reportTypeCode;
  final int? parentAccountId;
  final bool isActive;
  const ChartOfAccount(
      {required this.id,
      required this.accountCode,
      required this.accountNameAr,
      required this.accountNameEn,
      required this.accountTypeCode,
      this.accountGroupCode,
      this.classificationCode,
      this.reportTypeCode,
      this.parentAccountId,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_code'] = Variable<String>(accountCode);
    map['account_name_ar'] = Variable<String>(accountNameAr);
    map['account_name_en'] = Variable<String>(accountNameEn);
    map['account_type_code'] = Variable<String>(accountTypeCode);
    if (!nullToAbsent || accountGroupCode != null) {
      map['account_group_code'] = Variable<String>(accountGroupCode);
    }
    if (!nullToAbsent || classificationCode != null) {
      map['classification_code'] = Variable<String>(classificationCode);
    }
    if (!nullToAbsent || reportTypeCode != null) {
      map['report_type_code'] = Variable<String>(reportTypeCode);
    }
    if (!nullToAbsent || parentAccountId != null) {
      map['parent_account_id'] = Variable<int>(parentAccountId);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  ChartOfAccountsCompanion toCompanion(bool nullToAbsent) {
    return ChartOfAccountsCompanion(
      id: Value(id),
      accountCode: Value(accountCode),
      accountNameAr: Value(accountNameAr),
      accountNameEn: Value(accountNameEn),
      accountTypeCode: Value(accountTypeCode),
      accountGroupCode: accountGroupCode == null && nullToAbsent
          ? const Value.absent()
          : Value(accountGroupCode),
      classificationCode: classificationCode == null && nullToAbsent
          ? const Value.absent()
          : Value(classificationCode),
      reportTypeCode: reportTypeCode == null && nullToAbsent
          ? const Value.absent()
          : Value(reportTypeCode),
      parentAccountId: parentAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentAccountId),
      isActive: Value(isActive),
    );
  }

  factory ChartOfAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChartOfAccount(
      id: serializer.fromJson<int>(json['id']),
      accountCode: serializer.fromJson<String>(json['account_code']),
      accountNameAr: serializer.fromJson<String>(json['account_name_ar']),
      accountNameEn: serializer.fromJson<String>(json['account_name_en']),
      accountTypeCode: serializer.fromJson<String>(json['account_type_code']),
      accountGroupCode:
          serializer.fromJson<String?>(json['account_group_code']),
      classificationCode:
          serializer.fromJson<String?>(json['classification_code']),
      reportTypeCode: serializer.fromJson<String?>(json['report_type_code']),
      parentAccountId: serializer.fromJson<int?>(json['parent_account_id']),
      isActive: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'account_code': serializer.toJson<String>(accountCode),
      'account_name_ar': serializer.toJson<String>(accountNameAr),
      'account_name_en': serializer.toJson<String>(accountNameEn),
      'account_type_code': serializer.toJson<String>(accountTypeCode),
      'account_group_code': serializer.toJson<String?>(accountGroupCode),
      'classification_code': serializer.toJson<String?>(classificationCode),
      'report_type_code': serializer.toJson<String?>(reportTypeCode),
      'parent_account_id': serializer.toJson<int?>(parentAccountId),
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  ChartOfAccount copyWith(
          {int? id,
          String? accountCode,
          String? accountNameAr,
          String? accountNameEn,
          String? accountTypeCode,
          Value<String?> accountGroupCode = const Value.absent(),
          Value<String?> classificationCode = const Value.absent(),
          Value<String?> reportTypeCode = const Value.absent(),
          Value<int?> parentAccountId = const Value.absent(),
          bool? isActive}) =>
      ChartOfAccount(
        id: id ?? this.id,
        accountCode: accountCode ?? this.accountCode,
        accountNameAr: accountNameAr ?? this.accountNameAr,
        accountNameEn: accountNameEn ?? this.accountNameEn,
        accountTypeCode: accountTypeCode ?? this.accountTypeCode,
        accountGroupCode: accountGroupCode.present
            ? accountGroupCode.value
            : this.accountGroupCode,
        classificationCode: classificationCode.present
            ? classificationCode.value
            : this.classificationCode,
        reportTypeCode:
            reportTypeCode.present ? reportTypeCode.value : this.reportTypeCode,
        parentAccountId: parentAccountId.present
            ? parentAccountId.value
            : this.parentAccountId,
        isActive: isActive ?? this.isActive,
      );
  ChartOfAccount copyWithCompanion(ChartOfAccountsCompanion data) {
    return ChartOfAccount(
      id: data.id.present ? data.id.value : this.id,
      accountCode:
          data.accountCode.present ? data.accountCode.value : this.accountCode,
      accountNameAr: data.accountNameAr.present
          ? data.accountNameAr.value
          : this.accountNameAr,
      accountNameEn: data.accountNameEn.present
          ? data.accountNameEn.value
          : this.accountNameEn,
      accountTypeCode: data.accountTypeCode.present
          ? data.accountTypeCode.value
          : this.accountTypeCode,
      accountGroupCode: data.accountGroupCode.present
          ? data.accountGroupCode.value
          : this.accountGroupCode,
      classificationCode: data.classificationCode.present
          ? data.classificationCode.value
          : this.classificationCode,
      reportTypeCode: data.reportTypeCode.present
          ? data.reportTypeCode.value
          : this.reportTypeCode,
      parentAccountId: data.parentAccountId.present
          ? data.parentAccountId.value
          : this.parentAccountId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChartOfAccount(')
          ..write('id: $id, ')
          ..write('accountCode: $accountCode, ')
          ..write('accountNameAr: $accountNameAr, ')
          ..write('accountNameEn: $accountNameEn, ')
          ..write('accountTypeCode: $accountTypeCode, ')
          ..write('accountGroupCode: $accountGroupCode, ')
          ..write('classificationCode: $classificationCode, ')
          ..write('reportTypeCode: $reportTypeCode, ')
          ..write('parentAccountId: $parentAccountId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      accountCode,
      accountNameAr,
      accountNameEn,
      accountTypeCode,
      accountGroupCode,
      classificationCode,
      reportTypeCode,
      parentAccountId,
      isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChartOfAccount &&
          other.id == this.id &&
          other.accountCode == this.accountCode &&
          other.accountNameAr == this.accountNameAr &&
          other.accountNameEn == this.accountNameEn &&
          other.accountTypeCode == this.accountTypeCode &&
          other.accountGroupCode == this.accountGroupCode &&
          other.classificationCode == this.classificationCode &&
          other.reportTypeCode == this.reportTypeCode &&
          other.parentAccountId == this.parentAccountId &&
          other.isActive == this.isActive);
}

class ChartOfAccountsCompanion extends UpdateCompanion<ChartOfAccount> {
  final Value<int> id;
  final Value<String> accountCode;
  final Value<String> accountNameAr;
  final Value<String> accountNameEn;
  final Value<String> accountTypeCode;
  final Value<String?> accountGroupCode;
  final Value<String?> classificationCode;
  final Value<String?> reportTypeCode;
  final Value<int?> parentAccountId;
  final Value<bool> isActive;
  const ChartOfAccountsCompanion({
    this.id = const Value.absent(),
    this.accountCode = const Value.absent(),
    this.accountNameAr = const Value.absent(),
    this.accountNameEn = const Value.absent(),
    this.accountTypeCode = const Value.absent(),
    this.accountGroupCode = const Value.absent(),
    this.classificationCode = const Value.absent(),
    this.reportTypeCode = const Value.absent(),
    this.parentAccountId = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  ChartOfAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String accountCode,
    required String accountNameAr,
    required String accountNameEn,
    required String accountTypeCode,
    this.accountGroupCode = const Value.absent(),
    this.classificationCode = const Value.absent(),
    this.reportTypeCode = const Value.absent(),
    this.parentAccountId = const Value.absent(),
    this.isActive = const Value.absent(),
  })  : accountCode = Value(accountCode),
        accountNameAr = Value(accountNameAr),
        accountNameEn = Value(accountNameEn),
        accountTypeCode = Value(accountTypeCode);
  static Insertable<ChartOfAccount> custom({
    Expression<int>? id,
    Expression<String>? accountCode,
    Expression<String>? accountNameAr,
    Expression<String>? accountNameEn,
    Expression<String>? accountTypeCode,
    Expression<String>? accountGroupCode,
    Expression<String>? classificationCode,
    Expression<String>? reportTypeCode,
    Expression<int>? parentAccountId,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountCode != null) 'account_code': accountCode,
      if (accountNameAr != null) 'account_name_ar': accountNameAr,
      if (accountNameEn != null) 'account_name_en': accountNameEn,
      if (accountTypeCode != null) 'account_type_code': accountTypeCode,
      if (accountGroupCode != null) 'account_group_code': accountGroupCode,
      if (classificationCode != null) 'classification_code': classificationCode,
      if (reportTypeCode != null) 'report_type_code': reportTypeCode,
      if (parentAccountId != null) 'parent_account_id': parentAccountId,
      if (isActive != null) 'is_active': isActive,
    });
  }

  ChartOfAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? accountCode,
      Value<String>? accountNameAr,
      Value<String>? accountNameEn,
      Value<String>? accountTypeCode,
      Value<String?>? accountGroupCode,
      Value<String?>? classificationCode,
      Value<String?>? reportTypeCode,
      Value<int?>? parentAccountId,
      Value<bool>? isActive}) {
    return ChartOfAccountsCompanion(
      id: id ?? this.id,
      accountCode: accountCode ?? this.accountCode,
      accountNameAr: accountNameAr ?? this.accountNameAr,
      accountNameEn: accountNameEn ?? this.accountNameEn,
      accountTypeCode: accountTypeCode ?? this.accountTypeCode,
      accountGroupCode: accountGroupCode ?? this.accountGroupCode,
      classificationCode: classificationCode ?? this.classificationCode,
      reportTypeCode: reportTypeCode ?? this.reportTypeCode,
      parentAccountId: parentAccountId ?? this.parentAccountId,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountCode.present) {
      map['account_code'] = Variable<String>(accountCode.value);
    }
    if (accountNameAr.present) {
      map['account_name_ar'] = Variable<String>(accountNameAr.value);
    }
    if (accountNameEn.present) {
      map['account_name_en'] = Variable<String>(accountNameEn.value);
    }
    if (accountTypeCode.present) {
      map['account_type_code'] = Variable<String>(accountTypeCode.value);
    }
    if (accountGroupCode.present) {
      map['account_group_code'] = Variable<String>(accountGroupCode.value);
    }
    if (classificationCode.present) {
      map['classification_code'] = Variable<String>(classificationCode.value);
    }
    if (reportTypeCode.present) {
      map['report_type_code'] = Variable<String>(reportTypeCode.value);
    }
    if (parentAccountId.present) {
      map['parent_account_id'] = Variable<int>(parentAccountId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChartOfAccountsCompanion(')
          ..write('id: $id, ')
          ..write('accountCode: $accountCode, ')
          ..write('accountNameAr: $accountNameAr, ')
          ..write('accountNameEn: $accountNameEn, ')
          ..write('accountTypeCode: $accountTypeCode, ')
          ..write('accountGroupCode: $accountGroupCode, ')
          ..write('classificationCode: $classificationCode, ')
          ..write('reportTypeCode: $reportTypeCode, ')
          ..write('parentAccountId: $parentAccountId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class TaxBracket extends Table with TableInfo<TaxBracket, TaxBracketData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TaxBracket(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bracketCodeMeta =
      const VerificationMeta('bracketCode');
  late final GeneratedColumn<String> bracketCode = GeneratedColumn<String>(
      'bracket_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _taxRateMeta =
      const VerificationMeta('taxRate');
  late final GeneratedColumn<double> taxRate = GeneratedColumn<double>(
      'tax_rate', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
      'is_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  @override
  List<GeneratedColumn> get $columns =>
      [bracketCode, nameAr, nameEn, taxRate, isDefault];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tax_bracket';
  @override
  VerificationContext validateIntegrity(Insertable<TaxBracketData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bracket_code')) {
      context.handle(
          _bracketCodeMeta,
          bracketCode.isAcceptableOrUnknown(
              data['bracket_code']!, _bracketCodeMeta));
    } else if (isInserting) {
      context.missing(_bracketCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('tax_rate')) {
      context.handle(_taxRateMeta,
          taxRate.isAcceptableOrUnknown(data['tax_rate']!, _taxRateMeta));
    } else if (isInserting) {
      context.missing(_taxRateMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {bracketCode};
  @override
  TaxBracketData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaxBracketData(
      bracketCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bracket_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      taxRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax_rate'])!,
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
    );
  }

  @override
  TaxBracket createAlias(String alias) {
    return TaxBracket(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TaxBracketData extends DataClass implements Insertable<TaxBracketData> {
  final String bracketCode;
  final String nameAr;
  final String nameEn;
  final double taxRate;
  final bool isDefault;
  const TaxBracketData(
      {required this.bracketCode,
      required this.nameAr,
      required this.nameEn,
      required this.taxRate,
      required this.isDefault});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bracket_code'] = Variable<String>(bracketCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['tax_rate'] = Variable<double>(taxRate);
    map['is_default'] = Variable<bool>(isDefault);
    return map;
  }

  TaxBracketCompanion toCompanion(bool nullToAbsent) {
    return TaxBracketCompanion(
      bracketCode: Value(bracketCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      taxRate: Value(taxRate),
      isDefault: Value(isDefault),
    );
  }

  factory TaxBracketData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxBracketData(
      bracketCode: serializer.fromJson<String>(json['bracket_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      taxRate: serializer.fromJson<double>(json['tax_rate']),
      isDefault: serializer.fromJson<bool>(json['is_default']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bracket_code': serializer.toJson<String>(bracketCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'tax_rate': serializer.toJson<double>(taxRate),
      'is_default': serializer.toJson<bool>(isDefault),
    };
  }

  TaxBracketData copyWith(
          {String? bracketCode,
          String? nameAr,
          String? nameEn,
          double? taxRate,
          bool? isDefault}) =>
      TaxBracketData(
        bracketCode: bracketCode ?? this.bracketCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        taxRate: taxRate ?? this.taxRate,
        isDefault: isDefault ?? this.isDefault,
      );
  TaxBracketData copyWithCompanion(TaxBracketCompanion data) {
    return TaxBracketData(
      bracketCode:
          data.bracketCode.present ? data.bracketCode.value : this.bracketCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      taxRate: data.taxRate.present ? data.taxRate.value : this.taxRate,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxBracketData(')
          ..write('bracketCode: $bracketCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('taxRate: $taxRate, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(bracketCode, nameAr, nameEn, taxRate, isDefault);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxBracketData &&
          other.bracketCode == this.bracketCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.taxRate == this.taxRate &&
          other.isDefault == this.isDefault);
}

class TaxBracketCompanion extends UpdateCompanion<TaxBracketData> {
  final Value<String> bracketCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<double> taxRate;
  final Value<bool> isDefault;
  final Value<int> rowid;
  const TaxBracketCompanion({
    this.bracketCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.taxRate = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaxBracketCompanion.insert({
    required String bracketCode,
    required String nameAr,
    required String nameEn,
    required double taxRate,
    this.isDefault = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : bracketCode = Value(bracketCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        taxRate = Value(taxRate);
  static Insertable<TaxBracketData> custom({
    Expression<String>? bracketCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<double>? taxRate,
    Expression<bool>? isDefault,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (bracketCode != null) 'bracket_code': bracketCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (taxRate != null) 'tax_rate': taxRate,
      if (isDefault != null) 'is_default': isDefault,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaxBracketCompanion copyWith(
      {Value<String>? bracketCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<double>? taxRate,
      Value<bool>? isDefault,
      Value<int>? rowid}) {
    return TaxBracketCompanion(
      bracketCode: bracketCode ?? this.bracketCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      taxRate: taxRate ?? this.taxRate,
      isDefault: isDefault ?? this.isDefault,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bracketCode.present) {
      map['bracket_code'] = Variable<String>(bracketCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (taxRate.present) {
      map['tax_rate'] = Variable<double>(taxRate.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxBracketCompanion(')
          ..write('bracketCode: $bracketCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('taxRate: $taxRate, ')
          ..write('isDefault: $isDefault, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class TaxCalcMethods extends Table
    with TableInfo<TaxCalcMethods, TaxCalcMethod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TaxCalcMethods(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _methodCodeMeta =
      const VerificationMeta('methodCode');
  late final GeneratedColumn<String> methodCode = GeneratedColumn<String>(
      'method_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [methodCode, nameAr, nameEn, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tax_calc_methods';
  @override
  VerificationContext validateIntegrity(Insertable<TaxCalcMethod> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('method_code')) {
      context.handle(
          _methodCodeMeta,
          methodCode.isAcceptableOrUnknown(
              data['method_code']!, _methodCodeMeta));
    } else if (isInserting) {
      context.missing(_methodCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {methodCode};
  @override
  TaxCalcMethod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaxCalcMethod(
      methodCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
    );
  }

  @override
  TaxCalcMethods createAlias(String alias) {
    return TaxCalcMethods(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TaxCalcMethod extends DataClass implements Insertable<TaxCalcMethod> {
  final String methodCode;
  final String nameAr;
  final String nameEn;
  final String category;
  const TaxCalcMethod(
      {required this.methodCode,
      required this.nameAr,
      required this.nameEn,
      required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['method_code'] = Variable<String>(methodCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['category'] = Variable<String>(category);
    return map;
  }

  TaxCalcMethodsCompanion toCompanion(bool nullToAbsent) {
    return TaxCalcMethodsCompanion(
      methodCode: Value(methodCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      category: Value(category),
    );
  }

  factory TaxCalcMethod.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxCalcMethod(
      methodCode: serializer.fromJson<String>(json['method_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'method_code': serializer.toJson<String>(methodCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'category': serializer.toJson<String>(category),
    };
  }

  TaxCalcMethod copyWith(
          {String? methodCode,
          String? nameAr,
          String? nameEn,
          String? category}) =>
      TaxCalcMethod(
        methodCode: methodCode ?? this.methodCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        category: category ?? this.category,
      );
  TaxCalcMethod copyWithCompanion(TaxCalcMethodsCompanion data) {
    return TaxCalcMethod(
      methodCode:
          data.methodCode.present ? data.methodCode.value : this.methodCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxCalcMethod(')
          ..write('methodCode: $methodCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(methodCode, nameAr, nameEn, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxCalcMethod &&
          other.methodCode == this.methodCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.category == this.category);
}

class TaxCalcMethodsCompanion extends UpdateCompanion<TaxCalcMethod> {
  final Value<String> methodCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String> category;
  final Value<int> rowid;
  const TaxCalcMethodsCompanion({
    this.methodCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaxCalcMethodsCompanion.insert({
    required String methodCode,
    required String nameAr,
    required String nameEn,
    required String category,
    this.rowid = const Value.absent(),
  })  : methodCode = Value(methodCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        category = Value(category);
  static Insertable<TaxCalcMethod> custom({
    Expression<String>? methodCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? category,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (methodCode != null) 'method_code': methodCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (category != null) 'category': category,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaxCalcMethodsCompanion copyWith(
      {Value<String>? methodCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<String>? category,
      Value<int>? rowid}) {
    return TaxCalcMethodsCompanion(
      methodCode: methodCode ?? this.methodCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      category: category ?? this.category,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (methodCode.present) {
      map['method_code'] = Variable<String>(methodCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxCalcMethodsCompanion(')
          ..write('methodCode: $methodCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('category: $category, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class TaxTypes extends Table with TableInfo<TaxTypes, TaxType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TaxTypes(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _typeCodeMeta =
      const VerificationMeta('typeCode');
  late final GeneratedColumn<String> typeCode = GeneratedColumn<String>(
      'type_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _calcMethodCodeMeta =
      const VerificationMeta('calcMethodCode');
  late final GeneratedColumn<String> calcMethodCode = GeneratedColumn<String>(
      'calc_method_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES tax_calc_methods(method_code)');
  static const VerificationMeta _salesAccountIdMeta =
      const VerificationMeta('salesAccountId');
  late final GeneratedColumn<String> salesAccountId = GeneratedColumn<String>(
      'sales_account_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _purchasesAccountIdMeta =
      const VerificationMeta('purchasesAccountId');
  late final GeneratedColumn<String> purchasesAccountId =
      GeneratedColumn<String>('purchases_account_id', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        typeCode,
        nameAr,
        nameEn,
        calcMethodCode,
        salesAccountId,
        purchasesAccountId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tax_types';
  @override
  VerificationContext validateIntegrity(Insertable<TaxType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('type_code')) {
      context.handle(_typeCodeMeta,
          typeCode.isAcceptableOrUnknown(data['type_code']!, _typeCodeMeta));
    } else if (isInserting) {
      context.missing(_typeCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('calc_method_code')) {
      context.handle(
          _calcMethodCodeMeta,
          calcMethodCode.isAcceptableOrUnknown(
              data['calc_method_code']!, _calcMethodCodeMeta));
    } else if (isInserting) {
      context.missing(_calcMethodCodeMeta);
    }
    if (data.containsKey('sales_account_id')) {
      context.handle(
          _salesAccountIdMeta,
          salesAccountId.isAcceptableOrUnknown(
              data['sales_account_id']!, _salesAccountIdMeta));
    }
    if (data.containsKey('purchases_account_id')) {
      context.handle(
          _purchasesAccountIdMeta,
          purchasesAccountId.isAcceptableOrUnknown(
              data['purchases_account_id']!, _purchasesAccountIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {typeCode};
  @override
  TaxType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaxType(
      typeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      calcMethodCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}calc_method_code'])!,
      salesAccountId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}sales_account_id']),
      purchasesAccountId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}purchases_account_id']),
    );
  }

  @override
  TaxTypes createAlias(String alias) {
    return TaxTypes(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TaxType extends DataClass implements Insertable<TaxType> {
  final String typeCode;
  final String nameAr;
  final String nameEn;
  final String calcMethodCode;
  final String? salesAccountId;

  /// Should reference accounts table later
  final String? purchasesAccountId;
  const TaxType(
      {required this.typeCode,
      required this.nameAr,
      required this.nameEn,
      required this.calcMethodCode,
      this.salesAccountId,
      this.purchasesAccountId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['type_code'] = Variable<String>(typeCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['calc_method_code'] = Variable<String>(calcMethodCode);
    if (!nullToAbsent || salesAccountId != null) {
      map['sales_account_id'] = Variable<String>(salesAccountId);
    }
    if (!nullToAbsent || purchasesAccountId != null) {
      map['purchases_account_id'] = Variable<String>(purchasesAccountId);
    }
    return map;
  }

  TaxTypesCompanion toCompanion(bool nullToAbsent) {
    return TaxTypesCompanion(
      typeCode: Value(typeCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      calcMethodCode: Value(calcMethodCode),
      salesAccountId: salesAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(salesAccountId),
      purchasesAccountId: purchasesAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(purchasesAccountId),
    );
  }

  factory TaxType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxType(
      typeCode: serializer.fromJson<String>(json['type_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      calcMethodCode: serializer.fromJson<String>(json['calc_method_code']),
      salesAccountId: serializer.fromJson<String?>(json['sales_account_id']),
      purchasesAccountId:
          serializer.fromJson<String?>(json['purchases_account_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type_code': serializer.toJson<String>(typeCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'calc_method_code': serializer.toJson<String>(calcMethodCode),
      'sales_account_id': serializer.toJson<String?>(salesAccountId),
      'purchases_account_id': serializer.toJson<String?>(purchasesAccountId),
    };
  }

  TaxType copyWith(
          {String? typeCode,
          String? nameAr,
          String? nameEn,
          String? calcMethodCode,
          Value<String?> salesAccountId = const Value.absent(),
          Value<String?> purchasesAccountId = const Value.absent()}) =>
      TaxType(
        typeCode: typeCode ?? this.typeCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        calcMethodCode: calcMethodCode ?? this.calcMethodCode,
        salesAccountId:
            salesAccountId.present ? salesAccountId.value : this.salesAccountId,
        purchasesAccountId: purchasesAccountId.present
            ? purchasesAccountId.value
            : this.purchasesAccountId,
      );
  TaxType copyWithCompanion(TaxTypesCompanion data) {
    return TaxType(
      typeCode: data.typeCode.present ? data.typeCode.value : this.typeCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      calcMethodCode: data.calcMethodCode.present
          ? data.calcMethodCode.value
          : this.calcMethodCode,
      salesAccountId: data.salesAccountId.present
          ? data.salesAccountId.value
          : this.salesAccountId,
      purchasesAccountId: data.purchasesAccountId.present
          ? data.purchasesAccountId.value
          : this.purchasesAccountId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxType(')
          ..write('typeCode: $typeCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('calcMethodCode: $calcMethodCode, ')
          ..write('salesAccountId: $salesAccountId, ')
          ..write('purchasesAccountId: $purchasesAccountId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(typeCode, nameAr, nameEn, calcMethodCode,
      salesAccountId, purchasesAccountId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxType &&
          other.typeCode == this.typeCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.calcMethodCode == this.calcMethodCode &&
          other.salesAccountId == this.salesAccountId &&
          other.purchasesAccountId == this.purchasesAccountId);
}

class TaxTypesCompanion extends UpdateCompanion<TaxType> {
  final Value<String> typeCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String> calcMethodCode;
  final Value<String?> salesAccountId;
  final Value<String?> purchasesAccountId;
  final Value<int> rowid;
  const TaxTypesCompanion({
    this.typeCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.calcMethodCode = const Value.absent(),
    this.salesAccountId = const Value.absent(),
    this.purchasesAccountId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaxTypesCompanion.insert({
    required String typeCode,
    required String nameAr,
    required String nameEn,
    required String calcMethodCode,
    this.salesAccountId = const Value.absent(),
    this.purchasesAccountId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : typeCode = Value(typeCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        calcMethodCode = Value(calcMethodCode);
  static Insertable<TaxType> custom({
    Expression<String>? typeCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? calcMethodCode,
    Expression<String>? salesAccountId,
    Expression<String>? purchasesAccountId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (typeCode != null) 'type_code': typeCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (calcMethodCode != null) 'calc_method_code': calcMethodCode,
      if (salesAccountId != null) 'sales_account_id': salesAccountId,
      if (purchasesAccountId != null)
        'purchases_account_id': purchasesAccountId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaxTypesCompanion copyWith(
      {Value<String>? typeCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<String>? calcMethodCode,
      Value<String?>? salesAccountId,
      Value<String?>? purchasesAccountId,
      Value<int>? rowid}) {
    return TaxTypesCompanion(
      typeCode: typeCode ?? this.typeCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      calcMethodCode: calcMethodCode ?? this.calcMethodCode,
      salesAccountId: salesAccountId ?? this.salesAccountId,
      purchasesAccountId: purchasesAccountId ?? this.purchasesAccountId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (typeCode.present) {
      map['type_code'] = Variable<String>(typeCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (calcMethodCode.present) {
      map['calc_method_code'] = Variable<String>(calcMethodCode.value);
    }
    if (salesAccountId.present) {
      map['sales_account_id'] = Variable<String>(salesAccountId.value);
    }
    if (purchasesAccountId.present) {
      map['purchases_account_id'] = Variable<String>(purchasesAccountId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxTypesCompanion(')
          ..write('typeCode: $typeCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('calcMethodCode: $calcMethodCode, ')
          ..write('salesAccountId: $salesAccountId, ')
          ..write('purchasesAccountId: $purchasesAccountId, ')
          ..write('rowid: $rowid')
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
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, nameAr, nameEn, description, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roles';
  @override
  VerificationContext validateIntegrity(Insertable<Role> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Role map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Role(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
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
  const Role(
      {required this.id,
      required this.nameAr,
      required this.nameEn,
      this.description,
      required this.isActive});
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

  factory Role.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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

  Role copyWith(
          {int? id,
          String? nameAr,
          String? nameEn,
          Value<String?> description = const Value.absent(),
          bool? isActive}) =>
      Role(
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
      description:
          data.description.present ? data.description.value : this.description,
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
    required bool isActive,
  })  : nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        isActive = Value(isActive);
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

  RolesCompanion copyWith(
      {Value<int>? id,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<String?>? description,
      Value<bool>? isActive}) {
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

class CompanyInfo extends Table with TableInfo<CompanyInfo, CompanyInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CompanyInfo(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _companyCodeMeta =
      const VerificationMeta('companyCode');
  late final GeneratedColumn<String> companyCode = GeneratedColumn<String>(
      'company_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _countryIdMeta =
      const VerificationMeta('countryId');
  late final GeneratedColumn<String> countryId = GeneratedColumn<String>(
      'country_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _taxNumberMeta =
      const VerificationMeta('taxNumber');
  late final GeneratedColumn<String> taxNumber = GeneratedColumn<String>(
      'tax_number', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _commercialRegNoMeta =
      const VerificationMeta('commercialRegNo');
  late final GeneratedColumn<String> commercialRegNo = GeneratedColumn<String>(
      'commercial_reg_no', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  late final GeneratedColumn<Uint8List> logo = GeneratedColumn<Uint8List>(
      'logo', aliasedName, true,
      type: DriftSqlType.blob,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _isMainCompanyMeta =
      const VerificationMeta('isMainCompany');
  late final GeneratedColumn<bool> isMainCompany = GeneratedColumn<bool>(
      'is_main_company', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _remarksMeta =
      const VerificationMeta('remarks');
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
      'remarks', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        companyCode,
        nameAr,
        nameEn,
        countryId,
        taxNumber,
        commercialRegNo,
        address,
        phone,
        email,
        logo,
        isMainCompany,
        remarks
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'company_info';
  @override
  VerificationContext validateIntegrity(Insertable<CompanyInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_code')) {
      context.handle(
          _companyCodeMeta,
          companyCode.isAcceptableOrUnknown(
              data['company_code']!, _companyCodeMeta));
    } else if (isInserting) {
      context.missing(_companyCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('tax_number')) {
      context.handle(_taxNumberMeta,
          taxNumber.isAcceptableOrUnknown(data['tax_number']!, _taxNumberMeta));
    }
    if (data.containsKey('commercial_reg_no')) {
      context.handle(
          _commercialRegNoMeta,
          commercialRegNo.isAcceptableOrUnknown(
              data['commercial_reg_no']!, _commercialRegNoMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    }
    if (data.containsKey('is_main_company')) {
      context.handle(
          _isMainCompanyMeta,
          isMainCompany.isAcceptableOrUnknown(
              data['is_main_company']!, _isMainCompanyMeta));
    } else if (isInserting) {
      context.missing(_isMainCompanyMeta);
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompanyInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanyInfoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      companyCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      countryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country_id']),
      taxNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tax_number']),
      commercialRegNo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}commercial_reg_no']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      logo: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}logo']),
      isMainCompany: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_main_company'])!,
      remarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remarks']),
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
  final String companyCode;
  final String nameAr;
  final String nameEn;
  final String? countryId;
  final String? taxNumber;
  final String? commercialRegNo;
  final String? address;
  final String? phone;
  final String? email;
  final Uint8List? logo;
  final bool isMainCompany;
  final String? remarks;
  const CompanyInfoData(
      {required this.id,
      required this.companyCode,
      required this.nameAr,
      required this.nameEn,
      this.countryId,
      this.taxNumber,
      this.commercialRegNo,
      this.address,
      this.phone,
      this.email,
      this.logo,
      required this.isMainCompany,
      this.remarks});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_code'] = Variable<String>(companyCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String>(countryId);
    }
    if (!nullToAbsent || taxNumber != null) {
      map['tax_number'] = Variable<String>(taxNumber);
    }
    if (!nullToAbsent || commercialRegNo != null) {
      map['commercial_reg_no'] = Variable<String>(commercialRegNo);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || logo != null) {
      map['logo'] = Variable<Uint8List>(logo);
    }
    map['is_main_company'] = Variable<bool>(isMainCompany);
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    return map;
  }

  CompanyInfoCompanion toCompanion(bool nullToAbsent) {
    return CompanyInfoCompanion(
      id: Value(id),
      companyCode: Value(companyCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      taxNumber: taxNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(taxNumber),
      commercialRegNo: commercialRegNo == null && nullToAbsent
          ? const Value.absent()
          : Value(commercialRegNo),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      logo: logo == null && nullToAbsent ? const Value.absent() : Value(logo),
      isMainCompany: Value(isMainCompany),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
    );
  }

  factory CompanyInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanyInfoData(
      id: serializer.fromJson<int>(json['id']),
      companyCode: serializer.fromJson<String>(json['company_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      countryId: serializer.fromJson<String?>(json['country_id']),
      taxNumber: serializer.fromJson<String?>(json['tax_number']),
      commercialRegNo: serializer.fromJson<String?>(json['commercial_reg_no']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      logo: serializer.fromJson<Uint8List?>(json['logo']),
      isMainCompany: serializer.fromJson<bool>(json['is_main_company']),
      remarks: serializer.fromJson<String?>(json['remarks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'company_code': serializer.toJson<String>(companyCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'country_id': serializer.toJson<String?>(countryId),
      'tax_number': serializer.toJson<String?>(taxNumber),
      'commercial_reg_no': serializer.toJson<String?>(commercialRegNo),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'logo': serializer.toJson<Uint8List?>(logo),
      'is_main_company': serializer.toJson<bool>(isMainCompany),
      'remarks': serializer.toJson<String?>(remarks),
    };
  }

  CompanyInfoData copyWith(
          {int? id,
          String? companyCode,
          String? nameAr,
          String? nameEn,
          Value<String?> countryId = const Value.absent(),
          Value<String?> taxNumber = const Value.absent(),
          Value<String?> commercialRegNo = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<Uint8List?> logo = const Value.absent(),
          bool? isMainCompany,
          Value<String?> remarks = const Value.absent()}) =>
      CompanyInfoData(
        id: id ?? this.id,
        companyCode: companyCode ?? this.companyCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        countryId: countryId.present ? countryId.value : this.countryId,
        taxNumber: taxNumber.present ? taxNumber.value : this.taxNumber,
        commercialRegNo: commercialRegNo.present
            ? commercialRegNo.value
            : this.commercialRegNo,
        address: address.present ? address.value : this.address,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        logo: logo.present ? logo.value : this.logo,
        isMainCompany: isMainCompany ?? this.isMainCompany,
        remarks: remarks.present ? remarks.value : this.remarks,
      );
  CompanyInfoData copyWithCompanion(CompanyInfoCompanion data) {
    return CompanyInfoData(
      id: data.id.present ? data.id.value : this.id,
      companyCode:
          data.companyCode.present ? data.companyCode.value : this.companyCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      taxNumber: data.taxNumber.present ? data.taxNumber.value : this.taxNumber,
      commercialRegNo: data.commercialRegNo.present
          ? data.commercialRegNo.value
          : this.commercialRegNo,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      logo: data.logo.present ? data.logo.value : this.logo,
      isMainCompany: data.isMainCompany.present
          ? data.isMainCompany.value
          : this.isMainCompany,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CompanyInfoData(')
          ..write('id: $id, ')
          ..write('companyCode: $companyCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('countryId: $countryId, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('commercialRegNo: $commercialRegNo, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('logo: $logo, ')
          ..write('isMainCompany: $isMainCompany, ')
          ..write('remarks: $remarks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      companyCode,
      nameAr,
      nameEn,
      countryId,
      taxNumber,
      commercialRegNo,
      address,
      phone,
      email,
      $driftBlobEquality.hash(logo),
      isMainCompany,
      remarks);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyInfoData &&
          other.id == this.id &&
          other.companyCode == this.companyCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.countryId == this.countryId &&
          other.taxNumber == this.taxNumber &&
          other.commercialRegNo == this.commercialRegNo &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.email == this.email &&
          $driftBlobEquality.equals(other.logo, this.logo) &&
          other.isMainCompany == this.isMainCompany &&
          other.remarks == this.remarks);
}

class CompanyInfoCompanion extends UpdateCompanion<CompanyInfoData> {
  final Value<int> id;
  final Value<String> companyCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String?> countryId;
  final Value<String?> taxNumber;
  final Value<String?> commercialRegNo;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<Uint8List?> logo;
  final Value<bool> isMainCompany;
  final Value<String?> remarks;
  const CompanyInfoCompanion({
    this.id = const Value.absent(),
    this.companyCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.countryId = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.commercialRegNo = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.logo = const Value.absent(),
    this.isMainCompany = const Value.absent(),
    this.remarks = const Value.absent(),
  });
  CompanyInfoCompanion.insert({
    this.id = const Value.absent(),
    required String companyCode,
    required String nameAr,
    required String nameEn,
    this.countryId = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.commercialRegNo = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.logo = const Value.absent(),
    required bool isMainCompany,
    this.remarks = const Value.absent(),
  })  : companyCode = Value(companyCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        isMainCompany = Value(isMainCompany);
  static Insertable<CompanyInfoData> custom({
    Expression<int>? id,
    Expression<String>? companyCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? countryId,
    Expression<String>? taxNumber,
    Expression<String>? commercialRegNo,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<Uint8List>? logo,
    Expression<bool>? isMainCompany,
    Expression<String>? remarks,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyCode != null) 'company_code': companyCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (countryId != null) 'country_id': countryId,
      if (taxNumber != null) 'tax_number': taxNumber,
      if (commercialRegNo != null) 'commercial_reg_no': commercialRegNo,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (logo != null) 'logo': logo,
      if (isMainCompany != null) 'is_main_company': isMainCompany,
      if (remarks != null) 'remarks': remarks,
    });
  }

  CompanyInfoCompanion copyWith(
      {Value<int>? id,
      Value<String>? companyCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<String?>? countryId,
      Value<String?>? taxNumber,
      Value<String?>? commercialRegNo,
      Value<String?>? address,
      Value<String?>? phone,
      Value<String?>? email,
      Value<Uint8List?>? logo,
      Value<bool>? isMainCompany,
      Value<String?>? remarks}) {
    return CompanyInfoCompanion(
      id: id ?? this.id,
      companyCode: companyCode ?? this.companyCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      countryId: countryId ?? this.countryId,
      taxNumber: taxNumber ?? this.taxNumber,
      commercialRegNo: commercialRegNo ?? this.commercialRegNo,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      logo: logo ?? this.logo,
      isMainCompany: isMainCompany ?? this.isMainCompany,
      remarks: remarks ?? this.remarks,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyCode.present) {
      map['company_code'] = Variable<String>(companyCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String>(countryId.value);
    }
    if (taxNumber.present) {
      map['tax_number'] = Variable<String>(taxNumber.value);
    }
    if (commercialRegNo.present) {
      map['commercial_reg_no'] = Variable<String>(commercialRegNo.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (logo.present) {
      map['logo'] = Variable<Uint8List>(logo.value);
    }
    if (isMainCompany.present) {
      map['is_main_company'] = Variable<bool>(isMainCompany.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyInfoCompanion(')
          ..write('id: $id, ')
          ..write('companyCode: $companyCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('countryId: $countryId, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('commercialRegNo: $commercialRegNo, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('logo: $logo, ')
          ..write('isMainCompany: $isMainCompany, ')
          ..write('remarks: $remarks')
          ..write(')'))
        .toString();
  }
}

class FinancialPeriods extends Table
    with TableInfo<FinancialPeriods, FinancialPeriod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FinancialPeriods(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  late final GeneratedColumn<double> startDate = GeneratedColumn<double>(
      'start_date', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  late final GeneratedColumn<double> endDate = GeneratedColumn<double>(
      'end_date', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isClosedMeta =
      const VerificationMeta('isClosed');
  late final GeneratedColumn<bool> isClosed = GeneratedColumn<bool>(
      'is_closed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  @override
  List<GeneratedColumn> get $columns => [id, startDate, endDate, isClosed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'financial_periods';
  @override
  VerificationContext validateIntegrity(Insertable<FinancialPeriod> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('is_closed')) {
      context.handle(_isClosedMeta,
          isClosed.isAcceptableOrUnknown(data['is_closed']!, _isClosedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FinancialPeriod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FinancialPeriod(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}end_date'])!,
      isClosed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_closed'])!,
    );
  }

  @override
  FinancialPeriods createAlias(String alias) {
    return FinancialPeriods(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class FinancialPeriod extends DataClass implements Insertable<FinancialPeriod> {
  final int id;
  final double startDate;
  final double endDate;
  final bool isClosed;
  const FinancialPeriod(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.isClosed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start_date'] = Variable<double>(startDate);
    map['end_date'] = Variable<double>(endDate);
    map['is_closed'] = Variable<bool>(isClosed);
    return map;
  }

  FinancialPeriodsCompanion toCompanion(bool nullToAbsent) {
    return FinancialPeriodsCompanion(
      id: Value(id),
      startDate: Value(startDate),
      endDate: Value(endDate),
      isClosed: Value(isClosed),
    );
  }

  factory FinancialPeriod.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FinancialPeriod(
      id: serializer.fromJson<int>(json['id']),
      startDate: serializer.fromJson<double>(json['start_date']),
      endDate: serializer.fromJson<double>(json['end_date']),
      isClosed: serializer.fromJson<bool>(json['is_closed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'start_date': serializer.toJson<double>(startDate),
      'end_date': serializer.toJson<double>(endDate),
      'is_closed': serializer.toJson<bool>(isClosed),
    };
  }

  FinancialPeriod copyWith(
          {int? id, double? startDate, double? endDate, bool? isClosed}) =>
      FinancialPeriod(
        id: id ?? this.id,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        isClosed: isClosed ?? this.isClosed,
      );
  FinancialPeriod copyWithCompanion(FinancialPeriodsCompanion data) {
    return FinancialPeriod(
      id: data.id.present ? data.id.value : this.id,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isClosed: data.isClosed.present ? data.isClosed.value : this.isClosed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FinancialPeriod(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isClosed: $isClosed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, startDate, endDate, isClosed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FinancialPeriod &&
          other.id == this.id &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isClosed == this.isClosed);
}

class FinancialPeriodsCompanion extends UpdateCompanion<FinancialPeriod> {
  final Value<int> id;
  final Value<double> startDate;
  final Value<double> endDate;
  final Value<bool> isClosed;
  const FinancialPeriodsCompanion({
    this.id = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isClosed = const Value.absent(),
  });
  FinancialPeriodsCompanion.insert({
    this.id = const Value.absent(),
    required double startDate,
    required double endDate,
    this.isClosed = const Value.absent(),
  })  : startDate = Value(startDate),
        endDate = Value(endDate);
  static Insertable<FinancialPeriod> custom({
    Expression<int>? id,
    Expression<double>? startDate,
    Expression<double>? endDate,
    Expression<bool>? isClosed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isClosed != null) 'is_closed': isClosed,
    });
  }

  FinancialPeriodsCompanion copyWith(
      {Value<int>? id,
      Value<double>? startDate,
      Value<double>? endDate,
      Value<bool>? isClosed}) {
    return FinancialPeriodsCompanion(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isClosed: isClosed ?? this.isClosed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<double>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<double>(endDate.value);
    }
    if (isClosed.present) {
      map['is_closed'] = Variable<bool>(isClosed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FinancialPeriodsCompanion(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isClosed: $isClosed')
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
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES accounts(id)');
  static const VerificationMeta _accountCodeMeta =
      const VerificationMeta('accountCode');
  late final GeneratedColumn<String> accountCode = GeneratedColumn<String>(
      'account_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _natureMeta = const VerificationMeta('nature');
  late final GeneratedColumn<String> nature = GeneratedColumn<String>(
      'nature', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _reportTypeMeta =
      const VerificationMeta('reportType');
  late final GeneratedColumn<String> reportType = GeneratedColumn<String>(
      'report_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _cashFlowTypeMeta =
      const VerificationMeta('cashFlowType');
  late final GeneratedColumn<String> cashFlowType = GeneratedColumn<String>(
      'cash_flow_type', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _detailAccountTypeMeta =
      const VerificationMeta('detailAccountType');
  late final GeneratedColumn<String> detailAccountType =
      GeneratedColumn<String>('detail_account_type', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        parentId,
        accountCode,
        nameAr,
        nameEn,
        level,
        isActive,
        nature,
        reportType,
        cashFlowType,
        detailAccountType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('account_code')) {
      context.handle(
          _accountCodeMeta,
          accountCode.isAcceptableOrUnknown(
              data['account_code']!, _accountCodeMeta));
    } else if (isInserting) {
      context.missing(_accountCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('nature')) {
      context.handle(_natureMeta,
          nature.isAcceptableOrUnknown(data['nature']!, _natureMeta));
    } else if (isInserting) {
      context.missing(_natureMeta);
    }
    if (data.containsKey('report_type')) {
      context.handle(
          _reportTypeMeta,
          reportType.isAcceptableOrUnknown(
              data['report_type']!, _reportTypeMeta));
    } else if (isInserting) {
      context.missing(_reportTypeMeta);
    }
    if (data.containsKey('cash_flow_type')) {
      context.handle(
          _cashFlowTypeMeta,
          cashFlowType.isAcceptableOrUnknown(
              data['cash_flow_type']!, _cashFlowTypeMeta));
    }
    if (data.containsKey('detail_account_type')) {
      context.handle(
          _detailAccountTypeMeta,
          detailAccountType.isAcceptableOrUnknown(
              data['detail_account_type']!, _detailAccountTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id']),
      accountCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      nature: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nature'])!,
      reportType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}report_type'])!,
      cashFlowType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cash_flow_type']),
      detailAccountType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}detail_account_type']),
    );
  }

  @override
  Accounts createAlias(String alias) {
    return Accounts(attachedDatabase, alias);
  }

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
  final bool isActive;
  final String nature;
  final String reportType;
  final String? cashFlowType;
  final String? detailAccountType;
  const Account(
      {required this.id,
      this.parentId,
      required this.accountCode,
      required this.nameAr,
      required this.nameEn,
      required this.level,
      required this.isActive,
      required this.nature,
      required this.reportType,
      this.cashFlowType,
      this.detailAccountType});
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
    map['is_active'] = Variable<bool>(isActive);
    map['nature'] = Variable<String>(nature);
    map['report_type'] = Variable<String>(reportType);
    if (!nullToAbsent || cashFlowType != null) {
      map['cash_flow_type'] = Variable<String>(cashFlowType);
    }
    if (!nullToAbsent || detailAccountType != null) {
      map['detail_account_type'] = Variable<String>(detailAccountType);
    }
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
      isActive: Value(isActive),
      nature: Value(nature),
      reportType: Value(reportType),
      cashFlowType: cashFlowType == null && nullToAbsent
          ? const Value.absent()
          : Value(cashFlowType),
      detailAccountType: detailAccountType == null && nullToAbsent
          ? const Value.absent()
          : Value(detailAccountType),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int?>(json['parent_id']),
      accountCode: serializer.fromJson<String>(json['account_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      level: serializer.fromJson<int>(json['level']),
      isActive: serializer.fromJson<bool>(json['is_active']),
      nature: serializer.fromJson<String>(json['nature']),
      reportType: serializer.fromJson<String>(json['report_type']),
      cashFlowType: serializer.fromJson<String?>(json['cash_flow_type']),
      detailAccountType:
          serializer.fromJson<String?>(json['detail_account_type']),
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
      'is_active': serializer.toJson<bool>(isActive),
      'nature': serializer.toJson<String>(nature),
      'report_type': serializer.toJson<String>(reportType),
      'cash_flow_type': serializer.toJson<String?>(cashFlowType),
      'detail_account_type': serializer.toJson<String?>(detailAccountType),
    };
  }

  Account copyWith(
          {int? id,
          Value<int?> parentId = const Value.absent(),
          String? accountCode,
          String? nameAr,
          String? nameEn,
          int? level,
          bool? isActive,
          String? nature,
          String? reportType,
          Value<String?> cashFlowType = const Value.absent(),
          Value<String?> detailAccountType = const Value.absent()}) =>
      Account(
        id: id ?? this.id,
        parentId: parentId.present ? parentId.value : this.parentId,
        accountCode: accountCode ?? this.accountCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        level: level ?? this.level,
        isActive: isActive ?? this.isActive,
        nature: nature ?? this.nature,
        reportType: reportType ?? this.reportType,
        cashFlowType:
            cashFlowType.present ? cashFlowType.value : this.cashFlowType,
        detailAccountType: detailAccountType.present
            ? detailAccountType.value
            : this.detailAccountType,
      );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      accountCode:
          data.accountCode.present ? data.accountCode.value : this.accountCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      level: data.level.present ? data.level.value : this.level,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      nature: data.nature.present ? data.nature.value : this.nature,
      reportType:
          data.reportType.present ? data.reportType.value : this.reportType,
      cashFlowType: data.cashFlowType.present
          ? data.cashFlowType.value
          : this.cashFlowType,
      detailAccountType: data.detailAccountType.present
          ? data.detailAccountType.value
          : this.detailAccountType,
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
          ..write('isActive: $isActive, ')
          ..write('nature: $nature, ')
          ..write('reportType: $reportType, ')
          ..write('cashFlowType: $cashFlowType, ')
          ..write('detailAccountType: $detailAccountType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, parentId, accountCode, nameAr, nameEn,
      level, isActive, nature, reportType, cashFlowType, detailAccountType);
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
          other.isActive == this.isActive &&
          other.nature == this.nature &&
          other.reportType == this.reportType &&
          other.cashFlowType == this.cashFlowType &&
          other.detailAccountType == this.detailAccountType);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<int?> parentId;
  final Value<String> accountCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<int> level;
  final Value<bool> isActive;
  final Value<String> nature;
  final Value<String> reportType;
  final Value<String?> cashFlowType;
  final Value<String?> detailAccountType;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.accountCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.level = const Value.absent(),
    this.isActive = const Value.absent(),
    this.nature = const Value.absent(),
    this.reportType = const Value.absent(),
    this.cashFlowType = const Value.absent(),
    this.detailAccountType = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    required String accountCode,
    required String nameAr,
    required String nameEn,
    required int level,
    this.isActive = const Value.absent(),
    required String nature,
    required String reportType,
    this.cashFlowType = const Value.absent(),
    this.detailAccountType = const Value.absent(),
  })  : accountCode = Value(accountCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        level = Value(level),
        nature = Value(nature),
        reportType = Value(reportType);
  static Insertable<Account> custom({
    Expression<int>? id,
    Expression<int>? parentId,
    Expression<String>? accountCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<int>? level,
    Expression<bool>? isActive,
    Expression<String>? nature,
    Expression<String>? reportType,
    Expression<String>? cashFlowType,
    Expression<String>? detailAccountType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (accountCode != null) 'account_code': accountCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (level != null) 'level': level,
      if (isActive != null) 'is_active': isActive,
      if (nature != null) 'nature': nature,
      if (reportType != null) 'report_type': reportType,
      if (cashFlowType != null) 'cash_flow_type': cashFlowType,
      if (detailAccountType != null) 'detail_account_type': detailAccountType,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? parentId,
      Value<String>? accountCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<int>? level,
      Value<bool>? isActive,
      Value<String>? nature,
      Value<String>? reportType,
      Value<String?>? cashFlowType,
      Value<String?>? detailAccountType}) {
    return AccountsCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      accountCode: accountCode ?? this.accountCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      level: level ?? this.level,
      isActive: isActive ?? this.isActive,
      nature: nature ?? this.nature,
      reportType: reportType ?? this.reportType,
      cashFlowType: cashFlowType ?? this.cashFlowType,
      detailAccountType: detailAccountType ?? this.detailAccountType,
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
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (nature.present) {
      map['nature'] = Variable<String>(nature.value);
    }
    if (reportType.present) {
      map['report_type'] = Variable<String>(reportType.value);
    }
    if (cashFlowType.present) {
      map['cash_flow_type'] = Variable<String>(cashFlowType.value);
    }
    if (detailAccountType.present) {
      map['detail_account_type'] = Variable<String>(detailAccountType.value);
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
          ..write('isActive: $isActive, ')
          ..write('nature: $nature, ')
          ..write('reportType: $reportType, ')
          ..write('cashFlowType: $cashFlowType, ')
          ..write('detailAccountType: $detailAccountType')
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
      'role_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES roles(id)');
  static const VerificationMeta _permissionMeta =
      const VerificationMeta('permission');
  late final GeneratedColumn<String> permission = GeneratedColumn<String>(
      'permission', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [roleId, permission];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'role_permissions';
  @override
  VerificationContext validateIntegrity(Insertable<RolePermission> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    if (data.containsKey('permission')) {
      context.handle(
          _permissionMeta,
          permission.isAcceptableOrUnknown(
              data['permission']!, _permissionMeta));
    } else if (isInserting) {
      context.missing(_permissionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {roleId, permission};
  @override
  RolePermission map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RolePermission(
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}role_id'])!,
      permission: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}permission'])!,
    );
  }

  @override
  RolePermissions createAlias(String alias) {
    return RolePermissions(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY(role_id, permission)'];
  @override
  bool get dontWriteConstraints => true;
}

class RolePermission extends DataClass implements Insertable<RolePermission> {
  final int roleId;
  final String permission;
  const RolePermission({required this.roleId, required this.permission});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['role_id'] = Variable<int>(roleId);
    map['permission'] = Variable<String>(permission);
    return map;
  }

  RolePermissionsCompanion toCompanion(bool nullToAbsent) {
    return RolePermissionsCompanion(
      roleId: Value(roleId),
      permission: Value(permission),
    );
  }

  factory RolePermission.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RolePermission(
      roleId: serializer.fromJson<int>(json['role_id']),
      permission: serializer.fromJson<String>(json['permission']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'role_id': serializer.toJson<int>(roleId),
      'permission': serializer.toJson<String>(permission),
    };
  }

  RolePermission copyWith({int? roleId, String? permission}) => RolePermission(
        roleId: roleId ?? this.roleId,
        permission: permission ?? this.permission,
      );
  RolePermission copyWithCompanion(RolePermissionsCompanion data) {
    return RolePermission(
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
      permission:
          data.permission.present ? data.permission.value : this.permission,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RolePermission(')
          ..write('roleId: $roleId, ')
          ..write('permission: $permission')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(roleId, permission);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RolePermission &&
          other.roleId == this.roleId &&
          other.permission == this.permission);
}

class RolePermissionsCompanion extends UpdateCompanion<RolePermission> {
  final Value<int> roleId;
  final Value<String> permission;
  final Value<int> rowid;
  const RolePermissionsCompanion({
    this.roleId = const Value.absent(),
    this.permission = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RolePermissionsCompanion.insert({
    required int roleId,
    required String permission,
    this.rowid = const Value.absent(),
  })  : roleId = Value(roleId),
        permission = Value(permission);
  static Insertable<RolePermission> custom({
    Expression<int>? roleId,
    Expression<String>? permission,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (roleId != null) 'role_id': roleId,
      if (permission != null) 'permission': permission,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RolePermissionsCompanion copyWith(
      {Value<int>? roleId, Value<String>? permission, Value<int>? rowid}) {
    return RolePermissionsCompanion(
      roleId: roleId ?? this.roleId,
      permission: permission ?? this.permission,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (roleId.present) {
      map['role_id'] = Variable<int>(roleId.value);
    }
    if (permission.present) {
      map['permission'] = Variable<String>(permission.value);
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
          ..write('permission: $permission, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class BranchGroups extends Table with TableInfo<BranchGroups, BranchGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BranchGroups(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  @override
  List<GeneratedColumn> get $columns => [id, nameAr, nameEn, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'branch_groups';
  @override
  VerificationContext validateIntegrity(Insertable<BranchGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BranchGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BranchGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  BranchGroups createAlias(String alias) {
    return BranchGroups(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class BranchGroup extends DataClass implements Insertable<BranchGroup> {
  final int id;
  final String nameAr;
  final String nameEn;
  final bool isActive;
  const BranchGroup(
      {required this.id,
      required this.nameAr,
      required this.nameEn,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  BranchGroupsCompanion toCompanion(bool nullToAbsent) {
    return BranchGroupsCompanion(
      id: Value(id),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      isActive: Value(isActive),
    );
  }

  factory BranchGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BranchGroup(
      id: serializer.fromJson<int>(json['id']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
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
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  BranchGroup copyWith(
          {int? id, String? nameAr, String? nameEn, bool? isActive}) =>
      BranchGroup(
        id: id ?? this.id,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        isActive: isActive ?? this.isActive,
      );
  BranchGroup copyWithCompanion(BranchGroupsCompanion data) {
    return BranchGroup(
      id: data.id.present ? data.id.value : this.id,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BranchGroup(')
          ..write('id: $id, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameAr, nameEn, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BranchGroup &&
          other.id == this.id &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.isActive == this.isActive);
}

class BranchGroupsCompanion extends UpdateCompanion<BranchGroup> {
  final Value<int> id;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<bool> isActive;
  const BranchGroupsCompanion({
    this.id = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  BranchGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String nameAr,
    required String nameEn,
    this.isActive = const Value.absent(),
  })  : nameAr = Value(nameAr),
        nameEn = Value(nameEn);
  static Insertable<BranchGroup> custom({
    Expression<int>? id,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (isActive != null) 'is_active': isActive,
    });
  }

  BranchGroupsCompanion copyWith(
      {Value<int>? id,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<bool>? isActive}) {
    return BranchGroupsCompanion(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
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
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BranchGroupsCompanion(')
          ..write('id: $id, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class Branches extends Table with TableInfo<Branches, Branche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Branches(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _branchCodeMeta =
      const VerificationMeta('branchCode');
  late final GeneratedColumn<String> branchCode = GeneratedColumn<String>(
      'branch_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _companyIdMeta =
      const VerificationMeta('companyId');
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
      'company_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES company_info(id)');
  static const VerificationMeta _branchGroupIdMeta =
      const VerificationMeta('branchGroupId');
  late final GeneratedColumn<int> branchGroupId = GeneratedColumn<int>(
      'branch_group_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES branch_groups(id)');
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _defaultWarehouseIdMeta =
      const VerificationMeta('defaultWarehouseId');
  late final GeneratedColumn<String> defaultWarehouseId =
      GeneratedColumn<String>('default_warehouse_id', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const VerificationMeta _branchStatusMeta =
      const VerificationMeta('branchStatus');
  late final GeneratedColumn<bool> branchStatus = GeneratedColumn<bool>(
      'branch_status', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  late final GeneratedColumn<Uint8List> logo = GeneratedColumn<Uint8List>(
      'logo', aliasedName, true,
      type: DriftSqlType.blob,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _remarksMeta =
      const VerificationMeta('remarks');
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
      'remarks', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        branchCode,
        nameAr,
        nameEn,
        companyId,
        branchGroupId,
        address,
        phone,
        defaultWarehouseId,
        branchStatus,
        logo,
        remarks
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'branches';
  @override
  VerificationContext validateIntegrity(Insertable<Branche> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('branch_code')) {
      context.handle(
          _branchCodeMeta,
          branchCode.isAcceptableOrUnknown(
              data['branch_code']!, _branchCodeMeta));
    } else if (isInserting) {
      context.missing(_branchCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('branch_group_id')) {
      context.handle(
          _branchGroupIdMeta,
          branchGroupId.isAcceptableOrUnknown(
              data['branch_group_id']!, _branchGroupIdMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('default_warehouse_id')) {
      context.handle(
          _defaultWarehouseIdMeta,
          defaultWarehouseId.isAcceptableOrUnknown(
              data['default_warehouse_id']!, _defaultWarehouseIdMeta));
    }
    if (data.containsKey('branch_status')) {
      context.handle(
          _branchStatusMeta,
          branchStatus.isAcceptableOrUnknown(
              data['branch_status']!, _branchStatusMeta));
    }
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Branche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Branche(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      branchCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}branch_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      companyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}company_id'])!,
      branchGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_group_id']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      defaultWarehouseId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}default_warehouse_id']),
      branchStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}branch_status'])!,
      logo: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}logo']),
      remarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remarks']),
    );
  }

  @override
  Branches createAlias(String alias) {
    return Branches(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Branche extends DataClass implements Insertable<Branche> {
  final int id;
  final String branchCode;
  final String nameAr;
  final String nameEn;
  final int companyId;
  final int? branchGroupId;
  final String? address;
  final String? phone;
  final String? defaultWarehouseId;
  final bool branchStatus;
  final Uint8List? logo;
  final String? remarks;
  const Branche(
      {required this.id,
      required this.branchCode,
      required this.nameAr,
      required this.nameEn,
      required this.companyId,
      this.branchGroupId,
      this.address,
      this.phone,
      this.defaultWarehouseId,
      required this.branchStatus,
      this.logo,
      this.remarks});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['branch_code'] = Variable<String>(branchCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['company_id'] = Variable<int>(companyId);
    if (!nullToAbsent || branchGroupId != null) {
      map['branch_group_id'] = Variable<int>(branchGroupId);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || defaultWarehouseId != null) {
      map['default_warehouse_id'] = Variable<String>(defaultWarehouseId);
    }
    map['branch_status'] = Variable<bool>(branchStatus);
    if (!nullToAbsent || logo != null) {
      map['logo'] = Variable<Uint8List>(logo);
    }
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    return map;
  }

  BranchesCompanion toCompanion(bool nullToAbsent) {
    return BranchesCompanion(
      id: Value(id),
      branchCode: Value(branchCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      companyId: Value(companyId),
      branchGroupId: branchGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchGroupId),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      defaultWarehouseId: defaultWarehouseId == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultWarehouseId),
      branchStatus: Value(branchStatus),
      logo: logo == null && nullToAbsent ? const Value.absent() : Value(logo),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
    );
  }

  factory Branche.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Branche(
      id: serializer.fromJson<int>(json['id']),
      branchCode: serializer.fromJson<String>(json['branch_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      companyId: serializer.fromJson<int>(json['company_id']),
      branchGroupId: serializer.fromJson<int?>(json['branch_group_id']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      defaultWarehouseId:
          serializer.fromJson<String?>(json['default_warehouse_id']),
      branchStatus: serializer.fromJson<bool>(json['branch_status']),
      logo: serializer.fromJson<Uint8List?>(json['logo']),
      remarks: serializer.fromJson<String?>(json['remarks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'branch_code': serializer.toJson<String>(branchCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'company_id': serializer.toJson<int>(companyId),
      'branch_group_id': serializer.toJson<int?>(branchGroupId),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'default_warehouse_id': serializer.toJson<String?>(defaultWarehouseId),
      'branch_status': serializer.toJson<bool>(branchStatus),
      'logo': serializer.toJson<Uint8List?>(logo),
      'remarks': serializer.toJson<String?>(remarks),
    };
  }

  Branche copyWith(
          {int? id,
          String? branchCode,
          String? nameAr,
          String? nameEn,
          int? companyId,
          Value<int?> branchGroupId = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> defaultWarehouseId = const Value.absent(),
          bool? branchStatus,
          Value<Uint8List?> logo = const Value.absent(),
          Value<String?> remarks = const Value.absent()}) =>
      Branche(
        id: id ?? this.id,
        branchCode: branchCode ?? this.branchCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        companyId: companyId ?? this.companyId,
        branchGroupId:
            branchGroupId.present ? branchGroupId.value : this.branchGroupId,
        address: address.present ? address.value : this.address,
        phone: phone.present ? phone.value : this.phone,
        defaultWarehouseId: defaultWarehouseId.present
            ? defaultWarehouseId.value
            : this.defaultWarehouseId,
        branchStatus: branchStatus ?? this.branchStatus,
        logo: logo.present ? logo.value : this.logo,
        remarks: remarks.present ? remarks.value : this.remarks,
      );
  Branche copyWithCompanion(BranchesCompanion data) {
    return Branche(
      id: data.id.present ? data.id.value : this.id,
      branchCode:
          data.branchCode.present ? data.branchCode.value : this.branchCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      branchGroupId: data.branchGroupId.present
          ? data.branchGroupId.value
          : this.branchGroupId,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      defaultWarehouseId: data.defaultWarehouseId.present
          ? data.defaultWarehouseId.value
          : this.defaultWarehouseId,
      branchStatus: data.branchStatus.present
          ? data.branchStatus.value
          : this.branchStatus,
      logo: data.logo.present ? data.logo.value : this.logo,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Branche(')
          ..write('id: $id, ')
          ..write('branchCode: $branchCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('companyId: $companyId, ')
          ..write('branchGroupId: $branchGroupId, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('defaultWarehouseId: $defaultWarehouseId, ')
          ..write('branchStatus: $branchStatus, ')
          ..write('logo: $logo, ')
          ..write('remarks: $remarks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      branchCode,
      nameAr,
      nameEn,
      companyId,
      branchGroupId,
      address,
      phone,
      defaultWarehouseId,
      branchStatus,
      $driftBlobEquality.hash(logo),
      remarks);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Branche &&
          other.id == this.id &&
          other.branchCode == this.branchCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.companyId == this.companyId &&
          other.branchGroupId == this.branchGroupId &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.defaultWarehouseId == this.defaultWarehouseId &&
          other.branchStatus == this.branchStatus &&
          $driftBlobEquality.equals(other.logo, this.logo) &&
          other.remarks == this.remarks);
}

class BranchesCompanion extends UpdateCompanion<Branche> {
  final Value<int> id;
  final Value<String> branchCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<int> companyId;
  final Value<int?> branchGroupId;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String?> defaultWarehouseId;
  final Value<bool> branchStatus;
  final Value<Uint8List?> logo;
  final Value<String?> remarks;
  const BranchesCompanion({
    this.id = const Value.absent(),
    this.branchCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.companyId = const Value.absent(),
    this.branchGroupId = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.defaultWarehouseId = const Value.absent(),
    this.branchStatus = const Value.absent(),
    this.logo = const Value.absent(),
    this.remarks = const Value.absent(),
  });
  BranchesCompanion.insert({
    this.id = const Value.absent(),
    required String branchCode,
    required String nameAr,
    required String nameEn,
    required int companyId,
    this.branchGroupId = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.defaultWarehouseId = const Value.absent(),
    this.branchStatus = const Value.absent(),
    this.logo = const Value.absent(),
    this.remarks = const Value.absent(),
  })  : branchCode = Value(branchCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        companyId = Value(companyId);
  static Insertable<Branche> custom({
    Expression<int>? id,
    Expression<String>? branchCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<int>? companyId,
    Expression<int>? branchGroupId,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? defaultWarehouseId,
    Expression<bool>? branchStatus,
    Expression<Uint8List>? logo,
    Expression<String>? remarks,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (branchCode != null) 'branch_code': branchCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (companyId != null) 'company_id': companyId,
      if (branchGroupId != null) 'branch_group_id': branchGroupId,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (defaultWarehouseId != null)
        'default_warehouse_id': defaultWarehouseId,
      if (branchStatus != null) 'branch_status': branchStatus,
      if (logo != null) 'logo': logo,
      if (remarks != null) 'remarks': remarks,
    });
  }

  BranchesCompanion copyWith(
      {Value<int>? id,
      Value<String>? branchCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<int>? companyId,
      Value<int?>? branchGroupId,
      Value<String?>? address,
      Value<String?>? phone,
      Value<String?>? defaultWarehouseId,
      Value<bool>? branchStatus,
      Value<Uint8List?>? logo,
      Value<String?>? remarks}) {
    return BranchesCompanion(
      id: id ?? this.id,
      branchCode: branchCode ?? this.branchCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      companyId: companyId ?? this.companyId,
      branchGroupId: branchGroupId ?? this.branchGroupId,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      defaultWarehouseId: defaultWarehouseId ?? this.defaultWarehouseId,
      branchStatus: branchStatus ?? this.branchStatus,
      logo: logo ?? this.logo,
      remarks: remarks ?? this.remarks,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (branchCode.present) {
      map['branch_code'] = Variable<String>(branchCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (branchGroupId.present) {
      map['branch_group_id'] = Variable<int>(branchGroupId.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (defaultWarehouseId.present) {
      map['default_warehouse_id'] = Variable<String>(defaultWarehouseId.value);
    }
    if (branchStatus.present) {
      map['branch_status'] = Variable<bool>(branchStatus.value);
    }
    if (logo.present) {
      map['logo'] = Variable<Uint8List>(logo.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BranchesCompanion(')
          ..write('id: $id, ')
          ..write('branchCode: $branchCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('companyId: $companyId, ')
          ..write('branchGroupId: $branchGroupId, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('defaultWarehouseId: $defaultWarehouseId, ')
          ..write('branchStatus: $branchStatus, ')
          ..write('logo: $logo, ')
          ..write('remarks: $remarks')
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
      'user_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _fullNameArMeta =
      const VerificationMeta('fullNameAr');
  late final GeneratedColumn<String> fullNameAr = GeneratedColumn<String>(
      'full_name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _fullNameEnMeta =
      const VerificationMeta('fullNameEn');
  late final GeneratedColumn<String> fullNameEn = GeneratedColumn<String>(
      'full_name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES branches(id)');
  static const VerificationMeta _isBiometricEnabledMeta =
      const VerificationMeta('isBiometricEnabled');
  late final GeneratedColumn<bool> isBiometricEnabled = GeneratedColumn<bool>(
      'is_biometric_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _isDeviceLinkedMeta =
      const VerificationMeta('isDeviceLinked');
  late final GeneratedColumn<bool> isDeviceLinked = GeneratedColumn<bool>(
      'is_device_linked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        username,
        password,
        fullNameAr,
        fullNameEn,
        isActive,
        branchId,
        isBiometricEnabled,
        isDeviceLinked
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('full_name_ar')) {
      context.handle(
          _fullNameArMeta,
          fullNameAr.isAcceptableOrUnknown(
              data['full_name_ar']!, _fullNameArMeta));
    } else if (isInserting) {
      context.missing(_fullNameArMeta);
    }
    if (data.containsKey('full_name_en')) {
      context.handle(
          _fullNameEnMeta,
          fullNameEn.isAcceptableOrUnknown(
              data['full_name_en']!, _fullNameEnMeta));
    } else if (isInserting) {
      context.missing(_fullNameEnMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('is_biometric_enabled')) {
      context.handle(
          _isBiometricEnabledMeta,
          isBiometricEnabled.isAcceptableOrUnknown(
              data['is_biometric_enabled']!, _isBiometricEnabledMeta));
    }
    if (data.containsKey('is_device_linked')) {
      context.handle(
          _isDeviceLinkedMeta,
          isDeviceLinked.isAcceptableOrUnknown(
              data['is_device_linked']!, _isDeviceLinkedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      fullNameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name_ar'])!,
      fullNameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name_en'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id']),
      isBiometricEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_biometric_enabled'])!,
      isDeviceLinked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_device_linked'])!,
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
  final String password;
  final String fullNameAr;
  final String fullNameEn;
  final bool isActive;
  final int? branchId;

  /// Can be null for system-wide users
  final bool isBiometricEnabled;
  final bool isDeviceLinked;
  const User(
      {required this.userId,
      required this.username,
      required this.password,
      required this.fullNameAr,
      required this.fullNameEn,
      required this.isActive,
      this.branchId,
      required this.isBiometricEnabled,
      required this.isDeviceLinked});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['full_name_ar'] = Variable<String>(fullNameAr);
    map['full_name_en'] = Variable<String>(fullNameEn);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<int>(branchId);
    }
    map['is_biometric_enabled'] = Variable<bool>(isBiometricEnabled);
    map['is_device_linked'] = Variable<bool>(isDeviceLinked);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userId: Value(userId),
      username: Value(username),
      password: Value(password),
      fullNameAr: Value(fullNameAr),
      fullNameEn: Value(fullNameEn),
      isActive: Value(isActive),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      isBiometricEnabled: Value(isBiometricEnabled),
      isDeviceLinked: Value(isDeviceLinked),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      userId: serializer.fromJson<int>(json['user_id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      fullNameAr: serializer.fromJson<String>(json['full_name_ar']),
      fullNameEn: serializer.fromJson<String>(json['full_name_en']),
      isActive: serializer.fromJson<bool>(json['is_active']),
      branchId: serializer.fromJson<int?>(json['branch_id']),
      isBiometricEnabled:
          serializer.fromJson<bool>(json['is_biometric_enabled']),
      isDeviceLinked: serializer.fromJson<bool>(json['is_device_linked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<int>(userId),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'full_name_ar': serializer.toJson<String>(fullNameAr),
      'full_name_en': serializer.toJson<String>(fullNameEn),
      'is_active': serializer.toJson<bool>(isActive),
      'branch_id': serializer.toJson<int?>(branchId),
      'is_biometric_enabled': serializer.toJson<bool>(isBiometricEnabled),
      'is_device_linked': serializer.toJson<bool>(isDeviceLinked),
    };
  }

  User copyWith(
          {int? userId,
          String? username,
          String? password,
          String? fullNameAr,
          String? fullNameEn,
          bool? isActive,
          Value<int?> branchId = const Value.absent(),
          bool? isBiometricEnabled,
          bool? isDeviceLinked}) =>
      User(
        userId: userId ?? this.userId,
        username: username ?? this.username,
        password: password ?? this.password,
        fullNameAr: fullNameAr ?? this.fullNameAr,
        fullNameEn: fullNameEn ?? this.fullNameEn,
        isActive: isActive ?? this.isActive,
        branchId: branchId.present ? branchId.value : this.branchId,
        isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
        isDeviceLinked: isDeviceLinked ?? this.isDeviceLinked,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      userId: data.userId.present ? data.userId.value : this.userId,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      fullNameAr:
          data.fullNameAr.present ? data.fullNameAr.value : this.fullNameAr,
      fullNameEn:
          data.fullNameEn.present ? data.fullNameEn.value : this.fullNameEn,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      branchId: data.branchId.present ? data.branchId.value : this.branchId,
      isBiometricEnabled: data.isBiometricEnabled.present
          ? data.isBiometricEnabled.value
          : this.isBiometricEnabled,
      isDeviceLinked: data.isDeviceLinked.present
          ? data.isDeviceLinked.value
          : this.isDeviceLinked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('fullNameAr: $fullNameAr, ')
          ..write('fullNameEn: $fullNameEn, ')
          ..write('isActive: $isActive, ')
          ..write('branchId: $branchId, ')
          ..write('isBiometricEnabled: $isBiometricEnabled, ')
          ..write('isDeviceLinked: $isDeviceLinked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, username, password, fullNameAr,
      fullNameEn, isActive, branchId, isBiometricEnabled, isDeviceLinked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.userId == this.userId &&
          other.username == this.username &&
          other.password == this.password &&
          other.fullNameAr == this.fullNameAr &&
          other.fullNameEn == this.fullNameEn &&
          other.isActive == this.isActive &&
          other.branchId == this.branchId &&
          other.isBiometricEnabled == this.isBiometricEnabled &&
          other.isDeviceLinked == this.isDeviceLinked);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> userId;
  final Value<String> username;
  final Value<String> password;
  final Value<String> fullNameAr;
  final Value<String> fullNameEn;
  final Value<bool> isActive;
  final Value<int?> branchId;
  final Value<bool> isBiometricEnabled;
  final Value<bool> isDeviceLinked;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.fullNameAr = const Value.absent(),
    this.fullNameEn = const Value.absent(),
    this.isActive = const Value.absent(),
    this.branchId = const Value.absent(),
    this.isBiometricEnabled = const Value.absent(),
    this.isDeviceLinked = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userId = const Value.absent(),
    required String username,
    required String password,
    required String fullNameAr,
    required String fullNameEn,
    this.isActive = const Value.absent(),
    this.branchId = const Value.absent(),
    this.isBiometricEnabled = const Value.absent(),
    this.isDeviceLinked = const Value.absent(),
  })  : username = Value(username),
        password = Value(password),
        fullNameAr = Value(fullNameAr),
        fullNameEn = Value(fullNameEn);
  static Insertable<User> custom({
    Expression<int>? userId,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? fullNameAr,
    Expression<String>? fullNameEn,
    Expression<bool>? isActive,
    Expression<int>? branchId,
    Expression<bool>? isBiometricEnabled,
    Expression<bool>? isDeviceLinked,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (fullNameAr != null) 'full_name_ar': fullNameAr,
      if (fullNameEn != null) 'full_name_en': fullNameEn,
      if (isActive != null) 'is_active': isActive,
      if (branchId != null) 'branch_id': branchId,
      if (isBiometricEnabled != null)
        'is_biometric_enabled': isBiometricEnabled,
      if (isDeviceLinked != null) 'is_device_linked': isDeviceLinked,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? userId,
      Value<String>? username,
      Value<String>? password,
      Value<String>? fullNameAr,
      Value<String>? fullNameEn,
      Value<bool>? isActive,
      Value<int?>? branchId,
      Value<bool>? isBiometricEnabled,
      Value<bool>? isDeviceLinked}) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      password: password ?? this.password,
      fullNameAr: fullNameAr ?? this.fullNameAr,
      fullNameEn: fullNameEn ?? this.fullNameEn,
      isActive: isActive ?? this.isActive,
      branchId: branchId ?? this.branchId,
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      isDeviceLinked: isDeviceLinked ?? this.isDeviceLinked,
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
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (fullNameAr.present) {
      map['full_name_ar'] = Variable<String>(fullNameAr.value);
    }
    if (fullNameEn.present) {
      map['full_name_en'] = Variable<String>(fullNameEn.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (isBiometricEnabled.present) {
      map['is_biometric_enabled'] = Variable<bool>(isBiometricEnabled.value);
    }
    if (isDeviceLinked.present) {
      map['is_device_linked'] = Variable<bool>(isDeviceLinked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('fullNameAr: $fullNameAr, ')
          ..write('fullNameEn: $fullNameEn, ')
          ..write('isActive: $isActive, ')
          ..write('branchId: $branchId, ')
          ..write('isBiometricEnabled: $isBiometricEnabled, ')
          ..write('isDeviceLinked: $isDeviceLinked')
          ..write(')'))
        .toString();
  }
}

class AuditLog extends Table with TableInfo<AuditLog, AuditLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AuditLog(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES users(user_id)');
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  late final GeneratedColumn<double> timestamp = GeneratedColumn<double>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _eventActionMeta =
      const VerificationMeta('eventAction');
  late final GeneratedColumn<String> eventAction = GeneratedColumn<String>(
      'event_action', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _detailsMeta =
      const VerificationMeta('details');
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
      'details', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, timestamp, eventAction, details];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_log';
  @override
  VerificationContext validateIntegrity(Insertable<AuditLogData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('event_action')) {
      context.handle(
          _eventActionMeta,
          eventAction.isAcceptableOrUnknown(
              data['event_action']!, _eventActionMeta));
    } else if (isInserting) {
      context.missing(_eventActionMeta);
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta,
          details.isAcceptableOrUnknown(data['details']!, _detailsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}timestamp'])!,
      eventAction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_action'])!,
      details: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}details']),
    );
  }

  @override
  AuditLog createAlias(String alias) {
    return AuditLog(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AuditLogData extends DataClass implements Insertable<AuditLogData> {
  final int id;
  final int userId;
  final double timestamp;
  final String eventAction;
  final String? details;
  const AuditLogData(
      {required this.id,
      required this.userId,
      required this.timestamp,
      required this.eventAction,
      this.details});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['timestamp'] = Variable<double>(timestamp);
    map['event_action'] = Variable<String>(eventAction);
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    return map;
  }

  AuditLogCompanion toCompanion(bool nullToAbsent) {
    return AuditLogCompanion(
      id: Value(id),
      userId: Value(userId),
      timestamp: Value(timestamp),
      eventAction: Value(eventAction),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
    );
  }

  factory AuditLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLogData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['user_id']),
      timestamp: serializer.fromJson<double>(json['timestamp']),
      eventAction: serializer.fromJson<String>(json['event_action']),
      details: serializer.fromJson<String?>(json['details']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'user_id': serializer.toJson<int>(userId),
      'timestamp': serializer.toJson<double>(timestamp),
      'event_action': serializer.toJson<String>(eventAction),
      'details': serializer.toJson<String?>(details),
    };
  }

  AuditLogData copyWith(
          {int? id,
          int? userId,
          double? timestamp,
          String? eventAction,
          Value<String?> details = const Value.absent()}) =>
      AuditLogData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        timestamp: timestamp ?? this.timestamp,
        eventAction: eventAction ?? this.eventAction,
        details: details.present ? details.value : this.details,
      );
  AuditLogData copyWithCompanion(AuditLogCompanion data) {
    return AuditLogData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      eventAction:
          data.eventAction.present ? data.eventAction.value : this.eventAction,
      details: data.details.present ? data.details.value : this.details,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('timestamp: $timestamp, ')
          ..write('eventAction: $eventAction, ')
          ..write('details: $details')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, timestamp, eventAction, details);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLogData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.timestamp == this.timestamp &&
          other.eventAction == this.eventAction &&
          other.details == this.details);
}

class AuditLogCompanion extends UpdateCompanion<AuditLogData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<double> timestamp;
  final Value<String> eventAction;
  final Value<String?> details;
  const AuditLogCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.eventAction = const Value.absent(),
    this.details = const Value.absent(),
  });
  AuditLogCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required double timestamp,
    required String eventAction,
    this.details = const Value.absent(),
  })  : userId = Value(userId),
        timestamp = Value(timestamp),
        eventAction = Value(eventAction);
  static Insertable<AuditLogData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<double>? timestamp,
    Expression<String>? eventAction,
    Expression<String>? details,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (timestamp != null) 'timestamp': timestamp,
      if (eventAction != null) 'event_action': eventAction,
      if (details != null) 'details': details,
    });
  }

  AuditLogCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<double>? timestamp,
      Value<String>? eventAction,
      Value<String?>? details}) {
    return AuditLogCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      timestamp: timestamp ?? this.timestamp,
      eventAction: eventAction ?? this.eventAction,
      details: details ?? this.details,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<double>(timestamp.value);
    }
    if (eventAction.present) {
      map['event_action'] = Variable<String>(eventAction.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('timestamp: $timestamp, ')
          ..write('eventAction: $eventAction, ')
          ..write('details: $details')
          ..write(')'))
        .toString();
  }
}

class Zones extends Table with TableInfo<Zones, Zone> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Zones(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _zoneCodeMeta =
      const VerificationMeta('zoneCode');
  late final GeneratedColumn<String> zoneCode = GeneratedColumn<String>(
      'zone_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, zoneCode, nameAr, nameEn, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'zones';
  @override
  VerificationContext validateIntegrity(Insertable<Zone> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('zone_code')) {
      context.handle(_zoneCodeMeta,
          zoneCode.isAcceptableOrUnknown(data['zone_code']!, _zoneCodeMeta));
    } else if (isInserting) {
      context.missing(_zoneCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Zone map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Zone(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      zoneCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zone_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  Zones createAlias(String alias) {
    return Zones(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Zone extends DataClass implements Insertable<Zone> {
  final int id;
  final String zoneCode;
  final String nameAr;
  final String nameEn;
  final bool isActive;
  const Zone(
      {required this.id,
      required this.zoneCode,
      required this.nameAr,
      required this.nameEn,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['zone_code'] = Variable<String>(zoneCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  ZonesCompanion toCompanion(bool nullToAbsent) {
    return ZonesCompanion(
      id: Value(id),
      zoneCode: Value(zoneCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      isActive: Value(isActive),
    );
  }

  factory Zone.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Zone(
      id: serializer.fromJson<int>(json['id']),
      zoneCode: serializer.fromJson<String>(json['zone_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      isActive: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'zone_code': serializer.toJson<String>(zoneCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  Zone copyWith(
          {int? id,
          String? zoneCode,
          String? nameAr,
          String? nameEn,
          bool? isActive}) =>
      Zone(
        id: id ?? this.id,
        zoneCode: zoneCode ?? this.zoneCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        isActive: isActive ?? this.isActive,
      );
  Zone copyWithCompanion(ZonesCompanion data) {
    return Zone(
      id: data.id.present ? data.id.value : this.id,
      zoneCode: data.zoneCode.present ? data.zoneCode.value : this.zoneCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Zone(')
          ..write('id: $id, ')
          ..write('zoneCode: $zoneCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, zoneCode, nameAr, nameEn, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Zone &&
          other.id == this.id &&
          other.zoneCode == this.zoneCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.isActive == this.isActive);
}

class ZonesCompanion extends UpdateCompanion<Zone> {
  final Value<int> id;
  final Value<String> zoneCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<bool> isActive;
  const ZonesCompanion({
    this.id = const Value.absent(),
    this.zoneCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  ZonesCompanion.insert({
    this.id = const Value.absent(),
    required String zoneCode,
    required String nameAr,
    required String nameEn,
    this.isActive = const Value.absent(),
  })  : zoneCode = Value(zoneCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn);
  static Insertable<Zone> custom({
    Expression<int>? id,
    Expression<String>? zoneCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (zoneCode != null) 'zone_code': zoneCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (isActive != null) 'is_active': isActive,
    });
  }

  ZonesCompanion copyWith(
      {Value<int>? id,
      Value<String>? zoneCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<bool>? isActive}) {
    return ZonesCompanion(
      id: id ?? this.id,
      zoneCode: zoneCode ?? this.zoneCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (zoneCode.present) {
      map['zone_code'] = Variable<String>(zoneCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZonesCompanion(')
          ..write('id: $id, ')
          ..write('zoneCode: $zoneCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class Countries extends Table with TableInfo<Countries, Country> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Countries(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _countryCodeMeta =
      const VerificationMeta('countryCode');
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
      'country_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nationalityArMeta =
      const VerificationMeta('nationalityAr');
  late final GeneratedColumn<String> nationalityAr = GeneratedColumn<String>(
      'nationality_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nationalityEnMeta =
      const VerificationMeta('nationalityEn');
  late final GeneratedColumn<String> nationalityEn = GeneratedColumn<String>(
      'nationality_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _zoneIdMeta = const VerificationMeta('zoneId');
  late final GeneratedColumn<int> zoneId = GeneratedColumn<int>(
      'zone_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES zones(id)');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        countryCode,
        nameAr,
        nameEn,
        nationalityAr,
        nationalityEn,
        zoneId,
        isActive
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'countries';
  @override
  VerificationContext validateIntegrity(Insertable<Country> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('country_code')) {
      context.handle(
          _countryCodeMeta,
          countryCode.isAcceptableOrUnknown(
              data['country_code']!, _countryCodeMeta));
    } else if (isInserting) {
      context.missing(_countryCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('nationality_ar')) {
      context.handle(
          _nationalityArMeta,
          nationalityAr.isAcceptableOrUnknown(
              data['nationality_ar']!, _nationalityArMeta));
    } else if (isInserting) {
      context.missing(_nationalityArMeta);
    }
    if (data.containsKey('nationality_en')) {
      context.handle(
          _nationalityEnMeta,
          nationalityEn.isAcceptableOrUnknown(
              data['nationality_en']!, _nationalityEnMeta));
    } else if (isInserting) {
      context.missing(_nationalityEnMeta);
    }
    if (data.containsKey('zone_id')) {
      context.handle(_zoneIdMeta,
          zoneId.isAcceptableOrUnknown(data['zone_id']!, _zoneIdMeta));
    } else if (isInserting) {
      context.missing(_zoneIdMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Country map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Country(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      countryCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      nationalityAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nationality_ar'])!,
      nationalityEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nationality_en'])!,
      zoneId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}zone_id'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  Countries createAlias(String alias) {
    return Countries(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Country extends DataClass implements Insertable<Country> {
  final int id;
  final String countryCode;
  final String nameAr;
  final String nameEn;
  final String nationalityAr;
  final String nationalityEn;
  final int zoneId;
  final bool isActive;
  const Country(
      {required this.id,
      required this.countryCode,
      required this.nameAr,
      required this.nameEn,
      required this.nationalityAr,
      required this.nationalityEn,
      required this.zoneId,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['country_code'] = Variable<String>(countryCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['nationality_ar'] = Variable<String>(nationalityAr);
    map['nationality_en'] = Variable<String>(nationalityEn);
    map['zone_id'] = Variable<int>(zoneId);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  CountriesCompanion toCompanion(bool nullToAbsent) {
    return CountriesCompanion(
      id: Value(id),
      countryCode: Value(countryCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      nationalityAr: Value(nationalityAr),
      nationalityEn: Value(nationalityEn),
      zoneId: Value(zoneId),
      isActive: Value(isActive),
    );
  }

  factory Country.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Country(
      id: serializer.fromJson<int>(json['id']),
      countryCode: serializer.fromJson<String>(json['country_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      nationalityAr: serializer.fromJson<String>(json['nationality_ar']),
      nationalityEn: serializer.fromJson<String>(json['nationality_en']),
      zoneId: serializer.fromJson<int>(json['zone_id']),
      isActive: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'country_code': serializer.toJson<String>(countryCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'nationality_ar': serializer.toJson<String>(nationalityAr),
      'nationality_en': serializer.toJson<String>(nationalityEn),
      'zone_id': serializer.toJson<int>(zoneId),
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  Country copyWith(
          {int? id,
          String? countryCode,
          String? nameAr,
          String? nameEn,
          String? nationalityAr,
          String? nationalityEn,
          int? zoneId,
          bool? isActive}) =>
      Country(
        id: id ?? this.id,
        countryCode: countryCode ?? this.countryCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        nationalityAr: nationalityAr ?? this.nationalityAr,
        nationalityEn: nationalityEn ?? this.nationalityEn,
        zoneId: zoneId ?? this.zoneId,
        isActive: isActive ?? this.isActive,
      );
  Country copyWithCompanion(CountriesCompanion data) {
    return Country(
      id: data.id.present ? data.id.value : this.id,
      countryCode:
          data.countryCode.present ? data.countryCode.value : this.countryCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      nationalityAr: data.nationalityAr.present
          ? data.nationalityAr.value
          : this.nationalityAr,
      nationalityEn: data.nationalityEn.present
          ? data.nationalityEn.value
          : this.nationalityEn,
      zoneId: data.zoneId.present ? data.zoneId.value : this.zoneId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Country(')
          ..write('id: $id, ')
          ..write('countryCode: $countryCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('nationalityAr: $nationalityAr, ')
          ..write('nationalityEn: $nationalityEn, ')
          ..write('zoneId: $zoneId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, countryCode, nameAr, nameEn,
      nationalityAr, nationalityEn, zoneId, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Country &&
          other.id == this.id &&
          other.countryCode == this.countryCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.nationalityAr == this.nationalityAr &&
          other.nationalityEn == this.nationalityEn &&
          other.zoneId == this.zoneId &&
          other.isActive == this.isActive);
}

class CountriesCompanion extends UpdateCompanion<Country> {
  final Value<int> id;
  final Value<String> countryCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String> nationalityAr;
  final Value<String> nationalityEn;
  final Value<int> zoneId;
  final Value<bool> isActive;
  const CountriesCompanion({
    this.id = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.nationalityAr = const Value.absent(),
    this.nationalityEn = const Value.absent(),
    this.zoneId = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  CountriesCompanion.insert({
    this.id = const Value.absent(),
    required String countryCode,
    required String nameAr,
    required String nameEn,
    required String nationalityAr,
    required String nationalityEn,
    required int zoneId,
    this.isActive = const Value.absent(),
  })  : countryCode = Value(countryCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        nationalityAr = Value(nationalityAr),
        nationalityEn = Value(nationalityEn),
        zoneId = Value(zoneId);
  static Insertable<Country> custom({
    Expression<int>? id,
    Expression<String>? countryCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? nationalityAr,
    Expression<String>? nationalityEn,
    Expression<int>? zoneId,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countryCode != null) 'country_code': countryCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (nationalityAr != null) 'nationality_ar': nationalityAr,
      if (nationalityEn != null) 'nationality_en': nationalityEn,
      if (zoneId != null) 'zone_id': zoneId,
      if (isActive != null) 'is_active': isActive,
    });
  }

  CountriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? countryCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<String>? nationalityAr,
      Value<String>? nationalityEn,
      Value<int>? zoneId,
      Value<bool>? isActive}) {
    return CountriesCompanion(
      id: id ?? this.id,
      countryCode: countryCode ?? this.countryCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      nationalityAr: nationalityAr ?? this.nationalityAr,
      nationalityEn: nationalityEn ?? this.nationalityEn,
      zoneId: zoneId ?? this.zoneId,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (nationalityAr.present) {
      map['nationality_ar'] = Variable<String>(nationalityAr.value);
    }
    if (nationalityEn.present) {
      map['nationality_en'] = Variable<String>(nationalityEn.value);
    }
    if (zoneId.present) {
      map['zone_id'] = Variable<int>(zoneId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesCompanion(')
          ..write('id: $id, ')
          ..write('countryCode: $countryCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('nationalityAr: $nationalityAr, ')
          ..write('nationalityEn: $nationalityEn, ')
          ..write('zoneId: $zoneId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class Governorates extends Table with TableInfo<Governorates, Governorate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Governorates(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _govCodeMeta =
      const VerificationMeta('govCode');
  late final GeneratedColumn<String> govCode = GeneratedColumn<String>(
      'gov_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _countryIdMeta =
      const VerificationMeta('countryId');
  late final GeneratedColumn<int> countryId = GeneratedColumn<int>(
      'country_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES countries(id)');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, govCode, nameAr, nameEn, countryId, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'governorates';
  @override
  VerificationContext validateIntegrity(Insertable<Governorate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('gov_code')) {
      context.handle(_govCodeMeta,
          govCode.isAcceptableOrUnknown(data['gov_code']!, _govCodeMeta));
    } else if (isInserting) {
      context.missing(_govCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Governorate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Governorate(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      govCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gov_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      countryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}country_id'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  Governorates createAlias(String alias) {
    return Governorates(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Governorate extends DataClass implements Insertable<Governorate> {
  final int id;
  final String govCode;
  final String nameAr;
  final String nameEn;
  final int countryId;
  final bool isActive;
  const Governorate(
      {required this.id,
      required this.govCode,
      required this.nameAr,
      required this.nameEn,
      required this.countryId,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['gov_code'] = Variable<String>(govCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['country_id'] = Variable<int>(countryId);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  GovernoratesCompanion toCompanion(bool nullToAbsent) {
    return GovernoratesCompanion(
      id: Value(id),
      govCode: Value(govCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      countryId: Value(countryId),
      isActive: Value(isActive),
    );
  }

  factory Governorate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Governorate(
      id: serializer.fromJson<int>(json['id']),
      govCode: serializer.fromJson<String>(json['gov_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      countryId: serializer.fromJson<int>(json['country_id']),
      isActive: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gov_code': serializer.toJson<String>(govCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'country_id': serializer.toJson<int>(countryId),
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  Governorate copyWith(
          {int? id,
          String? govCode,
          String? nameAr,
          String? nameEn,
          int? countryId,
          bool? isActive}) =>
      Governorate(
        id: id ?? this.id,
        govCode: govCode ?? this.govCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        countryId: countryId ?? this.countryId,
        isActive: isActive ?? this.isActive,
      );
  Governorate copyWithCompanion(GovernoratesCompanion data) {
    return Governorate(
      id: data.id.present ? data.id.value : this.id,
      govCode: data.govCode.present ? data.govCode.value : this.govCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Governorate(')
          ..write('id: $id, ')
          ..write('govCode: $govCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('countryId: $countryId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, govCode, nameAr, nameEn, countryId, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Governorate &&
          other.id == this.id &&
          other.govCode == this.govCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.countryId == this.countryId &&
          other.isActive == this.isActive);
}

class GovernoratesCompanion extends UpdateCompanion<Governorate> {
  final Value<int> id;
  final Value<String> govCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<int> countryId;
  final Value<bool> isActive;
  const GovernoratesCompanion({
    this.id = const Value.absent(),
    this.govCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  GovernoratesCompanion.insert({
    this.id = const Value.absent(),
    required String govCode,
    required String nameAr,
    required String nameEn,
    required int countryId,
    this.isActive = const Value.absent(),
  })  : govCode = Value(govCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        countryId = Value(countryId);
  static Insertable<Governorate> custom({
    Expression<int>? id,
    Expression<String>? govCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<int>? countryId,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (govCode != null) 'gov_code': govCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (countryId != null) 'country_id': countryId,
      if (isActive != null) 'is_active': isActive,
    });
  }

  GovernoratesCompanion copyWith(
      {Value<int>? id,
      Value<String>? govCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<int>? countryId,
      Value<bool>? isActive}) {
    return GovernoratesCompanion(
      id: id ?? this.id,
      govCode: govCode ?? this.govCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      countryId: countryId ?? this.countryId,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (govCode.present) {
      map['gov_code'] = Variable<String>(govCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GovernoratesCompanion(')
          ..write('id: $id, ')
          ..write('govCode: $govCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('countryId: $countryId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class Cities extends Table with TableInfo<Cities, City> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Cities(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _cityCodeMeta =
      const VerificationMeta('cityCode');
  late final GeneratedColumn<String> cityCode = GeneratedColumn<String>(
      'city_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _govIdMeta = const VerificationMeta('govId');
  late final GeneratedColumn<int> govId = GeneratedColumn<int>(
      'gov_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES governorates(id)');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, cityCode, nameAr, nameEn, govId, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cities';
  @override
  VerificationContext validateIntegrity(Insertable<City> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('city_code')) {
      context.handle(_cityCodeMeta,
          cityCode.isAcceptableOrUnknown(data['city_code']!, _cityCodeMeta));
    } else if (isInserting) {
      context.missing(_cityCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('gov_id')) {
      context.handle(
          _govIdMeta, govId.isAcceptableOrUnknown(data['gov_id']!, _govIdMeta));
    } else if (isInserting) {
      context.missing(_govIdMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  City map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return City(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cityCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      govId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gov_id'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  Cities createAlias(String alias) {
    return Cities(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class City extends DataClass implements Insertable<City> {
  final int id;
  final String cityCode;
  final String nameAr;
  final String nameEn;
  final int govId;
  final bool isActive;
  const City(
      {required this.id,
      required this.cityCode,
      required this.nameAr,
      required this.nameEn,
      required this.govId,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['city_code'] = Variable<String>(cityCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['gov_id'] = Variable<int>(govId);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  CitiesCompanion toCompanion(bool nullToAbsent) {
    return CitiesCompanion(
      id: Value(id),
      cityCode: Value(cityCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      govId: Value(govId),
      isActive: Value(isActive),
    );
  }

  factory City.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return City(
      id: serializer.fromJson<int>(json['id']),
      cityCode: serializer.fromJson<String>(json['city_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      govId: serializer.fromJson<int>(json['gov_id']),
      isActive: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'city_code': serializer.toJson<String>(cityCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'gov_id': serializer.toJson<int>(govId),
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  City copyWith(
          {int? id,
          String? cityCode,
          String? nameAr,
          String? nameEn,
          int? govId,
          bool? isActive}) =>
      City(
        id: id ?? this.id,
        cityCode: cityCode ?? this.cityCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        govId: govId ?? this.govId,
        isActive: isActive ?? this.isActive,
      );
  City copyWithCompanion(CitiesCompanion data) {
    return City(
      id: data.id.present ? data.id.value : this.id,
      cityCode: data.cityCode.present ? data.cityCode.value : this.cityCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      govId: data.govId.present ? data.govId.value : this.govId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('City(')
          ..write('id: $id, ')
          ..write('cityCode: $cityCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('govId: $govId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, cityCode, nameAr, nameEn, govId, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is City &&
          other.id == this.id &&
          other.cityCode == this.cityCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.govId == this.govId &&
          other.isActive == this.isActive);
}

class CitiesCompanion extends UpdateCompanion<City> {
  final Value<int> id;
  final Value<String> cityCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<int> govId;
  final Value<bool> isActive;
  const CitiesCompanion({
    this.id = const Value.absent(),
    this.cityCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.govId = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  CitiesCompanion.insert({
    this.id = const Value.absent(),
    required String cityCode,
    required String nameAr,
    required String nameEn,
    required int govId,
    this.isActive = const Value.absent(),
  })  : cityCode = Value(cityCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        govId = Value(govId);
  static Insertable<City> custom({
    Expression<int>? id,
    Expression<String>? cityCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<int>? govId,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cityCode != null) 'city_code': cityCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (govId != null) 'gov_id': govId,
      if (isActive != null) 'is_active': isActive,
    });
  }

  CitiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? cityCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<int>? govId,
      Value<bool>? isActive}) {
    return CitiesCompanion(
      id: id ?? this.id,
      cityCode: cityCode ?? this.cityCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      govId: govId ?? this.govId,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cityCode.present) {
      map['city_code'] = Variable<String>(cityCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (govId.present) {
      map['gov_id'] = Variable<int>(govId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CitiesCompanion(')
          ..write('id: $id, ')
          ..write('cityCode: $cityCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('govId: $govId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class Regions extends Table with TableInfo<Regions, Region> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Regions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _regionCodeMeta =
      const VerificationMeta('regionCode');
  late final GeneratedColumn<String> regionCode = GeneratedColumn<String>(
      'region_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  late final GeneratedColumn<int> cityId = GeneratedColumn<int>(
      'city_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES cities(id)');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, regionCode, nameAr, nameEn, cityId, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'regions';
  @override
  VerificationContext validateIntegrity(Insertable<Region> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('region_code')) {
      context.handle(
          _regionCodeMeta,
          regionCode.isAcceptableOrUnknown(
              data['region_code']!, _regionCodeMeta));
    } else if (isInserting) {
      context.missing(_regionCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    } else if (isInserting) {
      context.missing(_cityIdMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Region map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Region(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      regionCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}region_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      cityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}city_id'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  Regions createAlias(String alias) {
    return Regions(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Region extends DataClass implements Insertable<Region> {
  final int id;
  final String regionCode;
  final String nameAr;
  final String nameEn;
  final int cityId;
  final bool isActive;
  const Region(
      {required this.id,
      required this.regionCode,
      required this.nameAr,
      required this.nameEn,
      required this.cityId,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['region_code'] = Variable<String>(regionCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['city_id'] = Variable<int>(cityId);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  RegionsCompanion toCompanion(bool nullToAbsent) {
    return RegionsCompanion(
      id: Value(id),
      regionCode: Value(regionCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      cityId: Value(cityId),
      isActive: Value(isActive),
    );
  }

  factory Region.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Region(
      id: serializer.fromJson<int>(json['id']),
      regionCode: serializer.fromJson<String>(json['region_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      cityId: serializer.fromJson<int>(json['city_id']),
      isActive: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'region_code': serializer.toJson<String>(regionCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'city_id': serializer.toJson<int>(cityId),
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  Region copyWith(
          {int? id,
          String? regionCode,
          String? nameAr,
          String? nameEn,
          int? cityId,
          bool? isActive}) =>
      Region(
        id: id ?? this.id,
        regionCode: regionCode ?? this.regionCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        cityId: cityId ?? this.cityId,
        isActive: isActive ?? this.isActive,
      );
  Region copyWithCompanion(RegionsCompanion data) {
    return Region(
      id: data.id.present ? data.id.value : this.id,
      regionCode:
          data.regionCode.present ? data.regionCode.value : this.regionCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      cityId: data.cityId.present ? data.cityId.value : this.cityId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Region(')
          ..write('id: $id, ')
          ..write('regionCode: $regionCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('cityId: $cityId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, regionCode, nameAr, nameEn, cityId, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Region &&
          other.id == this.id &&
          other.regionCode == this.regionCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.cityId == this.cityId &&
          other.isActive == this.isActive);
}

class RegionsCompanion extends UpdateCompanion<Region> {
  final Value<int> id;
  final Value<String> regionCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<int> cityId;
  final Value<bool> isActive;
  const RegionsCompanion({
    this.id = const Value.absent(),
    this.regionCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.cityId = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  RegionsCompanion.insert({
    this.id = const Value.absent(),
    required String regionCode,
    required String nameAr,
    required String nameEn,
    required int cityId,
    this.isActive = const Value.absent(),
  })  : regionCode = Value(regionCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        cityId = Value(cityId);
  static Insertable<Region> custom({
    Expression<int>? id,
    Expression<String>? regionCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<int>? cityId,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (regionCode != null) 'region_code': regionCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (cityId != null) 'city_id': cityId,
      if (isActive != null) 'is_active': isActive,
    });
  }

  RegionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? regionCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<int>? cityId,
      Value<bool>? isActive}) {
    return RegionsCompanion(
      id: id ?? this.id,
      regionCode: regionCode ?? this.regionCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      cityId: cityId ?? this.cityId,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (regionCode.present) {
      map['region_code'] = Variable<String>(regionCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<int>(cityId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegionsCompanion(')
          ..write('id: $id, ')
          ..write('regionCode: $regionCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('cityId: $cityId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class SystemConfig extends Table
    with TableInfo<SystemConfig, SystemConfigData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SystemConfig(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dateFormatMeta =
      const VerificationMeta('dateFormat');
  late final GeneratedColumn<String> dateFormat = GeneratedColumn<String>(
      'date_format', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _calendarTypeMeta =
      const VerificationMeta('calendarType');
  late final GeneratedColumn<String> calendarType = GeneratedColumn<String>(
      'calendar_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _accountNumberTypeMeta =
      const VerificationMeta('accountNumberType');
  late final GeneratedColumn<String> accountNumberType =
      GeneratedColumn<String>('account_number_type', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _accountNumberLengthMeta =
      const VerificationMeta('accountNumberLength');
  late final GeneratedColumn<int> accountNumberLength = GeneratedColumn<int>(
      'account_number_length', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _costCenterPolicyMeta =
      const VerificationMeta('costCenterPolicy');
  late final GeneratedColumn<String> costCenterPolicy = GeneratedColumn<String>(
      'cost_center_policy', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _projectPolicyMeta =
      const VerificationMeta('projectPolicy');
  late final GeneratedColumn<String> projectPolicy = GeneratedColumn<String>(
      'project_policy', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _passwordMinLengthMeta =
      const VerificationMeta('passwordMinLength');
  late final GeneratedColumn<int> passwordMinLength = GeneratedColumn<int>(
      'password_min_length', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _autoLockTimeoutMeta =
      const VerificationMeta('autoLockTimeout');
  late final GeneratedColumn<int> autoLockTimeout = GeneratedColumn<int>(
      'auto_lock_timeout', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _useVatMeta = const VerificationMeta('useVat');
  late final GeneratedColumn<bool> useVat = GeneratedColumn<bool>(
      'use_vat', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _useTdsMeta = const VerificationMeta('useTds');
  late final GeneratedColumn<bool> useTds = GeneratedColumn<bool>(
      'use_tds', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _useEInvoiceMeta =
      const VerificationMeta('useEInvoice');
  late final GeneratedColumn<bool> useEInvoice = GeneratedColumn<bool>(
      'use_e_invoice', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _priceIncludesTaxMeta =
      const VerificationMeta('priceIncludesTax');
  late final GeneratedColumn<bool> priceIncludesTax = GeneratedColumn<bool>(
      'price_includes_tax', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _backupFrequencyMeta =
      const VerificationMeta('backupFrequency');
  late final GeneratedColumn<String> backupFrequency = GeneratedColumn<String>(
      'backup_frequency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _cloudBackupMeta =
      const VerificationMeta('cloudBackup');
  late final GeneratedColumn<bool> cloudBackup = GeneratedColumn<bool>(
      'cloud_backup', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _uiThemeMeta =
      const VerificationMeta('uiTheme');
  late final GeneratedColumn<String> uiTheme = GeneratedColumn<String>(
      'ui_theme', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _fontSizeMeta =
      const VerificationMeta('fontSize');
  late final GeneratedColumn<String> fontSize = GeneratedColumn<String>(
      'font_size', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
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
        fontSize
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'system_config';
  @override
  VerificationContext validateIntegrity(Insertable<SystemConfigData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('date_format')) {
      context.handle(
          _dateFormatMeta,
          dateFormat.isAcceptableOrUnknown(
              data['date_format']!, _dateFormatMeta));
    } else if (isInserting) {
      context.missing(_dateFormatMeta);
    }
    if (data.containsKey('calendar_type')) {
      context.handle(
          _calendarTypeMeta,
          calendarType.isAcceptableOrUnknown(
              data['calendar_type']!, _calendarTypeMeta));
    } else if (isInserting) {
      context.missing(_calendarTypeMeta);
    }
    if (data.containsKey('account_number_type')) {
      context.handle(
          _accountNumberTypeMeta,
          accountNumberType.isAcceptableOrUnknown(
              data['account_number_type']!, _accountNumberTypeMeta));
    } else if (isInserting) {
      context.missing(_accountNumberTypeMeta);
    }
    if (data.containsKey('account_number_length')) {
      context.handle(
          _accountNumberLengthMeta,
          accountNumberLength.isAcceptableOrUnknown(
              data['account_number_length']!, _accountNumberLengthMeta));
    } else if (isInserting) {
      context.missing(_accountNumberLengthMeta);
    }
    if (data.containsKey('cost_center_policy')) {
      context.handle(
          _costCenterPolicyMeta,
          costCenterPolicy.isAcceptableOrUnknown(
              data['cost_center_policy']!, _costCenterPolicyMeta));
    } else if (isInserting) {
      context.missing(_costCenterPolicyMeta);
    }
    if (data.containsKey('project_policy')) {
      context.handle(
          _projectPolicyMeta,
          projectPolicy.isAcceptableOrUnknown(
              data['project_policy']!, _projectPolicyMeta));
    } else if (isInserting) {
      context.missing(_projectPolicyMeta);
    }
    if (data.containsKey('password_min_length')) {
      context.handle(
          _passwordMinLengthMeta,
          passwordMinLength.isAcceptableOrUnknown(
              data['password_min_length']!, _passwordMinLengthMeta));
    } else if (isInserting) {
      context.missing(_passwordMinLengthMeta);
    }
    if (data.containsKey('auto_lock_timeout')) {
      context.handle(
          _autoLockTimeoutMeta,
          autoLockTimeout.isAcceptableOrUnknown(
              data['auto_lock_timeout']!, _autoLockTimeoutMeta));
    } else if (isInserting) {
      context.missing(_autoLockTimeoutMeta);
    }
    if (data.containsKey('use_vat')) {
      context.handle(_useVatMeta,
          useVat.isAcceptableOrUnknown(data['use_vat']!, _useVatMeta));
    } else if (isInserting) {
      context.missing(_useVatMeta);
    }
    if (data.containsKey('use_tds')) {
      context.handle(_useTdsMeta,
          useTds.isAcceptableOrUnknown(data['use_tds']!, _useTdsMeta));
    } else if (isInserting) {
      context.missing(_useTdsMeta);
    }
    if (data.containsKey('use_e_invoice')) {
      context.handle(
          _useEInvoiceMeta,
          useEInvoice.isAcceptableOrUnknown(
              data['use_e_invoice']!, _useEInvoiceMeta));
    } else if (isInserting) {
      context.missing(_useEInvoiceMeta);
    }
    if (data.containsKey('price_includes_tax')) {
      context.handle(
          _priceIncludesTaxMeta,
          priceIncludesTax.isAcceptableOrUnknown(
              data['price_includes_tax']!, _priceIncludesTaxMeta));
    } else if (isInserting) {
      context.missing(_priceIncludesTaxMeta);
    }
    if (data.containsKey('backup_frequency')) {
      context.handle(
          _backupFrequencyMeta,
          backupFrequency.isAcceptableOrUnknown(
              data['backup_frequency']!, _backupFrequencyMeta));
    } else if (isInserting) {
      context.missing(_backupFrequencyMeta);
    }
    if (data.containsKey('cloud_backup')) {
      context.handle(
          _cloudBackupMeta,
          cloudBackup.isAcceptableOrUnknown(
              data['cloud_backup']!, _cloudBackupMeta));
    } else if (isInserting) {
      context.missing(_cloudBackupMeta);
    }
    if (data.containsKey('ui_theme')) {
      context.handle(_uiThemeMeta,
          uiTheme.isAcceptableOrUnknown(data['ui_theme']!, _uiThemeMeta));
    } else if (isInserting) {
      context.missing(_uiThemeMeta);
    }
    if (data.containsKey('font_size')) {
      context.handle(_fontSizeMeta,
          fontSize.isAcceptableOrUnknown(data['font_size']!, _fontSizeMeta));
    } else if (isInserting) {
      context.missing(_fontSizeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SystemConfigData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SystemConfigData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      dateFormat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_format'])!,
      calendarType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}calendar_type'])!,
      accountNumberType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}account_number_type'])!,
      accountNumberLength: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}account_number_length'])!,
      costCenterPolicy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cost_center_policy'])!,
      projectPolicy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_policy'])!,
      passwordMinLength: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}password_min_length'])!,
      autoLockTimeout: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}auto_lock_timeout'])!,
      useVat: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}use_vat'])!,
      useTds: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}use_tds'])!,
      useEInvoice: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}use_e_invoice'])!,
      priceIncludesTax: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}price_includes_tax'])!,
      backupFrequency: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}backup_frequency'])!,
      cloudBackup: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}cloud_backup'])!,
      uiTheme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ui_theme'])!,
      fontSize: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_size'])!,
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
  const SystemConfigData(
      {required this.id,
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
      required this.fontSize});
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

  factory SystemConfigData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SystemConfigData(
      id: serializer.fromJson<int>(json['id']),
      language: serializer.fromJson<String>(json['language']),
      dateFormat: serializer.fromJson<String>(json['date_format']),
      calendarType: serializer.fromJson<String>(json['calendar_type']),
      accountNumberType:
          serializer.fromJson<String>(json['account_number_type']),
      accountNumberLength:
          serializer.fromJson<int>(json['account_number_length']),
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

  SystemConfigData copyWith(
          {int? id,
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
          String? fontSize}) =>
      SystemConfigData(
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
      dateFormat:
          data.dateFormat.present ? data.dateFormat.value : this.dateFormat,
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
      useEInvoice:
          data.useEInvoice.present ? data.useEInvoice.value : this.useEInvoice,
      priceIncludesTax: data.priceIncludesTax.present
          ? data.priceIncludesTax.value
          : this.priceIncludesTax,
      backupFrequency: data.backupFrequency.present
          ? data.backupFrequency.value
          : this.backupFrequency,
      cloudBackup:
          data.cloudBackup.present ? data.cloudBackup.value : this.cloudBackup,
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
      fontSize);
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
    required String language,
    required String dateFormat,
    required String calendarType,
    required String accountNumberType,
    required int accountNumberLength,
    required String costCenterPolicy,
    required String projectPolicy,
    required int passwordMinLength,
    required int autoLockTimeout,
    required bool useVat,
    required bool useTds,
    required bool useEInvoice,
    required bool priceIncludesTax,
    required String backupFrequency,
    required bool cloudBackup,
    required String uiTheme,
    required String fontSize,
  })  : language = Value(language),
        dateFormat = Value(dateFormat),
        calendarType = Value(calendarType),
        accountNumberType = Value(accountNumberType),
        accountNumberLength = Value(accountNumberLength),
        costCenterPolicy = Value(costCenterPolicy),
        projectPolicy = Value(projectPolicy),
        passwordMinLength = Value(passwordMinLength),
        autoLockTimeout = Value(autoLockTimeout),
        useVat = Value(useVat),
        useTds = Value(useTds),
        useEInvoice = Value(useEInvoice),
        priceIncludesTax = Value(priceIncludesTax),
        backupFrequency = Value(backupFrequency),
        cloudBackup = Value(cloudBackup),
        uiTheme = Value(uiTheme),
        fontSize = Value(fontSize);
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

  SystemConfigCompanion copyWith(
      {Value<int>? id,
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
      Value<String>? fontSize}) {
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

class FinancialPeriods extends Table
    with TableInfo<FinancialPeriods, FinancialPeriod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FinancialPeriods(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _periodCodeMeta =
      const VerificationMeta('periodCode');
  late final GeneratedColumn<String> periodCode = GeneratedColumn<String>(
      'period_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _fiscalYearMeta =
      const VerificationMeta('fiscalYear');
  late final GeneratedColumn<int> fiscalYear = GeneratedColumn<int>(
      'fiscal_year', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _periodTypeMeta =
      const VerificationMeta('periodType');
  late final GeneratedColumn<String> periodType = GeneratedColumn<String>(
      'period_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _periodNumberMeta =
      const VerificationMeta('periodNumber');
  late final GeneratedColumn<int> periodNumber = GeneratedColumn<int>(
      'period_number', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  late final GeneratedColumn<int> startDate = GeneratedColumn<int>(
      'start_date', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  late final GeneratedColumn<int> endDate = GeneratedColumn<int>(
      'end_date', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isLockedMeta =
      const VerificationMeta('isLocked');
  late final GeneratedColumn<bool> isLocked = GeneratedColumn<bool>(
      'is_locked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        periodCode,
        fiscalYear,
        periodType,
        periodNumber,
        startDate,
        endDate,
        isLocked
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'financial_periods';
  @override
  VerificationContext validateIntegrity(Insertable<FinancialPeriod> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('period_code')) {
      context.handle(
          _periodCodeMeta,
          periodCode.isAcceptableOrUnknown(
              data['period_code']!, _periodCodeMeta));
    } else if (isInserting) {
      context.missing(_periodCodeMeta);
    }
    if (data.containsKey('fiscal_year')) {
      context.handle(
          _fiscalYearMeta,
          fiscalYear.isAcceptableOrUnknown(
              data['fiscal_year']!, _fiscalYearMeta));
    } else if (isInserting) {
      context.missing(_fiscalYearMeta);
    }
    if (data.containsKey('period_type')) {
      context.handle(
          _periodTypeMeta,
          periodType.isAcceptableOrUnknown(
              data['period_type']!, _periodTypeMeta));
    } else if (isInserting) {
      context.missing(_periodTypeMeta);
    }
    if (data.containsKey('period_number')) {
      context.handle(
          _periodNumberMeta,
          periodNumber.isAcceptableOrUnknown(
              data['period_number']!, _periodNumberMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('is_locked')) {
      context.handle(_isLockedMeta,
          isLocked.isAcceptableOrUnknown(data['is_locked']!, _isLockedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FinancialPeriod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FinancialPeriod(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      periodCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}period_code'])!,
      fiscalYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fiscal_year'])!,
      periodType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}period_type'])!,
      periodNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period_number']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_date'])!,
      isLocked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_locked'])!,
    );
  }

  @override
  FinancialPeriods createAlias(String alias) {
    return FinancialPeriods(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class FinancialPeriod extends DataClass implements Insertable<FinancialPeriod> {
  final int id;
  final String periodCode;
  final int fiscalYear;
  final String periodType;

  /// ENUM: Monthly, Quarterly, Custom
  final int? periodNumber;

  /// For custom periods, or 1-12 for monthly, 1-4 for quarterly
  final int startDate;

  /// Stored as Unix timestamp
  final int endDate;

  /// Stored as Unix timestamp
  final bool isLocked;
  const FinancialPeriod(
      {required this.id,
      required this.periodCode,
      required this.fiscalYear,
      required this.periodType,
      this.periodNumber,
      required this.startDate,
      required this.endDate,
      required this.isLocked});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['period_code'] = Variable<String>(periodCode);
    map['fiscal_year'] = Variable<int>(fiscalYear);
    map['period_type'] = Variable<String>(periodType);
    if (!nullToAbsent || periodNumber != null) {
      map['period_number'] = Variable<int>(periodNumber);
    }
    map['start_date'] = Variable<int>(startDate);
    map['end_date'] = Variable<int>(endDate);
    map['is_locked'] = Variable<bool>(isLocked);
    return map;
  }

  FinancialPeriodsCompanion toCompanion(bool nullToAbsent) {
    return FinancialPeriodsCompanion(
      id: Value(id),
      periodCode: Value(periodCode),
      fiscalYear: Value(fiscalYear),
      periodType: Value(periodType),
      periodNumber: periodNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(periodNumber),
      startDate: Value(startDate),
      endDate: Value(endDate),
      isLocked: Value(isLocked),
    );
  }

  factory FinancialPeriod.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FinancialPeriod(
      id: serializer.fromJson<int>(json['id']),
      periodCode: serializer.fromJson<String>(json['period_code']),
      fiscalYear: serializer.fromJson<int>(json['fiscal_year']),
      periodType: serializer.fromJson<String>(json['period_type']),
      periodNumber: serializer.fromJson<int?>(json['period_number']),
      startDate: serializer.fromJson<int>(json['start_date']),
      endDate: serializer.fromJson<int>(json['end_date']),
      isLocked: serializer.fromJson<bool>(json['is_locked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'period_code': serializer.toJson<String>(periodCode),
      'fiscal_year': serializer.toJson<int>(fiscalYear),
      'period_type': serializer.toJson<String>(periodType),
      'period_number': serializer.toJson<int?>(periodNumber),
      'start_date': serializer.toJson<int>(startDate),
      'end_date': serializer.toJson<int>(endDate),
      'is_locked': serializer.toJson<bool>(isLocked),
    };
  }

  FinancialPeriod copyWith(
          {int? id,
          String? periodCode,
          int? fiscalYear,
          String? periodType,
          Value<int?> periodNumber = const Value.absent(),
          int? startDate,
          int? endDate,
          bool? isLocked}) =>
      FinancialPeriod(
        id: id ?? this.id,
        periodCode: periodCode ?? this.periodCode,
        fiscalYear: fiscalYear ?? this.fiscalYear,
        periodType: periodType ?? this.periodType,
        periodNumber:
            periodNumber.present ? periodNumber.value : this.periodNumber,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        isLocked: isLocked ?? this.isLocked,
      );
  FinancialPeriod copyWithCompanion(FinancialPeriodsCompanion data) {
    return FinancialPeriod(
      id: data.id.present ? data.id.value : this.id,
      periodCode:
          data.periodCode.present ? data.periodCode.value : this.periodCode,
      fiscalYear:
          data.fiscalYear.present ? data.fiscalYear.value : this.fiscalYear,
      periodType:
          data.periodType.present ? data.periodType.value : this.periodType,
      periodNumber: data.periodNumber.present
          ? data.periodNumber.value
          : this.periodNumber,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isLocked: data.isLocked.present ? data.isLocked.value : this.isLocked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FinancialPeriod(')
          ..write('id: $id, ')
          ..write('periodCode: $periodCode, ')
          ..write('fiscalYear: $fiscalYear, ')
          ..write('periodType: $periodType, ')
          ..write('periodNumber: $periodNumber, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isLocked: $isLocked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, periodCode, fiscalYear, periodType,
      periodNumber, startDate, endDate, isLocked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FinancialPeriod &&
          other.id == this.id &&
          other.periodCode == this.periodCode &&
          other.fiscalYear == this.fiscalYear &&
          other.periodType == this.periodType &&
          other.periodNumber == this.periodNumber &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isLocked == this.isLocked);
}

class FinancialPeriodsCompanion extends UpdateCompanion<FinancialPeriod> {
  final Value<int> id;
  final Value<String> periodCode;
  final Value<int> fiscalYear;
  final Value<String> periodType;
  final Value<int?> periodNumber;
  final Value<int> startDate;
  final Value<int> endDate;
  final Value<bool> isLocked;
  const FinancialPeriodsCompanion({
    this.id = const Value.absent(),
    this.periodCode = const Value.absent(),
    this.fiscalYear = const Value.absent(),
    this.periodType = const Value.absent(),
    this.periodNumber = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isLocked = const Value.absent(),
  });
  FinancialPeriodsCompanion.insert({
    this.id = const Value.absent(),
    required String periodCode,
    required int fiscalYear,
    required String periodType,
    this.periodNumber = const Value.absent(),
    required int startDate,
    required int endDate,
    this.isLocked = const Value.absent(),
  })  : periodCode = Value(periodCode),
        fiscalYear = Value(fiscalYear),
        periodType = Value(periodType),
        startDate = Value(startDate),
        endDate = Value(endDate);
  static Insertable<FinancialPeriod> custom({
    Expression<int>? id,
    Expression<String>? periodCode,
    Expression<int>? fiscalYear,
    Expression<String>? periodType,
    Expression<int>? periodNumber,
    Expression<int>? startDate,
    Expression<int>? endDate,
    Expression<bool>? isLocked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (periodCode != null) 'period_code': periodCode,
      if (fiscalYear != null) 'fiscal_year': fiscalYear,
      if (periodType != null) 'period_type': periodType,
      if (periodNumber != null) 'period_number': periodNumber,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isLocked != null) 'is_locked': isLocked,
    });
  }

  FinancialPeriodsCompanion copyWith(
      {Value<int>? id,
      Value<String>? periodCode,
      Value<int>? fiscalYear,
      Value<String>? periodType,
      Value<int?>? periodNumber,
      Value<int>? startDate,
      Value<int>? endDate,
      Value<bool>? isLocked}) {
    return FinancialPeriodsCompanion(
      id: id ?? this.id,
      periodCode: periodCode ?? this.periodCode,
      fiscalYear: fiscalYear ?? this.fiscalYear,
      periodType: periodType ?? this.periodType,
      periodNumber: periodNumber ?? this.periodNumber,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isLocked: isLocked ?? this.isLocked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (periodCode.present) {
      map['period_code'] = Variable<String>(periodCode.value);
    }
    if (fiscalYear.present) {
      map['fiscal_year'] = Variable<int>(fiscalYear.value);
    }
    if (periodType.present) {
      map['period_type'] = Variable<String>(periodType.value);
    }
    if (periodNumber.present) {
      map['period_number'] = Variable<int>(periodNumber.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<int>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<int>(endDate.value);
    }
    if (isLocked.present) {
      map['is_locked'] = Variable<bool>(isLocked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FinancialPeriodsCompanion(')
          ..write('id: $id, ')
          ..write('periodCode: $periodCode, ')
          ..write('fiscalYear: $fiscalYear, ')
          ..write('periodType: $periodType, ')
          ..write('periodNumber: $periodNumber, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isLocked: $isLocked')
          ..write(')'))
        .toString();
  }
}

class Currencies extends Table with TableInfo<Currencies, Currency> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Currencies(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _currencyCodeMeta =
      const VerificationMeta('currencyCode');
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
      'currency_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
      'name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _fractionNameArMeta =
      const VerificationMeta('fractionNameAr');
  late final GeneratedColumn<String> fractionNameAr = GeneratedColumn<String>(
      'fraction_name_ar', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _fractionNameEnMeta =
      const VerificationMeta('fractionNameEn');
  late final GeneratedColumn<String> fractionNameEn = GeneratedColumn<String>(
      'fraction_name_en', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _exchangeRateMeta =
      const VerificationMeta('exchangeRate');
  late final GeneratedColumn<double> exchangeRate = GeneratedColumn<double>(
      'exchange_rate', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isBaseCurrencyMeta =
      const VerificationMeta('isBaseCurrency');
  late final GeneratedColumn<bool> isBaseCurrency = GeneratedColumn<bool>(
      'is_base_currency', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _decimalPlacesMeta =
      const VerificationMeta('decimalPlaces');
  late final GeneratedColumn<int> decimalPlaces = GeneratedColumn<int>(
      'decimal_places', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _minRateLimitMeta =
      const VerificationMeta('minRateLimit');
  late final GeneratedColumn<double> minRateLimit = GeneratedColumn<double>(
      'min_rate_limit', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _maxRateLimitMeta =
      const VerificationMeta('maxRateLimit');
  late final GeneratedColumn<double> maxRateLimit = GeneratedColumn<double>(
      'max_rate_limit', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        currencyCode,
        nameAr,
        nameEn,
        fractionNameAr,
        fractionNameEn,
        exchangeRate,
        isBaseCurrency,
        decimalPlaces,
        minRateLimit,
        maxRateLimit,
        isActive
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currencies';
  @override
  VerificationContext validateIntegrity(Insertable<Currency> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('currency_code')) {
      context.handle(
          _currencyCodeMeta,
          currencyCode.isAcceptableOrUnknown(
              data['currency_code']!, _currencyCodeMeta));
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('fraction_name_ar')) {
      context.handle(
          _fractionNameArMeta,
          fractionNameAr.isAcceptableOrUnknown(
              data['fraction_name_ar']!, _fractionNameArMeta));
    } else if (isInserting) {
      context.missing(_fractionNameArMeta);
    }
    if (data.containsKey('fraction_name_en')) {
      context.handle(
          _fractionNameEnMeta,
          fractionNameEn.isAcceptableOrUnknown(
              data['fraction_name_en']!, _fractionNameEnMeta));
    } else if (isInserting) {
      context.missing(_fractionNameEnMeta);
    }
    if (data.containsKey('exchange_rate')) {
      context.handle(
          _exchangeRateMeta,
          exchangeRate.isAcceptableOrUnknown(
              data['exchange_rate']!, _exchangeRateMeta));
    } else if (isInserting) {
      context.missing(_exchangeRateMeta);
    }
    if (data.containsKey('is_base_currency')) {
      context.handle(
          _isBaseCurrencyMeta,
          isBaseCurrency.isAcceptableOrUnknown(
              data['is_base_currency']!, _isBaseCurrencyMeta));
    }
    if (data.containsKey('decimal_places')) {
      context.handle(
          _decimalPlacesMeta,
          decimalPlaces.isAcceptableOrUnknown(
              data['decimal_places']!, _decimalPlacesMeta));
    } else if (isInserting) {
      context.missing(_decimalPlacesMeta);
    }
    if (data.containsKey('min_rate_limit')) {
      context.handle(
          _minRateLimitMeta,
          minRateLimit.isAcceptableOrUnknown(
              data['min_rate_limit']!, _minRateLimitMeta));
    }
    if (data.containsKey('max_rate_limit')) {
      context.handle(
          _maxRateLimitMeta,
          maxRateLimit.isAcceptableOrUnknown(
              data['max_rate_limit']!, _maxRateLimitMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {currencyCode};
  @override
  Currency map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Currency(
      currencyCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_code'])!,
      nameAr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      fractionNameAr: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}fraction_name_ar'])!,
      fractionNameEn: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}fraction_name_en'])!,
      exchangeRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}exchange_rate'])!,
      isBaseCurrency: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_base_currency'])!,
      decimalPlaces: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}decimal_places'])!,
      minRateLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_rate_limit']),
      maxRateLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_rate_limit']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  Currencies createAlias(String alias) {
    return Currencies(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Currency extends DataClass implements Insertable<Currency> {
  final String currencyCode;
  final String nameAr;
  final String nameEn;
  final String fractionNameAr;
  final String fractionNameEn;
  final double exchangeRate;
  final bool isBaseCurrency;
  final int decimalPlaces;
  final double? minRateLimit;
  final double? maxRateLimit;
  final bool isActive;
  const Currency(
      {required this.currencyCode,
      required this.nameAr,
      required this.nameEn,
      required this.fractionNameAr,
      required this.fractionNameEn,
      required this.exchangeRate,
      required this.isBaseCurrency,
      required this.decimalPlaces,
      this.minRateLimit,
      this.maxRateLimit,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['currency_code'] = Variable<String>(currencyCode);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['fraction_name_ar'] = Variable<String>(fractionNameAr);
    map['fraction_name_en'] = Variable<String>(fractionNameEn);
    map['exchange_rate'] = Variable<double>(exchangeRate);
    map['is_base_currency'] = Variable<bool>(isBaseCurrency);
    map['decimal_places'] = Variable<int>(decimalPlaces);
    if (!nullToAbsent || minRateLimit != null) {
      map['min_rate_limit'] = Variable<double>(minRateLimit);
    }
    if (!nullToAbsent || maxRateLimit != null) {
      map['max_rate_limit'] = Variable<double>(maxRateLimit);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  CurrenciesCompanion toCompanion(bool nullToAbsent) {
    return CurrenciesCompanion(
      currencyCode: Value(currencyCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      fractionNameAr: Value(fractionNameAr),
      fractionNameEn: Value(fractionNameEn),
      exchangeRate: Value(exchangeRate),
      isBaseCurrency: Value(isBaseCurrency),
      decimalPlaces: Value(decimalPlaces),
      minRateLimit: minRateLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(minRateLimit),
      maxRateLimit: maxRateLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(maxRateLimit),
      isActive: Value(isActive),
    );
  }

  factory Currency.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Currency(
      currencyCode: serializer.fromJson<String>(json['currency_code']),
      nameAr: serializer.fromJson<String>(json['name_ar']),
      nameEn: serializer.fromJson<String>(json['name_en']),
      fractionNameAr: serializer.fromJson<String>(json['fraction_name_ar']),
      fractionNameEn: serializer.fromJson<String>(json['fraction_name_en']),
      exchangeRate: serializer.fromJson<double>(json['exchange_rate']),
      isBaseCurrency: serializer.fromJson<bool>(json['is_base_currency']),
      decimalPlaces: serializer.fromJson<int>(json['decimal_places']),
      minRateLimit: serializer.fromJson<double?>(json['min_rate_limit']),
      maxRateLimit: serializer.fromJson<double?>(json['max_rate_limit']),
      isActive: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'currency_code': serializer.toJson<String>(currencyCode),
      'name_ar': serializer.toJson<String>(nameAr),
      'name_en': serializer.toJson<String>(nameEn),
      'fraction_name_ar': serializer.toJson<String>(fractionNameAr),
      'fraction_name_en': serializer.toJson<String>(fractionNameEn),
      'exchange_rate': serializer.toJson<double>(exchangeRate),
      'is_base_currency': serializer.toJson<bool>(isBaseCurrency),
      'decimal_places': serializer.toJson<int>(decimalPlaces),
      'min_rate_limit': serializer.toJson<double?>(minRateLimit),
      'max_rate_limit': serializer.toJson<double?>(maxRateLimit),
      'is_active': serializer.toJson<bool>(isActive),
    };
  }

  Currency copyWith(
          {String? currencyCode,
          String? nameAr,
          String? nameEn,
          String? fractionNameAr,
          String? fractionNameEn,
          double? exchangeRate,
          bool? isBaseCurrency,
          int? decimalPlaces,
          Value<double?> minRateLimit = const Value.absent(),
          Value<double?> maxRateLimit = const Value.absent(),
          bool? isActive}) =>
      Currency(
        currencyCode: currencyCode ?? this.currencyCode,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        fractionNameAr: fractionNameAr ?? this.fractionNameAr,
        fractionNameEn: fractionNameEn ?? this.fractionNameEn,
        exchangeRate: exchangeRate ?? this.exchangeRate,
        isBaseCurrency: isBaseCurrency ?? this.isBaseCurrency,
        decimalPlaces: decimalPlaces ?? this.decimalPlaces,
        minRateLimit:
            minRateLimit.present ? minRateLimit.value : this.minRateLimit,
        maxRateLimit:
            maxRateLimit.present ? maxRateLimit.value : this.maxRateLimit,
        isActive: isActive ?? this.isActive,
      );
  Currency copyWithCompanion(CurrenciesCompanion data) {
    return Currency(
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      fractionNameAr: data.fractionNameAr.present
          ? data.fractionNameAr.value
          : this.fractionNameAr,
      fractionNameEn: data.fractionNameEn.present
          ? data.fractionNameEn.value
          : this.fractionNameEn,
      exchangeRate: data.exchangeRate.present
          ? data.exchangeRate.value
          : this.exchangeRate,
      isBaseCurrency: data.isBaseCurrency.present
          ? data.isBaseCurrency.value
          : this.isBaseCurrency,
      decimalPlaces: data.decimalPlaces.present
          ? data.decimalPlaces.value
          : this.decimalPlaces,
      minRateLimit: data.minRateLimit.present
          ? data.minRateLimit.value
          : this.minRateLimit,
      maxRateLimit: data.maxRateLimit.present
          ? data.maxRateLimit.value
          : this.maxRateLimit,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Currency(')
          ..write('currencyCode: $currencyCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('fractionNameAr: $fractionNameAr, ')
          ..write('fractionNameEn: $fractionNameEn, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('isBaseCurrency: $isBaseCurrency, ')
          ..write('decimalPlaces: $decimalPlaces, ')
          ..write('minRateLimit: $minRateLimit, ')
          ..write('maxRateLimit: $maxRateLimit, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      currencyCode,
      nameAr,
      nameEn,
      fractionNameAr,
      fractionNameEn,
      exchangeRate,
      isBaseCurrency,
      decimalPlaces,
      minRateLimit,
      maxRateLimit,
      isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Currency &&
          other.currencyCode == this.currencyCode &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.fractionNameAr == this.fractionNameAr &&
          other.fractionNameEn == this.fractionNameEn &&
          other.exchangeRate == this.exchangeRate &&
          other.isBaseCurrency == this.isBaseCurrency &&
          other.decimalPlaces == this.decimalPlaces &&
          other.minRateLimit == this.minRateLimit &&
          other.maxRateLimit == this.maxRateLimit &&
          other.isActive == this.isActive);
}

class CurrenciesCompanion extends UpdateCompanion<Currency> {
  final Value<String> currencyCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String> fractionNameAr;
  final Value<String> fractionNameEn;
  final Value<double> exchangeRate;
  final Value<bool> isBaseCurrency;
  final Value<int> decimalPlaces;
  final Value<double?> minRateLimit;
  final Value<double?> maxRateLimit;
  final Value<bool> isActive;
  final Value<int> rowid;
  const CurrenciesCompanion({
    this.currencyCode = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.fractionNameAr = const Value.absent(),
    this.fractionNameEn = const Value.absent(),
    this.exchangeRate = const Value.absent(),
    this.isBaseCurrency = const Value.absent(),
    this.decimalPlaces = const Value.absent(),
    this.minRateLimit = const Value.absent(),
    this.maxRateLimit = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrenciesCompanion.insert({
    required String currencyCode,
    required String nameAr,
    required String nameEn,
    required String fractionNameAr,
    required String fractionNameEn,
    required double exchangeRate,
    this.isBaseCurrency = const Value.absent(),
    required int decimalPlaces,
    this.minRateLimit = const Value.absent(),
    this.maxRateLimit = const Value.absent(),
    required bool isActive,
    this.rowid = const Value.absent(),
  })  : currencyCode = Value(currencyCode),
        nameAr = Value(nameAr),
        nameEn = Value(nameEn),
        fractionNameAr = Value(fractionNameAr),
        fractionNameEn = Value(fractionNameEn),
        exchangeRate = Value(exchangeRate),
        decimalPlaces = Value(decimalPlaces),
        isActive = Value(isActive);
  static Insertable<Currency> custom({
    Expression<String>? currencyCode,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? fractionNameAr,
    Expression<String>? fractionNameEn,
    Expression<double>? exchangeRate,
    Expression<bool>? isBaseCurrency,
    Expression<int>? decimalPlaces,
    Expression<double>? minRateLimit,
    Expression<double>? maxRateLimit,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (currencyCode != null) 'currency_code': currencyCode,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (fractionNameAr != null) 'fraction_name_ar': fractionNameAr,
      if (fractionNameEn != null) 'fraction_name_en': fractionNameEn,
      if (exchangeRate != null) 'exchange_rate': exchangeRate,
      if (isBaseCurrency != null) 'is_base_currency': isBaseCurrency,
      if (decimalPlaces != null) 'decimal_places': decimalPlaces,
      if (minRateLimit != null) 'min_rate_limit': minRateLimit,
      if (maxRateLimit != null) 'max_rate_limit': maxRateLimit,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrenciesCompanion copyWith(
      {Value<String>? currencyCode,
      Value<String>? nameAr,
      Value<String>? nameEn,
      Value<String>? fractionNameAr,
      Value<String>? fractionNameEn,
      Value<double>? exchangeRate,
      Value<bool>? isBaseCurrency,
      Value<int>? decimalPlaces,
      Value<double?>? minRateLimit,
      Value<double?>? maxRateLimit,
      Value<bool>? isActive,
      Value<int>? rowid}) {
    return CurrenciesCompanion(
      currencyCode: currencyCode ?? this.currencyCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      fractionNameAr: fractionNameAr ?? this.fractionNameAr,
      fractionNameEn: fractionNameEn ?? this.fractionNameEn,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      isBaseCurrency: isBaseCurrency ?? this.isBaseCurrency,
      decimalPlaces: decimalPlaces ?? this.decimalPlaces,
      minRateLimit: minRateLimit ?? this.minRateLimit,
      maxRateLimit: maxRateLimit ?? this.maxRateLimit,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (fractionNameAr.present) {
      map['fraction_name_ar'] = Variable<String>(fractionNameAr.value);
    }
    if (fractionNameEn.present) {
      map['fraction_name_en'] = Variable<String>(fractionNameEn.value);
    }
    if (exchangeRate.present) {
      map['exchange_rate'] = Variable<double>(exchangeRate.value);
    }
    if (isBaseCurrency.present) {
      map['is_base_currency'] = Variable<bool>(isBaseCurrency.value);
    }
    if (decimalPlaces.present) {
      map['decimal_places'] = Variable<int>(decimalPlaces.value);
    }
    if (minRateLimit.present) {
      map['min_rate_limit'] = Variable<double>(minRateLimit.value);
    }
    if (maxRateLimit.present) {
      map['max_rate_limit'] = Variable<double>(maxRateLimit.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrenciesCompanion(')
          ..write('currencyCode: $currencyCode, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('fractionNameAr: $fractionNameAr, ')
          ..write('fractionNameEn: $fractionNameEn, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('isBaseCurrency: $isBaseCurrency, ')
          ..write('decimalPlaces: $decimalPlaces, ')
          ..write('minRateLimit: $minRateLimit, ')
          ..write('maxRateLimit: $maxRateLimit, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CurrencyDenominations extends Table
    with TableInfo<CurrencyDenominations, CurrencyDenomination> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CurrencyDenominations(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _currencyCodeMeta =
      const VerificationMeta('currencyCode');
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
      'currency_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES currencies(currency_code)');
  static const VerificationMeta _denominationValueMeta =
      const VerificationMeta('denominationValue');
  late final GeneratedColumn<double> denominationValue =
      GeneratedColumn<double>('denomination_value', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _denominationNameArMeta =
      const VerificationMeta('denominationNameAr');
  late final GeneratedColumn<String> denominationNameAr =
      GeneratedColumn<String>('denomination_name_ar', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _denominationNameEnMeta =
      const VerificationMeta('denominationNameEn');
  late final GeneratedColumn<String> denominationNameEn =
      GeneratedColumn<String>('denomination_name_en', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _denominationTypeMeta =
      const VerificationMeta('denominationType');
  late final GeneratedColumn<String> denominationType = GeneratedColumn<String>(
      'denomination_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        currencyCode,
        denominationValue,
        denominationNameAr,
        denominationNameEn,
        denominationType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency_denominations';
  @override
  VerificationContext validateIntegrity(
      Insertable<CurrencyDenomination> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('currency_code')) {
      context.handle(
          _currencyCodeMeta,
          currencyCode.isAcceptableOrUnknown(
              data['currency_code']!, _currencyCodeMeta));
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('denomination_value')) {
      context.handle(
          _denominationValueMeta,
          denominationValue.isAcceptableOrUnknown(
              data['denomination_value']!, _denominationValueMeta));
    } else if (isInserting) {
      context.missing(_denominationValueMeta);
    }
    if (data.containsKey('denomination_name_ar')) {
      context.handle(
          _denominationNameArMeta,
          denominationNameAr.isAcceptableOrUnknown(
              data['denomination_name_ar']!, _denominationNameArMeta));
    } else if (isInserting) {
      context.missing(_denominationNameArMeta);
    }
    if (data.containsKey('denomination_name_en')) {
      context.handle(
          _denominationNameEnMeta,
          denominationNameEn.isAcceptableOrUnknown(
              data['denomination_name_en']!, _denominationNameEnMeta));
    } else if (isInserting) {
      context.missing(_denominationNameEnMeta);
    }
    if (data.containsKey('denomination_type')) {
      context.handle(
          _denominationTypeMeta,
          denominationType.isAcceptableOrUnknown(
              data['denomination_type']!, _denominationTypeMeta));
    } else if (isInserting) {
      context.missing(_denominationTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurrencyDenomination map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyDenomination(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      currencyCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_code'])!,
      denominationValue: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}denomination_value'])!,
      denominationNameAr: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}denomination_name_ar'])!,
      denominationNameEn: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}denomination_name_en'])!,
      denominationType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}denomination_type'])!,
    );
  }

  @override
  CurrencyDenominations createAlias(String alias) {
    return CurrencyDenominations(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CurrencyDenomination extends DataClass
    implements Insertable<CurrencyDenomination> {
  final int id;
  final String currencyCode;
  final double denominationValue;
  final String denominationNameAr;
  final String denominationNameEn;
  final String denominationType;
  const CurrencyDenomination(
      {required this.id,
      required this.currencyCode,
      required this.denominationValue,
      required this.denominationNameAr,
      required this.denominationNameEn,
      required this.denominationType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['currency_code'] = Variable<String>(currencyCode);
    map['denomination_value'] = Variable<double>(denominationValue);
    map['denomination_name_ar'] = Variable<String>(denominationNameAr);
    map['denomination_name_en'] = Variable<String>(denominationNameEn);
    map['denomination_type'] = Variable<String>(denominationType);
    return map;
  }

  CurrencyDenominationsCompanion toCompanion(bool nullToAbsent) {
    return CurrencyDenominationsCompanion(
      id: Value(id),
      currencyCode: Value(currencyCode),
      denominationValue: Value(denominationValue),
      denominationNameAr: Value(denominationNameAr),
      denominationNameEn: Value(denominationNameEn),
      denominationType: Value(denominationType),
    );
  }

  factory CurrencyDenomination.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyDenomination(
      id: serializer.fromJson<int>(json['id']),
      currencyCode: serializer.fromJson<String>(json['currency_code']),
      denominationValue:
          serializer.fromJson<double>(json['denomination_value']),
      denominationNameAr:
          serializer.fromJson<String>(json['denomination_name_ar']),
      denominationNameEn:
          serializer.fromJson<String>(json['denomination_name_en']),
      denominationType: serializer.fromJson<String>(json['denomination_type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currency_code': serializer.toJson<String>(currencyCode),
      'denomination_value': serializer.toJson<double>(denominationValue),
      'denomination_name_ar': serializer.toJson<String>(denominationNameAr),
      'denomination_name_en': serializer.toJson<String>(denominationNameEn),
      'denomination_type': serializer.toJson<String>(denominationType),
    };
  }

  CurrencyDenomination copyWith(
          {int? id,
          String? currencyCode,
          double? denominationValue,
          String? denominationNameAr,
          String? denominationNameEn,
          String? denominationType}) =>
      CurrencyDenomination(
        id: id ?? this.id,
        currencyCode: currencyCode ?? this.currencyCode,
        denominationValue: denominationValue ?? this.denominationValue,
        denominationNameAr: denominationNameAr ?? this.denominationNameAr,
        denominationNameEn: denominationNameEn ?? this.denominationNameEn,
        denominationType: denominationType ?? this.denominationType,
      );
  CurrencyDenomination copyWithCompanion(CurrencyDenominationsCompanion data) {
    return CurrencyDenomination(
      id: data.id.present ? data.id.value : this.id,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      denominationValue: data.denominationValue.present
          ? data.denominationValue.value
          : this.denominationValue,
      denominationNameAr: data.denominationNameAr.present
          ? data.denominationNameAr.value
          : this.denominationNameAr,
      denominationNameEn: data.denominationNameEn.present
          ? data.denominationNameEn.value
          : this.denominationNameEn,
      denominationType: data.denominationType.present
          ? data.denominationType.value
          : this.denominationType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyDenomination(')
          ..write('id: $id, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('denominationValue: $denominationValue, ')
          ..write('denominationNameAr: $denominationNameAr, ')
          ..write('denominationNameEn: $denominationNameEn, ')
          ..write('denominationType: $denominationType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, currencyCode, denominationValue,
      denominationNameAr, denominationNameEn, denominationType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyDenomination &&
          other.id == this.id &&
          other.currencyCode == this.currencyCode &&
          other.denominationValue == this.denominationValue &&
          other.denominationNameAr == this.denominationNameAr &&
          other.denominationNameEn == this.denominationNameEn &&
          other.denominationType == this.denominationType);
}

class CurrencyDenominationsCompanion
    extends UpdateCompanion<CurrencyDenomination> {
  final Value<int> id;
  final Value<String> currencyCode;
  final Value<double> denominationValue;
  final Value<String> denominationNameAr;
  final Value<String> denominationNameEn;
  final Value<String> denominationType;
  const CurrencyDenominationsCompanion({
    this.id = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.denominationValue = const Value.absent(),
    this.denominationNameAr = const Value.absent(),
    this.denominationNameEn = const Value.absent(),
    this.denominationType = const Value.absent(),
  });
  CurrencyDenominationsCompanion.insert({
    this.id = const Value.absent(),
    required String currencyCode,
    required double denominationValue,
    required String denominationNameAr,
    required String denominationNameEn,
    required String denominationType,
  })  : currencyCode = Value(currencyCode),
        denominationValue = Value(denominationValue),
        denominationNameAr = Value(denominationNameAr),
        denominationNameEn = Value(denominationNameEn),
        denominationType = Value(denominationType);
  static Insertable<CurrencyDenomination> custom({
    Expression<int>? id,
    Expression<String>? currencyCode,
    Expression<double>? denominationValue,
    Expression<String>? denominationNameAr,
    Expression<String>? denominationNameEn,
    Expression<String>? denominationType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (denominationValue != null) 'denomination_value': denominationValue,
      if (denominationNameAr != null)
        'denomination_name_ar': denominationNameAr,
      if (denominationNameEn != null)
        'denomination_name_en': denominationNameEn,
      if (denominationType != null) 'denomination_type': denominationType,
    });
  }

  CurrencyDenominationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? currencyCode,
      Value<double>? denominationValue,
      Value<String>? denominationNameAr,
      Value<String>? denominationNameEn,
      Value<String>? denominationType}) {
    return CurrencyDenominationsCompanion(
      id: id ?? this.id,
      currencyCode: currencyCode ?? this.currencyCode,
      denominationValue: denominationValue ?? this.denominationValue,
      denominationNameAr: denominationNameAr ?? this.denominationNameAr,
      denominationNameEn: denominationNameEn ?? this.denominationNameEn,
      denominationType: denominationType ?? this.denominationType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (denominationValue.present) {
      map['denomination_value'] = Variable<double>(denominationValue.value);
    }
    if (denominationNameAr.present) {
      map['denomination_name_ar'] = Variable<String>(denominationNameAr.value);
    }
    if (denominationNameEn.present) {
      map['denomination_name_en'] = Variable<String>(denominationNameEn.value);
    }
    if (denominationType.present) {
      map['denomination_type'] = Variable<String>(denominationType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyDenominationsCompanion(')
          ..write('id: $id, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('denominationValue: $denominationValue, ')
          ..write('denominationNameAr: $denominationNameAr, ')
          ..write('denominationNameEn: $denominationNameEn, ')
          ..write('denominationType: $denominationType')
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
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES users(user_id)');
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  late final GeneratedColumn<int> roleId = GeneratedColumn<int>(
      'role_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES roles(id)');
  @override
  List<GeneratedColumn> get $columns => [userId, roleId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_roles';
  @override
  VerificationContext validateIntegrity(Insertable<UserRole> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
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
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}role_id'])!,
    );
  }

  @override
  UserRoles createAlias(String alias) {
    return UserRoles(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(user_id, role_id)'];
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
    return UserRolesCompanion(
      userId: Value(userId),
      roleId: Value(roleId),
    );
  }

  factory UserRole.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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

  UserRole copyWith({int? userId, int? roleId}) => UserRole(
        userId: userId ?? this.userId,
        roleId: roleId ?? this.roleId,
      );
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
  })  : userId = Value(userId),
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

  UserRolesCompanion copyWith(
      {Value<int>? userId, Value<int>? roleId, Value<int>? rowid}) {
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final AccountTypes accountTypes = AccountTypes(this);
  late final AccountGroups accountGroups = AccountGroups(this);
  late final Classifications classifications = Classifications(this);
  late final ReportTypes reportTypes = ReportTypes(this);
  late final ChartOfAccounts chartOfAccounts = ChartOfAccounts(this);
  late final TaxBracket taxBracket = TaxBracket(this);
  late final TaxCalcMethods taxCalcMethods = TaxCalcMethods(this);
  late final TaxTypes taxTypes = TaxTypes(this);
  late final Roles roles = Roles(this);
  late final CompanyInfo companyInfo = CompanyInfo(this);
  late final FinancialPeriods financialPeriods = FinancialPeriods(this);
  late final Accounts accounts = Accounts(this);
  late final RolePermissions rolePermissions = RolePermissions(this);
  late final BranchGroups branchGroups = BranchGroups(this);
  late final Branches branches = Branches(this);
  late final Users users = Users(this);
  late final AuditLog auditLog = AuditLog(this);
  late final Zones zones = Zones(this);
  late final Countries countries = Countries(this);
  late final Governorates governorates = Governorates(this);
  late final Cities cities = Cities(this);
  late final Regions regions = Regions(this);
  late final SystemConfig systemConfig = SystemConfig(this);
  late final FinancialPeriods financialPeriods = FinancialPeriods(this);
  late final Currencies currencies = Currencies(this);
  late final CurrencyDenominations currencyDenominations =
      CurrencyDenominations(this);
  late final UserRoles userRoles = UserRoles(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        accountTypes,
        accountGroups,
        classifications,
        reportTypes,
        chartOfAccounts,
        taxBracket,
        taxCalcMethods,
        taxTypes,
        roles,
        companyInfo,
        financialPeriods,
        accounts,
        rolePermissions,
        branchGroups,
        branches,
        users,
        auditLog,
        zones,
        countries,
        governorates,
        cities,
        regions,
        systemConfig,
        financialPeriods,
        currencies,
        currencyDenominations,
        userRoles
      ];
}

typedef $AccountTypesCreateCompanionBuilder = AccountTypesCompanion Function({
  required String typeCode,
  required String nameAr,
  required String nameEn,
  required int level,
  Value<bool> isTransactionLevel,
  Value<int> rowid,
});
typedef $AccountTypesUpdateCompanionBuilder = AccountTypesCompanion Function({
  Value<String> typeCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<int> level,
  Value<bool> isTransactionLevel,
  Value<int> rowid,
});

final class $AccountTypesReferences
    extends BaseReferences<_$AppDatabase, AccountTypes, AccountType> {
  $AccountTypesReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<ChartOfAccounts, List<ChartOfAccount>>
      _chartOfAccountsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.chartOfAccounts,
              aliasName: $_aliasNameGenerator(db.accountTypes.typeCode,
                  db.chartOfAccounts.accountTypeCode));

  $ChartOfAccountsProcessedTableManager get chartOfAccountsRefs {
    final manager = $ChartOfAccountsTableManager($_db, $_db.chartOfAccounts)
        .filter((f) => f.accountTypeCode.typeCode
            .sqlEquals($_itemColumn<String>('type_code')!));

    final cache =
        $_typedResult.readTableOrNull(_chartOfAccountsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $AccountTypesFilterComposer
    extends Composer<_$AppDatabase, AccountTypes> {
  $AccountTypesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get typeCode => $composableBuilder(
      column: $table.typeCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isTransactionLevel => $composableBuilder(
      column: $table.isTransactionLevel,
      builder: (column) => ColumnFilters(column));

  Expression<bool> chartOfAccountsRefs(
      Expression<bool> Function($ChartOfAccountsFilterComposer f) f) {
    final $ChartOfAccountsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeCode,
        referencedTable: $db.chartOfAccounts,
        getReferencedColumn: (t) => t.accountTypeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ChartOfAccountsFilterComposer(
              $db: $db,
              $table: $db.chartOfAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $AccountTypesOrderingComposer
    extends Composer<_$AppDatabase, AccountTypes> {
  $AccountTypesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get typeCode => $composableBuilder(
      column: $table.typeCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isTransactionLevel => $composableBuilder(
      column: $table.isTransactionLevel,
      builder: (column) => ColumnOrderings(column));
}

class $AccountTypesAnnotationComposer
    extends Composer<_$AppDatabase, AccountTypes> {
  $AccountTypesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get typeCode =>
      $composableBuilder(column: $table.typeCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<bool> get isTransactionLevel => $composableBuilder(
      column: $table.isTransactionLevel, builder: (column) => column);

  Expression<T> chartOfAccountsRefs<T extends Object>(
      Expression<T> Function($ChartOfAccountsAnnotationComposer a) f) {
    final $ChartOfAccountsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeCode,
        referencedTable: $db.chartOfAccounts,
        getReferencedColumn: (t) => t.accountTypeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ChartOfAccountsAnnotationComposer(
              $db: $db,
              $table: $db.chartOfAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $AccountTypesTableManager extends RootTableManager<
    _$AppDatabase,
    AccountTypes,
    AccountType,
    $AccountTypesFilterComposer,
    $AccountTypesOrderingComposer,
    $AccountTypesAnnotationComposer,
    $AccountTypesCreateCompanionBuilder,
    $AccountTypesUpdateCompanionBuilder,
    (AccountType, $AccountTypesReferences),
    AccountType,
    PrefetchHooks Function({bool chartOfAccountsRefs})> {
  $AccountTypesTableManager(_$AppDatabase db, AccountTypes table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AccountTypesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AccountTypesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AccountTypesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> typeCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<bool> isTransactionLevel = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountTypesCompanion(
            typeCode: typeCode,
            nameAr: nameAr,
            nameEn: nameEn,
            level: level,
            isTransactionLevel: isTransactionLevel,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String typeCode,
            required String nameAr,
            required String nameEn,
            required int level,
            Value<bool> isTransactionLevel = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountTypesCompanion.insert(
            typeCode: typeCode,
            nameAr: nameAr,
            nameEn: nameEn,
            level: level,
            isTransactionLevel: isTransactionLevel,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $AccountTypesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({chartOfAccountsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (chartOfAccountsRefs) db.chartOfAccounts
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (chartOfAccountsRefs)
                    await $_getPrefetchedData<AccountType, AccountTypes,
                            ChartOfAccount>(
                        currentTable: table,
                        referencedTable: $AccountTypesReferences
                            ._chartOfAccountsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $AccountTypesReferences(db, table, p0)
                                .chartOfAccountsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.accountTypeCode == item.typeCode),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $AccountTypesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    AccountTypes,
    AccountType,
    $AccountTypesFilterComposer,
    $AccountTypesOrderingComposer,
    $AccountTypesAnnotationComposer,
    $AccountTypesCreateCompanionBuilder,
    $AccountTypesUpdateCompanionBuilder,
    (AccountType, $AccountTypesReferences),
    AccountType,
    PrefetchHooks Function({bool chartOfAccountsRefs})>;
typedef $AccountGroupsCreateCompanionBuilder = AccountGroupsCompanion Function({
  required String groupCode,
  required String nameAr,
  required String nameEn,
  Value<int> rowid,
});
typedef $AccountGroupsUpdateCompanionBuilder = AccountGroupsCompanion Function({
  Value<String> groupCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<int> rowid,
});

final class $AccountGroupsReferences
    extends BaseReferences<_$AppDatabase, AccountGroups, AccountGroup> {
  $AccountGroupsReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<ChartOfAccounts, List<ChartOfAccount>>
      _chartOfAccountsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.chartOfAccounts,
              aliasName: $_aliasNameGenerator(db.accountGroups.groupCode,
                  db.chartOfAccounts.accountGroupCode));

  $ChartOfAccountsProcessedTableManager get chartOfAccountsRefs {
    final manager = $ChartOfAccountsTableManager($_db, $_db.chartOfAccounts)
        .filter((f) => f.accountGroupCode.groupCode
            .sqlEquals($_itemColumn<String>('group_code')!));

    final cache =
        $_typedResult.readTableOrNull(_chartOfAccountsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $AccountGroupsFilterComposer
    extends Composer<_$AppDatabase, AccountGroups> {
  $AccountGroupsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get groupCode => $composableBuilder(
      column: $table.groupCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  Expression<bool> chartOfAccountsRefs(
      Expression<bool> Function($ChartOfAccountsFilterComposer f) f) {
    final $ChartOfAccountsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupCode,
        referencedTable: $db.chartOfAccounts,
        getReferencedColumn: (t) => t.accountGroupCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ChartOfAccountsFilterComposer(
              $db: $db,
              $table: $db.chartOfAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $AccountGroupsOrderingComposer
    extends Composer<_$AppDatabase, AccountGroups> {
  $AccountGroupsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get groupCode => $composableBuilder(
      column: $table.groupCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));
}

class $AccountGroupsAnnotationComposer
    extends Composer<_$AppDatabase, AccountGroups> {
  $AccountGroupsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get groupCode =>
      $composableBuilder(column: $table.groupCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  Expression<T> chartOfAccountsRefs<T extends Object>(
      Expression<T> Function($ChartOfAccountsAnnotationComposer a) f) {
    final $ChartOfAccountsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupCode,
        referencedTable: $db.chartOfAccounts,
        getReferencedColumn: (t) => t.accountGroupCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ChartOfAccountsAnnotationComposer(
              $db: $db,
              $table: $db.chartOfAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $AccountGroupsTableManager extends RootTableManager<
    _$AppDatabase,
    AccountGroups,
    AccountGroup,
    $AccountGroupsFilterComposer,
    $AccountGroupsOrderingComposer,
    $AccountGroupsAnnotationComposer,
    $AccountGroupsCreateCompanionBuilder,
    $AccountGroupsUpdateCompanionBuilder,
    (AccountGroup, $AccountGroupsReferences),
    AccountGroup,
    PrefetchHooks Function({bool chartOfAccountsRefs})> {
  $AccountGroupsTableManager(_$AppDatabase db, AccountGroups table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AccountGroupsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AccountGroupsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AccountGroupsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> groupCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountGroupsCompanion(
            groupCode: groupCode,
            nameAr: nameAr,
            nameEn: nameEn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String groupCode,
            required String nameAr,
            required String nameEn,
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountGroupsCompanion.insert(
            groupCode: groupCode,
            nameAr: nameAr,
            nameEn: nameEn,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $AccountGroupsReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({chartOfAccountsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (chartOfAccountsRefs) db.chartOfAccounts
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (chartOfAccountsRefs)
                    await $_getPrefetchedData<AccountGroup, AccountGroups,
                            ChartOfAccount>(
                        currentTable: table,
                        referencedTable: $AccountGroupsReferences
                            ._chartOfAccountsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $AccountGroupsReferences(db, table, p0)
                                .chartOfAccountsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.accountGroupCode == item.groupCode),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $AccountGroupsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    AccountGroups,
    AccountGroup,
    $AccountGroupsFilterComposer,
    $AccountGroupsOrderingComposer,
    $AccountGroupsAnnotationComposer,
    $AccountGroupsCreateCompanionBuilder,
    $AccountGroupsUpdateCompanionBuilder,
    (AccountGroup, $AccountGroupsReferences),
    AccountGroup,
    PrefetchHooks Function({bool chartOfAccountsRefs})>;
typedef $ClassificationsCreateCompanionBuilder = ClassificationsCompanion
    Function({
  required String classCode,
  required String nameAr,
  required String nameEn,
  Value<int> rowid,
});
typedef $ClassificationsUpdateCompanionBuilder = ClassificationsCompanion
    Function({
  Value<String> classCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<int> rowid,
});

final class $ClassificationsReferences
    extends BaseReferences<_$AppDatabase, Classifications, Classification> {
  $ClassificationsReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<ChartOfAccounts, List<ChartOfAccount>>
      _chartOfAccountsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.chartOfAccounts,
              aliasName: $_aliasNameGenerator(db.classifications.classCode,
                  db.chartOfAccounts.classificationCode));

  $ChartOfAccountsProcessedTableManager get chartOfAccountsRefs {
    final manager = $ChartOfAccountsTableManager($_db, $_db.chartOfAccounts)
        .filter((f) => f.classificationCode.classCode
            .sqlEquals($_itemColumn<String>('class_code')!));

    final cache =
        $_typedResult.readTableOrNull(_chartOfAccountsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $ClassificationsFilterComposer
    extends Composer<_$AppDatabase, Classifications> {
  $ClassificationsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get classCode => $composableBuilder(
      column: $table.classCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  Expression<bool> chartOfAccountsRefs(
      Expression<bool> Function($ChartOfAccountsFilterComposer f) f) {
    final $ChartOfAccountsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.classCode,
        referencedTable: $db.chartOfAccounts,
        getReferencedColumn: (t) => t.classificationCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ChartOfAccountsFilterComposer(
              $db: $db,
              $table: $db.chartOfAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $ClassificationsOrderingComposer
    extends Composer<_$AppDatabase, Classifications> {
  $ClassificationsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get classCode => $composableBuilder(
      column: $table.classCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));
}

class $ClassificationsAnnotationComposer
    extends Composer<_$AppDatabase, Classifications> {
  $ClassificationsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get classCode =>
      $composableBuilder(column: $table.classCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  Expression<T> chartOfAccountsRefs<T extends Object>(
      Expression<T> Function($ChartOfAccountsAnnotationComposer a) f) {
    final $ChartOfAccountsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.classCode,
        referencedTable: $db.chartOfAccounts,
        getReferencedColumn: (t) => t.classificationCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ChartOfAccountsAnnotationComposer(
              $db: $db,
              $table: $db.chartOfAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $ClassificationsTableManager extends RootTableManager<
    _$AppDatabase,
    Classifications,
    Classification,
    $ClassificationsFilterComposer,
    $ClassificationsOrderingComposer,
    $ClassificationsAnnotationComposer,
    $ClassificationsCreateCompanionBuilder,
    $ClassificationsUpdateCompanionBuilder,
    (Classification, $ClassificationsReferences),
    Classification,
    PrefetchHooks Function({bool chartOfAccountsRefs})> {
  $ClassificationsTableManager(_$AppDatabase db, Classifications table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ClassificationsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ClassificationsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ClassificationsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> classCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ClassificationsCompanion(
            classCode: classCode,
            nameAr: nameAr,
            nameEn: nameEn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String classCode,
            required String nameAr,
            required String nameEn,
            Value<int> rowid = const Value.absent(),
          }) =>
              ClassificationsCompanion.insert(
            classCode: classCode,
            nameAr: nameAr,
            nameEn: nameEn,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $ClassificationsReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({chartOfAccountsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (chartOfAccountsRefs) db.chartOfAccounts
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (chartOfAccountsRefs)
                    await $_getPrefetchedData<Classification, Classifications,
                            ChartOfAccount>(
                        currentTable: table,
                        referencedTable: $ClassificationsReferences
                            ._chartOfAccountsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $ClassificationsReferences(db, table, p0)
                                .chartOfAccountsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.classificationCode == item.classCode),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $ClassificationsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Classifications,
    Classification,
    $ClassificationsFilterComposer,
    $ClassificationsOrderingComposer,
    $ClassificationsAnnotationComposer,
    $ClassificationsCreateCompanionBuilder,
    $ClassificationsUpdateCompanionBuilder,
    (Classification, $ClassificationsReferences),
    Classification,
    PrefetchHooks Function({bool chartOfAccountsRefs})>;
typedef $ReportTypesCreateCompanionBuilder = ReportTypesCompanion Function({
  required String reportCode,
  required String nameAr,
  required String nameEn,
  Value<int> rowid,
});
typedef $ReportTypesUpdateCompanionBuilder = ReportTypesCompanion Function({
  Value<String> reportCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<int> rowid,
});

final class $ReportTypesReferences
    extends BaseReferences<_$AppDatabase, ReportTypes, ReportType> {
  $ReportTypesReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<ChartOfAccounts, List<ChartOfAccount>>
      _chartOfAccountsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.chartOfAccounts,
              aliasName: $_aliasNameGenerator(db.reportTypes.reportCode,
                  db.chartOfAccounts.reportTypeCode));

  $ChartOfAccountsProcessedTableManager get chartOfAccountsRefs {
    final manager = $ChartOfAccountsTableManager($_db, $_db.chartOfAccounts)
        .filter((f) => f.reportTypeCode.reportCode
            .sqlEquals($_itemColumn<String>('report_code')!));

    final cache =
        $_typedResult.readTableOrNull(_chartOfAccountsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $ReportTypesFilterComposer extends Composer<_$AppDatabase, ReportTypes> {
  $ReportTypesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get reportCode => $composableBuilder(
      column: $table.reportCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  Expression<bool> chartOfAccountsRefs(
      Expression<bool> Function($ChartOfAccountsFilterComposer f) f) {
    final $ChartOfAccountsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.reportCode,
        referencedTable: $db.chartOfAccounts,
        getReferencedColumn: (t) => t.reportTypeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ChartOfAccountsFilterComposer(
              $db: $db,
              $table: $db.chartOfAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $ReportTypesOrderingComposer
    extends Composer<_$AppDatabase, ReportTypes> {
  $ReportTypesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get reportCode => $composableBuilder(
      column: $table.reportCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));
}

class $ReportTypesAnnotationComposer
    extends Composer<_$AppDatabase, ReportTypes> {
  $ReportTypesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get reportCode => $composableBuilder(
      column: $table.reportCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  Expression<T> chartOfAccountsRefs<T extends Object>(
      Expression<T> Function($ChartOfAccountsAnnotationComposer a) f) {
    final $ChartOfAccountsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.reportCode,
        referencedTable: $db.chartOfAccounts,
        getReferencedColumn: (t) => t.reportTypeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ChartOfAccountsAnnotationComposer(
              $db: $db,
              $table: $db.chartOfAccounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $ReportTypesTableManager extends RootTableManager<
    _$AppDatabase,
    ReportTypes,
    ReportType,
    $ReportTypesFilterComposer,
    $ReportTypesOrderingComposer,
    $ReportTypesAnnotationComposer,
    $ReportTypesCreateCompanionBuilder,
    $ReportTypesUpdateCompanionBuilder,
    (ReportType, $ReportTypesReferences),
    ReportType,
    PrefetchHooks Function({bool chartOfAccountsRefs})> {
  $ReportTypesTableManager(_$AppDatabase db, ReportTypes table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ReportTypesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ReportTypesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ReportTypesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> reportCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReportTypesCompanion(
            reportCode: reportCode,
            nameAr: nameAr,
            nameEn: nameEn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String reportCode,
            required String nameAr,
            required String nameEn,
            Value<int> rowid = const Value.absent(),
          }) =>
              ReportTypesCompanion.insert(
            reportCode: reportCode,
            nameAr: nameAr,
            nameEn: nameEn,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $ReportTypesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({chartOfAccountsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (chartOfAccountsRefs) db.chartOfAccounts
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (chartOfAccountsRefs)
                    await $_getPrefetchedData<ReportType, ReportTypes,
                            ChartOfAccount>(
                        currentTable: table,
                        referencedTable: $ReportTypesReferences
                            ._chartOfAccountsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $ReportTypesReferences(db, table, p0)
                                .chartOfAccountsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.reportTypeCode == item.reportCode),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $ReportTypesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    ReportTypes,
    ReportType,
    $ReportTypesFilterComposer,
    $ReportTypesOrderingComposer,
    $ReportTypesAnnotationComposer,
    $ReportTypesCreateCompanionBuilder,
    $ReportTypesUpdateCompanionBuilder,
    (ReportType, $ReportTypesReferences),
    ReportType,
    PrefetchHooks Function({bool chartOfAccountsRefs})>;
typedef $ChartOfAccountsCreateCompanionBuilder = ChartOfAccountsCompanion
    Function({
  Value<int> id,
  required String accountCode,
  required String accountNameAr,
  required String accountNameEn,
  required String accountTypeCode,
  Value<String?> accountGroupCode,
  Value<String?> classificationCode,
  Value<String?> reportTypeCode,
  Value<int?> parentAccountId,
  Value<bool> isActive,
});
typedef $ChartOfAccountsUpdateCompanionBuilder = ChartOfAccountsCompanion
    Function({
  Value<int> id,
  Value<String> accountCode,
  Value<String> accountNameAr,
  Value<String> accountNameEn,
  Value<String> accountTypeCode,
  Value<String?> accountGroupCode,
  Value<String?> classificationCode,
  Value<String?> reportTypeCode,
  Value<int?> parentAccountId,
  Value<bool> isActive,
});

final class $ChartOfAccountsReferences
    extends BaseReferences<_$AppDatabase, ChartOfAccounts, ChartOfAccount> {
  $ChartOfAccountsReferences(super.$_db, super.$_table, super.$_typedResult);

  static AccountTypes _accountTypeCodeTable(_$AppDatabase db) =>
      db.accountTypes.createAlias($_aliasNameGenerator(
          db.chartOfAccounts.accountTypeCode, db.accountTypes.typeCode));

  $AccountTypesProcessedTableManager get accountTypeCode {
    final $_column = $_itemColumn<String>('account_type_code')!;

    final manager = $AccountTypesTableManager($_db, $_db.accountTypes)
        .filter((f) => f.typeCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountTypeCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static AccountGroups _accountGroupCodeTable(_$AppDatabase db) =>
      db.accountGroups.createAlias($_aliasNameGenerator(
          db.chartOfAccounts.accountGroupCode, db.accountGroups.groupCode));

  $AccountGroupsProcessedTableManager? get accountGroupCode {
    final $_column = $_itemColumn<String>('account_group_code');
    if ($_column == null) return null;
    final manager = $AccountGroupsTableManager($_db, $_db.accountGroups)
        .filter((f) => f.groupCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountGroupCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static Classifications _classificationCodeTable(_$AppDatabase db) =>
      db.classifications.createAlias($_aliasNameGenerator(
          db.chartOfAccounts.classificationCode, db.classifications.classCode));

  $ClassificationsProcessedTableManager? get classificationCode {
    final $_column = $_itemColumn<String>('classification_code');
    if ($_column == null) return null;
    final manager = $ClassificationsTableManager($_db, $_db.classifications)
        .filter((f) => f.classCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_classificationCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static ReportTypes _reportTypeCodeTable(_$AppDatabase db) =>
      db.reportTypes.createAlias($_aliasNameGenerator(
          db.chartOfAccounts.reportTypeCode, db.reportTypes.reportCode));

  $ReportTypesProcessedTableManager? get reportTypeCode {
    final $_column = $_itemColumn<String>('report_type_code');
    if ($_column == null) return null;
    final manager = $ReportTypesTableManager($_db, $_db.reportTypes)
        .filter((f) => f.reportCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reportTypeCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $ChartOfAccountsFilterComposer
    extends Composer<_$AppDatabase, ChartOfAccounts> {
  $ChartOfAccountsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountCode => $composableBuilder(
      column: $table.accountCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountNameAr => $composableBuilder(
      column: $table.accountNameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountNameEn => $composableBuilder(
      column: $table.accountNameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentAccountId => $composableBuilder(
      column: $table.parentAccountId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  $AccountTypesFilterComposer get accountTypeCode {
    final $AccountTypesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountTypeCode,
        referencedTable: $db.accountTypes,
        getReferencedColumn: (t) => t.typeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $AccountTypesFilterComposer(
              $db: $db,
              $table: $db.accountTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $AccountGroupsFilterComposer get accountGroupCode {
    final $AccountGroupsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountGroupCode,
        referencedTable: $db.accountGroups,
        getReferencedColumn: (t) => t.groupCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $AccountGroupsFilterComposer(
              $db: $db,
              $table: $db.accountGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $ClassificationsFilterComposer get classificationCode {
    final $ClassificationsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.classificationCode,
        referencedTable: $db.classifications,
        getReferencedColumn: (t) => t.classCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ClassificationsFilterComposer(
              $db: $db,
              $table: $db.classifications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $ReportTypesFilterComposer get reportTypeCode {
    final $ReportTypesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.reportTypeCode,
        referencedTable: $db.reportTypes,
        getReferencedColumn: (t) => t.reportCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ReportTypesFilterComposer(
              $db: $db,
              $table: $db.reportTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $ChartOfAccountsOrderingComposer
    extends Composer<_$AppDatabase, ChartOfAccounts> {
  $ChartOfAccountsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountCode => $composableBuilder(
      column: $table.accountCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountNameAr => $composableBuilder(
      column: $table.accountNameAr,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountNameEn => $composableBuilder(
      column: $table.accountNameEn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentAccountId => $composableBuilder(
      column: $table.parentAccountId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  $AccountTypesOrderingComposer get accountTypeCode {
    final $AccountTypesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountTypeCode,
        referencedTable: $db.accountTypes,
        getReferencedColumn: (t) => t.typeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $AccountTypesOrderingComposer(
              $db: $db,
              $table: $db.accountTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $AccountGroupsOrderingComposer get accountGroupCode {
    final $AccountGroupsOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountGroupCode,
        referencedTable: $db.accountGroups,
        getReferencedColumn: (t) => t.groupCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $AccountGroupsOrderingComposer(
              $db: $db,
              $table: $db.accountGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $ClassificationsOrderingComposer get classificationCode {
    final $ClassificationsOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.classificationCode,
        referencedTable: $db.classifications,
        getReferencedColumn: (t) => t.classCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ClassificationsOrderingComposer(
              $db: $db,
              $table: $db.classifications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $ReportTypesOrderingComposer get reportTypeCode {
    final $ReportTypesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.reportTypeCode,
        referencedTable: $db.reportTypes,
        getReferencedColumn: (t) => t.reportCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ReportTypesOrderingComposer(
              $db: $db,
              $table: $db.reportTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $ChartOfAccountsAnnotationComposer
    extends Composer<_$AppDatabase, ChartOfAccounts> {
  $ChartOfAccountsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountCode => $composableBuilder(
      column: $table.accountCode, builder: (column) => column);

  GeneratedColumn<String> get accountNameAr => $composableBuilder(
      column: $table.accountNameAr, builder: (column) => column);

  GeneratedColumn<String> get accountNameEn => $composableBuilder(
      column: $table.accountNameEn, builder: (column) => column);

  GeneratedColumn<int> get parentAccountId => $composableBuilder(
      column: $table.parentAccountId, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $AccountTypesAnnotationComposer get accountTypeCode {
    final $AccountTypesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountTypeCode,
        referencedTable: $db.accountTypes,
        getReferencedColumn: (t) => t.typeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $AccountTypesAnnotationComposer(
              $db: $db,
              $table: $db.accountTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $AccountGroupsAnnotationComposer get accountGroupCode {
    final $AccountGroupsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountGroupCode,
        referencedTable: $db.accountGroups,
        getReferencedColumn: (t) => t.groupCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $AccountGroupsAnnotationComposer(
              $db: $db,
              $table: $db.accountGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $ClassificationsAnnotationComposer get classificationCode {
    final $ClassificationsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.classificationCode,
        referencedTable: $db.classifications,
        getReferencedColumn: (t) => t.classCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ClassificationsAnnotationComposer(
              $db: $db,
              $table: $db.classifications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $ReportTypesAnnotationComposer get reportTypeCode {
    final $ReportTypesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.reportTypeCode,
        referencedTable: $db.reportTypes,
        getReferencedColumn: (t) => t.reportCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ReportTypesAnnotationComposer(
              $db: $db,
              $table: $db.reportTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $ChartOfAccountsTableManager extends RootTableManager<
    _$AppDatabase,
    ChartOfAccounts,
    ChartOfAccount,
    $ChartOfAccountsFilterComposer,
    $ChartOfAccountsOrderingComposer,
    $ChartOfAccountsAnnotationComposer,
    $ChartOfAccountsCreateCompanionBuilder,
    $ChartOfAccountsUpdateCompanionBuilder,
    (ChartOfAccount, $ChartOfAccountsReferences),
    ChartOfAccount,
    PrefetchHooks Function(
        {bool accountTypeCode,
        bool accountGroupCode,
        bool classificationCode,
        bool reportTypeCode})> {
  $ChartOfAccountsTableManager(_$AppDatabase db, ChartOfAccounts table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ChartOfAccountsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ChartOfAccountsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ChartOfAccountsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> accountCode = const Value.absent(),
            Value<String> accountNameAr = const Value.absent(),
            Value<String> accountNameEn = const Value.absent(),
            Value<String> accountTypeCode = const Value.absent(),
            Value<String?> accountGroupCode = const Value.absent(),
            Value<String?> classificationCode = const Value.absent(),
            Value<String?> reportTypeCode = const Value.absent(),
            Value<int?> parentAccountId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              ChartOfAccountsCompanion(
            id: id,
            accountCode: accountCode,
            accountNameAr: accountNameAr,
            accountNameEn: accountNameEn,
            accountTypeCode: accountTypeCode,
            accountGroupCode: accountGroupCode,
            classificationCode: classificationCode,
            reportTypeCode: reportTypeCode,
            parentAccountId: parentAccountId,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String accountCode,
            required String accountNameAr,
            required String accountNameEn,
            required String accountTypeCode,
            Value<String?> accountGroupCode = const Value.absent(),
            Value<String?> classificationCode = const Value.absent(),
            Value<String?> reportTypeCode = const Value.absent(),
            Value<int?> parentAccountId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              ChartOfAccountsCompanion.insert(
            id: id,
            accountCode: accountCode,
            accountNameAr: accountNameAr,
            accountNameEn: accountNameEn,
            accountTypeCode: accountTypeCode,
            accountGroupCode: accountGroupCode,
            classificationCode: classificationCode,
            reportTypeCode: reportTypeCode,
            parentAccountId: parentAccountId,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $ChartOfAccountsReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {accountTypeCode = false,
              accountGroupCode = false,
              classificationCode = false,
              reportTypeCode = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (accountTypeCode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountTypeCode,
                    referencedTable:
                        $ChartOfAccountsReferences._accountTypeCodeTable(db),
                    referencedColumn: $ChartOfAccountsReferences
                        ._accountTypeCodeTable(db)
                        .typeCode,
                  ) as T;
                }
                if (accountGroupCode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountGroupCode,
                    referencedTable:
                        $ChartOfAccountsReferences._accountGroupCodeTable(db),
                    referencedColumn: $ChartOfAccountsReferences
                        ._accountGroupCodeTable(db)
                        .groupCode,
                  ) as T;
                }
                if (classificationCode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.classificationCode,
                    referencedTable:
                        $ChartOfAccountsReferences._classificationCodeTable(db),
                    referencedColumn: $ChartOfAccountsReferences
                        ._classificationCodeTable(db)
                        .classCode,
                  ) as T;
                }
                if (reportTypeCode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.reportTypeCode,
                    referencedTable:
                        $ChartOfAccountsReferences._reportTypeCodeTable(db),
                    referencedColumn: $ChartOfAccountsReferences
                        ._reportTypeCodeTable(db)
                        .reportCode,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $ChartOfAccountsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    ChartOfAccounts,
    ChartOfAccount,
    $ChartOfAccountsFilterComposer,
    $ChartOfAccountsOrderingComposer,
    $ChartOfAccountsAnnotationComposer,
    $ChartOfAccountsCreateCompanionBuilder,
    $ChartOfAccountsUpdateCompanionBuilder,
    (ChartOfAccount, $ChartOfAccountsReferences),
    ChartOfAccount,
    PrefetchHooks Function(
        {bool accountTypeCode,
        bool accountGroupCode,
        bool classificationCode,
        bool reportTypeCode})>;
typedef $TaxBracketCreateCompanionBuilder = TaxBracketCompanion Function({
  required String bracketCode,
  required String nameAr,
  required String nameEn,
  required double taxRate,
  Value<bool> isDefault,
  Value<int> rowid,
});
typedef $TaxBracketUpdateCompanionBuilder = TaxBracketCompanion Function({
  Value<String> bracketCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<double> taxRate,
  Value<bool> isDefault,
  Value<int> rowid,
});

class $TaxBracketFilterComposer extends Composer<_$AppDatabase, TaxBracket> {
  $TaxBracketFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get bracketCode => $composableBuilder(
      column: $table.bracketCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxRate => $composableBuilder(
      column: $table.taxRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnFilters(column));
}

class $TaxBracketOrderingComposer extends Composer<_$AppDatabase, TaxBracket> {
  $TaxBracketOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get bracketCode => $composableBuilder(
      column: $table.bracketCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxRate => $composableBuilder(
      column: $table.taxRate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnOrderings(column));
}

class $TaxBracketAnnotationComposer
    extends Composer<_$AppDatabase, TaxBracket> {
  $TaxBracketAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get bracketCode => $composableBuilder(
      column: $table.bracketCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<double> get taxRate =>
      $composableBuilder(column: $table.taxRate, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);
}

class $TaxBracketTableManager extends RootTableManager<
    _$AppDatabase,
    TaxBracket,
    TaxBracketData,
    $TaxBracketFilterComposer,
    $TaxBracketOrderingComposer,
    $TaxBracketAnnotationComposer,
    $TaxBracketCreateCompanionBuilder,
    $TaxBracketUpdateCompanionBuilder,
    (TaxBracketData, BaseReferences<_$AppDatabase, TaxBracket, TaxBracketData>),
    TaxBracketData,
    PrefetchHooks Function()> {
  $TaxBracketTableManager(_$AppDatabase db, TaxBracket table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TaxBracketFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TaxBracketOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TaxBracketAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> bracketCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<double> taxRate = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TaxBracketCompanion(
            bracketCode: bracketCode,
            nameAr: nameAr,
            nameEn: nameEn,
            taxRate: taxRate,
            isDefault: isDefault,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String bracketCode,
            required String nameAr,
            required String nameEn,
            required double taxRate,
            Value<bool> isDefault = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TaxBracketCompanion.insert(
            bracketCode: bracketCode,
            nameAr: nameAr,
            nameEn: nameEn,
            taxRate: taxRate,
            isDefault: isDefault,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $TaxBracketProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    TaxBracket,
    TaxBracketData,
    $TaxBracketFilterComposer,
    $TaxBracketOrderingComposer,
    $TaxBracketAnnotationComposer,
    $TaxBracketCreateCompanionBuilder,
    $TaxBracketUpdateCompanionBuilder,
    (TaxBracketData, BaseReferences<_$AppDatabase, TaxBracket, TaxBracketData>),
    TaxBracketData,
    PrefetchHooks Function()>;
typedef $TaxCalcMethodsCreateCompanionBuilder = TaxCalcMethodsCompanion
    Function({
  required String methodCode,
  required String nameAr,
  required String nameEn,
  required String category,
  Value<int> rowid,
});
typedef $TaxCalcMethodsUpdateCompanionBuilder = TaxCalcMethodsCompanion
    Function({
  Value<String> methodCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<String> category,
  Value<int> rowid,
});

final class $TaxCalcMethodsReferences
    extends BaseReferences<_$AppDatabase, TaxCalcMethods, TaxCalcMethod> {
  $TaxCalcMethodsReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<TaxTypes, List<TaxType>> _taxTypesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.taxTypes,
          aliasName: $_aliasNameGenerator(
              db.taxCalcMethods.methodCode, db.taxTypes.calcMethodCode));

  $TaxTypesProcessedTableManager get taxTypesRefs {
    final manager = $TaxTypesTableManager($_db, $_db.taxTypes).filter((f) => f
        .calcMethodCode.methodCode
        .sqlEquals($_itemColumn<String>('method_code')!));

    final cache = $_typedResult.readTableOrNull(_taxTypesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $TaxCalcMethodsFilterComposer
    extends Composer<_$AppDatabase, TaxCalcMethods> {
  $TaxCalcMethodsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get methodCode => $composableBuilder(
      column: $table.methodCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  Expression<bool> taxTypesRefs(
      Expression<bool> Function($TaxTypesFilterComposer f) f) {
    final $TaxTypesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.methodCode,
        referencedTable: $db.taxTypes,
        getReferencedColumn: (t) => t.calcMethodCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $TaxTypesFilterComposer(
              $db: $db,
              $table: $db.taxTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $TaxCalcMethodsOrderingComposer
    extends Composer<_$AppDatabase, TaxCalcMethods> {
  $TaxCalcMethodsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get methodCode => $composableBuilder(
      column: $table.methodCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));
}

class $TaxCalcMethodsAnnotationComposer
    extends Composer<_$AppDatabase, TaxCalcMethods> {
  $TaxCalcMethodsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get methodCode => $composableBuilder(
      column: $table.methodCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  Expression<T> taxTypesRefs<T extends Object>(
      Expression<T> Function($TaxTypesAnnotationComposer a) f) {
    final $TaxTypesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.methodCode,
        referencedTable: $db.taxTypes,
        getReferencedColumn: (t) => t.calcMethodCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $TaxTypesAnnotationComposer(
              $db: $db,
              $table: $db.taxTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $TaxCalcMethodsTableManager extends RootTableManager<
    _$AppDatabase,
    TaxCalcMethods,
    TaxCalcMethod,
    $TaxCalcMethodsFilterComposer,
    $TaxCalcMethodsOrderingComposer,
    $TaxCalcMethodsAnnotationComposer,
    $TaxCalcMethodsCreateCompanionBuilder,
    $TaxCalcMethodsUpdateCompanionBuilder,
    (TaxCalcMethod, $TaxCalcMethodsReferences),
    TaxCalcMethod,
    PrefetchHooks Function({bool taxTypesRefs})> {
  $TaxCalcMethodsTableManager(_$AppDatabase db, TaxCalcMethods table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TaxCalcMethodsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TaxCalcMethodsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TaxCalcMethodsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> methodCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TaxCalcMethodsCompanion(
            methodCode: methodCode,
            nameAr: nameAr,
            nameEn: nameEn,
            category: category,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String methodCode,
            required String nameAr,
            required String nameEn,
            required String category,
            Value<int> rowid = const Value.absent(),
          }) =>
              TaxCalcMethodsCompanion.insert(
            methodCode: methodCode,
            nameAr: nameAr,
            nameEn: nameEn,
            category: category,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $TaxCalcMethodsReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({taxTypesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (taxTypesRefs) db.taxTypes],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (taxTypesRefs)
                    await $_getPrefetchedData<TaxCalcMethod, TaxCalcMethods,
                            TaxType>(
                        currentTable: table,
                        referencedTable:
                            $TaxCalcMethodsReferences._taxTypesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $TaxCalcMethodsReferences(db, table, p0)
                                .taxTypesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.calcMethodCode == item.methodCode),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $TaxCalcMethodsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    TaxCalcMethods,
    TaxCalcMethod,
    $TaxCalcMethodsFilterComposer,
    $TaxCalcMethodsOrderingComposer,
    $TaxCalcMethodsAnnotationComposer,
    $TaxCalcMethodsCreateCompanionBuilder,
    $TaxCalcMethodsUpdateCompanionBuilder,
    (TaxCalcMethod, $TaxCalcMethodsReferences),
    TaxCalcMethod,
    PrefetchHooks Function({bool taxTypesRefs})>;
typedef $TaxTypesCreateCompanionBuilder = TaxTypesCompanion Function({
  required String typeCode,
  required String nameAr,
  required String nameEn,
  required String calcMethodCode,
  Value<String?> salesAccountId,
  Value<String?> purchasesAccountId,
  Value<int> rowid,
});
typedef $TaxTypesUpdateCompanionBuilder = TaxTypesCompanion Function({
  Value<String> typeCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<String> calcMethodCode,
  Value<String?> salesAccountId,
  Value<String?> purchasesAccountId,
  Value<int> rowid,
});

final class $TaxTypesReferences
    extends BaseReferences<_$AppDatabase, TaxTypes, TaxType> {
  $TaxTypesReferences(super.$_db, super.$_table, super.$_typedResult);

  static TaxCalcMethods _calcMethodCodeTable(_$AppDatabase db) =>
      db.taxCalcMethods.createAlias($_aliasNameGenerator(
          db.taxTypes.calcMethodCode, db.taxCalcMethods.methodCode));

  $TaxCalcMethodsProcessedTableManager get calcMethodCode {
    final $_column = $_itemColumn<String>('calc_method_code')!;

    final manager = $TaxCalcMethodsTableManager($_db, $_db.taxCalcMethods)
        .filter((f) => f.methodCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_calcMethodCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $TaxTypesFilterComposer extends Composer<_$AppDatabase, TaxTypes> {
  $TaxTypesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get typeCode => $composableBuilder(
      column: $table.typeCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get salesAccountId => $composableBuilder(
      column: $table.salesAccountId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get purchasesAccountId => $composableBuilder(
      column: $table.purchasesAccountId,
      builder: (column) => ColumnFilters(column));

  $TaxCalcMethodsFilterComposer get calcMethodCode {
    final $TaxCalcMethodsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.calcMethodCode,
        referencedTable: $db.taxCalcMethods,
        getReferencedColumn: (t) => t.methodCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $TaxCalcMethodsFilterComposer(
              $db: $db,
              $table: $db.taxCalcMethods,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $TaxTypesOrderingComposer extends Composer<_$AppDatabase, TaxTypes> {
  $TaxTypesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get typeCode => $composableBuilder(
      column: $table.typeCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get salesAccountId => $composableBuilder(
      column: $table.salesAccountId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get purchasesAccountId => $composableBuilder(
      column: $table.purchasesAccountId,
      builder: (column) => ColumnOrderings(column));

  $TaxCalcMethodsOrderingComposer get calcMethodCode {
    final $TaxCalcMethodsOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.calcMethodCode,
        referencedTable: $db.taxCalcMethods,
        getReferencedColumn: (t) => t.methodCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $TaxCalcMethodsOrderingComposer(
              $db: $db,
              $table: $db.taxCalcMethods,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $TaxTypesAnnotationComposer extends Composer<_$AppDatabase, TaxTypes> {
  $TaxTypesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get typeCode =>
      $composableBuilder(column: $table.typeCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get salesAccountId => $composableBuilder(
      column: $table.salesAccountId, builder: (column) => column);

  GeneratedColumn<String> get purchasesAccountId => $composableBuilder(
      column: $table.purchasesAccountId, builder: (column) => column);

  $TaxCalcMethodsAnnotationComposer get calcMethodCode {
    final $TaxCalcMethodsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.calcMethodCode,
        referencedTable: $db.taxCalcMethods,
        getReferencedColumn: (t) => t.methodCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $TaxCalcMethodsAnnotationComposer(
              $db: $db,
              $table: $db.taxCalcMethods,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $TaxTypesTableManager extends RootTableManager<
    _$AppDatabase,
    TaxTypes,
    TaxType,
    $TaxTypesFilterComposer,
    $TaxTypesOrderingComposer,
    $TaxTypesAnnotationComposer,
    $TaxTypesCreateCompanionBuilder,
    $TaxTypesUpdateCompanionBuilder,
    (TaxType, $TaxTypesReferences),
    TaxType,
    PrefetchHooks Function({bool calcMethodCode})> {
  $TaxTypesTableManager(_$AppDatabase db, TaxTypes table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TaxTypesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TaxTypesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TaxTypesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> typeCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<String> calcMethodCode = const Value.absent(),
            Value<String?> salesAccountId = const Value.absent(),
            Value<String?> purchasesAccountId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TaxTypesCompanion(
            typeCode: typeCode,
            nameAr: nameAr,
            nameEn: nameEn,
            calcMethodCode: calcMethodCode,
            salesAccountId: salesAccountId,
            purchasesAccountId: purchasesAccountId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String typeCode,
            required String nameAr,
            required String nameEn,
            required String calcMethodCode,
            Value<String?> salesAccountId = const Value.absent(),
            Value<String?> purchasesAccountId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TaxTypesCompanion.insert(
            typeCode: typeCode,
            nameAr: nameAr,
            nameEn: nameEn,
            calcMethodCode: calcMethodCode,
            salesAccountId: salesAccountId,
            purchasesAccountId: purchasesAccountId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $TaxTypesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({calcMethodCode = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (calcMethodCode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.calcMethodCode,
                    referencedTable:
                        $TaxTypesReferences._calcMethodCodeTable(db),
                    referencedColumn:
                        $TaxTypesReferences._calcMethodCodeTable(db).methodCode,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $TaxTypesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    TaxTypes,
    TaxType,
    $TaxTypesFilterComposer,
    $TaxTypesOrderingComposer,
    $TaxTypesAnnotationComposer,
    $TaxTypesCreateCompanionBuilder,
    $TaxTypesUpdateCompanionBuilder,
    (TaxType, $TaxTypesReferences),
    TaxType,
    PrefetchHooks Function({bool calcMethodCode})>;
typedef $RolesCreateCompanionBuilder = RolesCompanion Function({
  Value<int> id,
  required String nameAr,
  required String nameEn,
  Value<String?> description,
  required bool isActive,
});
typedef $RolesUpdateCompanionBuilder = RolesCompanion Function({
  Value<int> id,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<String?> description,
  Value<bool> isActive,
});

final class $RolesReferences
    extends BaseReferences<_$AppDatabase, Roles, Role> {
  $RolesReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<RolePermissions, List<RolePermission>>
      _rolePermissionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.rolePermissions,
              aliasName:
                  $_aliasNameGenerator(db.roles.id, db.rolePermissions.roleId));

  $RolePermissionsProcessedTableManager get rolePermissionsRefs {
    final manager = $RolePermissionsTableManager($_db, $_db.rolePermissions)
        .filter((f) => f.roleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_rolePermissionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<UserRoles, List<UserRole>> _userRolesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.userRoles,
          aliasName: $_aliasNameGenerator(db.roles.id, db.userRoles.roleId));

  $UserRolesProcessedTableManager get userRolesRefs {
    final manager = $UserRolesTableManager($_db, $_db.userRoles)
        .filter((f) => f.roleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userRolesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $RolesFilterComposer extends Composer<_$AppDatabase, Roles> {
  $RolesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  Expression<bool> rolePermissionsRefs(
      Expression<bool> Function($RolePermissionsFilterComposer f) f) {
    final $RolePermissionsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rolePermissions,
        getReferencedColumn: (t) => t.roleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $RolePermissionsFilterComposer(
              $db: $db,
              $table: $db.rolePermissions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> userRolesRefs(
      Expression<bool> Function($UserRolesFilterComposer f) f) {
    final $UserRolesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userRoles,
        getReferencedColumn: (t) => t.roleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UserRolesFilterComposer(
              $db: $db,
              $table: $db.userRoles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
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
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> rolePermissionsRefs<T extends Object>(
      Expression<T> Function($RolePermissionsAnnotationComposer a) f) {
    final $RolePermissionsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rolePermissions,
        getReferencedColumn: (t) => t.roleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $RolePermissionsAnnotationComposer(
              $db: $db,
              $table: $db.rolePermissions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> userRolesRefs<T extends Object>(
      Expression<T> Function($UserRolesAnnotationComposer a) f) {
    final $UserRolesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userRoles,
        getReferencedColumn: (t) => t.roleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UserRolesAnnotationComposer(
              $db: $db,
              $table: $db.userRoles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $RolesTableManager extends RootTableManager<
    _$AppDatabase,
    Roles,
    Role,
    $RolesFilterComposer,
    $RolesOrderingComposer,
    $RolesAnnotationComposer,
    $RolesCreateCompanionBuilder,
    $RolesUpdateCompanionBuilder,
    (Role, $RolesReferences),
    Role,
    PrefetchHooks Function({bool rolePermissionsRefs, bool userRolesRefs})> {
  $RolesTableManager(_$AppDatabase db, Roles table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $RolesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $RolesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $RolesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              RolesCompanion(
            id: id,
            nameAr: nameAr,
            nameEn: nameEn,
            description: description,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nameAr,
            required String nameEn,
            Value<String?> description = const Value.absent(),
            required bool isActive,
          }) =>
              RolesCompanion.insert(
            id: id,
            nameAr: nameAr,
            nameEn: nameEn,
            description: description,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $RolesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {rolePermissionsRefs = false, userRolesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (rolePermissionsRefs) db.rolePermissions,
                if (userRolesRefs) db.userRoles
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (rolePermissionsRefs)
                    await $_getPrefetchedData<Role, Roles, RolePermission>(
                        currentTable: table,
                        referencedTable:
                            $RolesReferences._rolePermissionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $RolesReferences(db, table, p0).rolePermissionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.roleId == item.id),
                        typedResults: items),
                  if (userRolesRefs)
                    await $_getPrefetchedData<Role, Roles, UserRole>(
                        currentTable: table,
                        referencedTable:
                            $RolesReferences._userRolesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $RolesReferences(db, table, p0).userRolesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.roleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $RolesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Roles,
    Role,
    $RolesFilterComposer,
    $RolesOrderingComposer,
    $RolesAnnotationComposer,
    $RolesCreateCompanionBuilder,
    $RolesUpdateCompanionBuilder,
    (Role, $RolesReferences),
    Role,
    PrefetchHooks Function({bool rolePermissionsRefs, bool userRolesRefs})>;
typedef $CompanyInfoCreateCompanionBuilder = CompanyInfoCompanion Function({
  Value<int> id,
  required String companyCode,
  required String nameAr,
  required String nameEn,
  Value<String?> countryId,
  Value<String?> taxNumber,
  Value<String?> commercialRegNo,
  Value<String?> address,
  Value<String?> phone,
  Value<String?> email,
  Value<Uint8List?> logo,
  required bool isMainCompany,
  Value<String?> remarks,
});
typedef $CompanyInfoUpdateCompanionBuilder = CompanyInfoCompanion Function({
  Value<int> id,
  Value<String> companyCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<String?> countryId,
  Value<String?> taxNumber,
  Value<String?> commercialRegNo,
  Value<String?> address,
  Value<String?> phone,
  Value<String?> email,
  Value<Uint8List?> logo,
  Value<bool> isMainCompany,
  Value<String?> remarks,
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
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get companyCode => $composableBuilder(
      column: $table.companyCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get countryId => $composableBuilder(
      column: $table.countryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taxNumber => $composableBuilder(
      column: $table.taxNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get commercialRegNo => $composableBuilder(
      column: $table.commercialRegNo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get logo => $composableBuilder(
      column: $table.logo, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isMainCompany => $composableBuilder(
      column: $table.isMainCompany, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnFilters(column));
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
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get companyCode => $composableBuilder(
      column: $table.companyCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get countryId => $composableBuilder(
      column: $table.countryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taxNumber => $composableBuilder(
      column: $table.taxNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get commercialRegNo => $composableBuilder(
      column: $table.commercialRegNo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get logo => $composableBuilder(
      column: $table.logo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isMainCompany => $composableBuilder(
      column: $table.isMainCompany,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get companyCode => $composableBuilder(
      column: $table.companyCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get countryId =>
      $composableBuilder(column: $table.countryId, builder: (column) => column);

  GeneratedColumn<String> get taxNumber =>
      $composableBuilder(column: $table.taxNumber, builder: (column) => column);

  GeneratedColumn<String> get commercialRegNo => $composableBuilder(
      column: $table.commercialRegNo, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<Uint8List> get logo =>
      $composableBuilder(column: $table.logo, builder: (column) => column);

  GeneratedColumn<bool> get isMainCompany => $composableBuilder(
      column: $table.isMainCompany, builder: (column) => column);

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);
}

class $CompanyInfoTableManager extends RootTableManager<
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
      BaseReferences<_$AppDatabase, CompanyInfo, CompanyInfoData>
    ),
    CompanyInfoData,
    PrefetchHooks Function()> {
  $CompanyInfoTableManager(_$AppDatabase db, CompanyInfo table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CompanyInfoFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CompanyInfoOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CompanyInfoAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> companyCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<String?> countryId = const Value.absent(),
            Value<String?> taxNumber = const Value.absent(),
            Value<String?> commercialRegNo = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<Uint8List?> logo = const Value.absent(),
            Value<bool> isMainCompany = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
          }) =>
              CompanyInfoCompanion(
            id: id,
            companyCode: companyCode,
            nameAr: nameAr,
            nameEn: nameEn,
            countryId: countryId,
            taxNumber: taxNumber,
            commercialRegNo: commercialRegNo,
            address: address,
            phone: phone,
            email: email,
            logo: logo,
            isMainCompany: isMainCompany,
            remarks: remarks,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String companyCode,
            required String nameAr,
            required String nameEn,
            Value<String?> countryId = const Value.absent(),
            Value<String?> taxNumber = const Value.absent(),
            Value<String?> commercialRegNo = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<Uint8List?> logo = const Value.absent(),
            required bool isMainCompany,
            Value<String?> remarks = const Value.absent(),
          }) =>
              CompanyInfoCompanion.insert(
            id: id,
            companyCode: companyCode,
            nameAr: nameAr,
            nameEn: nameEn,
            countryId: countryId,
            taxNumber: taxNumber,
            commercialRegNo: commercialRegNo,
            address: address,
            phone: phone,
            email: email,
            logo: logo,
            isMainCompany: isMainCompany,
            remarks: remarks,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CompanyInfoProcessedTableManager = ProcessedTableManager<
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
      BaseReferences<_$AppDatabase, CompanyInfo, CompanyInfoData>
    ),
    CompanyInfoData,
    PrefetchHooks Function()>;
typedef $FinancialPeriodsCreateCompanionBuilder = FinancialPeriodsCompanion
    Function({
  Value<int> id,
  required double startDate,
  required double endDate,
  Value<bool> isClosed,
});
typedef $FinancialPeriodsUpdateCompanionBuilder = FinancialPeriodsCompanion
    Function({
  Value<int> id,
  Value<double> startDate,
  Value<double> endDate,
  Value<bool> isClosed,
});

class $FinancialPeriodsFilterComposer
    extends Composer<_$AppDatabase, FinancialPeriods> {
  $FinancialPeriodsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isClosed => $composableBuilder(
      column: $table.isClosed, builder: (column) => ColumnFilters(column));
}

class $FinancialPeriodsOrderingComposer
    extends Composer<_$AppDatabase, FinancialPeriods> {
  $FinancialPeriodsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isClosed => $composableBuilder(
      column: $table.isClosed, builder: (column) => ColumnOrderings(column));
}

class $FinancialPeriodsAnnotationComposer
    extends Composer<_$AppDatabase, FinancialPeriods> {
  $FinancialPeriodsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<double> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isClosed =>
      $composableBuilder(column: $table.isClosed, builder: (column) => column);
}

class $FinancialPeriodsTableManager extends RootTableManager<
    _$AppDatabase,
    FinancialPeriods,
    FinancialPeriod,
    $FinancialPeriodsFilterComposer,
    $FinancialPeriodsOrderingComposer,
    $FinancialPeriodsAnnotationComposer,
    $FinancialPeriodsCreateCompanionBuilder,
    $FinancialPeriodsUpdateCompanionBuilder,
    (
      FinancialPeriod,
      BaseReferences<_$AppDatabase, FinancialPeriods, FinancialPeriod>
    ),
    FinancialPeriod,
    PrefetchHooks Function()> {
  $FinancialPeriodsTableManager(_$AppDatabase db, FinancialPeriods table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $FinancialPeriodsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $FinancialPeriodsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $FinancialPeriodsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> startDate = const Value.absent(),
            Value<double> endDate = const Value.absent(),
            Value<bool> isClosed = const Value.absent(),
          }) =>
              FinancialPeriodsCompanion(
            id: id,
            startDate: startDate,
            endDate: endDate,
            isClosed: isClosed,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double startDate,
            required double endDate,
            Value<bool> isClosed = const Value.absent(),
          }) =>
              FinancialPeriodsCompanion.insert(
            id: id,
            startDate: startDate,
            endDate: endDate,
            isClosed: isClosed,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $FinancialPeriodsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    FinancialPeriods,
    FinancialPeriod,
    $FinancialPeriodsFilterComposer,
    $FinancialPeriodsOrderingComposer,
    $FinancialPeriodsAnnotationComposer,
    $FinancialPeriodsCreateCompanionBuilder,
    $FinancialPeriodsUpdateCompanionBuilder,
    (
      FinancialPeriod,
      BaseReferences<_$AppDatabase, FinancialPeriods, FinancialPeriod>
    ),
    FinancialPeriod,
    PrefetchHooks Function()>;
typedef $AccountsCreateCompanionBuilder = AccountsCompanion Function({
  Value<int> id,
  Value<int?> parentId,
  required String accountCode,
  required String nameAr,
  required String nameEn,
  required int level,
  Value<bool> isActive,
  required String nature,
  required String reportType,
  Value<String?> cashFlowType,
  Value<String?> detailAccountType,
});
typedef $AccountsUpdateCompanionBuilder = AccountsCompanion Function({
  Value<int> id,
  Value<int?> parentId,
  Value<String> accountCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<int> level,
  Value<bool> isActive,
  Value<String> nature,
  Value<String> reportType,
  Value<String?> cashFlowType,
  Value<String?> detailAccountType,
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
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountCode => $composableBuilder(
      column: $table.accountCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nature => $composableBuilder(
      column: $table.nature, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cashFlowType => $composableBuilder(
      column: $table.cashFlowType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get detailAccountType => $composableBuilder(
      column: $table.detailAccountType,
      builder: (column) => ColumnFilters(column));
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
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountCode => $composableBuilder(
      column: $table.accountCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nature => $composableBuilder(
      column: $table.nature, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cashFlowType => $composableBuilder(
      column: $table.cashFlowType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detailAccountType => $composableBuilder(
      column: $table.detailAccountType,
      builder: (column) => ColumnOrderings(column));
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
      column: $table.accountCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get nature =>
      $composableBuilder(column: $table.nature, builder: (column) => column);

  GeneratedColumn<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => column);

  GeneratedColumn<String> get cashFlowType => $composableBuilder(
      column: $table.cashFlowType, builder: (column) => column);

  GeneratedColumn<String> get detailAccountType => $composableBuilder(
      column: $table.detailAccountType, builder: (column) => column);
}

class $AccountsTableManager extends RootTableManager<
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
    PrefetchHooks Function()> {
  $AccountsTableManager(_$AppDatabase db, Accounts table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AccountsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AccountsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AccountsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> parentId = const Value.absent(),
            Value<String> accountCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String> nature = const Value.absent(),
            Value<String> reportType = const Value.absent(),
            Value<String?> cashFlowType = const Value.absent(),
            Value<String?> detailAccountType = const Value.absent(),
          }) =>
              AccountsCompanion(
            id: id,
            parentId: parentId,
            accountCode: accountCode,
            nameAr: nameAr,
            nameEn: nameEn,
            level: level,
            isActive: isActive,
            nature: nature,
            reportType: reportType,
            cashFlowType: cashFlowType,
            detailAccountType: detailAccountType,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> parentId = const Value.absent(),
            required String accountCode,
            required String nameAr,
            required String nameEn,
            required int level,
            Value<bool> isActive = const Value.absent(),
            required String nature,
            required String reportType,
            Value<String?> cashFlowType = const Value.absent(),
            Value<String?> detailAccountType = const Value.absent(),
          }) =>
              AccountsCompanion.insert(
            id: id,
            parentId: parentId,
            accountCode: accountCode,
            nameAr: nameAr,
            nameEn: nameEn,
            level: level,
            isActive: isActive,
            nature: nature,
            reportType: reportType,
            cashFlowType: cashFlowType,
            detailAccountType: detailAccountType,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $AccountsProcessedTableManager = ProcessedTableManager<
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
    PrefetchHooks Function()>;
typedef $RolePermissionsCreateCompanionBuilder = RolePermissionsCompanion
    Function({
  required int roleId,
  required String permission,
  Value<int> rowid,
});
typedef $RolePermissionsUpdateCompanionBuilder = RolePermissionsCompanion
    Function({
  Value<int> roleId,
  Value<String> permission,
  Value<int> rowid,
});

final class $RolePermissionsReferences
    extends BaseReferences<_$AppDatabase, RolePermissions, RolePermission> {
  $RolePermissionsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Roles _roleIdTable(_$AppDatabase db) => db.roles.createAlias(
      $_aliasNameGenerator(db.rolePermissions.roleId, db.roles.id));

  $RolesProcessedTableManager get roleId {
    final $_column = $_itemColumn<int>('role_id')!;

    final manager = $RolesTableManager($_db, $_db.roles)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $RolePermissionsFilterComposer
    extends Composer<_$AppDatabase, RolePermissions> {
  $RolePermissionsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get permission => $composableBuilder(
      column: $table.permission, builder: (column) => ColumnFilters(column));

  $RolesFilterComposer get roleId {
    final $RolesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roleId,
        referencedTable: $db.roles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $RolesFilterComposer(
              $db: $db,
              $table: $db.roles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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
  ColumnOrderings<String> get permission => $composableBuilder(
      column: $table.permission, builder: (column) => ColumnOrderings(column));

  $RolesOrderingComposer get roleId {
    final $RolesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roleId,
        referencedTable: $db.roles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $RolesOrderingComposer(
              $db: $db,
              $table: $db.roles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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
  GeneratedColumn<String> get permission => $composableBuilder(
      column: $table.permission, builder: (column) => column);

  $RolesAnnotationComposer get roleId {
    final $RolesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roleId,
        referencedTable: $db.roles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $RolesAnnotationComposer(
              $db: $db,
              $table: $db.roles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $RolePermissionsTableManager extends RootTableManager<
    _$AppDatabase,
    RolePermissions,
    RolePermission,
    $RolePermissionsFilterComposer,
    $RolePermissionsOrderingComposer,
    $RolePermissionsAnnotationComposer,
    $RolePermissionsCreateCompanionBuilder,
    $RolePermissionsUpdateCompanionBuilder,
    (RolePermission, $RolePermissionsReferences),
    RolePermission,
    PrefetchHooks Function({bool roleId})> {
  $RolePermissionsTableManager(_$AppDatabase db, RolePermissions table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $RolePermissionsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $RolePermissionsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $RolePermissionsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> roleId = const Value.absent(),
            Value<String> permission = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RolePermissionsCompanion(
            roleId: roleId,
            permission: permission,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int roleId,
            required String permission,
            Value<int> rowid = const Value.absent(),
          }) =>
              RolePermissionsCompanion.insert(
            roleId: roleId,
            permission: permission,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $RolePermissionsReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({roleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (roleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roleId,
                    referencedTable:
                        $RolePermissionsReferences._roleIdTable(db),
                    referencedColumn:
                        $RolePermissionsReferences._roleIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $RolePermissionsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    RolePermissions,
    RolePermission,
    $RolePermissionsFilterComposer,
    $RolePermissionsOrderingComposer,
    $RolePermissionsAnnotationComposer,
    $RolePermissionsCreateCompanionBuilder,
    $RolePermissionsUpdateCompanionBuilder,
    (RolePermission, $RolePermissionsReferences),
    RolePermission,
    PrefetchHooks Function({bool roleId})>;
typedef $BranchGroupsCreateCompanionBuilder = BranchGroupsCompanion Function({
  Value<int> id,
  required String nameAr,
  required String nameEn,
  Value<bool> isActive,
});
typedef $BranchGroupsUpdateCompanionBuilder = BranchGroupsCompanion Function({
  Value<int> id,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<bool> isActive,
});

final class $BranchGroupsReferences
    extends BaseReferences<_$AppDatabase, BranchGroups, BranchGroup> {
  $BranchGroupsReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<Branches, List<Branche>> _branchesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.branches,
          aliasName: $_aliasNameGenerator(
              db.branchGroups.id, db.branches.branchGroupId));

  $BranchesProcessedTableManager get branchesRefs {
    final manager = $BranchesTableManager($_db, $_db.branches)
        .filter((f) => f.branchGroupId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_branchesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $BranchGroupsFilterComposer
    extends Composer<_$AppDatabase, BranchGroups> {
  $BranchGroupsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  Expression<bool> branchesRefs(
      Expression<bool> Function($BranchesFilterComposer f) f) {
    final $BranchesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.branches,
        getReferencedColumn: (t) => t.branchGroupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $BranchesFilterComposer(
              $db: $db,
              $table: $db.branches,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $BranchGroupsOrderingComposer
    extends Composer<_$AppDatabase, BranchGroups> {
  $BranchGroupsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $BranchGroupsAnnotationComposer
    extends Composer<_$AppDatabase, BranchGroups> {
  $BranchGroupsAnnotationComposer({
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

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> branchesRefs<T extends Object>(
      Expression<T> Function($BranchesAnnotationComposer a) f) {
    final $BranchesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.branches,
        getReferencedColumn: (t) => t.branchGroupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $BranchesAnnotationComposer(
              $db: $db,
              $table: $db.branches,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $BranchGroupsTableManager extends RootTableManager<
    _$AppDatabase,
    BranchGroups,
    BranchGroup,
    $BranchGroupsFilterComposer,
    $BranchGroupsOrderingComposer,
    $BranchGroupsAnnotationComposer,
    $BranchGroupsCreateCompanionBuilder,
    $BranchGroupsUpdateCompanionBuilder,
    (BranchGroup, $BranchGroupsReferences),
    BranchGroup,
    PrefetchHooks Function({bool branchesRefs})> {
  $BranchGroupsTableManager(_$AppDatabase db, BranchGroups table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $BranchGroupsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $BranchGroupsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $BranchGroupsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              BranchGroupsCompanion(
            id: id,
            nameAr: nameAr,
            nameEn: nameEn,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nameAr,
            required String nameEn,
            Value<bool> isActive = const Value.absent(),
          }) =>
              BranchGroupsCompanion.insert(
            id: id,
            nameAr: nameAr,
            nameEn: nameEn,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $BranchGroupsReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({branchesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (branchesRefs) db.branches],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (branchesRefs)
                    await $_getPrefetchedData<BranchGroup, BranchGroups,
                            Branche>(
                        currentTable: table,
                        referencedTable:
                            $BranchGroupsReferences._branchesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $BranchGroupsReferences(db, table, p0).branchesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.branchGroupId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $BranchGroupsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    BranchGroups,
    BranchGroup,
    $BranchGroupsFilterComposer,
    $BranchGroupsOrderingComposer,
    $BranchGroupsAnnotationComposer,
    $BranchGroupsCreateCompanionBuilder,
    $BranchGroupsUpdateCompanionBuilder,
    (BranchGroup, $BranchGroupsReferences),
    BranchGroup,
    PrefetchHooks Function({bool branchesRefs})>;
typedef $BranchesCreateCompanionBuilder = BranchesCompanion Function({
  Value<int> id,
  required String branchCode,
  required String nameAr,
  required String nameEn,
  required int companyId,
  Value<int?> branchGroupId,
  Value<String?> address,
  Value<String?> phone,
  Value<String?> defaultWarehouseId,
  Value<bool> branchStatus,
  Value<Uint8List?> logo,
  Value<String?> remarks,
});
typedef $BranchesUpdateCompanionBuilder = BranchesCompanion Function({
  Value<int> id,
  Value<String> branchCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<int> companyId,
  Value<int?> branchGroupId,
  Value<String?> address,
  Value<String?> phone,
  Value<String?> defaultWarehouseId,
  Value<bool> branchStatus,
  Value<Uint8List?> logo,
  Value<String?> remarks,
});

final class $BranchesReferences
    extends BaseReferences<_$AppDatabase, Branches, Branche> {
  $BranchesReferences(super.$_db, super.$_table, super.$_typedResult);

  static BranchGroups _branchGroupIdTable(_$AppDatabase db) =>
      db.branchGroups.createAlias(
          $_aliasNameGenerator(db.branches.branchGroupId, db.branchGroups.id));

  $BranchGroupsProcessedTableManager? get branchGroupId {
    final $_column = $_itemColumn<int>('branch_group_id');
    if ($_column == null) return null;
    final manager = $BranchGroupsTableManager($_db, $_db.branchGroups)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_branchGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<Users, List<User>> _usersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.users,
          aliasName: $_aliasNameGenerator(db.branches.id, db.users.branchId));

  $UsersProcessedTableManager get usersRefs {
    final manager = $UsersTableManager($_db, $_db.users)
        .filter((f) => f.branchId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $BranchesFilterComposer extends Composer<_$AppDatabase, Branches> {
  $BranchesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get branchCode => $composableBuilder(
      column: $table.branchCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get companyId => $composableBuilder(
      column: $table.companyId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get defaultWarehouseId => $composableBuilder(
      column: $table.defaultWarehouseId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get branchStatus => $composableBuilder(
      column: $table.branchStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get logo => $composableBuilder(
      column: $table.logo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnFilters(column));

  $BranchGroupsFilterComposer get branchGroupId {
    final $BranchGroupsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.branchGroupId,
        referencedTable: $db.branchGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $BranchGroupsFilterComposer(
              $db: $db,
              $table: $db.branchGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> usersRefs(
      Expression<bool> Function($UsersFilterComposer f) f) {
    final $UsersFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.branchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UsersFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $BranchesOrderingComposer extends Composer<_$AppDatabase, Branches> {
  $BranchesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get branchCode => $composableBuilder(
      column: $table.branchCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get companyId => $composableBuilder(
      column: $table.companyId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get defaultWarehouseId => $composableBuilder(
      column: $table.defaultWarehouseId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get branchStatus => $composableBuilder(
      column: $table.branchStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get logo => $composableBuilder(
      column: $table.logo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remarks => $composableBuilder(
      column: $table.remarks, builder: (column) => ColumnOrderings(column));

  $BranchGroupsOrderingComposer get branchGroupId {
    final $BranchGroupsOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.branchGroupId,
        referencedTable: $db.branchGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $BranchGroupsOrderingComposer(
              $db: $db,
              $table: $db.branchGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $BranchesAnnotationComposer extends Composer<_$AppDatabase, Branches> {
  $BranchesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get branchCode => $composableBuilder(
      column: $table.branchCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<int> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get defaultWarehouseId => $composableBuilder(
      column: $table.defaultWarehouseId, builder: (column) => column);

  GeneratedColumn<bool> get branchStatus => $composableBuilder(
      column: $table.branchStatus, builder: (column) => column);

  GeneratedColumn<Uint8List> get logo =>
      $composableBuilder(column: $table.logo, builder: (column) => column);

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  $BranchGroupsAnnotationComposer get branchGroupId {
    final $BranchGroupsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.branchGroupId,
        referencedTable: $db.branchGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $BranchGroupsAnnotationComposer(
              $db: $db,
              $table: $db.branchGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> usersRefs<T extends Object>(
      Expression<T> Function($UsersAnnotationComposer a) f) {
    final $UsersAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.branchId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UsersAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $BranchesTableManager extends RootTableManager<
    _$AppDatabase,
    Branches,
    Branche,
    $BranchesFilterComposer,
    $BranchesOrderingComposer,
    $BranchesAnnotationComposer,
    $BranchesCreateCompanionBuilder,
    $BranchesUpdateCompanionBuilder,
    (Branche, $BranchesReferences),
    Branche,
    PrefetchHooks Function({bool branchGroupId, bool usersRefs})> {
  $BranchesTableManager(_$AppDatabase db, Branches table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $BranchesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $BranchesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $BranchesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> branchCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<int> companyId = const Value.absent(),
            Value<int?> branchGroupId = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> defaultWarehouseId = const Value.absent(),
            Value<bool> branchStatus = const Value.absent(),
            Value<Uint8List?> logo = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
          }) =>
              BranchesCompanion(
            id: id,
            branchCode: branchCode,
            nameAr: nameAr,
            nameEn: nameEn,
            companyId: companyId,
            branchGroupId: branchGroupId,
            address: address,
            phone: phone,
            defaultWarehouseId: defaultWarehouseId,
            branchStatus: branchStatus,
            logo: logo,
            remarks: remarks,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String branchCode,
            required String nameAr,
            required String nameEn,
            required int companyId,
            Value<int?> branchGroupId = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> defaultWarehouseId = const Value.absent(),
            Value<bool> branchStatus = const Value.absent(),
            Value<Uint8List?> logo = const Value.absent(),
            Value<String?> remarks = const Value.absent(),
          }) =>
              BranchesCompanion.insert(
            id: id,
            branchCode: branchCode,
            nameAr: nameAr,
            nameEn: nameEn,
            companyId: companyId,
            branchGroupId: branchGroupId,
            address: address,
            phone: phone,
            defaultWarehouseId: defaultWarehouseId,
            branchStatus: branchStatus,
            logo: logo,
            remarks: remarks,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $BranchesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({branchGroupId = false, usersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (usersRefs) db.users],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (branchGroupId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.branchGroupId,
                    referencedTable:
                        $BranchesReferences._branchGroupIdTable(db),
                    referencedColumn:
                        $BranchesReferences._branchGroupIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usersRefs)
                    await $_getPrefetchedData<Branche, Branches, User>(
                        currentTable: table,
                        referencedTable:
                            $BranchesReferences._usersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $BranchesReferences(db, table, p0).usersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.branchId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $BranchesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Branches,
    Branche,
    $BranchesFilterComposer,
    $BranchesOrderingComposer,
    $BranchesAnnotationComposer,
    $BranchesCreateCompanionBuilder,
    $BranchesUpdateCompanionBuilder,
    (Branche, $BranchesReferences),
    Branche,
    PrefetchHooks Function({bool branchGroupId, bool usersRefs})>;
typedef $UsersCreateCompanionBuilder = UsersCompanion Function({
  Value<int> userId,
  required String username,
  required String password,
  required String fullNameAr,
  required String fullNameEn,
  Value<bool> isActive,
  Value<int?> branchId,
  Value<bool> isBiometricEnabled,
  Value<bool> isDeviceLinked,
});
typedef $UsersUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> userId,
  Value<String> username,
  Value<String> password,
  Value<String> fullNameAr,
  Value<String> fullNameEn,
  Value<bool> isActive,
  Value<int?> branchId,
  Value<bool> isBiometricEnabled,
  Value<bool> isDeviceLinked,
});

final class $UsersReferences
    extends BaseReferences<_$AppDatabase, Users, User> {
  $UsersReferences(super.$_db, super.$_table, super.$_typedResult);

  static Branches _branchIdTable(_$AppDatabase db) => db.branches
      .createAlias($_aliasNameGenerator(db.users.branchId, db.branches.id));

  $BranchesProcessedTableManager? get branchId {
    final $_column = $_itemColumn<int>('branch_id');
    if ($_column == null) return null;
    final manager = $BranchesTableManager($_db, $_db.branches)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_branchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<AuditLog, List<AuditLogData>> _auditLogRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.auditLog,
          aliasName: $_aliasNameGenerator(db.users.userId, db.auditLog.userId));

  $AuditLogProcessedTableManager get auditLogRefs {
    final manager = $AuditLogTableManager($_db, $_db.auditLog).filter(
        (f) => f.userId.userId.sqlEquals($_itemColumn<int>('user_id')!));

    final cache = $_typedResult.readTableOrNull(_auditLogRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<UserRoles, List<UserRole>> _userRolesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.userRoles,
          aliasName:
              $_aliasNameGenerator(db.users.userId, db.userRoles.userId));

  $UserRolesProcessedTableManager get userRolesRefs {
    final manager = $UserRolesTableManager($_db, $_db.userRoles).filter(
        (f) => f.userId.userId.sqlEquals($_itemColumn<int>('user_id')!));

    final cache = $_typedResult.readTableOrNull(_userRolesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $UsersFilterComposer extends Composer<_$AppDatabase, Users> {
  $UsersFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullNameAr => $composableBuilder(
      column: $table.fullNameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullNameEn => $composableBuilder(
      column: $table.fullNameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBiometricEnabled => $composableBuilder(
      column: $table.isBiometricEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeviceLinked => $composableBuilder(
      column: $table.isDeviceLinked,
      builder: (column) => ColumnFilters(column));

  $BranchesFilterComposer get branchId {
    final $BranchesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.branchId,
        referencedTable: $db.branches,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $BranchesFilterComposer(
              $db: $db,
              $table: $db.branches,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> auditLogRefs(
      Expression<bool> Function($AuditLogFilterComposer f) f) {
    final $AuditLogFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.auditLog,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $AuditLogFilterComposer(
              $db: $db,
              $table: $db.auditLog,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> userRolesRefs(
      Expression<bool> Function($UserRolesFilterComposer f) f) {
    final $UserRolesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.userRoles,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UserRolesFilterComposer(
              $db: $db,
              $table: $db.userRoles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullNameAr => $composableBuilder(
      column: $table.fullNameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullNameEn => $composableBuilder(
      column: $table.fullNameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBiometricEnabled => $composableBuilder(
      column: $table.isBiometricEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeviceLinked => $composableBuilder(
      column: $table.isDeviceLinked,
      builder: (column) => ColumnOrderings(column));

  $BranchesOrderingComposer get branchId {
    final $BranchesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.branchId,
        referencedTable: $db.branches,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $BranchesOrderingComposer(
              $db: $db,
              $table: $db.branches,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get fullNameAr => $composableBuilder(
      column: $table.fullNameAr, builder: (column) => column);

  GeneratedColumn<String> get fullNameEn => $composableBuilder(
      column: $table.fullNameEn, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isBiometricEnabled => $composableBuilder(
      column: $table.isBiometricEnabled, builder: (column) => column);

  GeneratedColumn<bool> get isDeviceLinked => $composableBuilder(
      column: $table.isDeviceLinked, builder: (column) => column);

  $BranchesAnnotationComposer get branchId {
    final $BranchesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.branchId,
        referencedTable: $db.branches,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $BranchesAnnotationComposer(
              $db: $db,
              $table: $db.branches,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> auditLogRefs<T extends Object>(
      Expression<T> Function($AuditLogAnnotationComposer a) f) {
    final $AuditLogAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.auditLog,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $AuditLogAnnotationComposer(
              $db: $db,
              $table: $db.auditLog,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> userRolesRefs<T extends Object>(
      Expression<T> Function($UserRolesAnnotationComposer a) f) {
    final $UserRolesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.userRoles,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UserRolesAnnotationComposer(
              $db: $db,
              $table: $db.userRoles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $UsersTableManager extends RootTableManager<
    _$AppDatabase,
    Users,
    User,
    $UsersFilterComposer,
    $UsersOrderingComposer,
    $UsersAnnotationComposer,
    $UsersCreateCompanionBuilder,
    $UsersUpdateCompanionBuilder,
    (User, $UsersReferences),
    User,
    PrefetchHooks Function(
        {bool branchId, bool auditLogRefs, bool userRolesRefs})> {
  $UsersTableManager(_$AppDatabase db, Users table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $UsersFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $UsersOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $UsersAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> fullNameAr = const Value.absent(),
            Value<String> fullNameEn = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int?> branchId = const Value.absent(),
            Value<bool> isBiometricEnabled = const Value.absent(),
            Value<bool> isDeviceLinked = const Value.absent(),
          }) =>
              UsersCompanion(
            userId: userId,
            username: username,
            password: password,
            fullNameAr: fullNameAr,
            fullNameEn: fullNameEn,
            isActive: isActive,
            branchId: branchId,
            isBiometricEnabled: isBiometricEnabled,
            isDeviceLinked: isDeviceLinked,
          ),
          createCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            required String username,
            required String password,
            required String fullNameAr,
            required String fullNameEn,
            Value<bool> isActive = const Value.absent(),
            Value<int?> branchId = const Value.absent(),
            Value<bool> isBiometricEnabled = const Value.absent(),
            Value<bool> isDeviceLinked = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            userId: userId,
            username: username,
            password: password,
            fullNameAr: fullNameAr,
            fullNameEn: fullNameEn,
            isActive: isActive,
            branchId: branchId,
            isBiometricEnabled: isBiometricEnabled,
            isDeviceLinked: isDeviceLinked,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $UsersReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {branchId = false, auditLogRefs = false, userRolesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (auditLogRefs) db.auditLog,
                if (userRolesRefs) db.userRoles
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (branchId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.branchId,
                    referencedTable: $UsersReferences._branchIdTable(db),
                    referencedColumn: $UsersReferences._branchIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (auditLogRefs)
                    await $_getPrefetchedData<User, Users, AuditLogData>(
                        currentTable: table,
                        referencedTable:
                            $UsersReferences._auditLogRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $UsersReferences(db, table, p0).auditLogRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userId == item.userId),
                        typedResults: items),
                  if (userRolesRefs)
                    await $_getPrefetchedData<User, Users, UserRole>(
                        currentTable: table,
                        referencedTable:
                            $UsersReferences._userRolesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $UsersReferences(db, table, p0).userRolesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userId == item.userId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $UsersProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Users,
    User,
    $UsersFilterComposer,
    $UsersOrderingComposer,
    $UsersAnnotationComposer,
    $UsersCreateCompanionBuilder,
    $UsersUpdateCompanionBuilder,
    (User, $UsersReferences),
    User,
    PrefetchHooks Function(
        {bool branchId, bool auditLogRefs, bool userRolesRefs})>;
typedef $AuditLogCreateCompanionBuilder = AuditLogCompanion Function({
  Value<int> id,
  required int userId,
  required double timestamp,
  required String eventAction,
  Value<String?> details,
});
typedef $AuditLogUpdateCompanionBuilder = AuditLogCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<double> timestamp,
  Value<String> eventAction,
  Value<String?> details,
});

final class $AuditLogReferences
    extends BaseReferences<_$AppDatabase, AuditLog, AuditLogData> {
  $AuditLogReferences(super.$_db, super.$_table, super.$_typedResult);

  static Users _userIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.auditLog.userId, db.users.userId));

  $UsersProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $UsersTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $AuditLogFilterComposer extends Composer<_$AppDatabase, AuditLog> {
  $AuditLogFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eventAction => $composableBuilder(
      column: $table.eventAction, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get details => $composableBuilder(
      column: $table.details, builder: (column) => ColumnFilters(column));

  $UsersFilterComposer get userId {
    final $UsersFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UsersFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $AuditLogOrderingComposer extends Composer<_$AppDatabase, AuditLog> {
  $AuditLogOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eventAction => $composableBuilder(
      column: $table.eventAction, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get details => $composableBuilder(
      column: $table.details, builder: (column) => ColumnOrderings(column));

  $UsersOrderingComposer get userId {
    final $UsersOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UsersOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $AuditLogAnnotationComposer extends Composer<_$AppDatabase, AuditLog> {
  $AuditLogAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get eventAction => $composableBuilder(
      column: $table.eventAction, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  $UsersAnnotationComposer get userId {
    final $UsersAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UsersAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $AuditLogTableManager extends RootTableManager<
    _$AppDatabase,
    AuditLog,
    AuditLogData,
    $AuditLogFilterComposer,
    $AuditLogOrderingComposer,
    $AuditLogAnnotationComposer,
    $AuditLogCreateCompanionBuilder,
    $AuditLogUpdateCompanionBuilder,
    (AuditLogData, $AuditLogReferences),
    AuditLogData,
    PrefetchHooks Function({bool userId})> {
  $AuditLogTableManager(_$AppDatabase db, AuditLog table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AuditLogFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AuditLogOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AuditLogAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<double> timestamp = const Value.absent(),
            Value<String> eventAction = const Value.absent(),
            Value<String?> details = const Value.absent(),
          }) =>
              AuditLogCompanion(
            id: id,
            userId: userId,
            timestamp: timestamp,
            eventAction: eventAction,
            details: details,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required double timestamp,
            required String eventAction,
            Value<String?> details = const Value.absent(),
          }) =>
              AuditLogCompanion.insert(
            id: id,
            userId: userId,
            timestamp: timestamp,
            eventAction: eventAction,
            details: details,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $AuditLogReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable: $AuditLogReferences._userIdTable(db),
                    referencedColumn:
                        $AuditLogReferences._userIdTable(db).userId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $AuditLogProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    AuditLog,
    AuditLogData,
    $AuditLogFilterComposer,
    $AuditLogOrderingComposer,
    $AuditLogAnnotationComposer,
    $AuditLogCreateCompanionBuilder,
    $AuditLogUpdateCompanionBuilder,
    (AuditLogData, $AuditLogReferences),
    AuditLogData,
    PrefetchHooks Function({bool userId})>;
typedef $ZonesCreateCompanionBuilder = ZonesCompanion Function({
  Value<int> id,
  required String zoneCode,
  required String nameAr,
  required String nameEn,
  Value<bool> isActive,
});
typedef $ZonesUpdateCompanionBuilder = ZonesCompanion Function({
  Value<int> id,
  Value<String> zoneCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<bool> isActive,
});

final class $ZonesReferences
    extends BaseReferences<_$AppDatabase, Zones, Zone> {
  $ZonesReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<Countries, List<Country>> _countriesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.countries,
          aliasName: $_aliasNameGenerator(db.zones.id, db.countries.zoneId));

  $CountriesProcessedTableManager get countriesRefs {
    final manager = $CountriesTableManager($_db, $_db.countries)
        .filter((f) => f.zoneId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_countriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $ZonesFilterComposer extends Composer<_$AppDatabase, Zones> {
  $ZonesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get zoneCode => $composableBuilder(
      column: $table.zoneCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  Expression<bool> countriesRefs(
      Expression<bool> Function($CountriesFilterComposer f) f) {
    final $CountriesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.countries,
        getReferencedColumn: (t) => t.zoneId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CountriesFilterComposer(
              $db: $db,
              $table: $db.countries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $ZonesOrderingComposer extends Composer<_$AppDatabase, Zones> {
  $ZonesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get zoneCode => $composableBuilder(
      column: $table.zoneCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $ZonesAnnotationComposer extends Composer<_$AppDatabase, Zones> {
  $ZonesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get zoneCode =>
      $composableBuilder(column: $table.zoneCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> countriesRefs<T extends Object>(
      Expression<T> Function($CountriesAnnotationComposer a) f) {
    final $CountriesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.countries,
        getReferencedColumn: (t) => t.zoneId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CountriesAnnotationComposer(
              $db: $db,
              $table: $db.countries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $ZonesTableManager extends RootTableManager<
    _$AppDatabase,
    Zones,
    Zone,
    $ZonesFilterComposer,
    $ZonesOrderingComposer,
    $ZonesAnnotationComposer,
    $ZonesCreateCompanionBuilder,
    $ZonesUpdateCompanionBuilder,
    (Zone, $ZonesReferences),
    Zone,
    PrefetchHooks Function({bool countriesRefs})> {
  $ZonesTableManager(_$AppDatabase db, Zones table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ZonesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ZonesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ZonesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> zoneCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              ZonesCompanion(
            id: id,
            zoneCode: zoneCode,
            nameAr: nameAr,
            nameEn: nameEn,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String zoneCode,
            required String nameAr,
            required String nameEn,
            Value<bool> isActive = const Value.absent(),
          }) =>
              ZonesCompanion.insert(
            id: id,
            zoneCode: zoneCode,
            nameAr: nameAr,
            nameEn: nameEn,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $ZonesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({countriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (countriesRefs) db.countries],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (countriesRefs)
                    await $_getPrefetchedData<Zone, Zones, Country>(
                        currentTable: table,
                        referencedTable:
                            $ZonesReferences._countriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $ZonesReferences(db, table, p0).countriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.zoneId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $ZonesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Zones,
    Zone,
    $ZonesFilterComposer,
    $ZonesOrderingComposer,
    $ZonesAnnotationComposer,
    $ZonesCreateCompanionBuilder,
    $ZonesUpdateCompanionBuilder,
    (Zone, $ZonesReferences),
    Zone,
    PrefetchHooks Function({bool countriesRefs})>;
typedef $CountriesCreateCompanionBuilder = CountriesCompanion Function({
  Value<int> id,
  required String countryCode,
  required String nameAr,
  required String nameEn,
  required String nationalityAr,
  required String nationalityEn,
  required int zoneId,
  Value<bool> isActive,
});
typedef $CountriesUpdateCompanionBuilder = CountriesCompanion Function({
  Value<int> id,
  Value<String> countryCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<String> nationalityAr,
  Value<String> nationalityEn,
  Value<int> zoneId,
  Value<bool> isActive,
});

final class $CountriesReferences
    extends BaseReferences<_$AppDatabase, Countries, Country> {
  $CountriesReferences(super.$_db, super.$_table, super.$_typedResult);

  static Zones _zoneIdTable(_$AppDatabase db) => db.zones
      .createAlias($_aliasNameGenerator(db.countries.zoneId, db.zones.id));

  $ZonesProcessedTableManager get zoneId {
    final $_column = $_itemColumn<int>('zone_id')!;

    final manager = $ZonesTableManager($_db, $_db.zones)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_zoneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<Governorates, List<Governorate>>
      _governoratesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.governorates,
          aliasName:
              $_aliasNameGenerator(db.countries.id, db.governorates.countryId));

  $GovernoratesProcessedTableManager get governoratesRefs {
    final manager = $GovernoratesTableManager($_db, $_db.governorates)
        .filter((f) => f.countryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_governoratesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $CountriesFilterComposer extends Composer<_$AppDatabase, Countries> {
  $CountriesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get countryCode => $composableBuilder(
      column: $table.countryCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nationalityAr => $composableBuilder(
      column: $table.nationalityAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nationalityEn => $composableBuilder(
      column: $table.nationalityEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  $ZonesFilterComposer get zoneId {
    final $ZonesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.zoneId,
        referencedTable: $db.zones,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ZonesFilterComposer(
              $db: $db,
              $table: $db.zones,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> governoratesRefs(
      Expression<bool> Function($GovernoratesFilterComposer f) f) {
    final $GovernoratesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.governorates,
        getReferencedColumn: (t) => t.countryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $GovernoratesFilterComposer(
              $db: $db,
              $table: $db.governorates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $CountriesOrderingComposer extends Composer<_$AppDatabase, Countries> {
  $CountriesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get countryCode => $composableBuilder(
      column: $table.countryCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nationalityAr => $composableBuilder(
      column: $table.nationalityAr,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nationalityEn => $composableBuilder(
      column: $table.nationalityEn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  $ZonesOrderingComposer get zoneId {
    final $ZonesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.zoneId,
        referencedTable: $db.zones,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ZonesOrderingComposer(
              $db: $db,
              $table: $db.zones,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $CountriesAnnotationComposer extends Composer<_$AppDatabase, Countries> {
  $CountriesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get countryCode => $composableBuilder(
      column: $table.countryCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get nationalityAr => $composableBuilder(
      column: $table.nationalityAr, builder: (column) => column);

  GeneratedColumn<String> get nationalityEn => $composableBuilder(
      column: $table.nationalityEn, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $ZonesAnnotationComposer get zoneId {
    final $ZonesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.zoneId,
        referencedTable: $db.zones,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ZonesAnnotationComposer(
              $db: $db,
              $table: $db.zones,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> governoratesRefs<T extends Object>(
      Expression<T> Function($GovernoratesAnnotationComposer a) f) {
    final $GovernoratesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.governorates,
        getReferencedColumn: (t) => t.countryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $GovernoratesAnnotationComposer(
              $db: $db,
              $table: $db.governorates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $CountriesTableManager extends RootTableManager<
    _$AppDatabase,
    Countries,
    Country,
    $CountriesFilterComposer,
    $CountriesOrderingComposer,
    $CountriesAnnotationComposer,
    $CountriesCreateCompanionBuilder,
    $CountriesUpdateCompanionBuilder,
    (Country, $CountriesReferences),
    Country,
    PrefetchHooks Function({bool zoneId, bool governoratesRefs})> {
  $CountriesTableManager(_$AppDatabase db, Countries table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CountriesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CountriesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CountriesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> countryCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<String> nationalityAr = const Value.absent(),
            Value<String> nationalityEn = const Value.absent(),
            Value<int> zoneId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              CountriesCompanion(
            id: id,
            countryCode: countryCode,
            nameAr: nameAr,
            nameEn: nameEn,
            nationalityAr: nationalityAr,
            nationalityEn: nationalityEn,
            zoneId: zoneId,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String countryCode,
            required String nameAr,
            required String nameEn,
            required String nationalityAr,
            required String nationalityEn,
            required int zoneId,
            Value<bool> isActive = const Value.absent(),
          }) =>
              CountriesCompanion.insert(
            id: id,
            countryCode: countryCode,
            nameAr: nameAr,
            nameEn: nameEn,
            nationalityAr: nationalityAr,
            nationalityEn: nationalityEn,
            zoneId: zoneId,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $CountriesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({zoneId = false, governoratesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (governoratesRefs) db.governorates],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (zoneId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.zoneId,
                    referencedTable: $CountriesReferences._zoneIdTable(db),
                    referencedColumn: $CountriesReferences._zoneIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (governoratesRefs)
                    await $_getPrefetchedData<Country, Countries, Governorate>(
                        currentTable: table,
                        referencedTable:
                            $CountriesReferences._governoratesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $CountriesReferences(db, table, p0)
                                .governoratesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.countryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $CountriesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Countries,
    Country,
    $CountriesFilterComposer,
    $CountriesOrderingComposer,
    $CountriesAnnotationComposer,
    $CountriesCreateCompanionBuilder,
    $CountriesUpdateCompanionBuilder,
    (Country, $CountriesReferences),
    Country,
    PrefetchHooks Function({bool zoneId, bool governoratesRefs})>;
typedef $GovernoratesCreateCompanionBuilder = GovernoratesCompanion Function({
  Value<int> id,
  required String govCode,
  required String nameAr,
  required String nameEn,
  required int countryId,
  Value<bool> isActive,
});
typedef $GovernoratesUpdateCompanionBuilder = GovernoratesCompanion Function({
  Value<int> id,
  Value<String> govCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<int> countryId,
  Value<bool> isActive,
});

final class $GovernoratesReferences
    extends BaseReferences<_$AppDatabase, Governorates, Governorate> {
  $GovernoratesReferences(super.$_db, super.$_table, super.$_typedResult);

  static Countries _countryIdTable(_$AppDatabase db) =>
      db.countries.createAlias(
          $_aliasNameGenerator(db.governorates.countryId, db.countries.id));

  $CountriesProcessedTableManager get countryId {
    final $_column = $_itemColumn<int>('country_id')!;

    final manager = $CountriesTableManager($_db, $_db.countries)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_countryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<Cities, List<City>> _citiesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.cities,
          aliasName: $_aliasNameGenerator(db.governorates.id, db.cities.govId));

  $CitiesProcessedTableManager get citiesRefs {
    final manager = $CitiesTableManager($_db, $_db.cities)
        .filter((f) => f.govId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_citiesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $GovernoratesFilterComposer
    extends Composer<_$AppDatabase, Governorates> {
  $GovernoratesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get govCode => $composableBuilder(
      column: $table.govCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  $CountriesFilterComposer get countryId {
    final $CountriesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.countryId,
        referencedTable: $db.countries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CountriesFilterComposer(
              $db: $db,
              $table: $db.countries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> citiesRefs(
      Expression<bool> Function($CitiesFilterComposer f) f) {
    final $CitiesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cities,
        getReferencedColumn: (t) => t.govId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CitiesFilterComposer(
              $db: $db,
              $table: $db.cities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $GovernoratesOrderingComposer
    extends Composer<_$AppDatabase, Governorates> {
  $GovernoratesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get govCode => $composableBuilder(
      column: $table.govCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  $CountriesOrderingComposer get countryId {
    final $CountriesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.countryId,
        referencedTable: $db.countries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CountriesOrderingComposer(
              $db: $db,
              $table: $db.countries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $GovernoratesAnnotationComposer
    extends Composer<_$AppDatabase, Governorates> {
  $GovernoratesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get govCode =>
      $composableBuilder(column: $table.govCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $CountriesAnnotationComposer get countryId {
    final $CountriesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.countryId,
        referencedTable: $db.countries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CountriesAnnotationComposer(
              $db: $db,
              $table: $db.countries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> citiesRefs<T extends Object>(
      Expression<T> Function($CitiesAnnotationComposer a) f) {
    final $CitiesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cities,
        getReferencedColumn: (t) => t.govId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CitiesAnnotationComposer(
              $db: $db,
              $table: $db.cities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $GovernoratesTableManager extends RootTableManager<
    _$AppDatabase,
    Governorates,
    Governorate,
    $GovernoratesFilterComposer,
    $GovernoratesOrderingComposer,
    $GovernoratesAnnotationComposer,
    $GovernoratesCreateCompanionBuilder,
    $GovernoratesUpdateCompanionBuilder,
    (Governorate, $GovernoratesReferences),
    Governorate,
    PrefetchHooks Function({bool countryId, bool citiesRefs})> {
  $GovernoratesTableManager(_$AppDatabase db, Governorates table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $GovernoratesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $GovernoratesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $GovernoratesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> govCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<int> countryId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              GovernoratesCompanion(
            id: id,
            govCode: govCode,
            nameAr: nameAr,
            nameEn: nameEn,
            countryId: countryId,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String govCode,
            required String nameAr,
            required String nameEn,
            required int countryId,
            Value<bool> isActive = const Value.absent(),
          }) =>
              GovernoratesCompanion.insert(
            id: id,
            govCode: govCode,
            nameAr: nameAr,
            nameEn: nameEn,
            countryId: countryId,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $GovernoratesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({countryId = false, citiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (citiesRefs) db.cities],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (countryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.countryId,
                    referencedTable:
                        $GovernoratesReferences._countryIdTable(db),
                    referencedColumn:
                        $GovernoratesReferences._countryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (citiesRefs)
                    await $_getPrefetchedData<Governorate, Governorates, City>(
                        currentTable: table,
                        referencedTable:
                            $GovernoratesReferences._citiesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $GovernoratesReferences(db, table, p0).citiesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.govId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $GovernoratesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Governorates,
    Governorate,
    $GovernoratesFilterComposer,
    $GovernoratesOrderingComposer,
    $GovernoratesAnnotationComposer,
    $GovernoratesCreateCompanionBuilder,
    $GovernoratesUpdateCompanionBuilder,
    (Governorate, $GovernoratesReferences),
    Governorate,
    PrefetchHooks Function({bool countryId, bool citiesRefs})>;
typedef $CitiesCreateCompanionBuilder = CitiesCompanion Function({
  Value<int> id,
  required String cityCode,
  required String nameAr,
  required String nameEn,
  required int govId,
  Value<bool> isActive,
});
typedef $CitiesUpdateCompanionBuilder = CitiesCompanion Function({
  Value<int> id,
  Value<String> cityCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<int> govId,
  Value<bool> isActive,
});

final class $CitiesReferences
    extends BaseReferences<_$AppDatabase, Cities, City> {
  $CitiesReferences(super.$_db, super.$_table, super.$_typedResult);

  static Governorates _govIdTable(_$AppDatabase db) => db.governorates
      .createAlias($_aliasNameGenerator(db.cities.govId, db.governorates.id));

  $GovernoratesProcessedTableManager get govId {
    final $_column = $_itemColumn<int>('gov_id')!;

    final manager = $GovernoratesTableManager($_db, $_db.governorates)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_govIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<Regions, List<Region>> _regionsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.regions,
          aliasName: $_aliasNameGenerator(db.cities.id, db.regions.cityId));

  $RegionsProcessedTableManager get regionsRefs {
    final manager = $RegionsTableManager($_db, $_db.regions)
        .filter((f) => f.cityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_regionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $CitiesFilterComposer extends Composer<_$AppDatabase, Cities> {
  $CitiesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cityCode => $composableBuilder(
      column: $table.cityCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  $GovernoratesFilterComposer get govId {
    final $GovernoratesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.govId,
        referencedTable: $db.governorates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $GovernoratesFilterComposer(
              $db: $db,
              $table: $db.governorates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> regionsRefs(
      Expression<bool> Function($RegionsFilterComposer f) f) {
    final $RegionsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.regions,
        getReferencedColumn: (t) => t.cityId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $RegionsFilterComposer(
              $db: $db,
              $table: $db.regions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $CitiesOrderingComposer extends Composer<_$AppDatabase, Cities> {
  $CitiesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cityCode => $composableBuilder(
      column: $table.cityCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  $GovernoratesOrderingComposer get govId {
    final $GovernoratesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.govId,
        referencedTable: $db.governorates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $GovernoratesOrderingComposer(
              $db: $db,
              $table: $db.governorates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $CitiesAnnotationComposer extends Composer<_$AppDatabase, Cities> {
  $CitiesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cityCode =>
      $composableBuilder(column: $table.cityCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $GovernoratesAnnotationComposer get govId {
    final $GovernoratesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.govId,
        referencedTable: $db.governorates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $GovernoratesAnnotationComposer(
              $db: $db,
              $table: $db.governorates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> regionsRefs<T extends Object>(
      Expression<T> Function($RegionsAnnotationComposer a) f) {
    final $RegionsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.regions,
        getReferencedColumn: (t) => t.cityId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $RegionsAnnotationComposer(
              $db: $db,
              $table: $db.regions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $CitiesTableManager extends RootTableManager<
    _$AppDatabase,
    Cities,
    City,
    $CitiesFilterComposer,
    $CitiesOrderingComposer,
    $CitiesAnnotationComposer,
    $CitiesCreateCompanionBuilder,
    $CitiesUpdateCompanionBuilder,
    (City, $CitiesReferences),
    City,
    PrefetchHooks Function({bool govId, bool regionsRefs})> {
  $CitiesTableManager(_$AppDatabase db, Cities table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CitiesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CitiesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CitiesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> cityCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<int> govId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              CitiesCompanion(
            id: id,
            cityCode: cityCode,
            nameAr: nameAr,
            nameEn: nameEn,
            govId: govId,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String cityCode,
            required String nameAr,
            required String nameEn,
            required int govId,
            Value<bool> isActive = const Value.absent(),
          }) =>
              CitiesCompanion.insert(
            id: id,
            cityCode: cityCode,
            nameAr: nameAr,
            nameEn: nameEn,
            govId: govId,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $CitiesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({govId = false, regionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (regionsRefs) db.regions],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (govId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.govId,
                    referencedTable: $CitiesReferences._govIdTable(db),
                    referencedColumn: $CitiesReferences._govIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (regionsRefs)
                    await $_getPrefetchedData<City, Cities, Region>(
                        currentTable: table,
                        referencedTable:
                            $CitiesReferences._regionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $CitiesReferences(db, table, p0).regionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cityId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $CitiesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Cities,
    City,
    $CitiesFilterComposer,
    $CitiesOrderingComposer,
    $CitiesAnnotationComposer,
    $CitiesCreateCompanionBuilder,
    $CitiesUpdateCompanionBuilder,
    (City, $CitiesReferences),
    City,
    PrefetchHooks Function({bool govId, bool regionsRefs})>;
typedef $RegionsCreateCompanionBuilder = RegionsCompanion Function({
  Value<int> id,
  required String regionCode,
  required String nameAr,
  required String nameEn,
  required int cityId,
  Value<bool> isActive,
});
typedef $RegionsUpdateCompanionBuilder = RegionsCompanion Function({
  Value<int> id,
  Value<String> regionCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<int> cityId,
  Value<bool> isActive,
});

final class $RegionsReferences
    extends BaseReferences<_$AppDatabase, Regions, Region> {
  $RegionsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Cities _cityIdTable(_$AppDatabase db) => db.cities
      .createAlias($_aliasNameGenerator(db.regions.cityId, db.cities.id));

  $CitiesProcessedTableManager get cityId {
    final $_column = $_itemColumn<int>('city_id')!;

    final manager = $CitiesTableManager($_db, $_db.cities)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $RegionsFilterComposer extends Composer<_$AppDatabase, Regions> {
  $RegionsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get regionCode => $composableBuilder(
      column: $table.regionCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  $CitiesFilterComposer get cityId {
    final $CitiesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cityId,
        referencedTable: $db.cities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CitiesFilterComposer(
              $db: $db,
              $table: $db.cities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $RegionsOrderingComposer extends Composer<_$AppDatabase, Regions> {
  $RegionsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get regionCode => $composableBuilder(
      column: $table.regionCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  $CitiesOrderingComposer get cityId {
    final $CitiesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cityId,
        referencedTable: $db.cities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CitiesOrderingComposer(
              $db: $db,
              $table: $db.cities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $RegionsAnnotationComposer extends Composer<_$AppDatabase, Regions> {
  $RegionsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get regionCode => $composableBuilder(
      column: $table.regionCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $CitiesAnnotationComposer get cityId {
    final $CitiesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cityId,
        referencedTable: $db.cities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CitiesAnnotationComposer(
              $db: $db,
              $table: $db.cities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $RegionsTableManager extends RootTableManager<
    _$AppDatabase,
    Regions,
    Region,
    $RegionsFilterComposer,
    $RegionsOrderingComposer,
    $RegionsAnnotationComposer,
    $RegionsCreateCompanionBuilder,
    $RegionsUpdateCompanionBuilder,
    (Region, $RegionsReferences),
    Region,
    PrefetchHooks Function({bool cityId})> {
  $RegionsTableManager(_$AppDatabase db, Regions table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $RegionsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $RegionsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $RegionsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> regionCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<int> cityId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              RegionsCompanion(
            id: id,
            regionCode: regionCode,
            nameAr: nameAr,
            nameEn: nameEn,
            cityId: cityId,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String regionCode,
            required String nameAr,
            required String nameEn,
            required int cityId,
            Value<bool> isActive = const Value.absent(),
          }) =>
              RegionsCompanion.insert(
            id: id,
            regionCode: regionCode,
            nameAr: nameAr,
            nameEn: nameEn,
            cityId: cityId,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map(
                  (e) => (e.readTable(table), $RegionsReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({cityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (cityId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cityId,
                    referencedTable: $RegionsReferences._cityIdTable(db),
                    referencedColumn: $RegionsReferences._cityIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $RegionsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Regions,
    Region,
    $RegionsFilterComposer,
    $RegionsOrderingComposer,
    $RegionsAnnotationComposer,
    $RegionsCreateCompanionBuilder,
    $RegionsUpdateCompanionBuilder,
    (Region, $RegionsReferences),
    Region,
    PrefetchHooks Function({bool cityId})>;
typedef $SystemConfigCreateCompanionBuilder = SystemConfigCompanion Function({
  Value<int> id,
  required String language,
  required String dateFormat,
  required String calendarType,
  required String accountNumberType,
  required int accountNumberLength,
  required String costCenterPolicy,
  required String projectPolicy,
  required int passwordMinLength,
  required int autoLockTimeout,
  required bool useVat,
  required bool useTds,
  required bool useEInvoice,
  required bool priceIncludesTax,
  required String backupFrequency,
  required bool cloudBackup,
  required String uiTheme,
  required String fontSize,
});
typedef $SystemConfigUpdateCompanionBuilder = SystemConfigCompanion Function({
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
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dateFormat => $composableBuilder(
      column: $table.dateFormat, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get calendarType => $composableBuilder(
      column: $table.calendarType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountNumberType => $composableBuilder(
      column: $table.accountNumberType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get accountNumberLength => $composableBuilder(
      column: $table.accountNumberLength,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get costCenterPolicy => $composableBuilder(
      column: $table.costCenterPolicy,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectPolicy => $composableBuilder(
      column: $table.projectPolicy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get passwordMinLength => $composableBuilder(
      column: $table.passwordMinLength,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get autoLockTimeout => $composableBuilder(
      column: $table.autoLockTimeout,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get useVat => $composableBuilder(
      column: $table.useVat, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get useTds => $composableBuilder(
      column: $table.useTds, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get useEInvoice => $composableBuilder(
      column: $table.useEInvoice, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get priceIncludesTax => $composableBuilder(
      column: $table.priceIncludesTax,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backupFrequency => $composableBuilder(
      column: $table.backupFrequency,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get cloudBackup => $composableBuilder(
      column: $table.cloudBackup, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uiTheme => $composableBuilder(
      column: $table.uiTheme, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fontSize => $composableBuilder(
      column: $table.fontSize, builder: (column) => ColumnFilters(column));
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
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dateFormat => $composableBuilder(
      column: $table.dateFormat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get calendarType => $composableBuilder(
      column: $table.calendarType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountNumberType => $composableBuilder(
      column: $table.accountNumberType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get accountNumberLength => $composableBuilder(
      column: $table.accountNumberLength,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get costCenterPolicy => $composableBuilder(
      column: $table.costCenterPolicy,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectPolicy => $composableBuilder(
      column: $table.projectPolicy,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get passwordMinLength => $composableBuilder(
      column: $table.passwordMinLength,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get autoLockTimeout => $composableBuilder(
      column: $table.autoLockTimeout,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get useVat => $composableBuilder(
      column: $table.useVat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get useTds => $composableBuilder(
      column: $table.useTds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get useEInvoice => $composableBuilder(
      column: $table.useEInvoice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get priceIncludesTax => $composableBuilder(
      column: $table.priceIncludesTax,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backupFrequency => $composableBuilder(
      column: $table.backupFrequency,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get cloudBackup => $composableBuilder(
      column: $table.cloudBackup, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uiTheme => $composableBuilder(
      column: $table.uiTheme, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fontSize => $composableBuilder(
      column: $table.fontSize, builder: (column) => ColumnOrderings(column));
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
      column: $table.dateFormat, builder: (column) => column);

  GeneratedColumn<String> get calendarType => $composableBuilder(
      column: $table.calendarType, builder: (column) => column);

  GeneratedColumn<String> get accountNumberType => $composableBuilder(
      column: $table.accountNumberType, builder: (column) => column);

  GeneratedColumn<int> get accountNumberLength => $composableBuilder(
      column: $table.accountNumberLength, builder: (column) => column);

  GeneratedColumn<String> get costCenterPolicy => $composableBuilder(
      column: $table.costCenterPolicy, builder: (column) => column);

  GeneratedColumn<String> get projectPolicy => $composableBuilder(
      column: $table.projectPolicy, builder: (column) => column);

  GeneratedColumn<int> get passwordMinLength => $composableBuilder(
      column: $table.passwordMinLength, builder: (column) => column);

  GeneratedColumn<int> get autoLockTimeout => $composableBuilder(
      column: $table.autoLockTimeout, builder: (column) => column);

  GeneratedColumn<bool> get useVat =>
      $composableBuilder(column: $table.useVat, builder: (column) => column);

  GeneratedColumn<bool> get useTds =>
      $composableBuilder(column: $table.useTds, builder: (column) => column);

  GeneratedColumn<bool> get useEInvoice => $composableBuilder(
      column: $table.useEInvoice, builder: (column) => column);

  GeneratedColumn<bool> get priceIncludesTax => $composableBuilder(
      column: $table.priceIncludesTax, builder: (column) => column);

  GeneratedColumn<String> get backupFrequency => $composableBuilder(
      column: $table.backupFrequency, builder: (column) => column);

  GeneratedColumn<bool> get cloudBackup => $composableBuilder(
      column: $table.cloudBackup, builder: (column) => column);

  GeneratedColumn<String> get uiTheme =>
      $composableBuilder(column: $table.uiTheme, builder: (column) => column);

  GeneratedColumn<String> get fontSize =>
      $composableBuilder(column: $table.fontSize, builder: (column) => column);
}

class $SystemConfigTableManager extends RootTableManager<
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
      BaseReferences<_$AppDatabase, SystemConfig, SystemConfigData>
    ),
    SystemConfigData,
    PrefetchHooks Function()> {
  $SystemConfigTableManager(_$AppDatabase db, SystemConfig table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $SystemConfigFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $SystemConfigOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $SystemConfigAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
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
          }) =>
              SystemConfigCompanion(
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
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String language,
            required String dateFormat,
            required String calendarType,
            required String accountNumberType,
            required int accountNumberLength,
            required String costCenterPolicy,
            required String projectPolicy,
            required int passwordMinLength,
            required int autoLockTimeout,
            required bool useVat,
            required bool useTds,
            required bool useEInvoice,
            required bool priceIncludesTax,
            required String backupFrequency,
            required bool cloudBackup,
            required String uiTheme,
            required String fontSize,
          }) =>
              SystemConfigCompanion.insert(
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
        ));
}

typedef $SystemConfigProcessedTableManager = ProcessedTableManager<
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
      BaseReferences<_$AppDatabase, SystemConfig, SystemConfigData>
    ),
    SystemConfigData,
    PrefetchHooks Function()>;
typedef $FinancialPeriodsCreateCompanionBuilder = FinancialPeriodsCompanion
    Function({
  Value<int> id,
  required String periodCode,
  required int fiscalYear,
  required String periodType,
  Value<int?> periodNumber,
  required int startDate,
  required int endDate,
  Value<bool> isLocked,
});
typedef $FinancialPeriodsUpdateCompanionBuilder = FinancialPeriodsCompanion
    Function({
  Value<int> id,
  Value<String> periodCode,
  Value<int> fiscalYear,
  Value<String> periodType,
  Value<int?> periodNumber,
  Value<int> startDate,
  Value<int> endDate,
  Value<bool> isLocked,
});

class $FinancialPeriodsFilterComposer
    extends Composer<_$AppDatabase, FinancialPeriods> {
  $FinancialPeriodsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get periodCode => $composableBuilder(
      column: $table.periodCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fiscalYear => $composableBuilder(
      column: $table.fiscalYear, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get periodType => $composableBuilder(
      column: $table.periodType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get periodNumber => $composableBuilder(
      column: $table.periodNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isLocked => $composableBuilder(
      column: $table.isLocked, builder: (column) => ColumnFilters(column));
}

class $FinancialPeriodsOrderingComposer
    extends Composer<_$AppDatabase, FinancialPeriods> {
  $FinancialPeriodsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get periodCode => $composableBuilder(
      column: $table.periodCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fiscalYear => $composableBuilder(
      column: $table.fiscalYear, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get periodType => $composableBuilder(
      column: $table.periodType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get periodNumber => $composableBuilder(
      column: $table.periodNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isLocked => $composableBuilder(
      column: $table.isLocked, builder: (column) => ColumnOrderings(column));
}

class $FinancialPeriodsAnnotationComposer
    extends Composer<_$AppDatabase, FinancialPeriods> {
  $FinancialPeriodsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get periodCode => $composableBuilder(
      column: $table.periodCode, builder: (column) => column);

  GeneratedColumn<int> get fiscalYear => $composableBuilder(
      column: $table.fiscalYear, builder: (column) => column);

  GeneratedColumn<String> get periodType => $composableBuilder(
      column: $table.periodType, builder: (column) => column);

  GeneratedColumn<int> get periodNumber => $composableBuilder(
      column: $table.periodNumber, builder: (column) => column);

  GeneratedColumn<int> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<int> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isLocked =>
      $composableBuilder(column: $table.isLocked, builder: (column) => column);
}

class $FinancialPeriodsTableManager extends RootTableManager<
    _$AppDatabase,
    FinancialPeriods,
    FinancialPeriod,
    $FinancialPeriodsFilterComposer,
    $FinancialPeriodsOrderingComposer,
    $FinancialPeriodsAnnotationComposer,
    $FinancialPeriodsCreateCompanionBuilder,
    $FinancialPeriodsUpdateCompanionBuilder,
    (
      FinancialPeriod,
      BaseReferences<_$AppDatabase, FinancialPeriods, FinancialPeriod>
    ),
    FinancialPeriod,
    PrefetchHooks Function()> {
  $FinancialPeriodsTableManager(_$AppDatabase db, FinancialPeriods table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $FinancialPeriodsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $FinancialPeriodsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $FinancialPeriodsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> periodCode = const Value.absent(),
            Value<int> fiscalYear = const Value.absent(),
            Value<String> periodType = const Value.absent(),
            Value<int?> periodNumber = const Value.absent(),
            Value<int> startDate = const Value.absent(),
            Value<int> endDate = const Value.absent(),
            Value<bool> isLocked = const Value.absent(),
          }) =>
              FinancialPeriodsCompanion(
            id: id,
            periodCode: periodCode,
            fiscalYear: fiscalYear,
            periodType: periodType,
            periodNumber: periodNumber,
            startDate: startDate,
            endDate: endDate,
            isLocked: isLocked,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String periodCode,
            required int fiscalYear,
            required String periodType,
            Value<int?> periodNumber = const Value.absent(),
            required int startDate,
            required int endDate,
            Value<bool> isLocked = const Value.absent(),
          }) =>
              FinancialPeriodsCompanion.insert(
            id: id,
            periodCode: periodCode,
            fiscalYear: fiscalYear,
            periodType: periodType,
            periodNumber: periodNumber,
            startDate: startDate,
            endDate: endDate,
            isLocked: isLocked,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $FinancialPeriodsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    FinancialPeriods,
    FinancialPeriod,
    $FinancialPeriodsFilterComposer,
    $FinancialPeriodsOrderingComposer,
    $FinancialPeriodsAnnotationComposer,
    $FinancialPeriodsCreateCompanionBuilder,
    $FinancialPeriodsUpdateCompanionBuilder,
    (
      FinancialPeriod,
      BaseReferences<_$AppDatabase, FinancialPeriods, FinancialPeriod>
    ),
    FinancialPeriod,
    PrefetchHooks Function()>;
typedef $CurrenciesCreateCompanionBuilder = CurrenciesCompanion Function({
  required String currencyCode,
  required String nameAr,
  required String nameEn,
  required String fractionNameAr,
  required String fractionNameEn,
  required double exchangeRate,
  Value<bool> isBaseCurrency,
  required int decimalPlaces,
  Value<double?> minRateLimit,
  Value<double?> maxRateLimit,
  required bool isActive,
  Value<int> rowid,
});
typedef $CurrenciesUpdateCompanionBuilder = CurrenciesCompanion Function({
  Value<String> currencyCode,
  Value<String> nameAr,
  Value<String> nameEn,
  Value<String> fractionNameAr,
  Value<String> fractionNameEn,
  Value<double> exchangeRate,
  Value<bool> isBaseCurrency,
  Value<int> decimalPlaces,
  Value<double?> minRateLimit,
  Value<double?> maxRateLimit,
  Value<bool> isActive,
  Value<int> rowid,
});

final class $CurrenciesReferences
    extends BaseReferences<_$AppDatabase, Currencies, Currency> {
  $CurrenciesReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<CurrencyDenominations, List<CurrencyDenomination>>
      _currencyDenominationsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.currencyDenominations,
              aliasName: $_aliasNameGenerator(db.currencies.currencyCode,
                  db.currencyDenominations.currencyCode));

  $CurrencyDenominationsProcessedTableManager get currencyDenominationsRefs {
    final manager =
        $CurrencyDenominationsTableManager($_db, $_db.currencyDenominations)
            .filter((f) => f.currencyCode.currencyCode
                .sqlEquals($_itemColumn<String>('currency_code')!));

    final cache =
        $_typedResult.readTableOrNull(_currencyDenominationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $CurrenciesFilterComposer extends Composer<_$AppDatabase, Currencies> {
  $CurrenciesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fractionNameAr => $composableBuilder(
      column: $table.fractionNameAr,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fractionNameEn => $composableBuilder(
      column: $table.fractionNameEn,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get exchangeRate => $composableBuilder(
      column: $table.exchangeRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBaseCurrency => $composableBuilder(
      column: $table.isBaseCurrency,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get decimalPlaces => $composableBuilder(
      column: $table.decimalPlaces, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minRateLimit => $composableBuilder(
      column: $table.minRateLimit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxRateLimit => $composableBuilder(
      column: $table.maxRateLimit, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  Expression<bool> currencyDenominationsRefs(
      Expression<bool> Function($CurrencyDenominationsFilterComposer f) f) {
    final $CurrencyDenominationsFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyCode,
        referencedTable: $db.currencyDenominations,
        getReferencedColumn: (t) => t.currencyCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CurrencyDenominationsFilterComposer(
              $db: $db,
              $table: $db.currencyDenominations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $CurrenciesOrderingComposer extends Composer<_$AppDatabase, Currencies> {
  $CurrenciesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fractionNameAr => $composableBuilder(
      column: $table.fractionNameAr,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fractionNameEn => $composableBuilder(
      column: $table.fractionNameEn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get exchangeRate => $composableBuilder(
      column: $table.exchangeRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBaseCurrency => $composableBuilder(
      column: $table.isBaseCurrency,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get decimalPlaces => $composableBuilder(
      column: $table.decimalPlaces,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minRateLimit => $composableBuilder(
      column: $table.minRateLimit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxRateLimit => $composableBuilder(
      column: $table.maxRateLimit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $CurrenciesAnnotationComposer
    extends Composer<_$AppDatabase, Currencies> {
  $CurrenciesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get fractionNameAr => $composableBuilder(
      column: $table.fractionNameAr, builder: (column) => column);

  GeneratedColumn<String> get fractionNameEn => $composableBuilder(
      column: $table.fractionNameEn, builder: (column) => column);

  GeneratedColumn<double> get exchangeRate => $composableBuilder(
      column: $table.exchangeRate, builder: (column) => column);

  GeneratedColumn<bool> get isBaseCurrency => $composableBuilder(
      column: $table.isBaseCurrency, builder: (column) => column);

  GeneratedColumn<int> get decimalPlaces => $composableBuilder(
      column: $table.decimalPlaces, builder: (column) => column);

  GeneratedColumn<double> get minRateLimit => $composableBuilder(
      column: $table.minRateLimit, builder: (column) => column);

  GeneratedColumn<double> get maxRateLimit => $composableBuilder(
      column: $table.maxRateLimit, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> currencyDenominationsRefs<T extends Object>(
      Expression<T> Function($CurrencyDenominationsAnnotationComposer a) f) {
    final $CurrencyDenominationsAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyCode,
        referencedTable: $db.currencyDenominations,
        getReferencedColumn: (t) => t.currencyCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CurrencyDenominationsAnnotationComposer(
              $db: $db,
              $table: $db.currencyDenominations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $CurrenciesTableManager extends RootTableManager<
    _$AppDatabase,
    Currencies,
    Currency,
    $CurrenciesFilterComposer,
    $CurrenciesOrderingComposer,
    $CurrenciesAnnotationComposer,
    $CurrenciesCreateCompanionBuilder,
    $CurrenciesUpdateCompanionBuilder,
    (Currency, $CurrenciesReferences),
    Currency,
    PrefetchHooks Function({bool currencyDenominationsRefs})> {
  $CurrenciesTableManager(_$AppDatabase db, Currencies table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CurrenciesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CurrenciesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CurrenciesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> currencyCode = const Value.absent(),
            Value<String> nameAr = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<String> fractionNameAr = const Value.absent(),
            Value<String> fractionNameEn = const Value.absent(),
            Value<double> exchangeRate = const Value.absent(),
            Value<bool> isBaseCurrency = const Value.absent(),
            Value<int> decimalPlaces = const Value.absent(),
            Value<double?> minRateLimit = const Value.absent(),
            Value<double?> maxRateLimit = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CurrenciesCompanion(
            currencyCode: currencyCode,
            nameAr: nameAr,
            nameEn: nameEn,
            fractionNameAr: fractionNameAr,
            fractionNameEn: fractionNameEn,
            exchangeRate: exchangeRate,
            isBaseCurrency: isBaseCurrency,
            decimalPlaces: decimalPlaces,
            minRateLimit: minRateLimit,
            maxRateLimit: maxRateLimit,
            isActive: isActive,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String currencyCode,
            required String nameAr,
            required String nameEn,
            required String fractionNameAr,
            required String fractionNameEn,
            required double exchangeRate,
            Value<bool> isBaseCurrency = const Value.absent(),
            required int decimalPlaces,
            Value<double?> minRateLimit = const Value.absent(),
            Value<double?> maxRateLimit = const Value.absent(),
            required bool isActive,
            Value<int> rowid = const Value.absent(),
          }) =>
              CurrenciesCompanion.insert(
            currencyCode: currencyCode,
            nameAr: nameAr,
            nameEn: nameEn,
            fractionNameAr: fractionNameAr,
            fractionNameEn: fractionNameEn,
            exchangeRate: exchangeRate,
            isBaseCurrency: isBaseCurrency,
            decimalPlaces: decimalPlaces,
            minRateLimit: minRateLimit,
            maxRateLimit: maxRateLimit,
            isActive: isActive,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $CurrenciesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({currencyDenominationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (currencyDenominationsRefs) db.currencyDenominations
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (currencyDenominationsRefs)
                    await $_getPrefetchedData<Currency, Currencies,
                            CurrencyDenomination>(
                        currentTable: table,
                        referencedTable: $CurrenciesReferences
                            ._currencyDenominationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $CurrenciesReferences(db, table, p0)
                                .currencyDenominationsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyCode == item.currencyCode),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $CurrenciesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Currencies,
    Currency,
    $CurrenciesFilterComposer,
    $CurrenciesOrderingComposer,
    $CurrenciesAnnotationComposer,
    $CurrenciesCreateCompanionBuilder,
    $CurrenciesUpdateCompanionBuilder,
    (Currency, $CurrenciesReferences),
    Currency,
    PrefetchHooks Function({bool currencyDenominationsRefs})>;
typedef $CurrencyDenominationsCreateCompanionBuilder
    = CurrencyDenominationsCompanion Function({
  Value<int> id,
  required String currencyCode,
  required double denominationValue,
  required String denominationNameAr,
  required String denominationNameEn,
  required String denominationType,
});
typedef $CurrencyDenominationsUpdateCompanionBuilder
    = CurrencyDenominationsCompanion Function({
  Value<int> id,
  Value<String> currencyCode,
  Value<double> denominationValue,
  Value<String> denominationNameAr,
  Value<String> denominationNameEn,
  Value<String> denominationType,
});

final class $CurrencyDenominationsReferences extends BaseReferences<
    _$AppDatabase, CurrencyDenominations, CurrencyDenomination> {
  $CurrencyDenominationsReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static Currencies _currencyCodeTable(_$AppDatabase db) =>
      db.currencies.createAlias($_aliasNameGenerator(
          db.currencyDenominations.currencyCode, db.currencies.currencyCode));

  $CurrenciesProcessedTableManager get currencyCode {
    final $_column = $_itemColumn<String>('currency_code')!;

    final manager = $CurrenciesTableManager($_db, $_db.currencies)
        .filter((f) => f.currencyCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $CurrencyDenominationsFilterComposer
    extends Composer<_$AppDatabase, CurrencyDenominations> {
  $CurrencyDenominationsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get denominationValue => $composableBuilder(
      column: $table.denominationValue,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get denominationNameAr => $composableBuilder(
      column: $table.denominationNameAr,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get denominationNameEn => $composableBuilder(
      column: $table.denominationNameEn,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get denominationType => $composableBuilder(
      column: $table.denominationType,
      builder: (column) => ColumnFilters(column));

  $CurrenciesFilterComposer get currencyCode {
    final $CurrenciesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyCode,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.currencyCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CurrenciesFilterComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $CurrencyDenominationsOrderingComposer
    extends Composer<_$AppDatabase, CurrencyDenominations> {
  $CurrencyDenominationsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get denominationValue => $composableBuilder(
      column: $table.denominationValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get denominationNameAr => $composableBuilder(
      column: $table.denominationNameAr,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get denominationNameEn => $composableBuilder(
      column: $table.denominationNameEn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get denominationType => $composableBuilder(
      column: $table.denominationType,
      builder: (column) => ColumnOrderings(column));

  $CurrenciesOrderingComposer get currencyCode {
    final $CurrenciesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyCode,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.currencyCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CurrenciesOrderingComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $CurrencyDenominationsAnnotationComposer
    extends Composer<_$AppDatabase, CurrencyDenominations> {
  $CurrencyDenominationsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get denominationValue => $composableBuilder(
      column: $table.denominationValue, builder: (column) => column);

  GeneratedColumn<String> get denominationNameAr => $composableBuilder(
      column: $table.denominationNameAr, builder: (column) => column);

  GeneratedColumn<String> get denominationNameEn => $composableBuilder(
      column: $table.denominationNameEn, builder: (column) => column);

  GeneratedColumn<String> get denominationType => $composableBuilder(
      column: $table.denominationType, builder: (column) => column);

  $CurrenciesAnnotationComposer get currencyCode {
    final $CurrenciesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyCode,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.currencyCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $CurrenciesAnnotationComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $CurrencyDenominationsTableManager extends RootTableManager<
    _$AppDatabase,
    CurrencyDenominations,
    CurrencyDenomination,
    $CurrencyDenominationsFilterComposer,
    $CurrencyDenominationsOrderingComposer,
    $CurrencyDenominationsAnnotationComposer,
    $CurrencyDenominationsCreateCompanionBuilder,
    $CurrencyDenominationsUpdateCompanionBuilder,
    (CurrencyDenomination, $CurrencyDenominationsReferences),
    CurrencyDenomination,
    PrefetchHooks Function({bool currencyCode})> {
  $CurrencyDenominationsTableManager(
      _$AppDatabase db, CurrencyDenominations table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CurrencyDenominationsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CurrencyDenominationsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CurrencyDenominationsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> currencyCode = const Value.absent(),
            Value<double> denominationValue = const Value.absent(),
            Value<String> denominationNameAr = const Value.absent(),
            Value<String> denominationNameEn = const Value.absent(),
            Value<String> denominationType = const Value.absent(),
          }) =>
              CurrencyDenominationsCompanion(
            id: id,
            currencyCode: currencyCode,
            denominationValue: denominationValue,
            denominationNameAr: denominationNameAr,
            denominationNameEn: denominationNameEn,
            denominationType: denominationType,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String currencyCode,
            required double denominationValue,
            required String denominationNameAr,
            required String denominationNameEn,
            required String denominationType,
          }) =>
              CurrencyDenominationsCompanion.insert(
            id: id,
            currencyCode: currencyCode,
            denominationValue: denominationValue,
            denominationNameAr: denominationNameAr,
            denominationNameEn: denominationNameEn,
            denominationType: denominationType,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $CurrencyDenominationsReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({currencyCode = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (currencyCode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.currencyCode,
                    referencedTable:
                        $CurrencyDenominationsReferences._currencyCodeTable(db),
                    referencedColumn: $CurrencyDenominationsReferences
                        ._currencyCodeTable(db)
                        .currencyCode,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $CurrencyDenominationsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    CurrencyDenominations,
    CurrencyDenomination,
    $CurrencyDenominationsFilterComposer,
    $CurrencyDenominationsOrderingComposer,
    $CurrencyDenominationsAnnotationComposer,
    $CurrencyDenominationsCreateCompanionBuilder,
    $CurrencyDenominationsUpdateCompanionBuilder,
    (CurrencyDenomination, $CurrencyDenominationsReferences),
    CurrencyDenomination,
    PrefetchHooks Function({bool currencyCode})>;
typedef $UserRolesCreateCompanionBuilder = UserRolesCompanion Function({
  required int userId,
  required int roleId,
  Value<int> rowid,
});
typedef $UserRolesUpdateCompanionBuilder = UserRolesCompanion Function({
  Value<int> userId,
  Value<int> roleId,
  Value<int> rowid,
});

final class $UserRolesReferences
    extends BaseReferences<_$AppDatabase, UserRoles, UserRole> {
  $UserRolesReferences(super.$_db, super.$_table, super.$_typedResult);

  static Users _userIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.userRoles.userId, db.users.userId));

  $UsersProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $UsersTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static Roles _roleIdTable(_$AppDatabase db) => db.roles
      .createAlias($_aliasNameGenerator(db.userRoles.roleId, db.roles.id));

  $RolesProcessedTableManager get roleId {
    final $_column = $_itemColumn<int>('role_id')!;

    final manager = $RolesTableManager($_db, $_db.roles)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $UserRolesFilterComposer extends Composer<_$AppDatabase, UserRoles> {
  $UserRolesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $UsersFilterComposer get userId {
    final $UsersFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UsersFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $RolesFilterComposer get roleId {
    final $RolesFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roleId,
        referencedTable: $db.roles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $RolesFilterComposer(
              $db: $db,
              $table: $db.roles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $UserRolesOrderingComposer extends Composer<_$AppDatabase, UserRoles> {
  $UserRolesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $UsersOrderingComposer get userId {
    final $UsersOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UsersOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $RolesOrderingComposer get roleId {
    final $RolesOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roleId,
        referencedTable: $db.roles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $RolesOrderingComposer(
              $db: $db,
              $table: $db.roles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $UserRolesAnnotationComposer extends Composer<_$AppDatabase, UserRoles> {
  $UserRolesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $UsersAnnotationComposer get userId {
    final $UsersAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $UsersAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $RolesAnnotationComposer get roleId {
    final $RolesAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roleId,
        referencedTable: $db.roles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $RolesAnnotationComposer(
              $db: $db,
              $table: $db.roles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $UserRolesTableManager extends RootTableManager<
    _$AppDatabase,
    UserRoles,
    UserRole,
    $UserRolesFilterComposer,
    $UserRolesOrderingComposer,
    $UserRolesAnnotationComposer,
    $UserRolesCreateCompanionBuilder,
    $UserRolesUpdateCompanionBuilder,
    (UserRole, $UserRolesReferences),
    UserRole,
    PrefetchHooks Function({bool userId, bool roleId})> {
  $UserRolesTableManager(_$AppDatabase db, UserRoles table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $UserRolesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $UserRolesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $UserRolesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            Value<int> roleId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserRolesCompanion(
            userId: userId,
            roleId: roleId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int userId,
            required int roleId,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserRolesCompanion.insert(
            userId: userId,
            roleId: roleId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $UserRolesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({userId = false, roleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable: $UserRolesReferences._userIdTable(db),
                    referencedColumn:
                        $UserRolesReferences._userIdTable(db).userId,
                  ) as T;
                }
                if (roleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roleId,
                    referencedTable: $UserRolesReferences._roleIdTable(db),
                    referencedColumn: $UserRolesReferences._roleIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $UserRolesProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    UserRoles,
    UserRole,
    $UserRolesFilterComposer,
    $UserRolesOrderingComposer,
    $UserRolesAnnotationComposer,
    $UserRolesCreateCompanionBuilder,
    $UserRolesUpdateCompanionBuilder,
    (UserRole, $UserRolesReferences),
    UserRole,
    PrefetchHooks Function({bool userId, bool roleId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $AccountTypesTableManager get accountTypes =>
      $AccountTypesTableManager(_db, _db.accountTypes);
  $AccountGroupsTableManager get accountGroups =>
      $AccountGroupsTableManager(_db, _db.accountGroups);
  $ClassificationsTableManager get classifications =>
      $ClassificationsTableManager(_db, _db.classifications);
  $ReportTypesTableManager get reportTypes =>
      $ReportTypesTableManager(_db, _db.reportTypes);
  $ChartOfAccountsTableManager get chartOfAccounts =>
      $ChartOfAccountsTableManager(_db, _db.chartOfAccounts);
  $TaxBracketTableManager get taxBracket =>
      $TaxBracketTableManager(_db, _db.taxBracket);
  $TaxCalcMethodsTableManager get taxCalcMethods =>
      $TaxCalcMethodsTableManager(_db, _db.taxCalcMethods);
  $TaxTypesTableManager get taxTypes =>
      $TaxTypesTableManager(_db, _db.taxTypes);
  $RolesTableManager get roles => $RolesTableManager(_db, _db.roles);
  $CompanyInfoTableManager get companyInfo =>
      $CompanyInfoTableManager(_db, _db.companyInfo);
  $FinancialPeriodsTableManager get financialPeriods =>
      $FinancialPeriodsTableManager(_db, _db.financialPeriods);
  $AccountsTableManager get accounts =>
      $AccountsTableManager(_db, _db.accounts);
  $RolePermissionsTableManager get rolePermissions =>
      $RolePermissionsTableManager(_db, _db.rolePermissions);
  $BranchGroupsTableManager get branchGroups =>
      $BranchGroupsTableManager(_db, _db.branchGroups);
  $BranchesTableManager get branches =>
      $BranchesTableManager(_db, _db.branches);
  $UsersTableManager get users => $UsersTableManager(_db, _db.users);
  $AuditLogTableManager get auditLog =>
      $AuditLogTableManager(_db, _db.auditLog);
  $ZonesTableManager get zones => $ZonesTableManager(_db, _db.zones);
  $CountriesTableManager get countries =>
      $CountriesTableManager(_db, _db.countries);
  $GovernoratesTableManager get governorates =>
      $GovernoratesTableManager(_db, _db.governorates);
  $CitiesTableManager get cities => $CitiesTableManager(_db, _db.cities);
  $RegionsTableManager get regions => $RegionsTableManager(_db, _db.regions);
  $SystemConfigTableManager get systemConfig =>
      $SystemConfigTableManager(_db, _db.systemConfig);
  $FinancialPeriodsTableManager get financialPeriods =>
      $FinancialPeriodsTableManager(_db, _db.financialPeriods);
  $CurrenciesTableManager get currencies =>
      $CurrenciesTableManager(_db, _db.currencies);
  $CurrencyDenominationsTableManager get currencyDenominations =>
      $CurrencyDenominationsTableManager(_db, _db.currencyDenominations);
  $UserRolesTableManager get userRoles =>
      $UserRolesTableManager(_db, _db.userRoles);
}
