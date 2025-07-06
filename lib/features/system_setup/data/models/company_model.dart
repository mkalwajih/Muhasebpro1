import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';

class CompanyModel extends Company {
  const CompanyModel({required super.id, required super.name});

  factory CompanyModel.fromDb(dynamic data) {
    return CompanyModel(
      id: data.id as String, // Changed to String cast
      name: data.nameEn,
    );
  }
}
