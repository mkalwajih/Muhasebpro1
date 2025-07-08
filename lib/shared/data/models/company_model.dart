import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.id,
    required super.companyCode,
    required super.nameAr,
    required super.nameEn,
    super.countryId,
    super.taxNumber,
    super.commercialRegNo,
    super.address,
    super.phone,
    super.email,
    required super.isMainCompany,
    super.remarks,
  });

  factory CompanyModel.fromDb(db.CompanyInfoData data) {
    return CompanyModel(
      id: data.id,
      companyCode: data.companyCode,
      nameAr: data.nameAr,
      nameEn: data.nameEn,
      countryId: data.countryId,
      taxNumber: data.taxNumber,
      commercialRegNo: data.commercialRegNo,
      address: data.address,
      phone: data.phone,
      email: data.email,
      isMainCompany: data.isMainCompany,
      remarks: data.remarks,
    );
  }
}
