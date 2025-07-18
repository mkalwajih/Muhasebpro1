import 'package:flutter_riverpod/flutter_riverpod';
import 'package:muhaseb_pro/di/database_provider.dart';
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

import 'auth_module.dart';

final generalParametersRepositoryProvider = Provider<GeneralParametersRepository>(
  (ref) => GeneralParametersRepositoryImpl(
    ref.watch(generalParametersLocalDataSourceProvider),
    ref.watch(appDatabaseProvider),
  ),
);

final generalParametersLocalDataSourceProvider =
    Provider<GeneralParametersLocalDataSource>(
  (ref) => GeneralParametersLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);

final companyInfoRepositoryProvider = Provider<CompanyInfoRepository>(
  (ref) => CompanyInfoRepositoryImpl(
    ref.watch(companyInfoLocalDataSourceProvider),
    ref.watch(appDatabaseProvider),
  ),
);

final companyInfoLocalDataSourceProvider = Provider<CompanyInfoLocalDataSource>(
  (ref) => CompanyInfoLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);

final branchesRepositoryProvider = Provider<BranchesRepository>(
  (ref) => BranchesRepositoryImpl(
    localDataSource: ref.watch(branchesLocalDataSourceProvider),
    database: ref.watch(appDatabaseProvider),
  ),
);

final branchesLocalDataSourceProvider = Provider<BranchesLocalDataSource>(
  (ref) => BranchesLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);

final geographicalDataRepositoryProvider = Provider<GeographicalDataRepository>(
  (ref) => GeographicalDataRepositoryImpl(
    ref.watch(geographicalDataLocalDataSourceProvider),
    ref.watch(appDatabaseProvider),
  ),
);

final geographicalDataLocalDataSourceProvider =
    Provider<GeographicalDataLocalDataSource>(
  (ref) => GeographicalDataLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);

final currenciesRepositoryProvider = Provider<CurrenciesRepository>(
  (ref) => CurrenciesRepositoryImpl(
    ref.watch(currenciesLocalDataSourceProvider),
  ),
);

final currenciesLocalDataSourceProvider = Provider<CurrenciesLocalDataSource>(
  (ref) => CurrenciesLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);

final taxRepositoryProvider = Provider<TaxRepository>(
  (ref) => TaxRepositoryImpl(
    ref.watch(taxLocalDataSourceProvider),
  ),
);

final taxLocalDataSourceProvider = Provider<TaxLocalDataSource>(
  (ref) => TaxLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);

final coaRepositoryProvider = Provider<CoaRepository>(
  (ref) => CoaRepositoryImpl(
    ref.watch(appDatabaseProvider),
  ),
);

final coaLocalDataSourceProvider = Provider<CoaLocalDataSource>(
  (ref) => CoaLocalDataSourceImpl(
    database: ref.watch(appDatabaseProvider),
  ),
);

final userManagementRepositoryProvider = Provider<UserManagementRepository>(
  (ref) => UserManagementRepositoryImpl(
    database: ref.watch(appDatabaseProvider),
    authLocalDataSource: ref.watch(authLocalDataSourceProvider),
  ),
);

final userManagementLocalDataSourceProvider =
    Provider<UserManagementLocalDataSource>(
  (ref) => UserManagementLocalDataSourceImpl(
    database: ref.watch(appDatabaseProvider),
  ),
);

final roleManagementRepositoryProvider = Provider<RoleManagementRepository>(
  (ref) => RoleManagementRepositoryImpl(ref.watch(appDatabaseProvider)),
);
