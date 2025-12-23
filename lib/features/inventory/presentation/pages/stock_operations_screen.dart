import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../l10n/app_localizations.dart';

class StockOperationsScreen extends ConsumerStatefulWidget {
  const StockOperationsScreen({super.key});

  @override
  ConsumerState<StockOperationsScreen> createState() =>
      _StockOperationsScreenState();
}

class _StockOperationsScreenState
    extends ConsumerState<StockOperationsScreen>
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
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.stockOperations),
        backgroundColor: theme.colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Iconsax.import),
              text: l10n.incomingStock,
            ),
            Tab(
              icon: const Icon(Iconsax.export),
              text: l10n.outgoingStock,
            ),
            Tab(
              icon: const Icon(Iconsax.arrow_swap_horizontal),
              text: l10n.transfers,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildIncomingStockTab(l10n),
          _buildOutgoingStockTab(l10n),
          _buildTransfersTab(l10n),
        ],
      ),
    );
  }

  Widget _buildIncomingStockTab(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.import, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            l10n.incomingStockOrders,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.manageIncomingStock,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.add),
            label: Text(l10n.createIncomingOrder),
          ),
        ],
      ),
    );
  }

  Widget _buildOutgoingStockTab(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.export, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            l10n.outgoingStockOrders,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.manageOutgoingStock,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.add),
            label: Text(l10n.createOutgoingOrder),
          ),
        ],
      ),
    );
  }

  Widget _buildTransfersTab(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.arrow_swap_horizontal,
              size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            l10n.warehouseTransfers,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.manageWarehouseTransfers,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.add),
            label: Text(l10n.createTransfer),
          ),
        ],
      ),
    );
  }
}
