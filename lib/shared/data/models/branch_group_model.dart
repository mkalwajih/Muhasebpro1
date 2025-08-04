import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_group_entity.dart';

class BranchGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

extension BranchGroupMapper on BranchGroup {
  BranchGroupEntity toEntity() {
    return BranchGroupEntity(
      id: id,
      nameAr: nameAr,
      nameEn: nameEn,
      isActive: isActive,
    );
  }
}

extension BranchGroupCompanionMapper on BranchGroupsCompanion {
  static BranchGroupsCompanion fromEntity(BranchGroupEntity entity) {
    return BranchGroupsCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      nameAr: Value(entity.nameAr),
      nameEn: Value(entity.nameEn),
      isActive: Value(entity.isActive),
    );
  }
}
