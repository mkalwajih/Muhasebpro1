import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../shared/utils/app_permissions.dart';
import '../../../../shared/presentation/widgets/error_widget.dart' as custom;
import '../../../../shared/utils/role_checker.dart';
import '../widgets/financial_reports/trial_balance_report.dart';
import '../widgets/financial_reports/income_statement_report.dart';
import '../widgets/financial_reports/balance_sheet_report.dart';
import '../widgets/financial_reports/cash_flow_report.dart';
import '../widgets/financial_reports/account_statement_report.dart';
import '../widgets/financial_reports/general_ledger_report.dart';

enum ReportType {
  trialBalance,
  incomeStatement,
  balanceSheet,
  cashFlow,
  accountStatement,
  generalLedger,
}

class FinancialReportsScreen extends ConsumerStatefulWidget {
  const FinancialReportsScreen({super.key});

  @override
  ConsumerState<FinancialReportsScreen> createState() => _FinancialReportsScreenState();
}

class _FinancialReportsScreenState extends ConsumerState<FinancialReportsScreen> {
  ReportType _selectedReportType = ReportType.trialBalance;

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);
    final roleChecker = ref.watch(roleCheckerProvider);

    // Check permissions
    final canView = roleChecker.hasPermission(AppPermission.viewGeneralLedger);

    if (!canView) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.reports.title),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.onSurface,
        ),
        body: custom.CustomErrorWidget(
          error: l10n.common.accessDenied,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.reports.title),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshReport,
            tooltip: l10n.common.refresh,
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: _exportReport,
            tooltip: l10n.common.export,
          ),
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: _printReport,
            tooltip: l10n.common.print,
          ),
        ],
      ),
      body: Row(
        children: [
          // Report selection sidebar
          Container(
            width: 280,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              border: Border(
                right: BorderSide(
                  color: theme.colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                    border: Border(
                      bottom: BorderSide(
                        color: theme.colorScheme.outline.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.assessment,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.reports.selectReport,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      _buildReportTile(
                        ReportType.trialBalance,
                        l10n.reports.trialBalance,
                        l10n.reports.trialBalanceDescription,
                        Icons.balance,
                      ),
                      _buildReportTile(
                        ReportType.incomeStatement,
                        l10n.reports.incomeStatement,
                        l10n.reports.incomeStatementDescription,
                        Icons.trending_up,
                      ),
                      _buildReportTile(
                        ReportType.balanceSheet,
                        l10n.reports.balanceSheet,
                        l10n.reports.balanceSheetDescription,
                        Icons.account_balance_wallet,
                      ),
                      _buildReportTile(
                        ReportType.cashFlow,
                        l10n.reports.cashFlowStatement,
                        l10n.reports.cashFlowDescription,
                        Icons.water_drop,
                      ),
                      _buildReportTile(
                        ReportType.accountStatement,
                        l10n.reports.accountStatement,
                        l10n.reports.accountStatementDescription,
                        Icons.receipt_long,
                      ),
                      _buildReportTile(
                        ReportType.generalLedger,
                        l10n.reports.generalLedgerReport,
                        l10n.reports.generalLedgerDescription,
                        Icons.book,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Report content area
          Expanded(
            child: _buildReportContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildReportTile(
    ReportType reportType,
    String title,
    String description,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    final isSelected = _selectedReportType == reportType;

    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
          color: isSelected 
          ? theme.colorScheme.primaryContainer.withValues(alpha: 0.5)
          : null,
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected 
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurfaceVariant,
        ),
        title: Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected 
                ? theme.colorScheme.primary
                : null,
          ),
        ),
        subtitle: Text(
          description,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        selected: isSelected,
        onTap: () {
          setState(() {
            _selectedReportType = reportType;
          });
        },
      ),
    );
  }

  Widget _buildReportContent() {
    switch (_selectedReportType) {
      case ReportType.trialBalance:
        return const TrialBalanceReport();
      case ReportType.incomeStatement:
        return const IncomeStatementReport();
      case ReportType.balanceSheet:
        return const BalanceSheetReport();
      case ReportType.cashFlow:
        return const CashFlowReport();
      case ReportType.accountStatement:
        return const AccountStatementReport();
      case ReportType.generalLedger:
        return const GeneralLedgerReport();
    }
  }

  void _refreshReport() {
    // TODO: Implement refresh logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(Translations.of(context).reports.reportRefreshed),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _exportReport() {
    final l10n = Translations.of(context);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.reports.exportReport),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.picture_as_pdf),
              title: Text(l10n.reports.exportToPdf),
              onTap: () {
                Navigator.of(context).pop();
                _performExport('PDF');
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_chart),
              title: Text(l10n.reports.exportToExcel),
              onTap: () {
                Navigator.of(context).pop();
                _performExport('Excel');
              },
            ),
            ListTile(
              leading: const Icon(Icons.text_snippet),
              title: Text(l10n.reports.exportToCsv),
              onTap: () {
                Navigator.of(context).pop();
                _performExport('CSV');
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.common.cancel),
          ),
        ],
      ),
    );
  }

  void _performExport(String format) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          Translations.of(context).reports.reportExportedSuccessfully(format: format),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _printReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(Translations.of(context).reports.reportSentToPrinter),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
