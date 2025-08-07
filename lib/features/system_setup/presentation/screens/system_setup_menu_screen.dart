import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';
import 'package:muhaseb_pro/shared/utils/role_checker.dart';

class SystemSetupMenuScreen extends ConsumerWidget {
  const SystemSetupMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final roleChecker = ref.watch(roleCheckerProvider);

    final menuItems = [
      if (roleChecker.hasPermission(AppPermission.manageCompanyInfo))
        _MenuItem(
          title: l10n.companyInfo,
          icon: Iconsax.building,
          onTap: () => context.go('/dashboard/system_setup/company_info'),
        ),
      if (roleChecker.hasPermission(AppPermission.viewBranches))
        _MenuItem(
          title: l10n.branches,
          icon: Iconsax.share,
          onTap: () => context.go('/dashboard/system_setup/branches'),
        ),
      if (roleChecker.hasPermission(AppPermission.viewBranches))
        _MenuItem(
          title: l10n.branchGroups,
          icon: Iconsax.shapes,
          onTap: () => context.go('/dashboard/system_setup/branch_groups'),
        ),
      if (roleChecker.hasPermission(AppPermission.manageChartOfAccounts))
        _MenuItem(
          title: l10n.chartOfAccounts,
          icon: Iconsax.book_1,
          onTap: () => context.go('/dashboard/system_setup/coa'),
        ),
      if (roleChecker.hasPermission(AppPermission.viewUsers))
        _MenuItem(
          title: l10n.userManagement,
          icon: Iconsax.user,
          onTap: () => context.go('/dashboard/system_setup/user_management'),
        ),
      if (roleChecker.hasPermission(AppPermission.viewRoles))
        _MenuItem(
          title: l10n.roleManagement,
          icon: Iconsax.security_user,
          onTap: () => context.go('/dashboard/system_setup/role_management'),
        ),
      // TODO: Add correct permissions for Geographical Data, General Parameters, Currencies, and Tax Settings
      // if (roleChecker.hasPermission(AppPermission.viewGeographicalData))
      //   _MenuItem(
      //     title: l10n.geographicalData,
      //     icon: Iconsax.map_1,
      //     onTap: () => context.go('/dashboard/system_setup/geographical_data'),
      //   ),
      // if (roleChecker.hasPermission(AppPermission.viewGeneralParameters))
      //   _MenuItem(
      //     title: l10n.generalParameters,
      //     icon: Iconsax.setting_2,
      //     onTap: () => context.go('/dashboard/system_setup/general_parameters'),
      //   ),
      // if (roleChecker.hasPermission(AppPermission.viewCurrencies))
      //   _MenuItem(
      //     title: l10n.currencies,
      //     icon: Iconsax.dollar_circle,
      //     onTap: () => context.go('/dashboard/system_setup/currencies'),
      //   ),
      // if (roleChecker.hasPermission(AppPermission.viewTaxSettings))
      //   _MenuItem(
      //     title: l10n.taxSettings,
      //     icon: Iconsax.receipt_2,
      //     onTap: () => context.go('/dashboard/system_setup/tax'),
      //   ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.systemSetup),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return menuItems[index];
        },
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
