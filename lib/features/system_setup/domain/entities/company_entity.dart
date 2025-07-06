import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
  final int id; // Changed from String to int to match generated CompanyInfoData.id
  final String companyCode; // Added as per documentation
  final String nameAr;
  final String nameEn;
  // Add other fields from docs/system_setup/04_companies.md as needed for domain
  final String? countryId;
  final String? taxNumber;
  final String? commercialRegNo;
  final String? address;
  final String? phone;
  final String? email;
  final bool isMainCompany;
  final String? remarks;

  const CompanyEntity({
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
    required this.isMainCompany,
    this.remarks,
  });

  @override
  List<Object?> get props => [
        id, companyCode, nameAr, nameEn, countryId, taxNumber, commercialRegNo,
        address, phone, email, isMainCompany, remarks
      ];
}
