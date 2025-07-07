import 'package:muhaseb_pro/features/system_setup/domain/entities/branch_entity.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';

class BranchModel extends BranchEntity {
  const BranchModel({
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

  factory BranchModel.fromDb(Branch dbBranch) {
    return BranchModel(
      branchCode: dbBranch.branchCode,
      nameAr: dbBranch.nameAr,
      nameEn: dbBranch.nameEn,
      companyId: dbBranch.companyId,
      branchGroupId: dbBranch.branchGroupId,
      address: dbBranch.address,
      phone: dbBranch.phone,
      defaultWarehouseId: dbBranch.defaultWarehouseId,
      branchStatus: dbBranch.branchStatus == 1,
      logo: dbBranch.logo,
      remarks: dbBranch.remarks,
    );
  }

  BranchesCompanion toDb() {
    return BranchesCompanion(
      branchCode: Value(branchCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      companyId: Value(companyId),
      branchGroupId: Value(branchGroupId),
      address: Value(address),
      phone: Value(phone),
      defaultWarehouseId: Value(defaultWarehouseId),
      branchStatus: Value(branchStatus ? 1 : 0),
      logo: Value(logo),
      remarks: Value(remarks),
    );
  }
}
