import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/features/dashboard/domain/entities/dashboard_item.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart'; // NEW IMPORT
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';

final dashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(
      // Access via t.dashboard.systemSetup
      getTitle: (t) => t.dashboard.systemSetup, 
      icon: Iconsax.setting_2,
      route: '/dashboard/system_setup',
      permission: AppPermission.viewSystemSetup,
    ),
    DashboardItem(
      getTitle: (t) => t.dashboard.generalLedger,
      icon: Iconsax.book_1,
      route: '/dashboard/general_ledger',
      permission: AppPermission.viewGeneralLedger,
    ),
    DashboardItem(
      getTitle: (t) => t.dashboard.inventory,
      icon: Iconsax.box,
      route: '/dashboard/inventory',
      permission: AppPermission.viewInventory,
    ),
    DashboardItem(
      getTitle: (t) => t.dashboard.vendors,
      icon: Iconsax.truck,
      route: '/dashboard/vendors',
      permission: null,
    ),
    DashboardItem(
      getTitle: (t) => t.dashboard.customers,
      icon: Iconsax.people,
      route: '/dashboard/customers',
      permission: null,
    ),
    DashboardItem(
      getTitle: (t) => t.dashboard.reports,
      icon: Iconsax.graph,
      route: '/dashboard/reports',
      permission: null,
    ),
  ];
});
