import 'package:equatable/equatable.dart';

/// Document Type entity for General Ledger voucher categorization
class DocumentTypeEntity extends Equatable {
  final String docTypeCode;
  final String nameAr;
  final String nameEn;
  final SequenceMethod sequenceMethod;
  final SequenceBehavior sequenceBehavior;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DocumentTypeEntity({
    required this.docTypeCode,
    required this.nameAr,
    required this.nameEn,
    required this.sequenceMethod,
    required this.sequenceBehavior,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Get localized name based on language
  String getLocalizedName(String languageCode) {
    return languageCode == 'ar' ? nameAr : nameEn;
  }

  /// Create a copy with updated fields
  DocumentTypeEntity copyWith({
    String? docTypeCode,
    String? nameAr,
    String? nameEn,
    SequenceMethod? sequenceMethod,
    SequenceBehavior? sequenceBehavior,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DocumentTypeEntity(
      docTypeCode: docTypeCode ?? this.docTypeCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      sequenceMethod: sequenceMethod ?? this.sequenceMethod,
      sequenceBehavior: sequenceBehavior ?? this.sequenceBehavior,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Validate entity data
  List<String> validate() {
    final errors = <String>[];

    if (docTypeCode.isEmpty || docTypeCode.length > 10) {
      errors.add('Document type code must be between 1 and 10 characters');
    }

    if (nameAr.isEmpty || nameAr.length > 50) {
      errors.add('Arabic name must be between 1 and 50 characters');
    }

    if (nameEn.isEmpty || nameEn.length > 50) {
      errors.add('English name must be between 1 and 50 characters');
    }

    return errors;
  }

  /// Check if entity is valid
  bool get isValid => validate().isEmpty;

  @override
  List<Object?> get props => [
        docTypeCode,
        nameAr,
        nameEn,
        sequenceMethod,
        sequenceBehavior,
        isActive,
        createdAt,
        updatedAt,
      ];
}

/// Sequence method enumeration
enum SequenceMethod {
  general('General'),
  specific('Specific');

  const SequenceMethod(this.value);
  final String value;

  static SequenceMethod fromString(String value) {
    return SequenceMethod.values.firstWhere(
      (method) => method.value == value,
      orElse: () => SequenceMethod.general,
    );
  }
}

/// Sequence behavior enumeration
enum SequenceBehavior {
  autoUnchangeable('Auto-Unchangeable'),
  autoChangeable('Auto-Changeable'),
  manual('Manual');

  const SequenceBehavior(this.value);
  final String value;

  static SequenceBehavior fromString(String value) {
    return SequenceBehavior.values.firstWhere(
      (behavior) => behavior.value == value,
      orElse: () => SequenceBehavior.autoUnchangeable,
    );
  }
}