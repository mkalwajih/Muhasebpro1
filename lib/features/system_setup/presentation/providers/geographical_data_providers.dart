// ... existing imports
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/geographical_data_repository.dart';

// ... existing ZonesNotifier, CountriesNotifier ...

// NEW PROVIDER: Fetches all countries regardless of zone
final allCountriesProvider = FutureProvider<List<CountryEntity>>((ref) async {
  final repo = ref.read(geographicalDataRepositoryProvider);
  return await repo.getAllCountries();
});

// ... existing GovernoratesNotifier, CitiesNotifier, RegionsNotifier ...
// (Keep existing code for ZonesNotifier, CountriesNotifier, etc.)
final zonesProvider = StateNotifierProvider<ZonesNotifier, AsyncValue<List<ZoneEntity>>>(
  (ref) => ZonesNotifier(ref.read(geographicalDataRepositoryProvider)),
);

class ZonesNotifier extends StateNotifier<AsyncValue<List<ZoneEntity>>> {
    final GeographicalDataRepository _repo;
    ZonesNotifier(this._repo) : super(const AsyncValue.loading()) { getZones(); }
    Future<void> getZones() async { state = await AsyncValue.guard(() => _repo.getZones()); }
    Future<void> addZone(ZoneEntity z) async { await _repo.addZone(z); getZones(); }
    Future<void> updateZone(ZoneEntity z) async { await _repo.updateZone(z); getZones(); }
    Future<void> deleteZone(int id) async { await _repo.deleteZone(id); getZones(); }
}

final countriesProvider = StateNotifierProvider.family<CountriesNotifier, AsyncValue<List<CountryEntity>>, int>(
  (ref, zoneId) => CountriesNotifier(ref.read(geographicalDataRepositoryProvider), zoneId),
);

class CountriesNotifier extends StateNotifier<AsyncValue<List<CountryEntity>>> {
    final GeographicalDataRepository _repo;
    final int zoneId;
    CountriesNotifier(this._repo, this.zoneId) : super(const AsyncValue.loading()) { getCountries(); }
    Future<void> getCountries() async { state = await AsyncValue.guard(() => _repo.getCountries(zoneId)); }
    Future<void> addCountry(CountryEntity c) async { await _repo.addCountry(c); getCountries(); }
    Future<void> updateCountry(CountryEntity c) async { await _repo.updateCountry(c); getCountries(); }
    Future<void> deleteCountry(int id) async { await _repo.deleteCountry(id); getCountries(); }
}

final governoratesProvider = StateNotifierProvider.family<GovernoratesNotifier, AsyncValue<List<GovernorateEntity>>, int>(
  (ref, countryId) => GovernoratesNotifier(ref.read(geographicalDataRepositoryProvider), countryId),
);
class GovernoratesNotifier extends StateNotifier<AsyncValue<List<GovernorateEntity>>> {
     final GeographicalDataRepository _repo;
     final int countryId;
     GovernoratesNotifier(this._repo, this.countryId) : super(const AsyncValue.loading()) { getGovernorates(); }
     Future<void> getGovernorates() async { state = await AsyncValue.guard(() => _repo.getGovernorates(countryId)); }
     Future<void> addGovernorate(GovernorateEntity g) async { await _repo.addGovernorate(g); getGovernorates(); }
     Future<void> updateGovernorate(GovernorateEntity g) async { await _repo.updateGovernorate(g); getGovernorates(); }
     Future<void> deleteGovernorate(int id) async { await _repo.deleteGovernorate(id); getGovernorates(); }
}

final citiesProvider = StateNotifierProvider.family<CitiesNotifier, AsyncValue<List<CityEntity>>, int>(
  (ref, govId) => CitiesNotifier(ref.read(geographicalDataRepositoryProvider), govId),
);
class CitiesNotifier extends StateNotifier<AsyncValue<List<CityEntity>>> {
     final GeographicalDataRepository _repo;
     final int govId;
     CitiesNotifier(this._repo, this.govId) : super(const AsyncValue.loading()) { getCities(); }
     Future<void> getCities() async { state = await AsyncValue.guard(() => _repo.getCities(govId)); }
     Future<void> addCity(CityEntity c) async { await _repo.addCity(c); getCities(); }
     Future<void> updateCity(CityEntity c) async { await _repo.updateCity(c); getCities(); }
     Future<void> deleteCity(int id) async { await _repo.deleteCity(id); getCities(); }
}

final regionsProvider = StateNotifierProvider.family<RegionsNotifier, AsyncValue<List<RegionEntity>>, int>(
  (ref, cityId) => RegionsNotifier(ref.read(geographicalDataRepositoryProvider), cityId),
);
class RegionsNotifier extends StateNotifier<AsyncValue<List<RegionEntity>>> {
     final GeographicalDataRepository _repo;
     final int cityId;
     RegionsNotifier(this._repo, this.cityId) : super(const AsyncValue.loading()) { getRegions(); }
     Future<void> getRegions() async { state = await AsyncValue.guard(() => _repo.getRegions(cityId)); }
     Future<void> addRegion(RegionEntity r) async { await _repo.addRegion(r); getRegions(); }
     Future<void> updateRegion(RegionEntity r) async { await _repo.updateRegion(r); getRegions(); }
     Future<void> deleteRegion(int id) async { await _repo.deleteRegion(id); getRegions(); }
}
