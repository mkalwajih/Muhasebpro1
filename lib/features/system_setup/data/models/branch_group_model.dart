import '../../../../core/db/app_database.dart';
import '../../domain/entities/branch_group_entity.dart';

class BranchGroupModel extends BranchGroup {
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

  BranchGroup toDb() {
    return BranchGroup(
      id: id,
      name: name,
    );
  }
}
