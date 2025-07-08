import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_group_entity.dart';

class BranchGroupModel extends BranchGroup {
  const BranchGroupModel({
    required super.id,
    required super.name,
  });

  factory BranchGroupModel.fromDb(db.BranchGroup dbBranchGroup) {
    return BranchGroupModel(
      id: dbBranchGroup.id,
      name: dbBranchGroup.name,
    );
  }

  db.BranchGroupsCompanion toDb() {
    return db.BranchGroupsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }
}
