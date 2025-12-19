import 'package:equatable/equatable.dart';

/// Description Coding entity for transaction description templates
class DescriptionCodingEntity extends Equatable {
  final String descCode;
  final String descriptionAr;
  final String descriptionEn;
  final String? linkedAccountId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DescriptionCodingEntity({
    required this.descCode,
    required this.descriptionAr,
    required this.descriptionEn,
    this.linkedAccountId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Get localized description based on language
  String getLocalizedDescription(String languageCode) {
    return languageCode == 'ar' ? descriptionAr : descriptionEn;
  }

  /// Check if this description is linked to a specific account
  bool get hasLinkedAccount => linkedAccountId != null && linkedAccountId!.isNotEmpty;

  /// Create a copy with updated fields
  DescriptionCodingEntity copyWith({
    String? descCode,
    String? descriptionAr,
    String? descriptionEn,
    String? linkedAccountId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DescriptionCodingEntity(
      descCode: descCode ?? this.descCode,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      linkedAccountId: linkedAccountId ?? this.linkedAccountId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Validate entity data
  List<String> validate() {
    final errors = <String>[];

    if (descCode.isEmpty || descCode.length > 10) {
      errors.add('Description code must be between 1 and 10 characters');
    }

    if (descriptionAr.isEmpty || descriptionAr.length > 250) {
      errors.add('Arabic description must be between 1 and 250 characters');
    }

    if (descriptionEn.isEmpty || descriptionEn.length > 250) {
      errors.add('English description must be between 1 and 250 characters');
    }

    if (linkedAccountId != null && linkedAccountId!.length > 10) {
      errors.add('Linked account ID must not exceed 10 characters');
    }

    return errors;
  }

  /// Check if entity is valid
  bool get isValid => validate().isEmpty;

  @override
  List<Object?> get props => [
        descCode,
        descriptionAr,
        descriptionEn,
        linkedAccountId,
        createdAt,
        updatedAt,
      ];
}