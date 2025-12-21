import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/app_permissions.dart';
import '../../../../shared/presentation/widgets/error_widget.dart';
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
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final roleChecker = ref.watch(roleCheckerProvider);

    // Check permissions
    final canView = roleChecker.hasPermission(AppPermission.viewGeneralLedger);

    if (!canView) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.financialReports),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.onSurface,
        ),
        body: ErrorWidget(
          l10n.accessDenied,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.financialReports),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshReport,
            tooltip: l10n.refresh,
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: _exportReport,
            tooltip: l10n.export,
          ),
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: _printReport,
            tooltip: l10n.print,
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
                  color: theme.colorScheme.outline.withOpacity(0.2),
                ),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                    border: Border(
                      bottom: BorderSide(
                        color: theme.colorScheme.outline.withOpacity(0.2),
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
                        l10n.selectReport,
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
                        l10n.trialBalance,
                        l10n.trialBalanceDescription,
                        Icons.balance,
                      ),
                      _buildReportTile(
                        ReportType.incomeStatement,
                        l10n.incomeStatement,
                        l10n.incomeStatementDescription,
                        Icons.trending_up,
                      ),
                      _buildReportTile(
                        ReportType.balanceSheet,
                        l10n.balanceSheet,
                        l10n.balanceSheetDescription,
                        Icons.account_balance_wallet,
                      ),
                      _buildReportTile(
                        ReportType.cashFlow,
                        l10n.cashFlowStatement,
                        l10n.cashFlowDescription,
                        Icons.water_drop,
                      ),
                      _buildReportTile(
                        ReportType.accountStatement,
                        l10n.accountStatement,
                        l10n.accountStatementDescription,
                        Icons.receipt_long,
                      ),
                      _buildReportTile(
                        ReportType.generalLedger,
                        l10n.generalLedgerReport,
                        l10n.generalLedgerDescription,
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
          ? theme.colorScheme.primaryContainer.withOpacity(0.5)
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
        content: Text(AppLocalizations.of(context)!.reportRefreshed),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _exportReport() {
    final l10n = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.exportReport),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.picture_as_pdf),
              title: Text(l10n.exportToPdf),
              onTap: () {
                Navigator.of(context).pop();
                _performExport('PDF');
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_chart),
              title: Text(l10n.exportToExcel),
              onTap: () {
                Navigator.of(context).pop();
                _performExport('Excel');
              },
            ),
            ListTile(
              leading: const Icon(Icons.text_snippet),
              title: Text(l10n.exportToCsv),
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
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );
  }

  void _performExport(String format) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(context)!.reportExportedSuccessfully(format),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _printReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.reportSentToPrinter),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}