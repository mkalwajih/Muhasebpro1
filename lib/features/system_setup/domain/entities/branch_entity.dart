import 'package:equatable/equatable.dart';
import 'dart:typed_data';

class BranchEntity extends Equatable {
  final int? id;
  final String branchCode;
  final String nameAr;
  final String nameEn;
  final int companyId; // Changed from String to int
  final int? branchGroupId;
  final String? address;
  final String? phone;
  final String? defaultWarehouseId;
  final bool isMainBranch;
  final bool branchStatus;
  final Uint8List? logo;
  final String? remarks;

  const BranchEntity({
    this.id,
    required this.branchCode,
    required this.nameAr,
    required this.nameEn,
    required this.companyId,
    this.branchGroupId,
    this.address,
    this.phone,
    this.defaultWarehouseId,
    this.isMainBranch = false,
    required this.branchStatus,
    this.logo,
    this.remarks,
  });

  @override
  List<Object?> get props => [
        id,
        branchCode,
        nameAr,
        nameEn,
        companyId,
        branchGroupId,
        address,
        phone,
        defaultWarehouseId,
        isMainBranch,
        branchStatus,
        logo,
        remarks,
      ];
}
