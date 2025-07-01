import 'package:equatable/equatable.dart';

// Represents the core information of a company

class CompanyInfoEntity extends Equatable {
  final String nameAr;
  final String nameEn;
  final String? addressAr;
  final String? addressEn;
  final String? phone;
  final String? email;
  final String? website;
  final String? taxNumber;
  final String? commercialRegNo;

  const CompanyInfoEntity({
    required this.nameAr,
    required this.nameEn,
    this.addressAr,
    this.addressEn,
    this.phone,
    this.email,
    this.website,
    this.taxNumber,
    this.commercialRegNo,
  });

  @override
  List<Object?> get props => [
        nameAr,
        nameEn,
        addressAr,
        addressEn,
        phone,
        email,
        website,
        taxNumber,
        commercialRegNo
      ];
}