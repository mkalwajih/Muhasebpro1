import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../shared/utils/app_permissions.dart';
import '../../../../shared/presentation/widgets/error_widget.dart' as custom;
import '../../../../shared/utils/role_checker.dart';
import '../widgets/setup/inventory_variables_tab.dart';
import '../widgets/setup/warehouses_tab.dart';
import '../widgets/setup/item_groups_tab.dart';

class InventorySetupScreen extends ConsumerStatefulWidget {
  const InventorySetupScreen({super.key});

  @override
  ConsumerState<InventorySetupScreen> createState() => _InventorySetupScreenState();
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
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final roleChecker = ref.watch(roleCheckerProvider);

    // Check permissions
    final canView = roleChecker.hasPermission(AppPermission.viewInventorySetup);
    final canModify = roleChecker.hasPermission(AppPermission.manageInventorySetup);

    if (!canView) {
      return Scaffold(
        appBar: AppBar(
          title: Text(t.master.setup),
        ),
        body: custom.CustomErrorWidget(
          error: t.common.accessDenied,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.master.setup),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: t.master.inventoryVariables),
            Tab(text: t.master.warehouses),
            Tab(text: t.master.itemGroups),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          InventoryVariablesTab(canModify: canModify),
          WarehousesTab(canModify: canModify),
          ItemGroupsTab(canModify: canModify),
        ],
      ),
    );
  }
}
