import 'package:drift/drift.dart';
import 'package:muhaseb_pro/core/db/app_database.dart' as db;
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/geographical_data_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/geographical_data_repository.dart';

class GeographicalDataRepositoryImpl implements GeographicalDataRepository {
  final GeographicalDataLocalDataSource localDataSource;

  GeographicalDataRepositoryImpl(this.localDataSource);

  ZoneEntity _mapZone(db.Zone zone) => ZoneEntity(
        id: zone.id,
        zoneCode: zone.zoneCode,
        nameAr: zone.nameAr,
        nameEn: zone.nameEn,
        isActive: zone.isActive,
      );

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

  @override
  Future<List<ZoneEntity>> getZones() async {
    final zones = await localDataSource.getZones();
    return zones.map(_mapZone).toList();
  }

  @override
  Future<List<CountryEntity>> getCountries(int zoneId) async {
    final allCountries = await localDataSource.getCountries();
    final filteredCountries =
        allCountries.where((country) => country.zoneId == zoneId).toList();
    return filteredCountries.map(_mapCountry).toList();
  }

  @override
  Future<List<CountryEntity>> getAllCountries() async {
    final allCountries = await localDataSource.getCountries();
    return allCountries.map(_mapCountry).toList();
  }

  @override
  Future<void> addZone(ZoneEntity zone) async => localDataSource
      .addZone(db.ZonesCompanion.insert(zoneCode: zone.zoneCode, nameAr: zone.nameAr, nameEn: zone.nameEn, isActive: Value(zone.isActive)));

  @override
  Future<void> updateZone(ZoneEntity zone) async =>
      localDataSource.updateZone(db.ZonesCompanion(
          id: Value(zone.id),
          zoneCode: Value(zone.zoneCode),
          nameAr: Value(zone.nameAr),
          nameEn: Value(zone.nameEn),
          isActive: Value(zone.isActive)));

  @override
  Future<(bool, String?)> deleteZone(int id) async {
    await localDataSource.deleteZone(id);
    return (true, null);
  }

  @override
  Future<void> addCountry(CountryEntity country) async =>
      localDataSource.addCountry(db.CountriesCompanion.insert(
          countryCode: country.countryCode,
          nameAr: country.nameAr,
          nameEn: country.nameEn,
          nationalityAr: country.nationalityAr,
          nationalityEn: country.nationalityEn,
          zoneId: country.zoneId,
          isActive: Value(country.isActive)));

  @override
  Future<void> updateCountry(CountryEntity country) async =>
      localDataSource.updateCountry(db.CountriesCompanion(
          id: Value(country.id),
          countryCode: Value(country.countryCode),
          nameAr: Value(country.nameAr),
          nameEn: Value(country.nameEn),
          nationalityAr: Value(country.nationalityAr),
          nationalityEn: Value(country.nationalityEn),
          zoneId: Value(country.zoneId),
          isActive: Value(country.isActive)));

  @override
  Future<(bool, String?)> deleteCountry(int id) async {
    await localDataSource.deleteCountry(id);
    return (true, null);
  }

  @override
  Future<List<CityEntity>> getCities(int govId) async => [];

  @override
  Future<List<GovernorateEntity>> getGovernorates(int countryId) async => [];

  @override
  Future<List<RegionEntity>> getRegions(int cityId) async => [];

  @override
  Future<void> addCity(CityEntity city) async {}

  @override
  Future<void> addGovernorate(GovernorateEntity governorate) async {}

  @override
  Future<void> addRegion(RegionEntity region) async {}

  @override
  Future<(bool, String?)> deleteCity(int id) async => (true, null);

  @override
  Future<(bool, String?)> deleteGovernorate(int id) async => (true, null);

  @override
  Future<(bool, String?)> deleteRegion(int id) async => (true, null);

  @override
  Future<void> updateCity(CityEntity city) async {}

  @override
  Future<void> updateGovernorate(GovernorateEntity governorate) async {}

  @override
  Future<void> updateRegion(RegionEntity region) async {}
}
