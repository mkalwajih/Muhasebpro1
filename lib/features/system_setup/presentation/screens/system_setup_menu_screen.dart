import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class SystemSetupMenuScreen extends StatelessWidget {
  const SystemSetupMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.systemSetup),
      ),
      body: ListView(
        children: [
           ListTile(
            leading: const Icon(Iconsax.setting),
            title: Text(l10n.generalParameters),
            onTap: () => context.go('/dashboard/system_setup/general_parameters'),
          ),
          ListTile(
            leading: const Icon(Iconsax.building),
            title: Text(l10n.companyInfo),
            onTap: () => context.go('/dashboard/system_setup/company_info'),
          ),
          ListTile(
            leading: const Icon(Iconsax.global),
            title: Text(l10n.geographicalData),
            onTap: () => context.go('/dashboard/system_setup/geographical_data'),
          ),
          ListTile(
            leading: const Icon(Iconsax.dollar_circle),
            title: Text(l10n.currencies),
            onTap: () => context.go('/dashboard/system_setup/currencies'),
          ),
          ListTile(
            leading: const Icon(Iconsax.diagram),
            title: Text(l10n.chartOfAccounts),
            onTap: () => context.go('/dashboard/system_setup/coa'),
          ),
          ListTile(
            leading: const Icon(Iconsax.user_edit),
            title: Text(l10n.userManagement),
            onTap: () => context.go('/dashboard/system_setup/user_management'),
          ),
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
