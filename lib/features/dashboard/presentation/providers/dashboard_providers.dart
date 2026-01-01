import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/dashboard/domain/entities/dashboard_item.dart';
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';

final dashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(
      getTitle: (t) => t.dashboard.systemSetup,
      icon: Icons.settings,
      route: '/system-setup',
      permission: AppPermission.viewSystemSetup,
    ),
    DashboardItem(
      getTitle: (t) => t.dashboard.generalLedger,
      icon: Icons.account_balance,
      route: '/general-ledger',
      permission: AppPermission.viewGeneralLedger,
    ),
    DashboardItem(
      getTitle: (t) => t.dashboard.inventory,
      icon: Icons.inventory,
      route: '/inventory',
      permission: AppPermission.viewInventory,
    ),
    DashboardItem(
      getTitle: (t) => t.dashboard.vendors,
      icon: Icons.local_shipping,
      route: '/vendors',
      // permission: AppPermission.viewVendors, // TODO: Add permission
    ),
    DashboardItem(
      getTitle: (t) => t.dashboard.customers,
      icon: Icons.people,
      route: '/customers',
      // permission: AppPermission.viewCustomers, // TODO: Add permission
    ),
    DashboardItem(
      getTitle: (t) => t.dashboard.reports,
      icon: Icons.bar_chart,
      route: '/reports',
      // permission: AppPermission.viewReports, // TODO: Add permission
    ),
  ];
});
