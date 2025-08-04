import 'package:equatable/equatable.dart';

class BranchGroupEntity extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final bool isActive;

  const BranchGroupEntity({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.isActive,
  });

  @override
  List<Object?> get props => [id, nameAr, nameEn, isActive];

  BranchGroupEntity copyWith({
    int? id,
    String? nameAr,
    String? nameEn,
    bool? isActive,
  }) {
    return BranchGroupEntity(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      isActive: isActive ?? this.isActive,
    );
  }
}
