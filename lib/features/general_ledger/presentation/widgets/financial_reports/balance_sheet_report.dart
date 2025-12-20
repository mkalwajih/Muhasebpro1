import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../domain/entities/balance_sheet_entity.dart';

class BalanceSheetReport extends ConsumerStatefulWidget {
  const BalanceSheetReport({super.key});

  @override
  ConsumerState<BalanceSheetReport> createState() => _BalanceSheetReportState();
}

class _BalanceSheetReportState extends ConsumerState<BalanceSheetReport> {
  DateTime _asOfDate = DateTime.now();
  String _selectedBranch = 'All';
  List<BalanceSheetLineEntity> _balanceSheetData = [];

  @override
  void initState() {
    super.initState();
    _loadBalanceSheetData();
  }

  void _loadBalanceSheetData() {
    // Sample balance sheet data
    _balanceSheetData = [
      // ASSETS
      BalanceSheetLineEntity(
        accountId: 'ASSETS_HEADER',
        accountCode: '',
        accountName: 'ASSETS',
        amount: 0.0,
        isHeader: true,
        level: 0,
        sectionType: BalanceSheetSection.assets,
      ),
      
      // Current Assets
      BalanceSheetLineEntity(
        accountId: 'CURRENT_ASSETS',
        accountCode: '',
        accountName: 'Current Assets',
        amount: 0.0,
        isHeader: true,
        level: 1,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: '1001',
        accountCode: '1001',
        accountName: 'Cash in Hand',
        amount: 15000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: '1002',
        accountCode: '1002',
        accountName: 'Bank Account - Main',
        amount: 45000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: '1100',
        accountCode: '1100',
        accountName: 'Accounts Receivable',
        amount: 25000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: '1200',
        accountCode: '1200',
        accountName: 'Inventory',
        amount: 18000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: 'CURRENT_ASSETS_TOTAL',
        accountCode: '',
        accountName: 'Total Current Assets',
        amount: 103000.0,
        isHeader: true,
        level: 1,
        sectionType: BalanceSheetSection.assets,
      ),
      
      // Fixed Assets
      BalanceSheetLineEntity(
        accountId: 'FIXED_ASSETS',
        accountCode: '',
        accountName: 'Fixed Assets',
        amount: 0.0,
        isHeader: true,
        level: 1,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: '1500',
        accountCode: '1500',
        accountName: 'Office Equipment',
        amount: 25000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: '1501',
        accountCode: '1501',
        accountName: 'Less: Accumulated Depreciation',
        amount: -5000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: '1600',
        accountCode: '1600',
        accountName: 'Vehicles',
        amount: 40000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: '1601',
        accountCode: '1601',
        accountName: 'Less: Accumulated Depreciation',
        amount: -8000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: 'FIXED_ASSETS_TOTAL',
        accountCode: '',
        accountName: 'Total Fixed Assets',
        amount: 52000.0,
        isHeader: true,
        level: 1,
        sectionType: BalanceSheetSection.assets,
      ),
      
      BalanceSheetLineEntity(
        accountId: 'TOTAL_ASSETS',
        accountCode: '',
        accountName: 'TOTAL ASSETS',
        amount: 155000.0,
        isHeader: true,
        level: 0,
        sectionType: BalanceSheetSection.assets,
      ),
      
      // LIABILITIES
      BalanceSheetLineEntity(
        accountId: 'LIABILITIES_HEADER',
        accountCode: '',
        accountName: 'LIABILITIES',
        amount: 0.0,
        isHeader: true,
        level: 0,
        sectionType: BalanceSheetSection.liabilities,
      ),
      
      // Current Liabilities
      BalanceSheetLineEntity(
        accountId: 'CURRENT_LIABILITIES',
        accountCode: '',
        accountName: 'Current Liabilities',
        amount: 0.0,
        isHeader: true,
        level: 1,
        sectionType: BalanceSheetSection.liabilities,
      ),
      BalanceSheetLineEntity(
        accountId: '2001',
        accountCode: '2001',
        accountName: 'Accounts Payable',
        amount: 18000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.liabilities,
      ),
      BalanceSheetLineEntity(
        accountId: '2100',
        accountCode: '2100',
        accountName: 'Accrued Expenses',
        amount: 5000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.liabilities,
      ),
      BalanceSheetLineEntity(
        accountId: '2200',
        accountCode: '2200',
        accountName: 'Short-term Loans',
        amount: 12000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.liabilities,
      ),
      BalanceSheetLineEntity(
        accountId: 'CURRENT_LIABILITIES_TOTAL',
        accountCode: '',
        accountName: 'Total Current Liabilities',
        amount: 35000.0,
        isHeader: true,
        level: 1,
        sectionType: BalanceSheetSection.liabilities,
      ),
      
      // Long-term Liabilities
      BalanceSheetLineEntity(
        accountId: 'LONGTERM_LIABILITIES',
        accountCode: '',
        accountName: 'Long-term Liabilities',
        amount: 0.0,
        isHeader: true,
        level: 1,
        sectionType: BalanceSheetSection.liabilities,
      ),
      BalanceSheetLineEntity(
        accountId: '2500',
        accountCode: '2500',
        accountName: 'Long-term Loan',
        amount: 25000.0,
        isHeader: false,
        level: 2,
        sectionType: BalanceSheetSection.liabilities,
      ),
      BalanceSheetLineEntity(
        accountId: 'LONGTERM_LIABILITIES_TOTAL',
        accountCode: '',
        accountName: 'Total Long-term Liabilities',
        amount: 25000.0,
        isHeader: true,
        level: 1,
        sectionType: BalanceSheetSection.liabilities,
      ),
      
      BalanceSheetLineEntity(
        accountId: 'TOTAL_LIABILITIES',
        accountCode: '',
        accountName: 'TOTAL LIABILITIES',
        amount: 60000.0,
        isHeader: true,
        level: 0,
        sectionType: BalanceSheetSection.liabilities,
      ),
      
      // EQUITY
      BalanceSheetLineEntity(
        accountId: 'EQUITY_HEADER',
        accountCode: '',
        accountName: 'EQUITY',
        amount: 0.0,
        isHeader: true,
        level: 0,
        sectionType: BalanceSheetSection.equity,
      ),
      BalanceSheetLineEntity(
        accountId: '3001',
        accountCode: '3001',
        accountName: 'Owner\'s Capital',
        amount: 70000.0,
        isHeader: false,
        level: 1,
        sectionType: BalanceSheetSection.equity,
      ),
      BalanceSheetLineEntity(
        accountId: '3100',
        accountCode: '3100',
        accountName: 'Retained Earnings',
        amount: 25000.0,
        isHeader: false,
        level: 1,
        sectionType: BalanceSheetSection.equity,
      ),
      BalanceSheetLineEntity(
        accountId: 'TOTAL_EQUITY',
        accountCode: '',
        accountName: 'TOTAL EQUITY',
        amount: 95000.0,
        isHeader: true,
        level: 0,
        sectionType: BalanceSheetSection.equity,
      ),
      
      BalanceSheetLineEntity(
        accountId: 'TOTAL_LIABILITIES_EQUITY',
        accountCode: '',
        accountName: 'TOTAL LIABILITIES & EQUITY',
        amount: 155000.0,
        isHeader: true,
        level: 0,
        sectionType: BalanceSheetSection.total,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');

    final totalAssets = _balanceSheetData
        .where((line) => line.accountId == 'TOTAL_ASSETS')
        .first.amount;
    final totalLiabilitiesEquity = _balanceSheetData
        .where((line) => line.accountId == 'TOTAL_LIABILITIES_EQUITY')
        .first.amount;

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
                l10n.balanceSheet,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${l10n.asOf} ${DateFormat('dd/MM/yyyy').format(_asOfDate)}',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
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
                  Expanded(child: Container()), // Spacer
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.outline.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: _balanceSheetData.map((line) => 
                        _buildBalanceSheetLine(line)).toList(),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Balance verification
                _buildBalanceVerification(totalAssets, totalLiabilitiesEquity),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceSheetLine(BalanceSheetLineEntity line) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    
    Color? backgroundColor;
    Color? textColor;
    FontWeight fontWeight = FontWeight.normal;
    double fontSize = 14.0;
    
    if (line.isHeader) {
      if (line.level == 0) {
        // Main section headers
        backgroundColor = theme.colorScheme.primaryContainer.withOpacity(0.5);
        textColor = theme.colorScheme.primary;
        fontWeight = FontWeight.bold;
        fontSize = 18.0;
      } else if (line.level == 1) {
        // Sub-section headers
        backgroundColor = theme.colorScheme.secondaryContainer.withOpacity(0.3);
        textColor = theme.colorScheme.secondary;
        fontWeight = FontWeight.bold;
        fontSize = 16.0;
      }
      
      // Special styling for totals
      if (line.accountId.contains('TOTAL')) {
        backgroundColor = theme.colorScheme.primaryContainer;
        textColor = theme.colorScheme.primary;
        fontWeight = FontWeight.bold;
        fontSize = line.level == 0 ? 20.0 : 16.0;
      }
    }
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0 + (line.level * 20.0),
        vertical: line.isHeader ? 12.0 : 8.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: line.isHeader && line.level == 0 ? Border(
          top: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.5),
          ),
          bottom: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.5),
          ),
        ) : null,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Text(
              line.accountName,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              line.accountCode.isNotEmpty || line.amount != 0.0
                  ? currencyFormat.format(line.amount)
                  : '',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor ?? (line.amount < 0 
                    ? theme.colorScheme.error 
                    : null),
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceVerification(double totalAssets, double totalLiabilitiesEquity) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    
    final difference = (totalAssets - totalLiabilitiesEquity).abs();
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
                isBalanced ? l10n.balanceSheetIsBalanced : l10n.balanceSheetNotBalanced,
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
      _loadBalanceSheetData(); // Reload data for new date
    }
  }
}