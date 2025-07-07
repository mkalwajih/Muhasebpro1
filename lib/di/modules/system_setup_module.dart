import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/branches_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/company_info_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/currencies_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/general_parameters_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/geographical_data_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/tax_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/branches_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/coa_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/company_info_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/currencies_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/general_parameters_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/geographical_data_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/role_management_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/tax_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/user_management_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/branches_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/coa_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/currencies_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/general_parameters_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/geographical_data_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/role_management_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/tax_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/user_management_repository.dart';

// --- DataSources ---
final branchesLocalDataSourceProvider = Provider<BranchesLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return BranchesLocalDataSource(db);
});

final companyInfoLocalDataSourceProvider = Provider<CompanyInfoLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CompanyInfoLocalDataSource(db);
});

final currenciesLocalDataSourceProvider = Provider<CurrenciesLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CurrenciesLocalDataSource(db);
});

final generalParametersLocalDataSourceProvider = Provider<GeneralParametersLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return GeneralParametersLocalDataSource(db);
});

final geographicalDataLocalDataSourceProvider = Provider<GeographicalDataLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return GeographicalDataLocalDataSource(db);
});

final taxLocalDataSourceProvider = Provider<TaxLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return TaxLocalDataSource(db);
});

// --- Repositories ---
final branchesRepositoryProvider = Provider<BranchesRepository>((ref) {
  final localDataSource = ref.watch(branchesLocalDataSourceProvider);
  return BranchesRepositoryImpl(localDataSource);
});

final coaRepositoryProvider = Provider<CoaRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CoaRepositoryImpl(db);
});

final companyInfoRepositoryProvider = Provider<CompanyInfoRepository>((ref) {
  final localDataSource = ref.watch(companyInfoLocalDataSourceProvider);
  return CompanyInfoRepositoryImpl(localDataSource);
});

final currenciesRepositoryProvider = Provider<CurrenciesRepository>((ref) {
  final localDataSource = ref.watch(currenciesLocalDataSourceProvider);
  return CurrenciesRepositoryImpl(localDataSource);
});

final generalParametersRepositoryProvider = Provider<GeneralParametersRepository>((ref) {
  final localDataSource = ref.watch(generalParametersLocalDataSourceProvider);
  return GeneralParametersRepositoryImpl(localDataSource);
});

final geographicalDataRepositoryProvider = Provider<GeographicalDataRepository>((ref) {
  final localDataSource = ref.watch(geographicalDataLocalDataSourceProvider);
  return GeographicalDataRepositoryImpl(localDataSource);
});

final roleManagementRepositoryProvider = Provider<RoleManagementRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return RoleManagementRepositoryImpl(db);
});

final taxRepositoryProvider = Provider<TaxRepository>((ref) {
  final localDataSource = ref.watch(taxLocalDataSourceProvider);
  return TaxRepositoryImpl(localDataSource);
});

final userManagementRepositoryProvider = Provider<UserManagementRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return UserManagementRepositoryImpl(db);
});
