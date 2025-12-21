import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../shared/domain/entities/failures.dart';
import '../../../../../shared/domain/interfaces/usecase.dart';
import '../../entities/document_type_entity.dart';
import '../../repositories/gl_setup_repository.dart';

class UpdateDocumentTypeUseCase implements UseCase<void, UpdateDocumentTypeParams> {
  final GLSetupRepository repository;

  UpdateDocumentTypeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateDocumentTypeParams params) async {
    // Validate entity
    final validationErrors = params.documentType.validate();
    if (validationErrors.isNotEmpty) {
      return Left(DataIntegrityFailure(message: validationErrors.join(', ')));
    }

    // Check if document type exists
    final existingResult = await repository.getDocumentTypeByCode(params.documentType.docTypeCode);
    return existingResult.fold(
      (failure) => Left(failure),
      (existing) {
        if (existing == null) {
          return Left(NotFoundFailure(message: 'Document type with code ${params.documentType.docTypeCode} not found'));
        }
        return repository.updateDocumentType(params.documentType);
      },
    );
  }
}

class UpdateDocumentTypeParams extends Equatable {
  final DocumentTypeEntity documentType;

  const UpdateDocumentTypeParams({required this.documentType});

  @override
  List<Object?> get props => [documentType];
}