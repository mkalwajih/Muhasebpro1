// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
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
  late final Users users = Users(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}

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
  $UsersTableManager get users => $UsersTableManager(_db, _db.users);
}
