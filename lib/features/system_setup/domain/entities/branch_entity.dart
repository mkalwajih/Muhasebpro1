import 'package:equatable/equatable.dart';
import 'dart:typed_data';

class BranchEntity extends Equatable {
  final String branchCode;
  final String nameAr;
  final String nameEn;
  final String companyId;
  final int? branchGroupId; // Changed from String? branchGroup to int? branchGroupId
  final String? address;
  final String? phone;
  final String? defaultWarehouseId;
  final bool branchStatus;
  final Uint8List? logo;
  final String? remarks;

  const BranchEntity({
    required this.branchCode,
    required this.nameAr,
    required this.nameEn,
    required this.companyId,
    this.branchGroupId, // Changed parameter name
    this.address,
    this.phone,
    this.defaultWarehouseId,
    required this.branchStatus,
    this.logo,
    this.remarks,
  });

  @override
  List<Object?> get props => [
        branchCode,
        nameAr,
        nameEn,
        companyId,
        branchGroupId, // Changed prop name
        address,
        phone,
        defaultWarehouseId,
        branchStatus,
        logo,
        remarks,
      ];
}
