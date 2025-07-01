// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
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

  /// e.g., 'Header', 'Transactional'
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final CompanyInfo companyInfo = CompanyInfo(this);
  late final Accounts accounts = Accounts(this);
  late final Users users = Users(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    companyInfo,
    accounts,
    users,
  ];
}

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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $CompanyInfoTableManager get companyInfo =>
      $CompanyInfoTableManager(_db, _db.companyInfo);
  $AccountsTableManager get accounts =>
      $AccountsTableManager(_db, _db.accounts);
  $UsersTableManager get users => $UsersTableManager(_db, _db.users);
}
