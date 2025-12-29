import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';

abstract class GeographicalDataRepository {
  // Zone Methods
  Future<List<ZoneEntity>> getZones();
  Future<void> addZone(ZoneEntity zone);
  Future<void> updateZone(ZoneEntity zone);
  Future<(bool, String?)> deleteZone(int id);

  // Country Methods
  Future<List<CountryEntity>> getCountries(int zoneId);
  Future<List<CountryEntity>> getAllCountries(); // Added this method
  Future<void> addCountry(CountryEntity country);
  Future<void> updateCountry(CountryEntity country);
  Future<(bool, String?)> deleteCountry(int id);

  // ... (Other methods remain unchanged)
  Future<List<GovernorateEntity>> getGovernorates(int countryId);
  Future<void> addGovernorate(GovernorateEntity governorate);
  Future<void> updateGovernorate(GovernorateEntity governorate);
  Future<(bool, String?)> deleteGovernorate(int id);

  Future<List<CityEntity>> getCities(int govId);
  Future<void> addCity(CityEntity city);
  Future<void> updateCity(CityEntity city);
  Future<(bool, String?)> deleteCity(int id);

  Future<List<RegionEntity>> getRegions(int cityId);
  Future<void> addRegion(RegionEntity region);
  Future<void> updateRegion(RegionEntity region);
  Future<(bool, String?)> deleteRegion(int id);
}
