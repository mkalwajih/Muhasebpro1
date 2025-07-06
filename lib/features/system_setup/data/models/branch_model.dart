import '../../../../core/db/app_database.dart';
import '../../domain/entities/branch_entity.dart';

class BranchModel extends BranchEntity {
  const BranchModel({
    required super.branchCode,
    required super.nameAr,
    required super.nameEn,
    required super.companyId,
    super.branchGroupId, // Changed from super.branchGroup
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
      branchGroupId: entity.branchGroupId, // Changed from branchGroup
      address: entity.address,
      phone: entity.phone,
      defaultWarehouseId: entity.defaultWarehouseId,
      branchStatus: entity.branchStatus,
      logo: entity.logo,
      remarks: entity.remarks,
    );
  }

  factory BranchModel.fromDb(Branche dbBranch) {
    return BranchModel(
      branchCode: dbBranch.branchCode,
      nameAr: dbBranch.nameAr,
      nameEn: dbBranch.nameEn,
      companyId: dbBranch.companyId,
      branchGroupId: dbBranch.branchGroupId, // Changed from dbBranch.branchGroup
      address: dbBranch.address,
      phone: dbBranch.phone,
      defaultWarehouseId: dbBranch.defaultWarehouseId,
      branchStatus: dbBranch.branchStatus == 1 ? true : false,
      logo: dbBranch.logo,
      remarks: dbBranch.remarks,
    );
  }

  Branche toDb() {
    return Branche(
      branchCode: branchCode,
      nameAr: nameAr,
      nameEn: nameEn,
      companyId: companyId,
      branchGroupId: branchGroupId, // Changed from branchGroup
      address: address,
      phone: phone,
      defaultWarehouseId: defaultWarehouseId,
      branchStatus: branchStatus ? 1 : 0,
      logo: logo,
      remarks: remarks,
    );
  }
}
