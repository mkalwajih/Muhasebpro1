import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/database_provider.dart';
import 'package:muhaseb_pro/di/modules/auth_providers.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/branches_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/coa_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/company_info_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/currencies_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/general_parameters_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/geographical_data_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/tax_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/local/user_management_local_datasource.dart';
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

// General Parameters
final generalParametersLocalDataSourceProvider = Provider<GeneralParametersLocalDataSource>(
  (ref) => GeneralParametersLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);
final generalParametersRepositoryProvider = Provider<GeneralParametersRepository>(
  (ref) => GeneralParametersRepositoryImpl(
    ref.watch(generalParametersLocalDataSourceProvider),
    ref.watch(appDatabaseProvider),
  ),
);

// Company Info
final companyInfoLocalDataSourceProvider = Provider<CompanyInfoLocalDataSource>(
  (ref) => CompanyInfoLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);
final companyInfoRepositoryProvider = Provider<CompanyInfoRepository>(
  (ref) => CompanyInfoRepositoryImpl(
    ref.watch(companyInfoLocalDataSourceProvider),
    ref.watch(appDatabaseProvider),
  ),
);

// Branches
final branchesLocalDataSourceProvider = Provider<BranchesLocalDataSource>(
  (ref) => BranchesLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);
final branchesRepositoryProvider = Provider<BranchesRepository>(
  (ref) => BranchesRepositoryImpl(
    localDataSource: ref.watch(branchesLocalDataSourceProvider),
    database: ref.watch(appDatabaseProvider),
  ),
);

// Geographical Data
final geographicalDataLocalDataSourceProvider = Provider<GeographicalDataLocalDataSource>(
  (ref) => GeographicalDataLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);
final geographicalDataRepositoryProvider = Provider<GeographicalDataRepository>(
  (ref) => GeographicalDataRepositoryImpl(
    ref.watch(geographicalDataLocalDataSourceProvider),
    ref.watch(appDatabaseProvider),
  ),
);

// Currencies
final currenciesLocalDataSourceProvider = Provider<CurrenciesLocalDataSource>(
  (ref) => CurrenciesLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);
final currenciesRepositoryProvider = Provider<CurrenciesRepository>(
  (ref) => CurrenciesRepositoryImpl(
    ref.watch(currenciesLocalDataSourceProvider),
  ),
);

// Tax
final taxLocalDataSourceProvider = Provider<TaxLocalDataSource>(
  (ref) => TaxLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);
final taxRepositoryProvider = Provider<TaxRepository>(
  (ref) => TaxRepositoryImpl(
    ref.watch(taxLocalDataSourceProvider),
  ),
);

// Chart of Accounts (COA)
final coaLocalDataSourceProvider = Provider<CoaLocalDataSource>(
  (ref) => CoaLocalDataSourceImpl(
    database: ref.watch(appDatabaseProvider),
    authLocalDataSource: ref.watch(authLocalDataSourceProvider),
  ),
);
final coaRepositoryProvider = Provider<CoaRepository>(
  (ref) => CoaRepositoryImpl(
    ref.watch(coaLocalDataSourceProvider),
    ref.watch(appDatabaseProvider),
  ),
);

// User Management
final userManagementLocalDataSourceProvider = Provider<UserManagementLocalDataSource>(
  (ref) => UserManagementLocalDataSource(ref.watch(appDatabaseProvider)),
);
final userManagementRepositoryProvider = Provider<UserManagementRepository>(
  (ref) => UserManagementRepositoryImpl(
    ref.watch(userManagementLocalDataSourceProvider),
    ref.watch(appDatabaseProvider),
  ),
);

// Role Management
final roleManagementRepositoryProvider = Provider<RoleManagementRepository>(
  (ref) => RoleManagementRepositoryImpl(ref.watch(appDatabaseProvider)),
);
