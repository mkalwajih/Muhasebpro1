import 'package:flutter/material.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

// FIX: The title is now a function that takes the AppLocalizations object.
class DashboardItem {
  // FIX: The title is now a function that takes the AppLocalizations object.
  // This decouples the data model from the specific translated string.
  final String Function(AppLocalizations l10n) getTitle;
  final IconData icon;
  final String route;

  DashboardItem({
    required this.getTitle,
    required this.icon,
    required this.route,
  });
}