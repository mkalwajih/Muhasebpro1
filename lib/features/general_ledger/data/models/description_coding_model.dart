import 'package:drift/drift.dart';
import '../../domain/entities/description_coding_entity.dart';

class DescriptionCodingModel extends DescriptionCodingEntity {
  const DescriptionCodingModel({
    required super.descCode,
    required super.descriptionAr,
    required super.descriptionEn,
    super.linkedAccountId,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Create model from entity
  factory DescriptionCodingModel.fromEntity(DescriptionCodingEntity entity) {
    return DescriptionCodingModel(
      descCode: entity.descCode,
      descriptionAr: entity.descriptionAr,
      descriptionEn: entity.descriptionEn,
      linkedAccountId: entity.linkedAccountId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Create model from Drift database row
  factory DescriptionCodingModel.fromDrift(dynamic row) {
    return DescriptionCodingModel(
      descCode: row.descCode as String,
      descriptionAr: row.descriptionAr as String,
      descriptionEn: row.descriptionEn as String,
      linkedAccountId: row.linkedAccountId as String?,
      createdAt: DateTime.fromMillisecondsSinceEpoch((row.createdAt as int) * 1000),
      updatedAt: DateTime.fromMillisecondsSinceEpoch((row.updatedAt as int) * 1000),
    );
  }

  /// Convert to Drift insertable
  Insertable toDrift() {
    return DescriptionCodingCompanion(
      descCode: Value(descCode),
      descriptionAr: Value(descriptionAr),
      descriptionEn: Value(descriptionEn),
      linkedAccountId: linkedAccountId != null ? Value(linkedAccountId!) : const Value.absent(),
      createdAt: Value(createdAt.millisecondsSinceEpoch ~/ 1000),
      updatedAt: Value(updatedAt.millisecondsSinceEpoch ~/ 1000),
    );
  }

  /// Convert to entity
  DescriptionCodingEntity toEntity() {
    return DescriptionCodingEntity(
      descCode: descCode,
      descriptionAr: descriptionAr,
      descriptionEn: descriptionEn,
      linkedAccountId: linkedAccountId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

// Temporary companion class until drift generates the actual one
class DescriptionCodingCompanion {
  final Value<String> descCode;
  final Value<String> descriptionAr;
  final Value<String> descriptionEn;
  final Value<String?> linkedAccountId;
  final Value<int> createdAt;
  final Value<int> updatedAt;

  const DescriptionCodingCompanion({
    required this.descCode,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.linkedAccountId,
    required this.createdAt,
    required this.updatedAt,
  });
}