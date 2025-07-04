import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';

abstract class GeographicalDataRepository {
  // Zone Methods
  Future<List<ZoneEntity>> getZones();
  Future<void> addZone(ZoneEntity zone);
  Future<void> updateZone(ZoneEntity zone);
  Future<void> deleteZone(int id);

  // Country Methods
  Future<List<CountryEntity>> getCountries(int zoneId);
  Future<void> addCountry(CountryEntity country);
  Future<void> updateCountry(CountryEntity country);
  Future<void> deleteCountry(int id);

  // Governorate Methods
  Future<List<GovernorateEntity>> getGovernorates(int countryId);
  Future<void> addGovernorate(GovernorateEntity governorate);
  Future<void> updateGovernorate(GovernorateEntity governorate);
  Future<void> deleteGovernorate(int id);

  // City Methods
  Future<List<CityEntity>> getCities(int govId);
  Future<void> addCity(CityEntity city);
  Future<void> updateCity(CityEntity city);
  Future<void> deleteCity(int id);

  // Region Methods
  Future<List<RegionEntity>> getRegions(int cityId);
  Future<void> addRegion(RegionEntity region);
  Future<void> updateRegion(RegionEntity region);
  Future<void> deleteRegion(int id);
}
