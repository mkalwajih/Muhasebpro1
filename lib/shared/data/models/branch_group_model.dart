import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_group_entity.dart';

class BranchGroupModel extends BranchGroupEntity {
  const BranchGroupModel({
    required super.id,
    required super.name,
  });

  factory BranchGroupModel.fromDb(BranchGroup dbBranchGroup) {
    return BranchGroupModel(
      id: dbBranchGroup.id,
      name: dbBranchGroup.name,
    );
  }

  BranchGroupsCompanion toDb() {
    return BranchGroupsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }
}
