import 'package:equatable/equatable.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/role_entity.dart';

class UserEntity extends Equatable {
  final int userId;
  final String username;
  final String fullNameEn;
  final String fullNameAr;
  final bool isActive;
  final List<RoleEntity> roles; 

  const UserEntity({
    required this.userId,
    required this.username,
    required this.fullNameEn,
    required this.fullNameAr,
    required this.isActive,
    this.roles = const [], 
  });

  @override
  List<Object?> get props => [userId, username, fullNameEn, fullNameAr, isActive, roles];
}
