import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final int id;
  final int? parentId;
  final String accountCode;
  final String nameAr;
  final String nameEn;
  final int level;
  final String type; // 'Header' or 'Transactional'
  final bool isActive;
  final List<AccountEntity> children;

  const AccountEntity({
    required this.id,
    this.parentId,
    required this.accountCode,
    required this.nameAr,
    required this.nameEn,
    required this.level,
    required this.type,
    required this.isActive,
    this.children = const [],
  });
  
  // Helper to get localized name based on app locale
  String getLocalizedName(String locale) => locale == 'ar' ? nameAr : nameEn;

  @override
  List<Object?> get props => [id, parentId, accountCode, nameAr, nameEn, level, type, isActive, children];
}
