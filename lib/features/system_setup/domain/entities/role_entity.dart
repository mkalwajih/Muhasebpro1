import 'package:equatable/equatable.dart';
import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';

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

  factory RoleEntity.fromRole(RoleData role) {
    return RoleEntity(
      id: role.id,
      nameAr: role.nameAr,
      nameEn: role.nameEn,
      description: role.description,
      isActive: role.isActive,
      permissions: const [], // Permissions will be populated separately
    );
  }

  @override
  List<Object?> get props => [id, nameAr, nameEn, description, isActive, permissions];
}
