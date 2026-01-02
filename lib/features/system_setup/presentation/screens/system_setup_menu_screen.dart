import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';

class SystemSetupMenuScreen extends StatelessWidget {
  const SystemSetupMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final menuItems = [
      _MenuItem(
        title: t.company.title,
        icon: Iconsax.building,
        route: '/system-setup/company-info',
      ),
      _MenuItem(
        title: t.company.branchTitle,
        icon: Iconsax.house_2,
        route: '/system-setup/branches',
      ),
      _MenuItem(
        title: t.company.branchGroup,
        icon: Iconsax.buildings,
        route: '/system-setup/branch-groups',
      ),
      _MenuItem(
        title: t.coa.title,
        icon: Iconsax.diagram,
        route: '/system-setup/coa',
      ),
      _MenuItem(
        title: t.users.title,
        icon: Iconsax.user,
        route: '/system-setup/users',
      ),
      _MenuItem(
        title: t.users.roleManagement,
        icon: Iconsax.shield_tick,
        route: '/system-setup/roles',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(t.dashboard.systemSetup),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            child: ListTile(
              leading: Icon(
                item.icon,
                color: theme.colorScheme.primary,
              ),
              title: Text(item.title),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => context.push(item.route),
            ),
          );
        },
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final IconData icon;
  final String route;

  _MenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}
