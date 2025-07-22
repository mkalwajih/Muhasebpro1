
import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/authentication/data/datasources/local/auth_local_datasource.dart';


abstract class UserManagementLocalDataSource {
  Future<void> addUser(UsersCompanion user);
  Future<void> updateUser(UsersCompanion user);
  Future<void> deleteUser(int id);
  Future<List<User>> getUsers();
  Future<User?> getUser(int id);
}

class UserManagementLocalDataSourceImpl implements UserManagementLocalDataSource {
  final AppDatabase database;
  final AuthLocalDataSource authLocalDataSource;

  UserManagementLocalDataSourceImpl({required this.database, required this.authLocalDataSource});

  @override
  Future<void> addUser(UsersCompanion user) async {
    await database.into(database.users).insert(user);
  }

  @override
  Future<void> updateUser(UsersCompanion user) async {
    await (database.update(database.users)
          ..where((tbl) => tbl.id.equals(user.id.value)))
        .write(user);
  }

  @override
  Future<void> deleteUser(int id) async {
    await (database.delete(database.users)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  @override
  Future<List<User>> getUsers() async {
    return await database.select(database.users).get();
  }

  @override
  Future<User?> getUser(int id) async {
    return await (database.select(database.users)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }
}
