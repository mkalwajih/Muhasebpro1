import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';
import 'package:muhaseb_pro/shared/utils/role_checker.dart';

class SystemSetupMenuScreen extends ConsumerWidget {
  const SystemSetupMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final roleChecker = ref.watch(roleCheckerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.systemSetup),
      ),
      body: ListView(
        children: [
          if (roleChecker.hasPermission(AppPermission.manageCompanyInfo))
            ListTile(
              leading: const Icon(Iconsax.setting),
              title: Text(l10n.generalParameters),
              onTap: () => context.go('/dashboard/system_setup/general_parameters'),
            ),
          if (roleChecker.hasPermission(AppPermission.manageCompanyInfo))
            ListTile(
              leading: const Icon(Iconsax.building),
              title: Text(l10n.companyInfo),
              onTap: () => context.go('/dashboard/system_setup/company_info'),
            ),
          if (roleChecker.hasPermission(AppPermission.viewSystemSetup))
            ListTile(
              leading: const Icon(Iconsax.global),
              title: Text(l10n.geographicalData),
              onTap: () => context.go('/dashboard/system_setup/geographical_data'),
            ),
          if (roleChecker.hasPermission(AppPermission.viewSystemSetup))
            ListTile(
              leading: const Icon(Iconsax.dollar_circle),
              title: Text(l10n.currencies),
              onTap: () => context.go('/dashboard/system_setup/currencies'),
            ),
          if (roleChecker.hasPermission(AppPermission.manageChartOfAccounts))
            ListTile(
              leading: const Icon(Iconsax.diagram),
              title: Text(l10n.chartOfAccounts),
              onTap: () => context.go('/dashboard/system_setup/coa'),
            ),
          if (roleChecker.hasAnyPermission([AppPermission.viewUsers, AppPermission.manageUsers]))
            ListTile(
              leading: const Icon(Iconsax.user_edit),
              title: Text(l10n.userManagement),
              onTap: () => context.go('/dashboard/system_setup/user_management'),
            ),
          if (roleChecker.hasAnyPermission([AppPermission.viewRoles, AppPermission.manageRoles]))
            ListTile(
              leading: const Icon(Iconsax.security_user),
              title: Text(l10n.roleManagement),
              onTap: () => context.go('/dashboard/system_setup/role_management'),
            ),
        ],
      ),
    );
  }
}
