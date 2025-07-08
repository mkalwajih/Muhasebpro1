import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_entity.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:drift/drift.dart';

class BranchModel extends BranchEntity {
  const BranchModel({
    super.id,
    required super.branchCode,
    required super.nameAr,
    required super.nameEn,
    required super.companyId,
    super.branchGroupId,
    super.address,
    super.phone,
    super.defaultWarehouseId,
    required super.branchStatus,
    super.logo,
    super.remarks,
  });

  factory BranchModel.fromEntity(BranchEntity entity) {
    return BranchModel(
      id: entity.id,
      branchCode: entity.branchCode,
      nameAr: entity.nameAr,
      nameEn: entity.nameEn,
      companyId: entity.companyId,
      branchGroupId: entity.branchGroupId,
      address: entity.address,
      phone: entity.phone,
      defaultWarehouseId: entity.defaultWarehouseId,
      branchStatus: entity.branchStatus,
      logo: entity.logo,
      remarks: entity.remarks,
    );
  }

  factory BranchModel.fromDb(db.Branche dbBranch) {
    return BranchModel(
      id: dbBranch.id,
      branchCode: dbBranch.branchCode,
      nameAr: dbBranch.nameAr,
      nameEn: dbBranch.nameEn,
      companyId: dbBranch.companyId, 
      branchGroupId: dbBranch.branchGroupId,
      address: dbBranch.address,
      phone: dbBranch.phone,
      defaultWarehouseId: dbBranch.defaultWarehouseId,
      branchStatus: dbBranch.branchStatus,
      logo: dbBranch.logo,
      remarks: dbBranch.remarks,
    );
  }

  db.BranchesCompanion toDb() {
    return db.BranchesCompanion(
      id: id != null ? Value(id!) : const Value.absent(),
      branchCode: Value(branchCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      companyId: Value(companyId), 
      branchGroupId: Value(branchGroupId),
      address: Value(address),
      phone: Value(phone),
      defaultWarehouseId: Value(defaultWarehouseId),
      branchStatus: Value(branchStatus),
      logo: Value(logo),
      remarks: Value(remarks),
    );
  }
}
