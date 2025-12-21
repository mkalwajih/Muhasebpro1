import 'package:drift/drift.dart';
import '../../domain/entities/document_type_entity.dart';

class DocumentTypeModel extends DocumentTypeEntity {
  const DocumentTypeModel({
    required super.docTypeCode,
    required super.nameAr,
    required super.nameEn,
    required super.sequenceMethod,
    required super.sequenceBehavior,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Create model from entity
  factory DocumentTypeModel.fromEntity(DocumentTypeEntity entity) {
    return DocumentTypeModel(
      docTypeCode: entity.docTypeCode,
      nameAr: entity.nameAr,
      nameEn: entity.nameEn,
      sequenceMethod: entity.sequenceMethod,
      sequenceBehavior: entity.sequenceBehavior,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Create model from Drift database row
  factory DocumentTypeModel.fromDrift(dynamic row) {
    return DocumentTypeModel(
      docTypeCode: row.docTypeCode as String,
      nameAr: row.nameAr as String,
      nameEn: row.nameEn as String,
      sequenceMethod: SequenceMethod.fromString(row.sequenceMethod as String),
      sequenceBehavior: SequenceBehavior.fromString(row.sequenceBehavior as String),
      isActive: (row.isActive as int) == 1,
      createdAt: DateTime.fromMillisecondsSinceEpoch((row.createdAt as int) * 1000),
      updatedAt: DateTime.fromMillisecondsSinceEpoch((row.updatedAt as int) * 1000),
    );
  }

  /// Convert to Drift insertable
  Insertable<dynamic> toDrift() {
    return DocumentTypesCompanion(
      docTypeCode: Value(docTypeCode),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      sequenceMethod: Value(sequenceMethod.value),
      sequenceBehavior: Value(sequenceBehavior.value),
      isActive: Value(isActive ? 1 : 0),
      createdAt: Value(createdAt.millisecondsSinceEpoch ~/ 1000),
      updatedAt: Value(updatedAt.millisecondsSinceEpoch ~/ 1000),
    );
  }

  /// Convert to entity
  DocumentTypeEntity toEntity() {
    return DocumentTypeEntity(
      docTypeCode: docTypeCode,
      nameAr: nameAr,
      nameEn: nameEn,
      sequenceMethod: sequenceMethod,
      sequenceBehavior: sequenceBehavior,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

// Temporary companion class until drift generates the actual one
class DocumentTypesCompanion implements Insertable<dynamic> {
  final Value<String> docTypeCode;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String> sequenceMethod;
  final Value<String> sequenceBehavior;
  final Value<int> isActive;
  final Value<int> createdAt;
  final Value<int> updatedAt;

  const DocumentTypesCompanion({
    required this.docTypeCode,
    required this.nameAr,
    required this.nameEn,
    required this.sequenceMethod,
    required this.sequenceBehavior,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return {};
  }
}