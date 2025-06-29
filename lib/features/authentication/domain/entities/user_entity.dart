import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int userId;
  final String username;
  final String fullNameEn;
  final String fullNameAr;
  final bool isActive;

  const UserEntity({
    required this.userId,
    required this.username,
    required this.fullNameEn,
    required this.fullNameAr,
    required this.isActive,
  });

  @override
  List<Object?> get props => [userId, username, fullNameEn, fullNameAr, isActive];
}