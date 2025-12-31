import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/shared/utils/app_permissions.dart';
import 'package:muhaseb_pro/shared/utils/role_checker.dart';
import 'package:muhaseb_pro/l10n/locale_provider.dart';

class SystemSetupMenuScreen extends ConsumerWidget {
  const SystemSetupMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = Translations.of(context);
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
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.systemSetup),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final currentLocale = ref.watch(localeProvider);
              return DropdownButton<Locale>(
                value: currentLocale,
                icon: const Icon(Icons.language),
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    ref.read(localeProvider.notifier).state = newLocale;
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: Locale('ar'),
                    child: Text('العربية'),
                  ),
                ],
              );
            },
          ),
        ],
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
