import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/local/gl_setup_local_datasource.dart';
import '../../data/repositories/gl_setup_repository_impl.dart';
import '../../domain/entities/document_type_entity.dart';
import '../../domain/entities/description_coding_entity.dart';
import '../../domain/repositories/gl_setup_repository.dart';
import '../../domain/usecases/document_types/get_all_document_types_usecase.dart';
import '../../domain/usecases/document_types/create_document_type_usecase.dart';
import '../../domain/usecases/document_types/update_document_type_usecase.dart';
import '../../domain/usecases/document_types/delete_document_type_usecase.dart';
import '../../domain/usecases/description_coding/get_all_description_coding_usecase.dart';
import '../../domain/usecases/description_coding/create_description_coding_usecase.dart';
import '../../../../../shared/domain/interfaces/usecase.dart';

// Data Source Provider
final glSetupLocalDataSourceProvider = Provider<GLSetupLocalDataSource>((ref) {
  return GLSetupLocalDataSourceImpl();
});

// Repository Provider
final glSetupRepositoryProvider = Provider<GLSetupRepository>((ref) {
  final localDataSource = ref.watch(glSetupLocalDataSourceProvider);
  return GLSetupRepositoryImpl(localDataSource: localDataSource);
});

// Use Cases Providers
final getAllDocumentTypesUseCaseProvider = Provider<GetAllDocumentTypesUseCase>((ref) {
  final repository = ref.watch(glSetupRepositoryProvider);
  return GetAllDocumentTypesUseCase(repository);
});

final createDocumentTypeUseCaseProvider = Provider<CreateDocumentTypeUseCase>((ref) {
  final repository = ref.watch(glSetupRepositoryProvider);
  return CreateDocumentTypeUseCase(repository);
});

final updateDocumentTypeUseCaseProvider = Provider<UpdateDocumentTypeUseCase>((ref) {
  final repository = ref.watch(glSetupRepositoryProvider);
  return UpdateDocumentTypeUseCase(repository);
});

final deleteDocumentTypeUseCaseProvider = Provider<DeleteDocumentTypeUseCase>((ref) {
  final repository = ref.watch(glSetupRepositoryProvider);
  return DeleteDocumentTypeUseCase(repository);
});

final getAllDescriptionCodingUseCaseProvider = Provider<GetAllDescriptionCodingUseCase>((ref) {
  final repository = ref.watch(glSetupRepositoryProvider);
  return GetAllDescriptionCodingUseCase(repository);
});

final createDescriptionCodingUseCaseProvider = Provider<CreateDescriptionCodingUseCase>((ref) {
  final repository = ref.watch(glSetupRepositoryProvider);
  return CreateDescriptionCodingUseCase(repository);
});

// State Providers for Document Types
final documentTypesProvider = StateNotifierProvider<DocumentTypesNotifier, AsyncValue<List<DocumentTypeEntity>>>((ref) {
  final getAllUseCase = ref.watch(getAllDocumentTypesUseCaseProvider);
  final createUseCase = ref.watch(createDocumentTypeUseCaseProvider);
  final updateUseCase = ref.watch(updateDocumentTypeUseCaseProvider);
  final deleteUseCase = ref.watch(deleteDocumentTypeUseCaseProvider);
  
  return DocumentTypesNotifier(
    getAllUseCase: getAllUseCase,
    createUseCase: createUseCase,
    updateUseCase: updateUseCase,
    deleteUseCase: deleteUseCase,
  );
});

// State Providers for Description Coding
final descriptionCodingProvider = StateNotifierProvider<DescriptionCodingNotifier, AsyncValue<List<DescriptionCodingEntity>>>((ref) {
  final getAllUseCase = ref.watch(getAllDescriptionCodingUseCaseProvider);
  final createUseCase = ref.watch(createDescriptionCodingUseCaseProvider);
  
  return DescriptionCodingNotifier(
    getAllUseCase: getAllUseCase,
    createUseCase: createUseCase,
  );
});

// Search Providers
final documentTypesSearchProvider = StateProvider<String>((ref) => '');
final descriptionCodingSearchProvider = StateProvider<String>((ref) => '');

// Filtered Document Types Provider
final filteredDocumentTypesProvider = Provider<AsyncValue<List<DocumentTypeEntity>>>((ref) {
  final documentTypes = ref.watch(documentTypesProvider);
  final searchQuery = ref.watch(documentTypesSearchProvider);
  
  return documentTypes.when(
    data: (types) {
      if (searchQuery.isEmpty) {
        return AsyncValue.data(types);
      }
      final filtered = types.where((type) =>
        type.docTypeCode.toLowerCase().contains(searchQuery.toLowerCase()) ||
        type.nameAr.toLowerCase().contains(searchQuery.toLowerCase()) ||
        type.nameEn.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
      return AsyncValue.data(filtered);
    },
    loading: () => const AsyncValue.loading(),
    error: (error, stack) => AsyncValue.error(error, stack),
  );
});

// Filtered Description Coding Provider
final filteredDescriptionCodingProvider = Provider<AsyncValue<List<DescriptionCodingEntity>>>((ref) {
  final descriptionCoding = ref.watch(descriptionCodingProvider);
  final searchQuery = ref.watch(descriptionCodingSearchProvider);
  
  return descriptionCoding.when(
    data: (coding) {
      if (searchQuery.isEmpty) {
        return AsyncValue.data(coding);
      }
      final filtered = coding.where((desc) =>
        desc.descCode.toLowerCase().contains(searchQuery.toLowerCase()) ||
        desc.descriptionAr.toLowerCase().contains(searchQuery.toLowerCase()) ||
        desc.descriptionEn.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
      return AsyncValue.data(filtered);
    },
    loading: () => const AsyncValue.loading(),
    error: (error, stack) => AsyncValue.error(error, stack),
  );
});

// Document Types State Notifier
class DocumentTypesNotifier extends StateNotifier<AsyncValue<List<DocumentTypeEntity>>> {
  final GetAllDocumentTypesUseCase getAllUseCase;
  final CreateDocumentTypeUseCase createUseCase;
  final UpdateDocumentTypeUseCase updateUseCase;
  final DeleteDocumentTypeUseCase deleteUseCase;

  DocumentTypesNotifier({
    required this.getAllUseCase,
    required this.createUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
  }) : super(const AsyncValue.loading()) {
    loadDocumentTypes();
  }

  Future<void> loadDocumentTypes() async {
    state = const AsyncValue.loading();
    final result = await getAllUseCase(const NoParams());
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (documentTypes) => state = AsyncValue.data(documentTypes),
    );
  }

  Future<bool> createDocumentType(DocumentTypeEntity documentType) async {
    final result = await createUseCase(CreateDocumentTypeParams(documentType: documentType));
    return result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        return false;
      },
      (_) {
        loadDocumentTypes(); // Refresh the list
        return true;
      },
    );
  }

  Future<bool> updateDocumentType(DocumentTypeEntity documentType) async {
    final result = await updateUseCase(UpdateDocumentTypeParams(documentType: documentType));
    return result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        return false;
      },
      (_) {
        loadDocumentTypes(); // Refresh the list
        return true;
      },
    );
  }

  Future<bool> deleteDocumentType(String docTypeCode) async {
    final result = await deleteUseCase(DeleteDocumentTypeParams(docTypeCode: docTypeCode));
    return result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        return false;
      },
      (_) {
        loadDocumentTypes(); // Refresh the list
        return true;
      },
    );
  }
}

// Description Coding State Notifier
class DescriptionCodingNotifier extends StateNotifier<AsyncValue<List<DescriptionCodingEntity>>> {
  final GetAllDescriptionCodingUseCase getAllUseCase;
  final CreateDescriptionCodingUseCase createUseCase;

  DescriptionCodingNotifier({
    required this.getAllUseCase,
    required this.createUseCase,
  }) : super(const AsyncValue.loading()) {
    loadDescriptionCoding();
  }

  Future<void> loadDescriptionCoding() async {
    state = const AsyncValue.loading();
    final result = await getAllUseCase(const NoParams());
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (descriptionCoding) => state = AsyncValue.data(descriptionCoding),
    );
  }

  Future<bool> createDescriptionCoding(DescriptionCodingEntity descriptionCoding) async {
    final result = await createUseCase(CreateDescriptionCodingParams(descriptionCoding: descriptionCoding));
    return result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        return false;
      },
      (_) {
        loadDescriptionCoding(); // Refresh the list
        return true;
      },
    );
  }
}