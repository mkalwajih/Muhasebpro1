import '../../../../../shared/utils/exceptions/exceptions.dart';
import '../../models/document_type_model.dart';
import '../../models/description_coding_model.dart';

abstract class GLSetupLocalDataSource {
  // Document Types operations
  Future<List<DocumentTypeModel>> getAllDocumentTypes();
  Future<List<DocumentTypeModel>> getActiveDocumentTypes();
  Future<DocumentTypeModel?> getDocumentTypeByCode(String code);
  Future<void> createDocumentType(DocumentTypeModel documentType);
  Future<void> updateDocumentType(DocumentTypeModel documentType);
  Future<void> deleteDocumentType(String code);
  Future<bool> isDocumentTypeUsedInTransactions(String code);

  // Description Coding operations
  Future<List<DescriptionCodingModel>> getAllDescriptionCoding();
  Future<List<DescriptionCodingModel>> getDescriptionCodingByAccount(String? accountId);
  Future<DescriptionCodingModel?> getDescriptionCodingByCode(String code);
  Future<bool> isDescriptionCodingUsedInTransactions(String code);
  Future<void> createDescriptionCoding(DescriptionCodingModel descriptionCoding);
  Future<void> updateDescriptionCoding(DescriptionCodingModel descriptionCoding);
  Future<void> deleteDescriptionCoding(String code);

  // Search operations
  Future<List<DocumentTypeModel>> searchDocumentTypes(String query);
  Future<List<DescriptionCodingModel>> searchDescriptionCoding(String query);
}

class GLSetupLocalDataSourceImpl implements GLSetupLocalDataSource {
  // For now, we'll use in-memory storage until the database is properly generated
  final List<DocumentTypeModel> _documentTypes = [];
  final List<DescriptionCodingModel> _descriptionCoding = [];

  @override
  Future<List<DocumentTypeModel>> getAllDocumentTypes() async {
    try {
      return List.from(_documentTypes);
    } catch (e) {
      throw CacheException(message: 'Failed to get document types: $e');
    }
  }

  @override
  Future<List<DocumentTypeModel>> getActiveDocumentTypes() async {
    try {
      return _documentTypes.where((dt) => dt.isActive).toList();
    } catch (e) {
      throw CacheException(message: 'Failed to get active document types: $e');
    }
  }

  @override
  Future<DocumentTypeModel?> getDocumentTypeByCode(String code) async {
    try {
      return _documentTypes.where((dt) => dt.docTypeCode == code).firstOrNull;
    } catch (e) {
      throw CacheException(message: 'Failed to get document type: $e');
    }
  }

  @override
  Future<void> createDocumentType(DocumentTypeModel documentType) async {
    try {
      if (_documentTypes.any((dt) => dt.docTypeCode == documentType.docTypeCode)) {
        throw CacheException(message: 'Document type with this code already exists');
      }
      _documentTypes.add(documentType);
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException(message: 'Failed to create document type: $e');
    }
  }

  @override
  Future<void> updateDocumentType(DocumentTypeModel documentType) async {
    try {
      final index = _documentTypes.indexWhere((dt) => dt.docTypeCode == documentType.docTypeCode);
      if (index == -1) {
        throw CacheException(message: 'Document type not found');
      }
      _documentTypes[index] = documentType;
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException(message: 'Failed to update document type: $e');
    }
  }

  @override
  Future<void> deleteDocumentType(String code) async {
    try {
      final removed = _documentTypes.removeWhere((dt) => dt.docTypeCode == code);
      if (removed == 0) {
        throw CacheException(message: 'Document type not found');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException(message: 'Failed to delete document type: $e');
    }
  }

  @override
  Future<bool> isDocumentTypeUsedInTransactions(String code) async {
    try {
      // TODO: Implement check against voucher tables when they are created
      // For now, return false as no voucher tables exist yet
      return false;
    } catch (e) {
      throw CacheException(message: 'Failed to check document type usage: $e');
    }
  }

  @override
  Future<List<DescriptionCodingModel>> getAllDescriptionCoding() async {
    try {
      return List.from(_descriptionCoding);
    } catch (e) {
      throw CacheException(message: 'Failed to get description coding: $e');
    }
  }

  @override
  Future<List<DescriptionCodingModel>> getDescriptionCodingByAccount(String? accountId) async {
    try {
      return _descriptionCoding.where((dc) => dc.linkedAccountId == accountId).toList();
    } catch (e) {
      throw CacheException(message: 'Failed to get description coding by account: $e');
    }
  }

  @override
  Future<DescriptionCodingModel?> getDescriptionCodingByCode(String code) async {
    try {
      return _descriptionCoding.where((dc) => dc.descCode == code).firstOrNull;
    } catch (e) {
      throw CacheException(message: 'Failed to get description coding: $e');
    }
  }

  @override
  Future<bool> isDescriptionCodingUsedInTransactions(String code) async {
    try {
      // TODO: Implement check against voucher tables when they are created
      // For now, return false as no voucher tables exist yet
      return false;
    } catch (e) {
      throw CacheException(message: 'Failed to check description coding usage: $e');
    }
  }

  @override
  Future<void> createDescriptionCoding(DescriptionCodingModel descriptionCoding) async {
    try {
      if (_descriptionCoding.any((dc) => dc.descCode == descriptionCoding.descCode)) {
        throw CacheException(message: 'Description coding with this code already exists');
      }
      _descriptionCoding.add(descriptionCoding);
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException(message: 'Failed to create description coding: $e');
    }
  }

  @override
  Future<void> updateDescriptionCoding(DescriptionCodingModel descriptionCoding) async {
    try {
      final index = _descriptionCoding.indexWhere((dc) => dc.descCode == descriptionCoding.descCode);
      if (index == -1) {
        throw CacheException(message: 'Description coding not found');
      }
      _descriptionCoding[index] = descriptionCoding;
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException(message: 'Failed to update description coding: $e');
    }
  }

  @override
  Future<void> deleteDescriptionCoding(String code) async {
    try {
      final removed = _descriptionCoding.removeWhere((dc) => dc.descCode == code);
      if (removed == 0) {
        throw CacheException(message: 'Description coding not found');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException(message: 'Failed to delete description coding: $e');
    }
  }

  @override
  Future<List<DocumentTypeModel>> searchDocumentTypes(String query) async {
    try {
      final lowerQuery = query.toLowerCase();
      return _documentTypes.where((dt) =>
          dt.nameAr.toLowerCase().contains(lowerQuery) ||
          dt.nameEn.toLowerCase().contains(lowerQuery) ||
          dt.docTypeCode.toLowerCase().contains(lowerQuery)).toList();
    } catch (e) {
      throw CacheException(message: 'Failed to search document types: $e');
    }
  }

  @override
  Future<List<DescriptionCodingModel>> searchDescriptionCoding(String query) async {
    try {
      final lowerQuery = query.toLowerCase();
      return _descriptionCoding.where((dc) =>
          dc.descriptionAr.toLowerCase().contains(lowerQuery) ||
          dc.descriptionEn.toLowerCase().contains(lowerQuery) ||
          dc.descCode.toLowerCase().contains(lowerQuery)).toList();
    } catch (e) {
      throw CacheException(message: 'Failed to search description coding: $e');
    }
  }
}