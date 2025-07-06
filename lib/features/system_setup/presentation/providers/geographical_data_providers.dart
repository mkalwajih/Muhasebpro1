import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/core/di/database_provider.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/geographical_data_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/geographical_data_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/geographical_data_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/geographical_data_repository.dart';


// --- Data Source and Repository Providers ---

final geoLocalDataSourceProvider = Provider<GeographicalDataLocalDataSource>(
  (ref) => GeographicalDataLocalDataSourceImpl(ref.read(appDatabaseProvider)),
);

final geoRepositoryProvider = Provider<GeographicalDataRepository>(
  (ref) => GeographicalDataRepositoryImpl(ref.read(geoLocalDataSourceProvider)),
);

// --- State Notifier Providers for each hierarchy level ---

// Zones
final zonesProvider = StateNotifierProvider<ZonesNotifier, AsyncValue<List<ZoneEntity>>>(
  (ref) => ZonesNotifier(ref.read(geoRepositoryProvider)),
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
  (ref, zoneId) => CountriesNotifier(ref.read(geoRepositoryProvider), zoneId),
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

// And so on for Governorates, Cities, Regions...
