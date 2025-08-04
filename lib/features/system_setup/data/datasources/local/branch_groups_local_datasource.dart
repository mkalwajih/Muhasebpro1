import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_group_entity.dart';
import 'package:muhaseb_pro/shared/data/models/branch_group_model.dart';
import 'package:muhaseb_pro/shared/utils/exceptions/exceptions.dart';

abstract class IBranchGroupsLocalDataSource {
  Future<List<BranchGroupEntity>> getAllBranchGroups();
  Future<void> addBranchGroup(BranchGroupEntity branchGroup);
  Future<void> updateBranchGroup(BranchGroupEntity branchGroup);
  Future<void> deleteBranchGroup(int id);
}

class BranchGroupsLocalDataSource implements IBranchGroupsLocalDataSource {
  final AppDatabase _appDatabase;

  BranchGroupsLocalDataSource(this._appDatabase);

  @override
  Future<List<BranchGroupEntity>> getAllBranchGroups() async {
    final branchGroups = await _appDatabase.select(_appDatabase.branchGroups).get();
    return branchGroups.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> addBranchGroup(BranchGroupEntity branchGroup) async {
    try {
      final companion = BranchGroupCompanionMapper.fromEntity(branchGroup);
      await _appDatabase.into(_appDatabase.branchGroups).insert(companion);
    } on SqliteException catch (e) {
      if (e.extendedResultCode == 2067) { // SQLITE_CONSTRAINT_UNIQUE
        throw DataIntegrityException('A group with this name already exists.');
      }
      rethrow;
    }
  }

  @override
  Future<void> updateBranchGroup(BranchGroupEntity branchGroup) async {
    final companion = BranchGroupCompanionMapper.fromEntity(branchGroup);
    await (_appDatabase.update(_appDatabase.branchGroups)..where((tbl) => tbl.id.equals(branchGroup.id))).write(companion);
  }

  @override
  Future<void> deleteBranchGroup(int id) async {
     try {
      await (_appDatabase.delete(_appDatabase.branchGroups)..where((tbl) => tbl.id.equals(id))).go();
    } on SqliteException catch (e) {
       if (e.extendedResultCode == 1811) { // SQLITE_CONSTRAINT_FOREIGNKEY
         throw DataIntegrityException('Cannot delete this group as it is associated with one or more branches.');
       }
       rethrow;
    }
  }
}
