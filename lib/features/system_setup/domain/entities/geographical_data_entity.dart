import 'package:equatable/equatable.dart';

// Base class
abstract class GeographicalDataEntity extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final bool isActive; // Added isActive here

  const GeographicalDataEntity({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.isActive, // Added isActive to constructor
  });

  @override
  List<Object?> get props => [id, nameAr, nameEn, isActive]; // Added isActive to props
}

// Zone
class ZoneEntity extends GeographicalDataEntity {
  final String zoneCode;

  const ZoneEntity({
    required super.id,
    required this.zoneCode,
    required super.nameAr,
    required super.nameEn,
    required super.isActive, // Added isActive to constructor
  });

  @override
  List<Object?> get props => [id, zoneCode, nameAr, nameEn, isActive]; // Added isActive to props
}

// Country
class CountryEntity extends GeographicalDataEntity {
  final String countryCode;
  final String nationalityAr;
  final String nationalityEn;
  final int zoneId;

  const CountryEntity({
    required super.id,
    required this.countryCode,
    required super.nameAr,
    required super.nameEn,
    required this.nationalityAr,
    required this.nationalityEn,
    required this.zoneId,
    required super.isActive, // Added isActive to constructor
  });

  @override
  List<Object?> get props => [
        id,
        countryCode,
        nameAr,
        nameEn,
        nationalityAr,
        nationalityEn,
        zoneId,
        isActive, // Added isActive to props
      ];
}

// Governorate
class GovernorateEntity extends GeographicalDataEntity {
  final String govCode;
  final int countryId;

  const GovernorateEntity({
    required super.id,
    required this.govCode,
    required super.nameAr,
    required super.nameEn,
    required this.countryId,
    required super.isActive, // Added isActive to constructor
  });

  @override
  List<Object?> get props => [id, govCode, nameAr, nameEn, countryId, isActive]; // Added isActive to props
}

// City
class CityEntity extends GeographicalDataEntity {
  final String cityCode;
  final int govId;

  const CityEntity({
    required super.id,
    required this.cityCode,
    required super.nameAr,
    required super.nameEn,
    required this.govId,
    required super.isActive, // Added isActive to constructor
  });

  @override
  List<Object?> get props => [id, cityCode, nameAr, nameEn, govId, isActive]; // Added isActive to props
}

// Region
class RegionEntity extends GeographicalDataEntity {
  final String regionCode;
  final int cityId;

  const RegionEntity({
    required super.id,
    required this.regionCode,
    required super.nameAr,
    required super.nameEn,
    required this.cityId,
    required super.isActive, // Added isActive to constructor
  });

  @override
  List<Object?> get props => [id, regionCode, nameAr, nameEn, cityId, isActive]; // Added isActive to props
}
