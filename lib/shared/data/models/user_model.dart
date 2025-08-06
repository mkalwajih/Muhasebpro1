import 'package:muhaseb_pro/core/db/app_database.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';

extension UserToEntity on User {
  UserEntity toEntity({List<RoleEntity> roles = const []}) {
    return UserEntity(
      userId: userId,
      username: username,
      fullNameAr: fullNameAr,
      fullNameEn: fullNameEn,
      isActive: isActive,
      branchId: branchId,
      isBiometricEnabled: isBiometricEnabled,
      isDeviceLinked: isDeviceLinked,
      roles: roles,
    );
  }
}
