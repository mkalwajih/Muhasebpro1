import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/features/dashboard/domain/entities/dashboard_item.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

// This provider will supply the list of dashboard items.
// It depends on the AppLocalizations provider to get translated titles.
final dashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  // This is a placeholder for the actual localization provider later.
  // For now, we assume English. A better way would be to watch a locale provider.
  // This is safe for now because AppLocalizations.of(context) will be used in the UI.
  final l10n = AppLocalizations.of(ref.context)!;
  
  return [
    DashboardItem(
        title: l10n.systemSetup,
        icon: Iconsax.setting_2,
        route: '/dashboard/system_setup'),
    DashboardItem(
        title: l10n.generalLedger,
        icon: Iconsax.book_1,
        route: '/dashboard/general_ledger'),
    DashboardItem(
        title: l10n.inventory,
        icon: Iconsax.box,
        route: '/dashboard/inventory'),
    DashboardItem(
        title: l10n.vendors,
        icon: Iconsax.truck,
        route: '/dashboard/vendors'),
    DashboardItem(
        title: l10n.customers,
        icon: Iconsax.people,
        route: '/dashboard/customers'),
    DashboardItem(
        title: l10n.reports,
        icon: Iconsax.graph,
        route: '/dashboard/reports'),
  ];
});

// A dummy provider for AppLocalizations since it needs BuildContext.
// The UI will use the correct context-based lookup.
// This allows the provider above to be testable and context-free if needed.
extension AppLocalizationsProvider on Ref {
  AppLocalizations get l10n => AppLocalizations.of(context)!;
}