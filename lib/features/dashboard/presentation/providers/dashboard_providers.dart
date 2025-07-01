import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/features/dashboard/domain/entities/dashboard_item.dart';
 
// FIX: This provider is now clean and has NO dependency on BuildContext or AppLocalizations.
final dashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(
 getTitle: (l10n) => l10n.systemSetup,
        icon: Iconsax.setting_2,
        route: '/dashboard/system_setup'),
    DashboardItem(
 getTitle: (l10n) => l10n.generalLedger,
        icon: Iconsax.book_1,
        route: '/dashboard/general_ledger'),
    DashboardItem(
 getTitle: (l10n) => l10n.inventory,
        icon: Iconsax.box,
 route: '/dashboard/inventory'),
    DashboardItem(
 getTitle: (l10n) => l10n.vendors,
        icon: Iconsax.truck,
        route: '/dashboard/vendors'),
    DashboardItem(
 getTitle: (l10n) => l10n.customers,
        icon: Iconsax.people,
        route: '/dashboard/customers'),
    DashboardItem(
 getTitle: (l10n) => l10n.reports,
        icon: Iconsax.graph,
        route: '/dashboard/reports'),
  ];
});