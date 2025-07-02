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
            leading: const Icon(Iconsax.building),
            title: Text(l10n.companyInfo),
            onTap: () => context.go('/dashboard/system_setup/company_info'),
          ),
          ListTile(
            leading: const Icon(Iconsax.diagram),
            title: Text(l10n.chartOfAccounts),
            onTap: () => context.go('/dashboard/system_setup/coa'),
          ),
          ListTile(
            leading: const Icon(Iconsax.user_edit), // Add this new list tile
            title: Text(l10n.userManagement),
            onTap: () => context.go('/dashboard/system_setup/user_management'),
          ),
        ],
      ),
    );
  }
}
