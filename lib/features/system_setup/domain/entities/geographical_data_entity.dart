import 'package:equatable/equatable.dart';

// Using a single file for all related geo entities for simplicity.

class ZoneEntity extends Equatable {
  final int id;
  final String zoneCode;
  final String nameAr;
  final String nameEn;
  final bool isActive;

  const ZoneEntity({
    required this.id,
    required this.zoneCode,
    required this.nameAr,
    required this.nameEn,
    required this.isActive,
  });

  @override
  List<Object?> get props => [id, zoneCode, nameAr, nameEn, isActive];
}

class CountryEntity extends Equatable {
  final int id;
  final String countryCode;
  final String nameAr;
  final String nameEn;
  final String nationalityAr;
  final String nationalityEn;
  final int zoneId;
  final bool isActive;

  const CountryEntity({
    required this.id,
    required this.countryCode,
    required this.nameAr,
    required this.nameEn,
    required this.nationalityAr,
    required this.nationalityEn,
    required this.zoneId,
    required this.isActive,
  });

  @override
  List<Object?> get props => [id, countryCode, nameAr, nameEn, nationalityAr, nationalityEn, zoneId, isActive];
}

class GovernorateEntity extends Equatable {
  final int id;
  final String govCode;
  final String nameAr;
  final String nameEn;
  final int countryId;
  final bool isActive;

  const GovernorateEntity({
    required this.id,
    required this.govCode,
    required this.nameAr,
    required this.nameEn,
    required this.countryId,
    required this.isActive,
  });

  @override
  List<Object?> get props => [id, govCode, nameAr, nameEn, countryId, isActive];
}

class CityEntity extends Equatable {
  final int id;
  final String cityCode;
  final String nameAr;
  final String nameEn;
  final int govId;
  final bool isActive;

  const CityEntity({
    required this.id,
    required this.cityCode,
    required this.nameAr,
    required this.nameEn,
    required this.govId,
    required this.isActive,
  });

  @override
  List<Object?> get props => [id, cityCode, nameAr, nameEn, govId, isActive];
}

class RegionEntity extends Equatable {
  final int id;
  final String regionCode;
  final String nameAr;
  final String nameEn;
  final int cityId;
  final bool isActive;

  const RegionEntity({
    required this.id,
    required this.regionCode,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.isActive,
  });

  @override
  List<Object?> get props => [id, regionCode, nameAr, nameEn, cityId, isActive];
}
