import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
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
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // final theme = Theme.of(context); // Unused

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
                  initialValue: _selectedStatus,
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

  Widget _buildEmptyState() {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.savings,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noDepositsFound,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.createFirstDeposit,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDepositCard(CashDepositEntity deposit) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    deposit.referenceNumber,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildStatusChip(deposit.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              deposit.description,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildDetailItem(
                    l10n.amount,
                    currencyFormat.format(deposit.amount),
                    theme.colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: _buildDetailItem(
                    l10n.date,
                    dateFormat.format(deposit.depositDate),
                    null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildDetailItem(
                    l10n.fromAccount,
                    deposit.fromAccountId,
                    null,
                  ),
                ),
                Expanded(
                  child: _buildDetailItem(
                    l10n.toAccount,
                    deposit.toAccountId,
                    null,
                  ),
                ),
              ],
            ),
            if (widget.canManage) ...[
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (deposit.status == DepositStatus.draft)
                    TextButton.icon(
                      onPressed: () => _submitDeposit(deposit),
                      icon: const Icon(Icons.send, size: 16),
                      label: Text(l10n.submit),
                    ),
                  if (deposit.status == DepositStatus.pending)
                    TextButton.icon(
                      onPressed: () => _confirmDeposit(deposit),
                      icon: const Icon(Icons.check_circle, size: 16),
                      label: Text(l10n.confirm),
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                      ),
                    ),
                  if (deposit.status == DepositStatus.draft)
                    TextButton.icon(
                      onPressed: () => _deleteDeposit(deposit),
                      icon: const Icon(Icons.delete, size: 16),
                      label: Text(l10n.delete),
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.error,
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(DepositStatus status) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    
    Color backgroundColor;
    Color foregroundColor;
    String statusText;
    
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
  
  void _createNewDeposit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.newDeposit),
        content: const Text('Deposit form will be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add new deposit logic
            },
            child: Text(AppLocalizations.of(context)!.create),
          ),
        ],
      ),
    );
  }

  void _submitDeposit(CashDepositEntity deposit) {
    setState(() {
      final index = _deposits.indexOf(deposit);
      if (index != -1) {
        // Logic to update status
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.depositSubmittedSuccessfully)),
    );
  }

  void _confirmDeposit(CashDepositEntity deposit) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.depositConfirmedSuccessfully)),
    );
  }

  void _deleteDeposit(CashDepositEntity deposit) {
    setState(() {
      _deposits.remove(deposit);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.depositDeletedSuccessfully)),
    );
  }
}