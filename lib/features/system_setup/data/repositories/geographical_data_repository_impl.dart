import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/features/system_setup/data/datasources/geographical_data_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/geographical_data_repository.dart';

class GeographicalDataRepositoryImpl implements GeographicalDataRepository {
  final GeographicalDataLocalDataSource localDataSource;

  GeographicalDataRepositoryImpl(this.localDataSource);

  // Mapper for Zone
  ZoneEntity _mapZone(db.Zone zone) => ZoneEntity(
        id: zone.id,
        zoneCode: zone.code,
        nameAr: zone.name_ar,
        nameEn: zone.name_en,
        isActive: zone.is_active,
      );

  // Mapper for Country
  CountryEntity _mapCountry(db.Country country) => CountryEntity(
        id: country.id,
        countryCode: country.code,
        nameAr: country.name_ar,
        nameEn: country.name_en,
        nationalityAr: country.nationality_ar,
        nationalityEn: country.nationality_en,
        zoneId: country.zone_id,
        isActive: country.is_active,
      );

  // Mapper for Governorate
  GovernorateEntity _mapGovernorate(db.Governorate gov) => GovernorateEntity(
        id: gov.id,
        govCode: gov.code,
        nameAr: gov.name_ar,
        nameEn: gov.name_en,
        countryId: gov.country_id,
        isActive: gov.is_active,
      );
  
  // Mapper for City
  CityEntity _mapCity(db.City city) => CityEntity(
        id: city.id,
        cityCode: city.code,
        nameAr: city.name_ar,
        nameEn: city.name_en,
        govId: city.gov_id,
        isActive: city.is_active,
      );

  // Mapper for Region
  RegionEntity _mapRegion(db.Region region) => RegionEntity(
        id: region.id,
        regionCode: region.code,
        nameAr: region.name_ar,
        nameEn: region.name_en,
        cityId: region.city_id,
        isActive: region.is_active,
      );

  @override
  Future<void> addCity(CityEntity city) {
    final companion = db.CitiesCompanion.insert(
        code: city.cityCode,
        name_ar: city.nameAr,
        name_en: city.nameEn,
        gov_id: city.govId,
        is_active: Value(city.isActive));
    return localDataSource.addCity(companion);
  }

  @override
  Future<void> addCountry(CountryEntity country) {
    final companion = db.CountriesCompanion.insert(
        code: country.countryCode,
        name_ar: country.nameAr,
        name_en: country.nameEn,
        nationality_ar: country.nationalityAr,
        nationality_en: country.nationalityEn,
        zone_id: country.zoneId,
        is_active: Value(country.isActive));
    return localDataSource.addCountry(companion);
  }

  @override
  Future<void> addGovernorate(GovernorateEntity governorate) {
    final companion = db.GovernoratesCompanion.insert(
        code: governorate.govCode,
        name_ar: governorate.nameAr,
        name_en: governorate.nameEn,
        country_id: governorate.countryId,
        is_active: Value(governorate.isActive));
    return localDataSource.addGovernorate(companion);
  }

  @override
  Future<void> addRegion(RegionEntity region) {
    final companion = db.RegionsCompanion.insert(
        code: region.regionCode,
        name_ar: region.nameAr,
        name_en: region.nameEn,
        city_id: region.cityId,
        is_active: Value(region.isActive));
    return localDataSource.addRegion(companion);
  }

  @override
  Future<void> addZone(ZoneEntity zone) {
    final companion = db.ZonesCompanion.insert(
        code: zone.zoneCode,
        name_ar: zone.nameAr,
        name_en: zone.nameEn,
        is_active: Value(zone.isActive));
    return localDataSource.addZone(companion);
  }

  @override
  Future<void> deleteCity(int id) => localDataSource.deleteCity(id);

  @override
  Future<void> deleteCountry(int id) => localDataSource.deleteCountry(id);

  @override
  Future<void> deleteGovernorate(int id) => localDataSource.deleteGovernorate(id);

  @override
  Future<void> deleteRegion(int id) => localDataSource.deleteRegion(id);

  @override
  Future<void> deleteZone(int id) => localDataSource.deleteZone(id);

  @override
  Future<List<CityEntity>> getCities(int govId) async {
    final cities = await localDataSource.getCities(govId);
    return cities.map(_mapCity).toList();
  }

  @override
  Future<List<CountryEntity>> getCountries(int zoneId) async {
    final countries = await localDataSource.getCountries(zoneId);
    return countries.map(_mapCountry).toList();
  }

  @override
  Future<List<GovernorateEntity>> getGovernorates(int countryId) async {
    final govs = await localDataSource.getGovernorates(countryId);
    return govs.map(_mapGovernorate).toList();
  }

  @override
  Future<List<RegionEntity>> getRegions(int cityId) async {
    final regions = await localDataSource.getRegions(cityId);
    return regions.map(_mapRegion).toList();
  }

  @override
  Future<List<ZoneEntity>> getZones() async {
    final zones = await localDataSource.getZones();
    return zones.map(_mapZone).toList();
  }

  @override
  Future<void> updateCity(CityEntity city) {
    final companion = db.CitiesCompanion(
        id: Value(city.id),
        code: Value(city.cityCode),
        name_ar: Value(city.nameAr),
        name_en: Value(city.nameEn),
        gov_id: Value(city.govId),
        is_active: Value(city.isActive));
    return localDataSource.updateCity(companion);
  }

  @override
  Future<void> updateCountry(CountryEntity country) {
    final companion = db.CountriesCompanion(
        id: Value(country.id),
        code: Value(country.countryCode),
        name_ar: Value(country.nameAr),
        name_en: Value(country.nameEn),
        nationality_ar: Value(country.nationalityAr),
        nationality_en: Value(country.nationalityEn),
        zone_id: Value(country.zoneId),
        is_active: Value(country.isActive));
    return localDataSource.updateCountry(companion);
  }

  @override
  Future<void> updateGovernorate(GovernorateEntity governorate) {
    final companion = db.GovernoratesCompanion(
        id: Value(governorate.id),
        code: Value(governorate.govCode),
        name_ar: Value(governorate.nameAr),
        name_en: Value(governorate.nameEn),
        country_id: Value(governorate.countryId),
        is_active: Value(governorate.isActive));
    return localDataSource.updateGovernorate(companion);
  }

  @override
  Future<void> updateRegion(RegionEntity region) {
    final companion = db.RegionsCompanion(
        id: Value(region.id),
        code: Value(region.regionCode),
        name_ar: Value(region.nameAr),
        name_en: Value(region.nameEn),
        city_id: Value(region.cityId),
        is_active: Value(region.isActive));
    return localDataSource.updateRegion(companion);
  }

  @override
  Future<void> updateZone(ZoneEntity zone) {
    final companion = db.ZonesCompanion(
        id: Value(zone.id),
        code: Value(zone.zoneCode),
        name_ar: Value(zone.nameAr),
        name_en: Value(zone.nameEn),
        is_active: Value(zone.isActive));
    return localDataSource.updateZone(companion);
  }
}
