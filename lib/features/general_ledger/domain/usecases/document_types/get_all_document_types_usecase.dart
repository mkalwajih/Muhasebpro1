import 'package:dartz/dartz.dart';
import '../../../../../shared/domain/entities/failures.dart';
import '../../../../../shared/domain/interfaces/usecase.dart';
import '../../entities/document_type_entity.dart';
import '../../repositories/gl_setup_repository.dart';

class GetAllDocumentTypesUseCase implements UseCase<List<DocumentTypeEntity>, NoParams> {
  final GLSetupRepository repository;

  GetAllDocumentTypesUseCase(this.repository);

  @override
  Future<Either<Failure, List<DocumentTypeEntity>>> call(NoParams params) async {
    return await repository.getAllDocumentTypes();
  }
}