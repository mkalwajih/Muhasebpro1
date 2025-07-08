import 'package:muhaseb_pro/core/db/app_database.dart' as db;

abstract class GeographicalDataLocalDataSource {
  Future<List<db.Zone>> getZones();
  Future<List<db.Country>> getCountries();
  Future<List<db.Governorate>> getGovernorates(int countryId);
  Future<List<db.City>> getCities(int govId);
  Future<List<db.Region>> getRegions(int cityId);

  Future<void> addZone(db.ZonesCompanion zone);
  Future<void> addCountry(db.CountriesCompanion country);
  Future<void> addGovernorate(db.GovernoratesCompanion governorate);
  Future<void> addCity(db.CitiesCompanion city);
  Future<void> addRegion(db.RegionsCompanion region);

  Future<void> updateZone(db.ZonesCompanion zone);
  Future<void> updateCountry(db.CountriesCompanion country);
  Future<void> updateGovernorate(db.GovernoratesCompanion governorate);
  Future<void> updateCity(db.CitiesCompanion city);
  Future<void> updateRegion(db.RegionsCompanion region);

  Future<void> deleteZone(int id);
  Future<void> deleteCountry(int id);
  Future<void> deleteGovernorate(int id);
  Future<void> deleteCity(int id);
  Future<void> deleteRegion(int id);
}

class GeographicalDataLocalDataSourceImpl
    implements GeographicalDataLocalDataSource {
  final db.AppDatabase appDatabase;

  GeographicalDataLocalDataSourceImpl(this.appDatabase);

  @override
  Future<List<db.Zone>> getZones() => appDatabase.select(appDatabase.zones).get();

  @override
  Future<List<db.Country>> getCountries() => appDatabase.select(appDatabase.countries).get();

  @override
  Future<List<db.Governorate>> getGovernorates(int countryId) =>
      (appDatabase.select(appDatabase.governorates)..where((t) => t.countryId.equals(countryId)))
          .get();

  @override
  Future<List<db.City>> getCities(int govId) =>
      (appDatabase.select(appDatabase.cities)..where((t) => t.govId.equals(govId))).get();

  @override
  Future<List<db.Region>> getRegions(int cityId) =>
      (appDatabase.select(appDatabase.regions)..where((t) => t.cityId.equals(cityId))).get();

  @override
  Future<void> addZone(db.ZonesCompanion zone) => appDatabase.into(appDatabase.zones).insert(zone);

  @override
  Future<void> addCountry(db.CountriesCompanion country) => appDatabase.into(appDatabase.countries).insert(country);

  @override
  Future<void> addGovernorate(db.GovernoratesCompanion governorate) => appDatabase.into(appDatabase.governorates).insert(governorate);

  @override
  Future<void> addCity(db.CitiesCompanion city) => appDatabase.into(appDatabase.cities).insert(city);

  @override
  Future<void> addRegion(db.RegionsCompanion region) => appDatabase.into(appDatabase.regions).insert(region);

  @override
  Future<void> updateZone(db.ZonesCompanion zone) => appDatabase.update(appDatabase.zones).replace(zone);

  @override
  Future<void> updateCountry(db.CountriesCompanion country) => appDatabase.update(appDatabase.countries).replace(country);

  @override
  Future<void> updateGovernorate(db.GovernoratesCompanion governorate) => appDatabase.update(appDatabase.governorates).replace(governorate);

  @override
  Future<void> updateCity(db.CitiesCompanion city) => appDatabase.update(appDatabase.cities).replace(city);

  @override
  Future<void> updateRegion(db.RegionsCompanion region) => appDatabase.update(appDatabase.regions).replace(region);

  @override
  Future<void> deleteZone(int id) => (appDatabase.delete(appDatabase.zones)..where((t) => t.id.equals(id))).go();

  @override
  Future<void> deleteCountry(int id) => (appDatabase.delete(appDatabase.countries)..where((t) => t.id.equals(id))).go();

  @override
  Future<void> deleteGovernorate(int id) => (appDatabase.delete(appDatabase.governorates)..where((t) => t.id.equals(id))).go();

  @override
  Future<void> deleteCity(int id) => (appDatabase.delete(appDatabase.cities)..where((t) => t.id.equals(id))).go();

  @override
  Future<void> deleteRegion(int id) => (appDatabase.delete(appDatabase.regions)..where((t) => t.id.equals(id))).go();
}