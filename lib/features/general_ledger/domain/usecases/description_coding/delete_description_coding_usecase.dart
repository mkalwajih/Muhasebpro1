import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../shared/domain/entities/failures.dart';
import '../../../../../shared/domain/interfaces/usecase.dart';
import '../../repositories/gl_setup_repository.dart';

class DeleteDescriptionCodingUseCase implements UseCase<void, DeleteDescriptionCodingParams> {
  final GLSetupRepository repository;

  DeleteDescriptionCodingUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteDescriptionCodingParams params) async {
    // Check if description coding exists
    final existingResult = await repository.getDescriptionCodingByCode(params.descCode);
    return existingResult.fold(
      (failure) => Left(failure),
      (existing) async {
        if (existing == null) {
          return Left(NotFoundFailure(message: 'Description coding with code ${params.descCode} not found'));
        }

        // Check if description coding is used in transactions
        final isUsedResult = await repository.isDescriptionCodingUsedInTransactions(params.descCode);
        return isUsedResult.fold(
          (failure) => Left(failure),
          (isUsed) {
            if (isUsed) {
              return Left(DataIntegrityFailure(
                message: 'Cannot delete description coding ${params.descCode} as it is used in transactions',
              ));
            }
            return repository.deleteDescriptionCoding(params.descCode);
          },
        );
      },
    );
  }
}

class DeleteDescriptionCodingParams extends Equatable {
  final String descCode;

  const DeleteDescriptionCodingParams({required this.descCode});

  @override
  List<Object?> get props => [descCode];
}