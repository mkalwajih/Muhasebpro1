import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../l10n/app_localizations.dart';

class InventoryControlScreen extends ConsumerStatefulWidget {
  const InventoryControlScreen({super.key});

  @override
  ConsumerState<InventoryControlScreen> createState() =>
      _InventoryControlScreenState();
}

class _InventoryControlScreenState
    extends ConsumerState<InventoryControlScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.inventoryControl),
        backgroundColor: theme.colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Iconsax.clipboard_tick),
              text: l10n.stocktaking,
            ),
            Tab(
              icon: const Icon(Iconsax.reserve),
              text: l10n.reservations,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildStocktakingTab(l10n),
          _buildReservationsTab(l10n),
        ],
      ),
    );
  }

  Widget _buildStocktakingTab(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.clipboard_tick, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            l10n.stocktakingSessions,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.manageStocktaking,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.add),
            label: Text(l10n.startStocktaking),
          ),
          const SizedBox(height: 16),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            color: Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(Iconsax.info_circle, color: Colors.blue.shade700),
                  const SizedBox(height: 8),
                  Text(
                    l10n.stocktakingInfo,
                    style: TextStyle(color: Colors.blue.shade900),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReservationsTab(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.reserve, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            l10n.stockReservations,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.manageReservations,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.add),
            label: Text(l10n.createReservation),
          ),
          const SizedBox(height: 16),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            color: Colors.orange.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(Iconsax.info_circle, color: Colors.orange.shade700),
                  const SizedBox(height: 8),
                  Text(
                    l10n.reservationInfo,
                    style: TextStyle(color: Colors.orange.shade900),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
