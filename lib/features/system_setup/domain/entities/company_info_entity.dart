import 'dart:typed_data';

import 'package:equatable/equatable.dart';

// Represents the core information of a company, aligned with the database schema.
class CompanyInfoEntity extends Equatable {
  final int id;
  final String companyCode;
  final String nameAr;
  final String nameEn;
  final String? countryId;
  final String? taxNumber;
  final String? commercialRegNo;
  final String? address;
  final String? phone;
  final String? email;
  final Uint8List? logo;
  final bool isMainCompany;
  final String? remarks;

  const CompanyInfoEntity({
    required this.id,
    required this.companyCode,
    required this.nameAr,
    required this.nameEn,
    this.countryId,
    this.taxNumber,
    this.commercialRegNo,
    this.address,
    this.phone,
    this.email,
    this.logo,
    required this.isMainCompany,
    this.remarks,
  });

  @override
  List<Object?> get props => [
        id,
        companyCode,
        nameAr,
        nameEn,
        countryId,
        taxNumber,
        commercialRegNo,
        address,
        phone,
        email,
        logo,
        isMainCompany,
        remarks,
      ];
}
