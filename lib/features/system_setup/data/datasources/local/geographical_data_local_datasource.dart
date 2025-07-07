import 'package:muhaseb_pro/core/db/app_database.dart';

// Abstract class defining the contract for the local data source
abstract class GeographicalDataLocalDataSource {
  // Zone methods
  Future<List<Zone>> getZones();
  Future<void> addZone(ZonesCompanion zone);
  Future<void> updateZone(ZonesCompanion zone);
  Future<int> deleteZone(int id);

  // Country methods
  Future<List<Country>> getCountries(int zoneId);
  Future<void> addCountry(CountriesCompanion country);
  Future<void> updateCountry(CountriesCompanion country);
  Future<int> deleteCountry(int id);

  // Governorate methods
  Future<List<Governorate>> getGovernorates(int countryId);
  Future<void> addGovernorate(GovernoratesCompanion governorate);
  Future<void> updateGovernorate(GovernoratesCompanion governorate);
  Future<int> deleteGovernorate(int id);

  // City methods
  Future<List<City>> getCities(int govId);
  Future<void> addCity(CitiesCompanion city);
  Future<void> updateCity(CitiesCompanion city);
  Future<int> deleteCity(int id);

  // Region methods
  Future<List<Region>> getRegions(int cityId);
  Future<void> addRegion(RegionsCompanion region);
  Future<void> updateRegion(RegionsCompanion region);
  Future<int> deleteRegion(int id);
}

// Concrete implementation of the local data source
class GeographicalDataLocalDataSourceImpl implements GeographicalDataLocalDataSource {
  final AppDatabase db;

  GeographicalDataLocalDataSourceImpl(this.db);

  // --- Zone Implementation ---
  @override
  Future<List<Zone>> getZones() => db.select(db.zones).get();

  @override
  Future<void> addZone(ZonesCompanion zone) => db.into(db.zones).insert(zone);

  @override
  Future<void> updateZone(ZonesCompanion zone) =>
      (db.update(db.zones)..where((t) => t.id.equals(zone.id.value))).write(zone);

  @override
  Future<int> deleteZone(int id) =>
      (db.delete(db.zones)..where((t) => t.id.equals(id))).go();

  // --- Country Implementation ---
  @override
  Future<List<Country>> getCountries(int zoneId) =>
      (db.select(db.countries)..where((t) => t.zoneId.equals(zoneId))).get();

  @override
  Future<void> addCountry(CountriesCompanion country) => db.into(db.countries).insert(country);

  @override
  Future<void> updateCountry(CountriesCompanion country) =>
      (db.update(db.countries)..where((t) => t.id.equals(country.id.value))).write(country);

  @override
  Future<int> deleteCountry(int id) =>
      (db.delete(db.countries)..where((t) => t.id.equals(id))).go();

  // --- Governorate Implementation ---
  @override
  Future<List<Governorate>> getGovernorates(int countryId) =>
      (db.select(db.governorates)..where((t) => t.countryId.equals(countryId))).get();

  @override
  Future<void> addGovernorate(GovernoratesCompanion governorate) =>
      db.into(db.governorates).insert(governorate);

  @override
  Future<void> updateGovernorate(GovernoratesCompanion governorate) =>
      (db.update(db.governorates)..where((t) => t.id.equals(governorate.id.value))).write(governorate);

  @override
  Future<int> deleteGovernorate(int id) =>
      (db.delete(db.governorates)..where((t) => t.id.equals(id))).go();

  // --- City Implementation ---
  @override
  Future<List<City>> getCities(int govId) =>
      (db.select(db.cities)..where((t) => t.govId.equals(govId))).get();

  @override
  Future<void> addCity(CitiesCompanion city) => db.into(db.cities).insert(city);

  @override
  Future<void> updateCity(CitiesCompanion city) =>
      (db.update(db.cities)..where((t) => t.id.equals(city.id.value))).write(city);

  @override
  Future<int> deleteCity(int id) =>
      (db.delete(db.cities)..where((t) => t.id.equals(id))).go();

  // --- Region Implementation ---
  @override
  Future<List<Region>> getRegions(int cityId) =>
      (db.select(db.regions)..where((t) => t.cityId.equals(cityId))).get();

  @override
  Future<void> addRegion(RegionsCompanion region) => db.into(db.regions).insert(region);

  @override
  Future<void> updateRegion(RegionsCompanion region) =>
      (db.update(db.regions)..where((t) => t.id.equals(region.id.value))).write(region);

  @override
  Future<int> deleteRegion(int id) =>
      (db.delete(db.regions)..where((t) => t.id.equals(id))).go();
}
