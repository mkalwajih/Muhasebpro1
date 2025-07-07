import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/geographical_data_repository.dart';

// --- State Notifier Providers for each hierarchy level ---

// Zones
final zonesProvider = StateNotifierProvider<ZonesNotifier, AsyncValue<List<ZoneEntity>>>(
  (ref) => ZonesNotifier(ref.read(geographicalDataRepositoryProvider)),
);

class ZonesNotifier extends StateNotifier<AsyncValue<List<ZoneEntity>>> {
  final GeographicalDataRepository _repo;
  ZonesNotifier(this._repo) : super(const AsyncValue.loading()) {
    getZones();
  }
  Future<void> getZones() async {
    try {
      state = const AsyncValue.loading();
      final zones = await _repo.getZones();
      state = AsyncValue.data(zones);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<void> addZone(ZoneEntity zone) async => _repo.addZone(zone).then((_) => getZones());
  Future<void> updateZone(ZoneEntity zone) async => _repo.updateZone(zone).then((_) => getZones());
  Future<void> deleteZone(int id) async => _repo.deleteZone(id).then((_) => getZones());
}

// Countries
final countriesProvider = StateNotifierProvider.family<CountriesNotifier, AsyncValue<List<CountryEntity>>, int>(
  (ref, zoneId) => CountriesNotifier(ref.read(geographicalDataRepositoryProvider), zoneId),
);

class CountriesNotifier extends StateNotifier<AsyncValue<List<CountryEntity>>> {
  final GeographicalDataRepository _repo;
  final int zoneId;
  CountriesNotifier(this._repo, this.zoneId) : super(const AsyncValue.loading()) {
    getCountries();
  }
  Future<void> getCountries() async {
     try {
      state = const AsyncValue.loading();
      final countries = await _repo.getCountries(zoneId);
      state = AsyncValue.data(countries);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<void> addCountry(CountryEntity country) async => _repo.addCountry(country).then((_) => getCountries());
  Future<void> updateCountry(CountryEntity country) async => _repo.updateCountry(country).then((_) => getCountries());
  Future<void> deleteCountry(int id) async => _repo.deleteCountry(id).then((_) => getCountries());
}

// Governorates
final governoratesProvider = StateNotifierProvider.family<GovernoratesNotifier, AsyncValue<List<GovernorateEntity>>, int>(
  (ref, countryId) => GovernoratesNotifier(ref.read(geographicalDataRepositoryProvider), countryId),
);

class GovernoratesNotifier extends StateNotifier<AsyncValue<List<GovernorateEntity>>> {
  final GeographicalDataRepository _repo;
  final int countryId;
  GovernoratesNotifier(this._repo, this.countryId) : super(const AsyncValue.loading()) {
    getGovernorates();
  }
  Future<void> getGovernorates() async {
     try {
      state = const AsyncValue.loading();
      final governorates = await _repo.getGovernorates(countryId);
      state = AsyncValue.data(governorates);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<void> addGovernorate(GovernorateEntity governorate) async => _repo.addGovernorate(governorate).then((_) => getGovernorates());
  Future<void> updateGovernorate(GovernorateEntity governorate) async => _repo.updateGovernorate(governorate).then((_) => getGovernorates());
  Future<void> deleteGovernorate(int id) async => _repo.deleteGovernorate(id).then((_) => getGovernorates());
}

// Cities
final citiesProvider = StateNotifierProvider.family<CitiesNotifier, AsyncValue<List<CityEntity>>, int>(
  (ref, governorateId) => CitiesNotifier(ref.read(geographicalDataRepositoryProvider), governorateId),
);

class CitiesNotifier extends StateNotifier<AsyncValue<List<CityEntity>>> {
  final GeographicalDataRepository _repo;
  final int governorateId;
  CitiesNotifier(this._repo, this.governorateId) : super(const AsyncValue.loading()) {
    getCities();
  }
  Future<void> getCities() async {
     try {
      state = const AsyncValue.loading();
      final cities = await _repo.getCities(governorateId);
      state = AsyncValue.data(cities);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<void> addCity(CityEntity city) async => _repo.addCity(city).then((_) => getCities());
  Future<void> updateCity(CityEntity city) async => _repo.updateCity(city).then((_) => getCities());
  Future<void> deleteCity(int id) async => _repo.deleteCity(id).then((_) => getCities());
}

// Regions
final regionsProvider = StateNotifierProvider.family<RegionsNotifier, AsyncValue<List<RegionEntity>>, int>(
  (ref, cityId) => RegionsNotifier(ref.read(geographicalDataRepositoryProvider), cityId),
);

class RegionsNotifier extends StateNotifier<AsyncValue<List<RegionEntity>>> {
  final GeographicalDataRepository _repo;
  final int cityId;
  RegionsNotifier(this._repo, this.cityId) : super(const AsyncValue.loading()) {
    getRegions();
  }
  Future<void> getRegions() async {
     try {
      state = const AsyncValue.loading();
      final regions = await _repo.getRegions(cityId);
      state = AsyncValue.data(regions);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<void> addRegion(RegionEntity region) async => _repo.addRegion(region).then((_) => getRegions());
  Future<void> updateRegion(RegionEntity region) async => _repo.updateRegion(region).then((_) => getRegions());
  Future<void> deleteRegion(int id) async => _repo.deleteRegion(id).then((_) => getRegions());
}
