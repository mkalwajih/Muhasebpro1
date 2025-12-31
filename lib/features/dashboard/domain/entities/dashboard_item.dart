// lib/features/dashboard/domain/entities/dashboard_item.dart
import 'package:flutter/material.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart'; // NEW IMPORT
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';

// CHANGED: AppLocalizations -> Translations
typedef LocalizedTitle = String Function(Translations t);

class DashboardItem {
  final LocalizedTitle getTitle;
  final IconData icon;
  final String route;
  final AppPermission? permission;

  DashboardItem({
    required this.getTitle,
    required this.icon,
    required this.route,
    this.permission,
  });
}
