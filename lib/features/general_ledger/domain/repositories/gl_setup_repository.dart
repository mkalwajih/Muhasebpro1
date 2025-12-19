import 'package:dartz/dartz.dart';
import '../../../../shared/domain/entities/failures.dart';
import '../entities/document_type_entity.dart';
import '../entities/description_coding_entity.dart';

/// Repository interface for General Ledger Setup operations
abstract class GLSetupRepository {
  // Document Types operations
  Future<Either<Failure, List<DocumentTypeEntity>>> getAllDocumentTypes();
  Future<Either<Failure, List<DocumentTypeEntity>>> getActiveDocumentTypes();
  Future<Either<Failure, DocumentTypeEntity?>> getDocumentTypeByCode(String code);
  Future<Either<Failure, void>> createDocumentType(DocumentTypeEntity documentType);
  Future<Either<Failure, void>> updateDocumentType(DocumentTypeEntity documentType);
  Future<Either<Failure, void>> deleteDocumentType(String code);
  Future<Either<Failure, bool>> isDocumentTypeUsedInTransactions(String code);

  // Description Coding operations
  Future<Either<Failure, List<DescriptionCodingEntity>>> getAllDescriptionCoding();
  Future<Either<Failure, List<DescriptionCodingEntity>>> getDescriptionCodingByAccount(String? accountId);
  Future<Either<Failure, DescriptionCodingEntity?>> getDescriptionCodingByCode(String code);
  Future<Either<Failure, void>> createDescriptionCoding(DescriptionCodingEntity descriptionCoding);
  Future<Either<Failure, void>> updateDescriptionCoding(DescriptionCodingEntity descriptionCoding);
  Future<Either<Failure, void>> deleteDescriptionCoding(String code);

  // Search operations
  Future<Either<Failure, List<DocumentTypeEntity>>> searchDocumentTypes(String query);
  Future<Either<Failure, List<DescriptionCodingEntity>>> searchDescriptionCoding(String query);
}