import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/setup/inventory_variables_tab.dart';
import '../widgets/setup/warehouses_tab.dart';
import '../widgets/setup/item_groups_tab.dart';

class InventorySetupScreen extends ConsumerStatefulWidget {
  const InventorySetupScreen({super.key});

  @override
  ConsumerState<InventorySetupScreen> createState() =>
      _InventorySetupScreenState();
}

class _InventorySetupScreenState extends ConsumerState<InventorySetupScreen>
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
    final l10n = Translations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.inventorySetup),
        backgroundColor: theme.colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Iconsax.setting_2),
              text: l10n.inventoryVariables,
            ),
            Tab(
              icon: const Icon(Iconsax.building),
              text: l10n.warehouses,
            ),
            Tab(
              icon: const Icon(Iconsax.category),
              text: l10n.itemGroups,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          InventoryVariablesTab(),
          WarehousesTab(),
          ItemGroupsTab(),
        ],
      ),
    );
  }
}
