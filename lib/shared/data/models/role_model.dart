import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';

extension RoleToEntity on Role {
  RoleEntity toEntity() {
    return RoleEntity(
      id: id,
      nameAr: nameAr,
      nameEn: nameEn,
      description: description,
      isActive: isActive,
      permissions: const [], // Permissions are handled separately
    );
  }
}
