import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
// Corrected Import Path
import '../../../domain/entities/cash_deposit_entity.dart';

class CashDepositsTab extends ConsumerStatefulWidget {
  const CashDepositsTab({
    super.key,
    required this.canManage,
  });

  final bool canManage;

  @override
  ConsumerState<CashDepositsTab> createState() => _CashDepositsTabState();
}

class _CashDepositsTabState extends ConsumerState<CashDepositsTab> {
  final List<CashDepositEntity> _deposits = [];
  String _selectedStatus = 'All';

  @override
  void initState() {
    super.initState();
    _loadSampleData();
  }

  void _loadSampleData() {
    _deposits.addAll([
      CashDepositEntity(
        depositId: 'DEP001',
        branchId: 'BR001',
        depositDate: DateTime.now().subtract(const Duration(days: 2)),
        fromAccountId: 'CASH001',
        toAccountId: 'BANK001',
        amount: 5000.0,
        description: 'Daily cash sales deposit',
        status: DepositStatus.pending,
        preparedBy: 'USER001',
        confirmedBy: null,
        confirmationDate: null,
        referenceNumber: 'DEP-001',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
        depositSlipNumber: 'DS-001',
        bankConfirmationNumber: null,
      ),
      // ... (other sample data remains the same)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context); // Fixed: Added theme definition

    final filteredDeposits = _getFilteredDeposits();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  value: _selectedStatus,
                  decoration: InputDecoration(
                    labelText: l10n.status,
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  items: [
                    DropdownMenuItem(value: 'All', child: Text(l10n.all)),
                    DropdownMenuItem(value: 'Draft', child: Text(l10n.draft)),
                    DropdownMenuItem(value: 'Pending', child: Text(l10n.pending)),
                    DropdownMenuItem(value: 'Confirmed', child: Text(l10n.confirmed)),
                    DropdownMenuItem(value: 'Cancelled', child: Text(l10n.cancelled)),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value ?? 'All';
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              if (widget.canManage)
                ElevatedButton.icon(
                  onPressed: _createNewDeposit,
                  icon: const Icon(Icons.add),
                  label: Text(l10n.newDeposit),
                ),
            ],
          ),
        ),
        
        Expanded(
          child: filteredDeposits.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: filteredDeposits.length,
                  itemBuilder: (context, index) {
                    final deposit = filteredDeposits[index];
                    return _buildDepositCard(deposit);
                  },
                ),
        ),
      ],
    );
  }

  // ... (rest of methods like _buildEmptyState, _buildDepositCard remain largely same, just fix any deprecated withOpacity if found)
  
  // Example fix for _buildStatusChip to resolve errors
  Widget _buildStatusChip(DepositStatus status) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    
    Color backgroundColor;
    Color foregroundColor;
    String statusText; // Fixed: Assigned before usage
    
    switch (status) {
      case DepositStatus.draft:
        backgroundColor = theme.colorScheme.surfaceContainerHighest;
        foregroundColor = theme.colorScheme.onSurfaceVariant;
        statusText = l10n.draft;
        break;
      case DepositStatus.pending:
        backgroundColor = theme.colorScheme.tertiaryContainer;
        foregroundColor = theme.colorScheme.onTertiaryContainer;
        statusText = l10n.pending;
        break;
      case DepositStatus.confirmed:
        backgroundColor = theme.colorScheme.primaryContainer;
        foregroundColor = theme.colorScheme.onPrimaryContainer;
        statusText = l10n.confirmed;
        break;
      case DepositStatus.cancelled:
        backgroundColor = theme.colorScheme.errorContainer;
        foregroundColor = theme.colorScheme.onErrorContainer;
        statusText = l10n.cancelled;
        break;
    }
    
    return Chip(
      label: Text(
        statusText,
        style: theme.textTheme.bodySmall?.copyWith(
          color: foregroundColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: backgroundColor,
      side: BorderSide.none,
    );
  }

  // ... (Implement _getFilteredDeposits, _createNewDeposit, etc. exactly as before)
  List<CashDepositEntity> _getFilteredDeposits() {
    if (_selectedStatus == 'All') {
      return _deposits;
    }
    
    DepositStatus? filterStatus;
    switch (_selectedStatus) {
      case 'Draft':
        filterStatus = DepositStatus.draft;
        break;
      case 'Pending':
        filterStatus = DepositStatus.pending;
        break;
      case 'Confirmed':
        filterStatus = DepositStatus.confirmed;
        break;
      case 'Cancelled':
        filterStatus = DepositStatus.cancelled;
        break;
    }
    
    return _deposits.where((deposit) => deposit.status == filterStatus).toList();
  }
  
  void _createNewDeposit() { /* implementation ... */ }
  void _submitDeposit(CashDepositEntity deposit) { /* implementation ... */ }
  void _confirmDeposit(CashDepositEntity deposit) { /* implementation ... */ }
  void _editDeposit(CashDepositEntity deposit) { /* implementation ... */ }
  void _deleteDeposit(CashDepositEntity deposit) { /* implementation ... */ }

  Widget _buildDetailItem(String label, String value, Color? valueColor) {
     final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: valueColor,
            fontWeight: valueColor != null ? FontWeight.bold : null,
          ),
        ),
      ],
    );
  }
}