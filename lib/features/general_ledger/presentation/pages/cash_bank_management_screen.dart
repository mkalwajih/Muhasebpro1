import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/app_permissions.dart';
import '../../../../shared/presentation/widgets/error_widget.dart' as custom;
import '../../../../shared/utils/role_checker.dart';
import '../widgets/cash_bank/bank_reconciliation_tab.dart';
import '../widgets/cash_bank/cash_deposits_tab.dart';
import '../widgets/cash_bank/bank_statements_tab.dart';
import '../widgets/cash_bank/adjustment_entries_tab.dart';

class CashBankManagementScreen extends ConsumerStatefulWidget {
  const CashBankManagementScreen({super.key});

  @override
  ConsumerState<CashBankManagementScreen> createState() => _CashBankManagementScreenState();
}

class _CashBankManagementScreenState extends ConsumerState<CashBankManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
    final roleChecker = ref.watch(roleCheckerProvider);

    // Check permissions
    final canView = roleChecker.hasPermission(AppPermission.viewGeneralLedger);
    final canManage = roleChecker.hasPermission(AppPermission.manageGLSetup);

    if (!canView) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.cashBankManagement),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.onSurface,
        ),
        body: custom.CustomErrorWidget(
          error: l10n.accessDenied,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.cashBankManagement),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.account_balance),
              text: l10n.bankReconciliation,
            ),
            Tab(
              icon: const Icon(Icons.savings),
              text: l10n.cashDeposits,
            ),
            Tab(
              icon: const Icon(Icons.receipt_long),
              text: l10n.bankStatements,
            ),
            Tab(
              icon: const Icon(Icons.edit_note),
              text: l10n.adjustmentEntries,
            ),
          ],
          labelColor: theme.colorScheme.primary,
          unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
          indicatorColor: theme.colorScheme.primary,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _refreshCurrentTab(),
            tooltip: l10n.refresh,
          ),
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () => _showHelpDialog(),
            tooltip: l10n.help,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BankReconciliationTab(canManage: canManage),
          CashDepositsTab(canManage: canManage),
          BankStatementsTab(canManage: canManage),
          AdjustmentEntriesTab(canManage: canManage),
        ],
      ),
    );
  }

  void _refreshCurrentTab() {
    // Refresh the current tab's data
    final currentIndex = _tabController.index;
    switch (currentIndex) {
      case 0:
        // Refresh bank reconciliation
        break;
      case 1:
        // Refresh cash deposits
        break;
      case 2:
        // Refresh bank statements
        break;
      case 3:
        // Refresh adjustment entries
        break;
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(Translations.of(context).dataRefreshed),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showHelpDialog() {
    final l10n = Translations.of(context);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.help),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.cashBankManagementHelp,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              _buildHelpSection(
                l10n.bankReconciliation,
                l10n.bankReconciliationHelp,
              ),
              const SizedBox(height: 12),
              _buildHelpSection(
                l10n.cashDeposits,
                l10n.cashDepositsHelp,
              ),
              const SizedBox(height: 12),
              _buildHelpSection(
                l10n.bankStatements,
                l10n.bankStatementsHelp,
              ),
              const SizedBox(height: 12),
              _buildHelpSection(
                l10n.adjustmentEntries,
                l10n.adjustmentEntriesHelp,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}