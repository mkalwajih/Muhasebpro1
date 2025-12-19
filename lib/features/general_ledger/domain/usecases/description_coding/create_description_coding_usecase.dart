import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../shared/domain/entities/failures.dart';
import '../../../../../shared/domain/interfaces/usecase.dart';
import '../../entities/description_coding_entity.dart';
import '../../repositories/gl_setup_repository.dart';

class CreateDescriptionCodingUseCase implements UseCase<void, CreateDescriptionCodingParams> {
  final GLSetupRepository repository;

  CreateDescriptionCodingUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateDescriptionCodingParams params) async {
    // Validate entity
    final validationErrors = params.descriptionCoding.validate();
    if (validationErrors.isNotEmpty) {
      return Left(DataIntegrityFailure(message: validationErrors.join(', ')));
    }

    // Check if description coding already exists
    final existingResult = await repository.getDescriptionCodingByCode(params.descriptionCoding.descCode);
    return existingResult.fold(
      (failure) => Left(failure),
      (existing) {
        if (existing != null) {
          return Left(DuplicateEntryFailure(message: 'Description coding with code ${params.descriptionCoding.descCode} already exists'));
        }
        return repository.createDescriptionCoding(params.descriptionCoding);
      },
    );
  }
}

class CreateDescriptionCodingParams extends Equatable {
  final DescriptionCodingEntity descriptionCoding;

  const CreateDescriptionCodingParams({required this.descriptionCoding});

  @override
  List<Object?> get props => [descriptionCoding];
}