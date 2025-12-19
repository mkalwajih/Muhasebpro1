import 'package:equatable/equatable.dart';

// Represents a General Ledger account, aligned with the database schema.
class AccountEntity extends Equatable {
  final int id;
  final int? parentId;
  final String accountCode;
  final String nameAr;
  final String nameEn;
  final int level;
  final bool isParent;
  final bool isActive;
  
  // Critical fields for financial reporting and subsystem integration.
  final String nature; // 'Debit' or 'Credit'
  final String reportType; // 'Balance Sheet' or 'Income Statement'
  final String? cashFlowType; // 'Operating', 'Investing', 'Financing', or null
  final String detailAccountType; // 'General', 'Cash', 'Bank', 'Customer', etc.

  final List<AccountEntity> children;

  const AccountEntity({
    required this.id,
    this.parentId,
    required this.accountCode,
    required this.nameAr,
    required this.nameEn,
    required this.level,
    required this.isParent,
    required this.isActive,
    required this.nature,
    required this.reportType,
    this.cashFlowType,
    required this.detailAccountType,
    this.children = const [],
  });
  
  // Helper to get localized name based on app locale
  String getLocalizedName(String locale) => locale == 'ar' ? nameAr : nameEn;

  @override
  List<Object?> get props => [
        id,
        parentId,
        accountCode,
        nameAr,
        nameEn,
        level,
        isParent,
        isActive,
        nature,
        reportType,
        cashFlowType,
        detailAccountType,
        children,
      ];
}
