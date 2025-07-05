import 'dart:typed_data';
import '../../../../core/db/app_database.dart';
import '../../domain/entities/branch_entity.dart';

class BranchModel extends BranchEntity {
  const BranchModel({
    required String branchCode,
    required String nameAr,
    required String nameEn,
    required int companyId,
    String? branchGroup,
    String? address,
    String? phone,
    String? defaultWarehouseId,
    required bool branchStatus,
    Uint8List? logo,
    String? remarks,
  }) : super(
          branchCode: branchCode,
          nameAr: nameAr,
          nameEn: nameEn,
          companyId: companyId,
          branchGroup: branchGroup,
          address: address,
          phone: phone,
          defaultWarehouseId: defaultWarehouseId,
          branchStatus: branchStatus,
          logo: logo,
          remarks: remarks,
        );

  factory BranchModel.fromEntity(BranchEntity entity) {
    return BranchModel(
      branchCode: entity.branchCode,
      nameAr: entity.nameAr,
      nameEn: entity.nameEn,
      companyId: entity.companyId,
      branchGroup: entity.branchGroup,
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
      branchGroup: dbBranch.branchGroup,
      address: dbBranch.address,
      phone: dbBranch.phone,
      defaultWarehouseId: dbBranch.defaultWarehouseId,
      branchStatus: dbBranch.branchStatus,
      logo: dbBranch.logo,
      remarks: dbBranch.remarks,
    );
  }

  Branch toDb() {
    return Branch(
      branchCode: branchCode,
      nameAr: nameAr,
      nameEn: nameEn,
      companyId: companyId,
      branchGroup: branchGroup,
      address: address,
      phone: phone,
      defaultWarehouseId: defaultWarehouseId,
      branchStatus: branchStatus,
      logo: logo,
      remarks: remarks,
    );
  }
}
