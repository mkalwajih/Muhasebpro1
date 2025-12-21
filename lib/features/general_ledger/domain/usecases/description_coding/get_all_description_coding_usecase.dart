import 'package:dartz/dartz.dart';
import '../../../../../shared/domain/entities/failures.dart';
import '../../../../../shared/domain/interfaces/usecase.dart';
import '../../entities/description_coding_entity.dart';
import '../../repositories/gl_setup_repository.dart';

class GetAllDescriptionCodingUseCase implements UseCase<List<DescriptionCodingEntity>, NoParams> {
  final GLSetupRepository repository;

  GetAllDescriptionCodingUseCase(this.repository);

  @override
  Future<Either<Failure, List<DescriptionCodingEntity>>> call(NoParams params) async {
    return await repository.getAllDescriptionCoding();
  }
}