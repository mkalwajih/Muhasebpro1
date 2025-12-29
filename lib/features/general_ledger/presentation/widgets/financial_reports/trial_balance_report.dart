import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
// Corrected Import Path
import '../../../domain/entities/trial_balance_entity.dart';

class TrialBalanceReport extends ConsumerStatefulWidget {
  const TrialBalanceReport({super.key});

  @override
  ConsumerState<TrialBalanceReport> createState() => _TrialBalanceReportState();
}

class _TrialBalanceReportState extends ConsumerState<TrialBalanceReport> {
    // ... state variables ...
  final DateTime _asOfDate = DateTime.now();
  final String _selectedBranch = 'All';
  final bool _showZeroBalances = false;
  List<TrialBalanceLineEntity> _trialBalanceData = [];

  @override
  void initState() {
    super.initState();
    _loadTrialBalanceData();
  }

  void _loadTrialBalanceData() {
      // Sample data
      _trialBalanceData = [
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
          // ... rest of data
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
          // ... UI implementation
          children: [
               // Use withValues instead of withOpacity
               // color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
               // ...
          ]
      );
  }

  // ... helper methods
  List<TrialBalanceLineEntity> _getFilteredData() {
      // ...
      return _trialBalanceData;
  }
   Future<void> _selectAsOfDate(BuildContext context) async { /* ... */ }
   Widget _buildBalanceVerification(double totalDebits, double totalCredits) { return Container(); }
}