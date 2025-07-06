import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/core/di/database_provider.dart';
import 'package:muhaseb_pro/core/usecases/usecase.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/company_info_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/company_info_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/company_info_repository.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_all_companies_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_company_info_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/save_company_info_usecase.dart';

// DI Providers
final companyInfoLocalDataSourceProvider = Provider<CompanyInfoLocalDataSource>(
    (ref) => CompanyInfoLocalDataSourceImpl(ref.watch(appDatabaseProvider)));

final companyInfoRepositoryProvider = Provider<CompanyInfoRepository>(
    (ref) => CompanyInfoRepositoryImpl(ref.watch(companyInfoLocalDataSourceProvider)));

final getCompanyInfoUseCaseProvider = Provider<GetCompanyInfoUseCase>(
    (ref) => GetCompanyInfoUseCase(ref.watch(companyInfoRepositoryProvider)));

final saveCompanyInfoUseCaseProvider = Provider<SaveCompanyInfoUseCase>(
    (ref) => SaveCompanyInfoUseCase(ref.watch(companyInfoRepositoryProvider)));

final getAllCompaniesUseCaseProvider = Provider<GetAllCompaniesUseCase>(
    (ref) => GetAllCompaniesUseCase(ref.watch(companyInfoRepositoryProvider)));


// State Notifier
final companyInfoProvider = StateNotifierProvider<CompanyInfoNotifier, AsyncValue<CompanyInfoEntity?>>((ref) {
  return CompanyInfoNotifier(
      ref.watch(getCompanyInfoUseCaseProvider),
      ref.watch(saveCompanyInfoUseCaseProvider)
  );
});

class CompanyInfoNotifier extends StateNotifier<AsyncValue<CompanyInfoEntity?>> {
  final GetCompanyInfoUseCase _getCompanyInfo;
  final SaveCompanyInfoUseCase _saveCompanyInfo;

  CompanyInfoNotifier(this._getCompanyInfo, this._saveCompanyInfo)
      : super(const AsyncValue.loading()) {
    fetchCompanyInfo();
  }

  Future<void> fetchCompanyInfo() async {
    state = const AsyncValue.loading();
    try {
      final info = await _getCompanyInfo();
      state = AsyncValue.data(info);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> saveCompanyInfo(CompanyInfoEntity info) async {
    await _saveCompanyInfo(info);
    // Refresh the state after saving
    await fetchCompanyInfo();
  }
}

// Companies List Provider
final companiesListProvider = FutureProvider<List<Company>>((ref) async {
  final getAllCompanies = ref.watch(getAllCompaniesUseCaseProvider);
  final result = await getAllCompanies(NoParams());
  return result.fold(
    (failure) => throw failure, // Or handle error appropriately
    (companies) => companies,
  );
});
