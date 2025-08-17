import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

import 'package:muhaseb_pro/di/modules/system_setup_module.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/add_company_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/delete_company_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_all_companies_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/get_company_info_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/save_company_info_usecase.dart';
import 'package:muhaseb_pro/features/system_setup/domain/usecases/update_company_usecase.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';
import 'package:muhaseb_pro/shared/domain/interfaces/usecase.dart';

// DI Providers for Use Cases
final getCompanyInfoUseCaseProvider = Provider<GetCompanyInfoUseCase>(
    (ref) => GetCompanyInfoUseCase(ref.watch(companyInfoRepositoryProvider)));

final saveCompanyInfoUseCaseProvider = Provider<SaveCompanyInfoUseCase>(
    (ref) => SaveCompanyInfoUseCase(ref.watch(companyInfoRepositoryProvider)));

final addCompanyUseCaseProvider = Provider<AddCompanyUseCase>(
    (ref) => AddCompanyUseCase(ref.watch(companyInfoRepositoryProvider)));

final updateCompanyUseCaseProvider = Provider<UpdateCompanyUseCase>(
    (ref) => UpdateCompanyUseCase(ref.watch(companyInfoRepositoryProvider)));

final deleteCompanyUseCaseProvider = Provider<DeleteCompanyUseCase>(
    (ref) => DeleteCompanyUseCase(ref.watch(companyInfoRepositoryProvider)));

final getAllCompaniesUseCaseProvider = Provider<GetAllCompaniesUseCase>(
    (ref) => GetAllCompaniesUseCase(ref.watch(companyInfoRepositoryProvider)));


// Companies List and Management Provider
final companiesProvider = StateNotifierProvider<CompaniesNotifier, AsyncValue<List<CompanyEntity>>>((ref) {
  return CompaniesNotifier(
    ref.watch(getAllCompaniesUseCaseProvider),
    ref.watch(addCompanyUseCaseProvider),
    ref.watch(updateCompanyUseCaseProvider),
    ref.watch(deleteCompanyUseCaseProvider),
  );
});

class CompaniesNotifier extends StateNotifier<AsyncValue<List<CompanyEntity>>> {
  final GetAllCompaniesUseCase _getAllCompanies;
  final AddCompanyUseCase _addCompany;
  final UpdateCompanyUseCase _updateCompany;
  final DeleteCompanyUseCase _deleteCompany;

  CompaniesNotifier(
    this._getAllCompanies,
    this._addCompany,
    this._updateCompany,
    this._deleteCompany,
  ) : super(const AsyncValue.loading()) {
    _fetchCompanies();
  }

  Future<void> _fetchCompanies() async {
    state = const AsyncValue.loading();
    final result = await _getAllCompanies(const NoParams());
    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (companies) => AsyncValue.data(companies),
    );
  }

  Future<Either<Failure, void>> addCompany(CompanyInfoEntity company) async {
    final result = await _addCompany(company);
    result.fold(
      (failure) {},
      (_) => _fetchCompanies(), // Refresh list on success
    );
    return result;
  }

  Future<Either<Failure, void>> updateCompany(CompanyInfoEntity company) async {
    final result = await _updateCompany(company);
    result.fold(
      (failure) {},
      (_) => _fetchCompanies(), // Refresh list on success
    );
    return result;
  }

  Future<Either<Failure, void>> deleteCompany(int id) async {
    final result = await _deleteCompany(id);
    result.fold(
      (failure) {},
      (_) => _fetchCompanies(), // Refresh list on success
    );
    return result;
  }

  // Optional: Provider for a single selected company, if needed by the UI
  // This can be managed directly in the UI screen's state, or via another provider
  // final selectedCompanyProvider = StateProvider<CompanyEntity?>((ref) => null);
}

// For the single company view (e.g., initial setup or if only one company is managed)
// This provider might become redundant if all company management moves to companiesProvider
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

  Future<Either<Failure, bool>> saveCompanyInfo(CompanyInfoEntity info) async {
    final result = await _saveCompanyInfo(info);
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (success) {
        if (success) fetchCompanyInfo();
        state = AsyncValue.data(info); // Update UI immediately if save is true
      },
    );
    return result;
  }
}
