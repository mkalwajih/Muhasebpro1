import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/features/dashboard/domain/entities/dashboard_item.dart';
import 'package:muhaseb_pro/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import 'package:muhaseb_pro/shared/utils/role_checker.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final user = ref.watch(authStateProvider);
    final allItems = ref.watch(dashboardItemsProvider);
    final roleChecker = ref.watch(roleCheckerProvider);

    final accessibleItems = allItems.where((item) {
      if (item.permission == null) return true; // Always show if no permission is required
      return roleChecker.can(item.permission!);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${t.auth.welcome}, ${user?.username ?? ''}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(loginNotifierProvider.notifier).logout();
              ref.read(authStateProvider.notifier).state = null;
              context.go('/'); // Redirect to login
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: accessibleItems.length,
        itemBuilder: (context, index) {
          final item = accessibleItems[index];
          return DashboardCard(item: item, t: t);
        },
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.item,
    required this.t,
  });

  final DashboardItem item;
  final Translations t;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push(item.route),
        child: Column(
          mainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 40, color: Theme.of(context).primaryColor),
            const SizedBox(height: 12),
            Text(
              item.getTitle(t),
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
