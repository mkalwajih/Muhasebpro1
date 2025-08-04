import 'package:equatable/equatable.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';

class UserEntity extends Equatable {
  final int userId;
  final String username;
  final String fullNameAr;
  final String fullNameEn;
  final bool isActive;
  final int? branchId;
  final bool isBiometricEnabled;
  final bool isDeviceLinked;
  final List<RoleEntity> roles;

  const UserEntity({
    required this.userId,
    required this.username,
    required this.fullNameAr,
    required this.fullNameEn,
    required this.isActive,
    this.branchId,
    this.isBiometricEnabled = false,
    this.isDeviceLinked = false,
    this.roles = const [],
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        fullNameAr,
        fullNameEn,
        isActive,
        branchId,
        isBiometricEnabled,
        isDeviceLinked,
        roles,
      ];

  UserEntity copyWith({
    int? userId,
    String? username,
    String? fullNameAr,
    String? fullNameEn,
    bool? isActive,
    int? branchId,
    bool? isBiometricEnabled,
    bool? isDeviceLinked,
    List<RoleEntity>? roles,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      fullNameAr: fullNameAr ?? this.fullNameAr,
      fullNameEn: fullNameEn ?? this.fullNameEn,
      isActive: isActive ?? this.isActive,
      branchId: branchId ?? this.branchId,
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      isDeviceLinked: isDeviceLinked ?? this.isDeviceLinked,
      roles: roles ?? this.roles,
    );
  }
}
