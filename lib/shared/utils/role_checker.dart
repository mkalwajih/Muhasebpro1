import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';

class RoleChecker {
  final UserEntity? _user;

  RoleChecker(this._user);

  bool hasPermission(AppPermission permission) {
    if (_user == null) {
      return false;
    }

    // A super admin (e.g., username 'admin') has all permissions
    if (_user.username == 'admin') {
      return true;
    }

    // Check if any of the user's roles contain the required permission
    for (final role in _user.roles) {
      if (role.permissions.contains(permission)) {
        return true;
      }
    }

    return false;
  }

  // Alias for hasPermission to match usage in some parts of the app
  bool can(AppPermission permission) => hasPermission(permission);

  bool hasAnyPermission(List<AppPermission> permissions) {
    if (_user == null) {
      return false;
    }
    
    if (_user.username == 'admin') {
      return true;
    }

    for (final p in permissions) {
      if (hasPermission(p)) {
        return true;
      }
    }
    return false;
  }
}

// Provider to easily access the RoleChecker
final roleCheckerProvider = Provider<RoleChecker>((ref) {
  final authState = ref.watch(authStateProvider);
  return RoleChecker(authState);
});
