import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../shared/utils/app_permissions.dart';
import '../../../../shared/presentation/widgets/error_widget.dart' as custom;
import '../../../../shared/utils/role_checker.dart';

class InventoryControlScreen extends ConsumerWidget {
  const InventoryControlScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final roleChecker = ref.watch(roleCheckerProvider);

    // Check permissions
    final canView = roleChecker.hasPermission(AppPermission.viewInventory);
    final canManageStocktaking = roleChecker.hasPermission(AppPermission.manageStocktaking);
    final canManageReservations = roleChecker.hasPermission(AppPermission.manageReservations);

    if (!canView) {
      return Scaffold(
        appBar: AppBar(
          title: Text(t.control.title),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.onSurface,
        ),
        body: custom.CustomErrorWidget(
          error: t.common.accessDenied,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.control.title),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(context, t.control.stocktaking),
          if (canManageStocktaking) ...[
            Card(
              child: ListTile(
                leading: const Icon(Icons.inventory_2),
                title: Text(t.control.stocktakingSessions),
                subtitle: Text(t.control.manageStocktaking),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // TODO: Navigate to stocktaking sessions
                },
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.play_arrow),
                title: Text(t.control.startSession),
                subtitle: Text(t.control.stocktakingInfo),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // TODO: Start new stocktaking session
                },
              ),
            ),
          ],
          
          const SizedBox(height: 24),
          _buildSectionHeader(context, t.control.reservations),
          if (canManageReservations) ...[
            Card(
              child: ListTile(
                leading: const Icon(Icons.bookmark),
                title: Text(t.control.stockReservations),
                subtitle: Text(t.control.manageReservations),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // TODO: Navigate to reservations
                },
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: Text(t.control.createReservation),
                subtitle: Text(t.control.reservationInfo),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // TODO: Create new reservation
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0, right: 4.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
