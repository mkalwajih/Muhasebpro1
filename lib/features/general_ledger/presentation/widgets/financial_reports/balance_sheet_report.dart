import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../domain/entities/balance_sheet_entity.dart';

class BalanceSheetReport extends ConsumerStatefulWidget {
  const BalanceSheetReport({super.key});

  @override
  ConsumerState<BalanceSheetReport> createState() => _BalanceSheetReportState();
}

class _BalanceSheetReportState extends ConsumerState<BalanceSheetReport> {
  // State variables for filters and data
  final DateTime _asOfDate = DateTime.now();
  final String _selectedBranch = 'All';
  List<BalanceSheetLineEntity> _balanceSheetData = [];

  @override
  void initState() {
    super.initState();
    _loadBalanceSheetData();
  }

  void _loadBalanceSheetData() {
    // Simulated data loading - in real app, fetch from provider based on _asOfDate and _selectedBranch
    _balanceSheetData = [
      BalanceSheetLineEntity(
        accountId: 'ASSETS_HEADER',
        accountCode: '',
        accountName: 'ASSETS',
        amount: 0.0,
        isHeader: true,
        level: 0,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: '1001',
        accountCode: '1001',
        accountName: 'Cash in Hand',
        amount: 50000.0,
        isHeader: false,
        level: 1,
        sectionType: BalanceSheetSection.assets,
      ),
      BalanceSheetLineEntity(
        accountId: 'TOTAL_ASSETS',
        accountCode: '',
        accountName: 'TOTAL ASSETS',
        amount: 50000.0,
        isHeader: true,
        level: 0,
        sectionType: BalanceSheetSection.assets,
      ),
      // ... rest of sample data (Liabilities and Equity)
    ];
    
    // FIX: Re-introduced setState to ensure the widget rebuilds with the loaded data
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);
    
    return Column(
      children: [
        // Filter Section
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border(
              bottom: BorderSide(
                color: theme.colorScheme.outline.withValues(alpha: 0.2), // FIX: Deprecation
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.balanceSheet,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              // Filter status display (uses _asOfDate and _selectedBranch)
              Text('As of: ${DateFormat.yMd().format(_asOfDate)} (Branch: $_selectedBranch)'), 
            ],
          ),
        ),
        // Report Content
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: _balanceSheetData.length,
            itemBuilder: (context, index) {
              return _buildBalanceSheetLine(_balanceSheetData[index]); // FIX: Used _buildBalanceSheetLine
            },
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
        backgroundColor = theme.colorScheme.primaryContainer.withValues(alpha: 0.5); // FIX: Deprecation
        textColor = theme.colorScheme.primary;
        fontWeight = FontWeight.bold;
        fontSize = 18.0;
      } else if (line.level == 1) {
        backgroundColor = theme.colorScheme.secondaryContainer.withValues(alpha: 0.3); // FIX: Deprecation
        textColor = theme.colorScheme.secondary;
        fontWeight = FontWeight.bold;
        fontSize = 16.0;
      }
      
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
            color: theme.colorScheme.outline.withValues(alpha: 0.5), // FIX: Deprecation
          ),
          bottom: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.5), // FIX: Deprecation
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
}
