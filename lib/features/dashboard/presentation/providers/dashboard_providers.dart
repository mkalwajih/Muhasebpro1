import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/features/dashboard/domain/entities/dashboard_item.dart';
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';
 
final dashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(
      getTitle: (l10n) => l10n.systemSetup,
      icon: Iconsax.setting_2,
      route: '/dashboard/system_setup',
      permission: AppPermission.viewSystemSetup,
    ),
    DashboardItem(
      getTitle: (l10n) => l10n.generalLedger,
      icon: Iconsax.book_1,
      route: '/dashboard/general_ledger',
      permission: AppPermission.viewGeneralLedger,
    ),
    DashboardItem(
      getTitle: (l10n) => l10n.inventory,
      icon: Iconsax.box,
      route: '/dashboard/inventory',
      permission: AppPermission.viewInventory,
    ),
    DashboardItem(
      getTitle: (l10n) => l10n.vendors,
      icon: Iconsax.truck,
      route: '/dashboard/vendors',
      permission: null, // Example: No specific permission needed yet
    ),
    DashboardItem(
      getTitle: (l10n) => l10n.customers,
      icon: Iconsax.people,
      route: '/dashboard/customers',
      permission: null, // Example: No specific permission needed yet
    ),
    DashboardItem(
      getTitle: (l10n) => l10n.reports,
      icon: Iconsax.graph,
      route: '/dashboard/reports',
      permission: null, // Example: No specific permission needed yet
    ),
  ];
});
