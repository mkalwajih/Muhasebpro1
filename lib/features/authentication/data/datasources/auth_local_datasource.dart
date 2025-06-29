import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';

abstract class AuthLocalDataSource {
  Future<User?> getUserByUsername(String username);
  Future<int> insertUser(UsersCompanion user);
  Future<int> countUsers();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final AppDatabase _database;

  AuthLocalDataSourceImpl(this._database);

  // A simple SHA256 hash. In a real-world app, use a stronger, salted hash like bcrypt.
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<User?> getUserByUsername(String username) async {
    return (_database.select(_database.users)
          ..where((u) => u.username.equals(username)))
        .getSingleOrNull();
  }

  @override
  Future<int> insertUser(UsersCompanion user) {
     final hashedPassword = _hashPassword(user.passwordHash.value);
     final userWithHashedPassword = user.copyWith(passwordHash: Value(hashedPassword));
     return _database.into(_database.users).insert(userWithHashedPassword);
  }

  @override
  Future<int> countUsers() async {
    final countExp = _database.users.userId.count();
    final query = _database.selectOnly(_database.users)..addColumns([countExp]);
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }
}