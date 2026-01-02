import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../shared/utils/app_permissions.dart';
import '../../../../shared/presentation/widgets/error_widget.dart' as custom;
import '../../../../shared/presentation/widgets/placeholder_screen.dart';
import '../../../../shared/utils/role_checker.dart';

class StockOperationsScreen extends ConsumerStatefulWidget {
  const StockOperationsScreen({super.key});

  @override
  ConsumerState<StockOperationsScreen> createState() => _StockOperationsScreenState();
}

class _StockOperationsScreenState extends ConsumerState<StockOperationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final roleChecker = ref.watch(roleCheckerProvider);

    // Check permissions
    final canView = roleChecker.hasPermission(AppPermission.viewStockOperations);
    final canCreate = roleChecker.hasPermission(AppPermission.createStockOperations);

    if (!canView) {
      return Scaffold(
        appBar: AppBar(
          title: Text(t.ops.title),
        ),
        body: custom.CustomErrorWidget(
          error: t.common.accessDenied,
        ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(t.ops.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: t.ops.incoming),
            Tab(text: t.ops.outgoing),
            Tab(text: t.ops.transfers),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOperationList(
            context,
            title: t.ops.incomingStockOrders,
            subtitle: t.ops.manageIncomingStock,
            canCreate: canCreate,
            createButtonText: t.ops.createIncomingOrder,
            onAdd: () {
              // TODO: Implement add incoming stock
            },
          ),
          _buildOperationList(
            context,
            title: t.ops.outgoingStockOrders,
            subtitle: t.ops.manageOutgoingStock,
            canCreate: canCreate,
            createButtonText: t.ops.createOutgoingOrder,
            onAdd: () {
              // TODO: Implement add outgoing stock
            },
          ),
          _buildOperationList(
            context,
            title: t.ops.warehouseTransfers,
            subtitle: t.ops.manageWarehouseTransfers,
            canCreate: canCreate,
            createButtonText: t.ops.createTransfer,
            onAdd: () {
              // TODO: Implement add transfer
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOperationList(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool canCreate,
    required String createButtonText,
    required VoidCallback onAdd,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              if (canCreate)
                ElevatedButton.icon(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add),
                  label: Text(createButtonText),
                ),
            ],
          ),
        ),
        const Expanded(
          child: PlaceholderScreen(), // Replace with actual list
        ),
      ],
    );
  }
}
