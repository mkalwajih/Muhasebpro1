import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_all_companies_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_company_info_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/save_company_info_usecase.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

// DI Providers
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
      final result = await _getCompanyInfo(const NoParams());
      result.fold(
        (failure) => state = AsyncValue.error(failure, StackTrace.current),
        (info) => state = AsyncValue.data(info),
      );
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
final companiesListProvider = FutureProvider<List<CompanyEntity>>((ref) async {
  final getAllCompanies = ref.watch(getAllCompaniesUseCaseProvider);
  final result = await getAllCompanies(const NoParams());
  return result.fold(
    (failure) => throw failure, // Or handle error appropriately
    (companies) => companies,
  );
});
