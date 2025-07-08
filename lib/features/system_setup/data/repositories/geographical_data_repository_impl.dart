import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/geographical_data_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/geographical_data_repository.dart';

class GeographicalDataRepositoryImpl implements GeographicalDataRepository {
  final GeographicalDataLocalDataSource localDataSource;

  GeographicalDataRepositoryImpl(this.localDataSource);

  // Mapper for Zone
  ZoneEntity _mapZone(db.Zone zone) => ZoneEntity(
        id: zone.id,
        zoneCode: zone.zoneCode,
        nameAr: zone.nameAr,
        nameEn: zone.nameEn,
        isActive: zone.isActive,
      );

  // Mapper for Country
  CountryEntity _mapCountry(db.Country country) => CountryEntity(
        id: country.id,
        countryCode: country.countryCode,
        nameAr: country.nameAr,
        nameEn: country.nameEn,
        nationalityAr: country.nationalityAr,
        nationalityEn: country.nationalityEn,
        zoneId: country.zoneId,
        isActive: country.isActive,
      );

  // Mapper for Governorate
  GovernorateEntity _mapGovernorate(db.Governorate gov) => GovernorateEntity(
        id: gov.id,
        govCode: gov.govCode,
        nameAr: gov.nameAr,
        nameEn: gov.nameEn,
        countryId: gov.countryId,
        isActive: gov.isActive,
      );
  
  // Mapper for City
  CityEntity _mapCity(db.City city) => CityEntity(
        id: city.id,
        cityCode: city.cityCode,
        nameAr: city.nameAr,
        nameEn: city.nameEn,
        govId: city.govId,
        isActive: city.isActive,
      );

  // Mapper for Region
  RegionEntity _mapRegion(db.Region region) => RegionEntity(
        id: region.id,
        regionCode: region.regionCode,
        nameAr: region.nameAr,
        nameEn: region.nameEn,
        cityId: region.cityId,
        isActive: region.isActive,
      );

  @override
  Future<void> addCity(CityEntity city) {
    final companion = db.CitiesCompanion.insert(
        cityCode: city.cityCode,
        nameAr: city.nameAr,
        nameEn: city.nameEn,
        govId: city.govId,
        isActive: Value(city.isActive));
    return localDataSource.addCity(companion);
  }

  @override
  Future<void> addCountry(CountryEntity country) {
    final companion = db.CountriesCompanion.insert(
        countryCode: country.countryCode,
        nameAr: country.nameAr,
        nameEn: country.nameEn,
        nationalityAr: country.nationalityAr,
        nationalityEn: country.nationalityEn,
        zoneId: country.zoneId,
        isActive: Value(country.isActive));
    return localDataSource.addCountry(companion);
  }

  @override
  Future<void> addGovernorate(GovernorateEntity governorate) {
    final companion = db.GovernoratesCompanion.insert(
        govCode: governorate.govCode,
        nameAr: governorate.nameAr,
        nameEn: governorate.nameEn,
        countryId: governorate.countryId,
        isActive: Value(governorate.isActive));
    return localDataSource.addGovernorate(companion);
  }

  @override
  Future<void> addRegion(RegionEntity region) {
    final companion = db.RegionsCompanion.insert(
        regionCode: region.regionCode,
        nameAr: region.nameAr,
        nameEn: region.nameEn,
        cityId: region.cityId,
        isActive: Value(region.isActive));
    return localDataSource.addRegion(companion);
  }

  @override
  Future<void> addZone(ZoneEntity zone) {
    final companion = db.ZonesCompanion.insert(
        zoneCode: zone.zoneCode,
        nameAr: zone.nameAr,
        nameEn: zone.nameEn,
        isActive: Value(zone.isActive));
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
    final allCountries = await localDataSource.getCountries();
    final filteredCountries = allCountries.where((country) => country.zoneId == zoneId).toList();
    return filteredCountries.map(_mapCountry).toList();
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
        cityCode: Value(city.cityCode),
        nameAr: Value(city.nameAr),
        nameEn: Value(city.nameEn),
        govId: Value(city.govId),
        isActive: Value(city.isActive));
    return localDataSource.updateCity(companion);
  }

  @override
  Future<void> updateCountry(CountryEntity country) {
    final companion = db.CountriesCompanion(
        id: Value(country.id),
        countryCode: Value(country.countryCode),
        nameAr: Value(country.nameAr),
        nameEn: Value(country.nameEn),
        nationalityAr: Value(country.nationalityAr),
        nationalityEn: Value(country.nationalityEn),
        zoneId: Value(country.zoneId),
        isActive: Value(country.isActive));
    return localDataSource.updateCountry(companion);
  }

  @override
  Future<void> updateGovernorate(GovernorateEntity governorate) {
    final companion = db.GovernoratesCompanion(
        id: Value(governorate.id),
        govCode: Value(governorate.govCode),
        nameAr: Value(governorate.nameAr),
        nameEn: Value(governorate.nameEn),
        countryId: Value(governorate.countryId),
        isActive: Value(governorate.isActive));
    return localDataSource.updateGovernorate(companion);
  }

  @override
  Future<void> updateRegion(RegionEntity region) {
    final companion = db.RegionsCompanion(
        id: Value(region.id),
        regionCode: Value(region.regionCode),
        nameAr: Value(region.nameAr),
        nameEn: Value(region.nameEn),
        cityId: Value(region.cityId),
        isActive: Value(region.isActive));
    return localDataSource.updateRegion(companion);
  }

  @override
  Future<void> updateZone(ZoneEntity zone) {
    final companion = db.ZonesCompanion(
        id: Value(zone.id),
        zoneCode: Value(zone.zoneCode),
        nameAr: Value(zone.nameAr),
        nameEn: Value(zone.nameEn),
        isActive: Value(zone.isActive));
    return localDataSource.updateZone(companion);
  }
}
