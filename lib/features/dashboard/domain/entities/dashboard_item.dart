import 'package:flutter/material.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';

// Type definition for a function that takes AppLocalizations and returns a String.
typedef LocalizedTitle = String Function(AppLocalizations l10n);

class DashboardItem {
  final LocalizedTitle getTitle;
  final IconData icon;
  final String route;
  final AppPermission? permission; // Nullable for items that don't need a permission check

  DashboardItem({
    required this.getTitle,
    required this.icon,
    required this.route,
    this.permission,
  });
}
