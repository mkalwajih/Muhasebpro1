import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({required super.id, required super.name});

  factory CompanyModel.fromDb(CompanyInfoData data) {
    return CompanyModel(
      id: data.id.toString(),
      name: data.nameEn,
    );
  }
}
