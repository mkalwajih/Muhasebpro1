import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';

class InventoryMenuScreen extends StatelessWidget {
  const InventoryMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);

    final menuItems = [
      _MenuItem(
        title: l10n.master.setup,
        subtitle: l10n.master.inventoryVariables,
        icon: Iconsax.setting_2,
        route: '/dashboard/inventory/setup',
      ),
      _MenuItem(
        title: l10n.master.title,
        subtitle: l10n.ops.manageIncomingStock, // Using existing key or generic
        icon: Iconsax.box,
        route: '/dashboard/inventory/items',
      ),
      _MenuItem(
        title: l10n.ops.opening,
        subtitle: l10n.ops.addOpeningStock,
        icon: Iconsax.box_add,
        route: '/dashboard/inventory/opening_stock',
      ),
      _MenuItem(
        title: l10n.ops.title,
        subtitle: l10n.ops.manageIncomingStock,
        icon: Iconsax.arrow_swap_horizontal,
        route: '/dashboard/inventory/operations',
      ),
      _MenuItem(
        title: l10n.control.title,
        subtitle: l10n.control.manageStocktaking,
        icon: Iconsax.clipboard_tick,
        route: '/dashboard/inventory/control',
      ),
      _MenuItem(
        title: l10n.control.reports,
        subtitle: l10n.control.reports, // Reuse title as subtitle if description missing
        icon: Iconsax.chart,
        route: '/dashboard/inventory/reports',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dashboard.inventory),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () => context.go(item.route),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      item.icon,
                      size: 40,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      item.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;

  _MenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });
}
