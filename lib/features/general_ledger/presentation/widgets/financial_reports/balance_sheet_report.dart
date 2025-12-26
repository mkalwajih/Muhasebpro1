import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
// Corrected Import Path (3 levels up)
import '../../../domain/entities/balance_sheet_entity.dart';

class BalanceSheetReport extends ConsumerStatefulWidget {
  const BalanceSheetReport({super.key});

  @override
  ConsumerState<BalanceSheetReport> createState() => _BalanceSheetReportState();
}

class _BalanceSheetReportState extends ConsumerState<BalanceSheetReport> {
  // ... state variables ...
  DateTime _asOfDate = DateTime.now();
  String _selectedBranch = 'All';
  List<BalanceSheetLineEntity> _balanceSheetData = [];

  @override
  void initState() {
    super.initState();
    _loadBalanceSheetData();
  }

  void _loadBalanceSheetData() {
    // ... data loading logic ...
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
      // ... rest of sample data
    ];
  }

  @override
  Widget build(BuildContext context) {
    // ... build method using corrected imports
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    // ... 
    return Column(
        children: [
             // ... UI code ...
             // Example fix for deprecation in _buildBalanceSheetLine:
             // color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
        ]
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
        backgroundColor = theme.colorScheme.primaryContainer.withOpacity(0.5);
        textColor = theme.colorScheme.primary;
        fontWeight = FontWeight.bold;
        fontSize = 18.0;
      } else if (line.level == 1) {
        backgroundColor = theme.colorScheme.secondaryContainer.withOpacity(0.3);
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

  // ... rest of the class
  Widget _buildBalanceVerification(double totalAssets, double totalLiabilitiesEquity) {
      // ... implementation ...
      return Container(); // Placeholder
  }
   Future<void> _selectAsOfDate(BuildContext context) async {
       // ... implementation ...
   }
}