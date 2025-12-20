import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../domain/entities/income_statement_entity.dart';

class IncomeStatementReport extends ConsumerStatefulWidget {
  const IncomeStatementReport({super.key});

  @override
  ConsumerState<IncomeStatementReport> createState() => _IncomeStatementReportState();
}

class _IncomeStatementReportState extends ConsumerState<IncomeStatementReport> {
  DateTime _fromDate = DateTime(DateTime.now().year, 1, 1);
  DateTime _toDate = DateTime.now();
  String _selectedBranch = 'All';
  List<IncomeStatementLineEntity> _incomeStatementData = [];

  @override
  void initState() {
    super.initState();
    _loadIncomeStatementData();
  }

  void _loadIncomeStatementData() {
    // Sample income statement data
    _incomeStatementData = [
      // Revenue Section
      IncomeStatementLineEntity(
        accountId: 'REV_HEADER',
        accountCode: '',
        accountName: 'REVENUE',
        amount: 0.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.revenue,
      ),
      IncomeStatementLineEntity(
        accountId: '4001',
        accountCode: '4001',
        accountName: 'Sales Revenue',
        amount: 150000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.revenue,
      ),
      IncomeStatementLineEntity(
        accountId: '4100',
        accountCode: '4100',
        accountName: 'Service Revenue',
        amount: 75000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.revenue,
      ),
      IncomeStatementLineEntity(
        accountId: '4200',
        accountCode: '4200',
        accountName: 'Interest Income',
        amount: 5000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.revenue,
      ),
      IncomeStatementLineEntity(
        accountId: 'REV_TOTAL',
        accountCode: '',
        accountName: 'Total Revenue',
        amount: 230000.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.revenue,
      ),
      
      // Cost of Goods Sold Section
      IncomeStatementLineEntity(
        accountId: 'COGS_HEADER',
        accountCode: '',
        accountName: 'COST OF GOODS SOLD',
        amount: 0.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.costOfGoodsSold,
      ),
      IncomeStatementLineEntity(
        accountId: '5001',
        accountCode: '5001',
        accountName: 'Cost of Materials',
        amount: 60000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.costOfGoodsSold,
      ),
      IncomeStatementLineEntity(
        accountId: '5002',
        accountCode: '5002',
        accountName: 'Direct Labor',
        amount: 40000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.costOfGoodsSold,
      ),
      IncomeStatementLineEntity(
        accountId: 'COGS_TOTAL',
        accountCode: '',
        accountName: 'Total Cost of Goods Sold',
        amount: 100000.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.costOfGoodsSold,
      ),
      
      // Gross Profit
      IncomeStatementLineEntity(
        accountId: 'GROSS_PROFIT',
        accountCode: '',
        accountName: 'GROSS PROFIT',
        amount: 130000.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.grossProfit,
      ),
      
      // Operating Expenses Section
      IncomeStatementLineEntity(
        accountId: 'OPEX_HEADER',
        accountCode: '',
        accountName: 'OPERATING EXPENSES',
        amount: 0.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.operatingExpenses,
      ),
      IncomeStatementLineEntity(
        accountId: '6001',
        accountCode: '6001',
        accountName: 'Salaries and Wages',
        amount: 45000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.operatingExpenses,
      ),
      IncomeStatementLineEntity(
        accountId: '6100',
        accountCode: '6100',
        accountName: 'Rent Expense',
        amount: 24000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.operatingExpenses,
      ),
      IncomeStatementLineEntity(
        accountId: '6200',
        accountCode: '6200',
        accountName: 'Utilities Expense',
        amount: 12000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.operatingExpenses,
      ),
      IncomeStatementLineEntity(
        accountId: '6300',
        accountCode: '6300',
        accountName: 'Office Supplies',
        amount: 8000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.operatingExpenses,
      ),
      IncomeStatementLineEntity(
        accountId: '6400',
        accountCode: '6400',
        accountName: 'Marketing Expense',
        amount: 15000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.operatingExpenses,
      ),
      IncomeStatementLineEntity(
        accountId: 'OPEX_TOTAL',
        accountCode: '',
        accountName: 'Total Operating Expenses',
        amount: 104000.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.operatingExpenses,
      ),
      
      // Operating Income
      IncomeStatementLineEntity(
        accountId: 'OPERATING_INCOME',
        accountCode: '',
        accountName: 'OPERATING INCOME',
        amount: 26000.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.operatingIncome,
      ),
      
      // Other Income/Expenses
      IncomeStatementLineEntity(
        accountId: 'OTHER_HEADER',
        accountCode: '',
        accountName: 'OTHER INCOME (EXPENSES)',
        amount: 0.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.otherIncomeExpenses,
      ),
      IncomeStatementLineEntity(
        accountId: '7001',
        accountCode: '7001',
        accountName: 'Interest Expense',
        amount: -2000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.otherIncomeExpenses,
      ),
      IncomeStatementLineEntity(
        accountId: '7100',
        accountCode: '7100',
        accountName: 'Gain on Asset Sale',
        amount: 3000.0,
        isHeader: false,
        level: 1,
        sectionType: IncomeStatementSection.otherIncomeExpenses,
      ),
      IncomeStatementLineEntity(
        accountId: 'OTHER_TOTAL',
        accountCode: '',
        accountName: 'Total Other Income (Expenses)',
        amount: 1000.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.otherIncomeExpenses,
      ),
      
      // Net Income
      IncomeStatementLineEntity(
        accountId: 'NET_INCOME',
        accountCode: '',
        accountName: 'NET INCOME',
        amount: 27000.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.netIncome,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');

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
                l10n.incomeStatement,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${DateFormat('dd/MM/yyyy').format(_fromDate)} - ${DateFormat('dd/MM/yyyy').format(_toDate)}',
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
                      onTap: () => _selectFromDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: l10n.fromDate,
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(DateFormat('dd/MM/yyyy').format(_fromDate)),
                            const Icon(Icons.calendar_today),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectToDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: l10n.toDate,
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(DateFormat('dd/MM/yyyy').format(_toDate)),
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
                ],
              ),
            ],
          ),
        ),
        
        // Report content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.colorScheme.outline.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: _incomeStatementData.map((line) => 
                    _buildIncomeStatementLine(line)).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIncomeStatementLine(IncomeStatementLineEntity line) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    
    Color? backgroundColor;
    Color? textColor;
    FontWeight fontWeight = FontWeight.normal;
    double fontSize = 14.0;
    
    if (line.isHeader) {
      if (line.sectionType == IncomeStatementSection.revenue ||
          line.sectionType == IncomeStatementSection.costOfGoodsSold ||
          line.sectionType == IncomeStatementSection.operatingExpenses ||
          line.sectionType == IncomeStatementSection.otherIncomeExpenses) {
        backgroundColor = theme.colorScheme.primaryContainer.withOpacity(0.3);
        textColor = theme.colorScheme.primary;
        fontWeight = FontWeight.bold;
        fontSize = 16.0;
      } else if (line.sectionType == IncomeStatementSection.grossProfit ||
                 line.sectionType == IncomeStatementSection.operatingIncome) {
        backgroundColor = theme.colorScheme.secondaryContainer.withOpacity(0.5);
        textColor = theme.colorScheme.secondary;
        fontWeight = FontWeight.bold;
        fontSize = 18.0;
      } else if (line.sectionType == IncomeStatementSection.netIncome) {
        backgroundColor = theme.colorScheme.primaryContainer;
        textColor = theme.colorScheme.primary;
        fontWeight = FontWeight.bold;
        fontSize = 20.0;
      }
    }
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0 + (line.level * 20.0),
        vertical: line.isHeader ? 12.0 : 8.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: line.isHeader ? Border(
          top: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.3),
          ),
          bottom: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.3),
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

  Future<void> _selectFromDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = picked;
      });
      _loadIncomeStatementData(); // Reload data for new date range
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _toDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _toDate) {
      setState(() {
        _toDate = picked;
      });
      _loadIncomeStatementData(); // Reload data for new date range
    }
  }
}