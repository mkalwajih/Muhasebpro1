import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/data/datasources/tax_local_datasource.dart';
import 'package:muhaseb_pro/features/system_setup/data/repositories/tax_repository_impl.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/tax_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/repositories/tax_repository.dart';
import 'package:muhaseb_pro/core/di/database_provider.dart';

final taxLocalDataSourceProvider = Provider<TaxLocalDataSource>(
  (ref) => TaxLocalDataSourceImpl(ref.read(databaseProvider)),
);

final taxRepositoryProvider = Provider<TaxRepository>(
  (ref) => TaxRepositoryImpl(ref.read(taxLocalDataSourceProvider)),
);

final taxBracketsProvider = StateNotifierProvider<TaxBracketsNotifier, AsyncValue<List<TaxBracketEntity>>>((ref) {
  return TaxBracketsNotifier(ref.read(taxRepositoryProvider));
});

class TaxBracketsNotifier extends StateNotifier<AsyncValue<List<TaxBracketEntity>>> {
  final TaxRepository _repository;

  TaxBracketsNotifier(this._repository) : super(const AsyncValue.loading()) {
    getTaxBrackets();
  }

  Future<void> getTaxBrackets() async {
    try {
      final taxBrackets = await _repository.getTaxBrackets();
      state = AsyncValue.data(taxBrackets);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addTaxBracket(TaxBracketEntity taxBracket) async {
    await _repository.addTaxBracket(taxBracket);
    getTaxBrackets();
  }

  Future<void> updateTaxBracket(TaxBracketEntity taxBracket) async {
    await _repository.updateTaxBracket(taxBracket);
    getTaxBrackets();
  }

  Future<void> deleteTaxBracket(String bracketCode) async {
    await _repository.deleteTaxBracket(bracketCode);
    getTaxBrackets();
  }
}

final taxTypesProvider = StateNotifierProvider<TaxTypesNotifier, AsyncValue<List<TaxTypeEntity>>>((ref) {
  return TaxTypesNotifier(ref.read(taxRepositoryProvider));
});

class TaxTypesNotifier extends StateNotifier<AsyncValue<List<TaxTypeEntity>>> {
  final TaxRepository _repository;

  TaxTypesNotifier(this._repository) : super(const AsyncValue.loading()) {
    getTaxTypes();
  }

  Future<void> getTaxTypes() async {
    try {
      final taxTypes = await _repository.getTaxTypes();
      state = AsyncValue.data(taxTypes);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addTaxType(TaxTypeEntity taxType) async {
    await _repository.addTaxType(taxType);
    getTaxTypes();
  }

  Future<void> updateTaxType(TaxTypeEntity taxType) async {
    await _repository.updateTaxType(taxType);
    getTaxTypes();
  }

  Future<void> deleteTaxType(String typeCode) async {
    await _repository.deleteTaxType(typeCode);
    getTaxTypes();
  }
}

final taxCalcMethodsProvider = StateNotifierProvider<TaxCalcMethodsNotifier, AsyncValue<List<TaxCalcMethodEntity>>>((ref) {
  return TaxCalcMethodsNotifier(ref.read(taxRepositoryProvider));
});

class TaxCalcMethodsNotifier extends StateNotifier<AsyncValue<List<TaxCalcMethodEntity>>> {
  final TaxRepository _repository;

  TaxCalcMethodsNotifier(this._repository) : super(const AsyncValue.loading()) {
    getTaxCalcMethods();
  }

  Future<void> getTaxCalcMethods() async {
    try {
      final taxCalcMethods = await _repository.getTaxCalcMethods();
      state = AsyncValue.data(taxCalcMethods);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addTaxCalcMethod(TaxCalcMethodEntity taxCalcMethod) async {
    await _repository.addTaxCalcMethod(taxCalcMethod);
    getTaxCalcMethods();
  }

  Future<void> updateTaxCalcMethod(TaxCalcMethodEntity taxCalcMethod) async {
    await _repository.updateTaxCalcMethod(taxCalcMethod);
    getTaxCalcMethods();
  }

  Future<void> deleteTaxCalcMethod(String methodCode) async {
    await _repository.deleteTaxCalcMethod(methodCode);
    getTaxCalcMethods();
  }
}
