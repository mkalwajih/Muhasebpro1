import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/income_statement_entity.dart';

class IncomeStatementReport extends ConsumerStatefulWidget {
  const IncomeStatementReport({super.key});

  @override
  ConsumerState<IncomeStatementReport> createState() => _IncomeStatementReportState();
}

class _IncomeStatementReportState extends ConsumerState<IncomeStatementReport> {
  // Removed unused fields _fromDate, _toDate, _selectedBranch
  List<IncomeStatementLineEntity> _incomeStatementData = [];

  @override
  void initState() {
    super.initState();
    _loadIncomeStatementData();
  }

  void _loadIncomeStatementData() {
    _incomeStatementData = [
      const IncomeStatementLineEntity(
        accountId: 'REV_HEADER',
        accountCode: '',
        accountName: 'REVENUE',
        amount: 0.0,
        isHeader: true,
        level: 0,
        sectionType: IncomeStatementSection.revenue,
      ),
      // ... Add more sample data as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Removed unused l10n variable
    final theme = Theme.of(context);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  // Fixed: Use withValues instead of withOpacity
                  color: theme.colorScheme.outline.withValues(alpha: 0.3),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: _incomeStatementData
                    .map((line) => _buildIncomeStatementLine(line))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIncomeStatementLine(IncomeStatementLineEntity line) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: 'S/.');
    
    Color? backgroundColor;
    Color? textColor;
    FontWeight fontWeight = FontWeight.normal;
    double fontSize = 14.0;

    if (line.isHeader) {
      if (line.sectionType == IncomeStatementSection.revenue ||
          line.sectionType == IncomeStatementSection.costOfGoodsSold ||
          line.sectionType == IncomeStatementSection.operatingExpenses ||
          line.sectionType == IncomeStatementSection.otherIncomeExpenses) {
        // Fixed: Use withValues
        backgroundColor = theme.colorScheme.primaryContainer.withValues(alpha: 0.3);
        textColor = theme.colorScheme.primary;
        fontWeight = FontWeight.bold;
        fontSize = 16.0;
      } else if (line.sectionType == IncomeStatementSection.grossProfit ||
          line.sectionType == IncomeStatementSection.operatingIncome) {
        // Fixed: Use withValues
        backgroundColor = theme.colorScheme.secondaryContainer.withValues(alpha: 0.5);
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
        border: line.isHeader
            ? Border(
                top: BorderSide(
                  // Fixed: Use withValues
                  color: theme.colorScheme.outline.withValues(alpha: 0.3),
                ),
                bottom: BorderSide(
                  // Fixed: Use withValues
                  color: theme.colorScheme.outline.withValues(alpha: 0.3),
                ),
              )
            : null,
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
                color: textColor ?? (line.amount < 0 ? theme.colorScheme.error : null),
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
