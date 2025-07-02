import 'package:equatable/equatable.dart';
import 'package:muhaseb_pro/core/permissions/app_permissions.dart';

class RoleEntity extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final String? description;
  final bool isActive;
  final List<AppPermission> permissions; // Add this line

  const RoleEntity({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.description,
    required this.isActive,
    this.permissions = const [], // Add this line
  });

  @override
  List<Object?> get props => [id, nameAr, nameEn, description, isActive, permissions];
}
