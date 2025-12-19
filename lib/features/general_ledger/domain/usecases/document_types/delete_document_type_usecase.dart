import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../shared/domain/entities/failures.dart';
import '../../../../../shared/domain/interfaces/usecase.dart';
import '../../repositories/gl_setup_repository.dart';

class DeleteDocumentTypeUseCase implements UseCase<void, DeleteDocumentTypeParams> {
  final GLSetupRepository repository;

  DeleteDocumentTypeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteDocumentTypeParams params) async {
    // Check if document type exists
    final existingResult = await repository.getDocumentTypeByCode(params.docTypeCode);
    return existingResult.fold(
      (failure) => Left(failure),
      (existing) async {
        if (existing == null) {
          return Left(NotFoundFailure(message: 'Document type with code ${params.docTypeCode} not found'));
        }

        // Check if document type is used in transactions
        final isUsedResult = await repository.isDocumentTypeUsedInTransactions(params.docTypeCode);
        return isUsedResult.fold(
          (failure) => Left(failure),
          (isUsed) {
            if (isUsed) {
              return Left(DataIntegrityFailure(
                message: 'Cannot delete document type ${params.docTypeCode} as it is used in transactions',
              ));
            }
            return repository.deleteDocumentType(params.docTypeCode);
          },
        );
      },
    );
  }
}

class DeleteDocumentTypeParams extends Equatable {
  final String docTypeCode;

  const DeleteDocumentTypeParams({required this.docTypeCode});

  @override
  List<Object?> get props => [docTypeCode];
}