import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../shared/domain/entities/failures.dart';
import '../../../../../shared/domain/interfaces/usecase.dart';
import '../../entities/document_type_entity.dart';
import '../../repositories/gl_setup_repository.dart';

class CreateDocumentTypeUseCase implements UseCase<void, CreateDocumentTypeParams> {
  final GLSetupRepository repository;

  CreateDocumentTypeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateDocumentTypeParams params) async {
    // Validate entity
    final validationErrors = params.documentType.validate();
    if (validationErrors.isNotEmpty) {
      return Left(DataIntegrityFailure(message: validationErrors.join(', ')));
    }

    // Check if document type already exists
    final existingResult = await repository.getDocumentTypeByCode(params.documentType.docTypeCode);
    return existingResult.fold(
      (failure) => Left(failure),
      (existing) {
        if (existing != null) {
          return Left(DuplicateEntryFailure(message: 'Document type with code ${params.documentType.docTypeCode} already exists'));
        }
        return repository.createDocumentType(params.documentType);
      },
    );
  }
}

class CreateDocumentTypeParams extends Equatable {
  final DocumentTypeEntity documentType;

  const CreateDocumentTypeParams({required this.documentType});

  @override
  List<Object?> get props => [documentType];
}