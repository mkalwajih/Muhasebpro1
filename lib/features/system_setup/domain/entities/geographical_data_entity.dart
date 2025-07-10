enum GeoLevel { zone, country, governorate, city, region }

abstract class GeoEntity {
  final int id;
  final String nameAr;
  final String nameEn;
  final bool isActive;
  String get code;

  GeoEntity({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.isActive,
  });
}

class ZoneEntity extends GeoEntity {
  final String zoneCode;

  @override
  String get code => zoneCode;

  ZoneEntity({
    required super.id,
    required this.zoneCode,
    required super.nameAr,
    required super.nameEn,
    required super.isActive,
  });
}

class CountryEntity extends GeoEntity {
  final String countryCode;
  final String nationalityAr;
  final String nationalityEn;
  final int zoneId;
  
  @override
  String get code => countryCode;

  CountryEntity({
    required super.id,
    required this.countryCode,
    required super.nameAr,
    required super.nameEn,
    required this.nationalityAr,
    required this.nationalityEn,
    required this.zoneId,
    required super.isActive,
  });
}

class GovernorateEntity extends GeoEntity {
  final String govCode;
  final int countryId;

  @override
  String get code => govCode;

  GovernorateEntity({
    required super.id,
    required this.govCode,
    required super.nameAr,
    required super.nameEn,
    required this.countryId,
    required super.isActive,
  });
}

class CityEntity extends GeoEntity {
  final String cityCode;
  final int govId;

  @override
  String get code => cityCode;

  CityEntity({
    required super.id,
    required this.cityCode,
    required super.nameAr,
    required super.nameEn,
    required this.govId,
    required super.isActive,
  });
}

class RegionEntity extends GeoEntity {
  final String regionCode;
  final int cityId;

  @override
  String get code => regionCode;

  RegionEntity({
    required super.id,
    required this.regionCode,
    required super.nameAr,
    required super.nameEn,
    required this.cityId,
    required super.isActive,
  });
}
