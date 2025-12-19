import 'package:dartz/dartz.dart';
import '../../../../shared/domain/entities/failures.dart';
import '../../../../shared/utils/exceptions/exceptions.dart';
import '../../domain/entities/document_type_entity.dart';
import '../../domain/entities/description_coding_entity.dart';
import '../../domain/repositories/gl_setup_repository.dart';
import '../datasources/local/gl_setup_local_datasource.dart';
import '../models/document_type_model.dart';
import '../models/description_coding_model.dart';

class GLSetupRepositoryImpl implements GLSetupRepository {
  final GLSetupLocalDataSource localDataSource;

  GLSetupRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<DocumentTypeEntity>>> getAllDocumentTypes() async {
    try {
      final models = await localDataSource.getAllDocumentTypes();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<DocumentTypeEntity>>> getActiveDocumentTypes() async {
    try {
      final models = await localDataSource.getActiveDocumentTypes();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, DocumentTypeEntity?>> getDocumentTypeByCode(String code) async {
    try {
      final model = await localDataSource.getDocumentTypeByCode(code);
      return Right(model?.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> createDocumentType(DocumentTypeEntity documentType) async {
    try {
      final model = DocumentTypeModel.fromEntity(documentType);
      await localDataSource.createDocumentType(model);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateDocumentType(DocumentTypeEntity documentType) async {
    try {
      final model = DocumentTypeModel.fromEntity(documentType);
      await localDataSource.updateDocumentType(model);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDocumentType(String code) async {
    try {
      await localDataSource.deleteDocumentType(code);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isDocumentTypeUsedInTransactions(String code) async {
    try {
      final isUsed = await localDataSource.isDocumentTypeUsedInTransactions(code);
      return Right(isUsed);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<DescriptionCodingEntity>>> getAllDescriptionCoding() async {
    try {
      final models = await localDataSource.getAllDescriptionCoding();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<DescriptionCodingEntity>>> getDescriptionCodingByAccount(String? accountId) async {
    try {
      final models = await localDataSource.getDescriptionCodingByAccount(accountId);
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, DescriptionCodingEntity?>> getDescriptionCodingByCode(String code) async {
    try {
      final model = await localDataSource.getDescriptionCodingByCode(code);
      return Right(model?.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> createDescriptionCoding(DescriptionCodingEntity descriptionCoding) async {
    try {
      final model = DescriptionCodingModel.fromEntity(descriptionCoding);
      await localDataSource.createDescriptionCoding(model);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateDescriptionCoding(DescriptionCodingEntity descriptionCoding) async {
    try {
      final model = DescriptionCodingModel.fromEntity(descriptionCoding);
      await localDataSource.updateDescriptionCoding(model);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDescriptionCoding(String code) async {
    try {
      await localDataSource.deleteDescriptionCoding(code);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<DocumentTypeEntity>>> searchDocumentTypes(String query) async {
    try {
      final models = await localDataSource.searchDocumentTypes(query);
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<DescriptionCodingEntity>>> searchDescriptionCoding(String query) async {
    try {
      final models = await localDataSource.searchDescriptionCoding(query);
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }
}