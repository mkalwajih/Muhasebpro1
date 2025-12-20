import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../domain/entities/trial_balance_entity.dart';

class TrialBalanceReport extends ConsumerStatefulWidget {
  const TrialBalanceReport({super.key});

  @override
  ConsumerState<TrialBalanceReport> createState() => _TrialBalanceReportState();
}

class _TrialBalanceReportState extends ConsumerState<TrialBalanceReport> {
  DateTime _asOfDate = DateTime.now();
  String _selectedBranch = 'All';
  bool _showZeroBalances = false;
  List<TrialBalanceLineEntity> _trialBalanceData = [];

  @override
  void initState() {
    super.initState();
    _loadTrialBalanceData();
  }

  void _loadTrialBalanceData() {
    // Sample trial balance data
    _trialBalanceData = [
      // Assets
      TrialBalanceLineEntity(
        accountId: '1001',
        accountCode: '1001',
        accountName: 'Cash in Hand',
        accountType: 'Asset',
        debitBalance: 15000.0,
        creditBalance: 0.0,
        level: 1,
        isHeader: false,
      ),
      TrialBalanceLineEntity(
        accountId: '1002',
        accountCode: '1002',
        accountName: 'Bank Account - Main',
        accountType: 'Asset',
        debitBalance: 45000.0,
        creditBalance: 0.0,
        level: 1,
        isHeader: false,
      ),
      TrialBalanceLineEntity(
        accountId: '1100',
        accountCode: '1100',
        accountName: 'Accounts Receivable',
        accountType: 'Asset',
        debitBalance: 25000.0,
        creditBalance: 0.0,
        level: 1,
        isHeader: false,
      ),
      TrialBalanceLineEntity(
        accountId: '1500',
        accountCode: '1500',
        accountName: 'Office Equipment',
        accountType: 'Asset',
        debitBalance: 12000.0,
        creditBalance: 0.0,
        level: 1,
        isHeader: false,
      ),
      
      // Liabilities
      TrialBalanceLineEntity(
        accountId: '2001',
        accountCode: '2001',
        accountName: 'Accounts Payable',
        accountType: 'Liability',
        debitBalance: 0.0,
        creditBalance: 18000.0,
        level: 1,
        isHeader: false,
      ),
      TrialBalanceLineEntity(
        accountId: '2100',
        accountCode: '2100',
        accountName: 'Accrued Expenses',
        accountType: 'Liability',
        debitBalance: 0.0,
        creditBalance: 5000.0,
        level: 1,
        isHeader: false,
      ),
      
      // Equity
      TrialBalanceLineEntity(
        accountId: '3001',
        accountCode: '3001',
        accountName: 'Owner\'s Capital',
        accountType: 'Equity',
        debitBalance: 0.0,
        creditBalance: 50000.0,
        level: 1,
        isHeader: false,
      ),
      TrialBalanceLineEntity(
        accountId: '3100',
        accountCode: '3100',
        accountName: 'Retained Earnings',
        accountType: 'Equity',
        debitBalance: 0.0,
        creditBalance: 8000.0,
        level: 1,
        isHeader: false,
      ),
      
      // Revenue
      TrialBalanceLineEntity(
        accountId: '4001',
        accountCode: '4001',
        accountName: 'Sales Revenue',
        accountType: 'Revenue',
        debitBalance: 0.0,
        creditBalance: 35000.0,
        level: 1,
        isHeader: false,
      ),
      TrialBalanceLineEntity(
        accountId: '4100',
        accountCode: '4100',
        accountName: 'Service Revenue',
        accountType: 'Revenue',
        debitBalance: 0.0,
        creditBalance: 15000.0,
        level: 1,
        isHeader: false,
      ),
      
      // Expenses
      TrialBalanceLineEntity(
        accountId: '5001',
        accountCode: '5001',
        accountName: 'Office Supplies Expense',
        accountType: 'Expense',
        debitBalance: 8000.0,
        creditBalance: 0.0,
        level: 1,
        isHeader: false,
      ),
      TrialBalanceLineEntity(
        accountId: '5100',
        accountCode: '5100',
        accountName: 'Utilities Expense',
        accountType: 'Expense',
        debitBalance: 6000.0,
        creditBalance: 0.0,
        level: 1,
        isHeader: false,
      ),
      TrialBalanceLineEntity(
        accountId: '5200',
        accountCode: '5200',
        accountName: 'Rent Expense',
        accountType: 'Expense',
        debitBalance: 12000.0,
        creditBalance: 0.0,
        level: 1,
        isHeader: false,
      ),
      TrialBalanceLineEntity(
        accountId: '5300',
        accountCode: '5300',
        accountName: 'Salaries Expense',
        accountType: 'Expense',
        debitBalance: 15000.0,
        creditBalance: 0.0,
        level: 1,
        isHeader: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');

    final filteredData = _getFilteredData();
    final totalDebits = filteredData.fold<double>(0.0, (sum, line) => sum + line.debitBalance);
    final totalCredits = filteredData.fold<double>(0.0, (sum, line) => sum + line.creditBalance);

    return Column(
      children: [
        // Report header and filters
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border(
              bottom: BorderSide(
                color: theme.colorScheme.outline.withOpacity(0.2),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Report title
              Text(
                l10n.trialBalance,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              
              // Filters row
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectAsOfDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: l10n.asOfDate,
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(DateFormat('dd/MM/yyyy').format(_asOfDate)),
                            const Icon(Icons.calendar_today),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedBranch,
                      decoration: InputDecoration(
                        labelText: l10n.branch,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      items: [
                        DropdownMenuItem(value: 'All', child: Text(l10n.allBranches)),
                        const DropdownMenuItem(value: 'BR001', child: Text('Main Branch')),
                        const DropdownMenuItem(value: 'BR002', child: Text('Secondary Branch')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedBranch = value ?? 'All';
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 200,
                    child: CheckboxListTile(
                      title: Text(
                        l10n.showZeroBalances,
                        style: theme.textTheme.bodySmall,
                      ),
                      value: _showZeroBalances,
                      onChanged: (value) {
                        setState(() {
                          _showZeroBalances = value ?? false;
                        });
                      },
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Report content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Trial balance table
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.outline.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      // Table header
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                l10n.accountCode,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                l10n.accountName,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                l10n.debit,
                                textAlign: TextAlign.right,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                l10n.credit,
                                textAlign: TextAlign.right,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Table rows
                      ...filteredData.asMap().entries.map((entry) {
                        final index = entry.key;
                        final line = entry.value;
                        final isEven = index % 2 == 0;
                        
                        return Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: isEven 
                                ? theme.colorScheme.surface
                                : theme.colorScheme.surfaceVariant.withOpacity(0.3),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  line.accountCode,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  line.accountName,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  line.debitBalance > 0 
                                      ? currencyFormat.format(line.debitBalance)
                                      : '',
                                  textAlign: TextAlign.right,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  line.creditBalance > 0 
                                      ? currencyFormat.format(line.creditBalance)
                                      : '',
                                  textAlign: TextAlign.right,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      
                      // Total row
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer.withOpacity(0.5),
                          border: Border(
                            top: BorderSide(
                              color: theme.colorScheme.outline,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Text(
                                l10n.total,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                currencyFormat.format(totalDebits),
                                textAlign: TextAlign.right,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'monospace',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                currencyFormat.format(totalCredits),
                                textAlign: TextAlign.right,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'monospace',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Balance verification
                _buildBalanceVerification(totalDebits, totalCredits),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceVerification(double totalDebits, double totalCredits) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    
    final difference = (totalDebits - totalCredits).abs();
    final isBalanced = difference < 0.01;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isBalanced 
            ? theme.colorScheme.primaryContainer.withOpacity(0.3)
            : theme.colorScheme.errorContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isBalanced 
              ? theme.colorScheme.primary
              : theme.colorScheme.error,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                isBalanced ? Icons.check_circle : Icons.error,
                color: isBalanced 
                    ? theme.colorScheme.primary
                    : theme.colorScheme.error,
              ),
              const SizedBox(width: 8),
              Text(
                isBalanced ? l10n.trialBalanceIsBalanced : l10n.trialBalanceNotBalanced,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isBalanced 
                      ? theme.colorScheme.primary
                      : theme.colorScheme.error,
                ),
              ),
            ],
          ),
          if (!isBalanced) ...[
            const SizedBox(height: 8),
            Text(
              '${l10n.difference}: ${currencyFormat.format(difference)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }

  List<TrialBalanceLineEntity> _getFilteredData() {
    var data = _trialBalanceData;
    
    if (!_showZeroBalances) {
      data = data.where((line) => 
          line.debitBalance > 0 || line.creditBalance > 0).toList();
    }
    
    // Sort by account code
    data.sort((a, b) => a.accountCode.compareTo(b.accountCode));
    
    return data;
  }

  Future<void> _selectAsOfDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _asOfDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _asOfDate) {
      setState(() {
        _asOfDate = picked;
      });
      _loadTrialBalanceData(); // Reload data for new date
    }
  }
}