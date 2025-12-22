import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/adjustment_entry_entity.dart';

class AdjustmentEntriesTab extends ConsumerStatefulWidget {
  const AdjustmentEntriesTab({
    super.key,
    required this.canManage,
  });

  final bool canManage;

  @override
  ConsumerState<AdjustmentEntriesTab> createState() => _AdjustmentEntriesTabState();
}

class _AdjustmentEntriesTabState extends ConsumerState<AdjustmentEntriesTab> {
  final List<AdjustmentEntryEntity> _adjustments = [];
  String _selectedType = 'All';

  @override
  void initState() {
    super.initState();
    _loadSampleData();
  }

  void _loadSampleData() {
    _adjustments.addAll([
      AdjustmentEntryEntity(
        adjustmentId: 'ADJ001',
        branchId: 'BR001',
        adjustmentDate: DateTime.now().subtract(const Duration(days: 3)),
        adjustmentType: AdjustmentType.bankCharges,
        description: 'Monthly bank service charges',
        amount: -25.0,
        accountId: 'ACC001',
        contraAccountId: 'EXP001',
        status: AdjustmentStatus.posted,
        referenceNumber: 'ADJ-001',
        approvedBy: 'USER002',
        approvalDate: DateTime.now().subtract(const Duration(days: 2)),
        createdBy: 'USER001',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
        journalVoucherId: 'JV001',
        bankStatementId: 'STMT001',
        notes: 'Standard monthly bank charges',
      ),
      AdjustmentEntryEntity(
        adjustmentId: 'ADJ002',
        branchId: 'BR001',
        adjustmentDate: DateTime.now().subtract(const Duration(days: 1)),
        adjustmentType: AdjustmentType.interestEarned,
        description: 'Interest earned on savings account',
        amount: 150.0,
        accountId: 'ACC002',
        contraAccountId: 'REV001',
        status: AdjustmentStatus.pending,
        referenceNumber: 'ADJ-002',
        approvedBy: null,
        approvalDate: null,
        createdBy: 'USER001',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
        journalVoucherId: null,
        bankStatementId: 'STMT002',
        notes: 'Quarterly interest payment',
      ),
      AdjustmentEntryEntity(
        adjustmentId: 'ADJ003',
        branchId: 'BR001',
        adjustmentDate: DateTime.now(),
        adjustmentType: AdjustmentType.errorCorrection,
        description: 'Correction of duplicate payment entry',
        amount: 500.0,
        accountId: 'ACC001',
        contraAccountId: 'EXP002',
        status: AdjustmentStatus.draft,
        referenceNumber: 'ADJ-003',
        approvedBy: null,
        approvalDate: null,
        createdBy: 'USER003',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        journalVoucherId: null,
        bankStatementId: null,
        notes: 'Reversal of erroneous payment posting',
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final filteredAdjustments = _getFilteredAdjustments();

    return Column(
      children: [
        // Filter and action bar
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: InputDecoration(
                    labelText: l10n.adjustmentType,
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  items: [
                    DropdownMenuItem(value: 'All', child: Text(l10n.all)),
                    DropdownMenuItem(value: 'BankCharges', child: Text(l10n.bankCharges)),
                    DropdownMenuItem(value: 'InterestEarned', child: Text(l10n.interestEarned)),
                    DropdownMenuItem(value: 'ErrorCorrection', child: Text(l10n.errorCorrection)),
                    DropdownMenuItem(value: 'Other', child: Text(l10n.other)),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value ?? 'All';
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              if (widget.canManage)
                ElevatedButton.icon(
                  onPressed: _createNewAdjustment,
                  icon: const Icon(Icons.add),
                  label: Text(l10n.newAdjustment),
                ),
            ],
          ),
        ),
        
        // Adjustments list
        Expanded(
          child: filteredAdjustments.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: filteredAdjustments.length,
                  itemBuilder: (context, index) {
                    final adjustment = filteredAdjustments[index];
                    return _buildAdjustmentCard(adjustment);
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
            Icons.edit_note,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noAdjustmentsFound,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.createFirstAdjustment,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdjustmentCard(AdjustmentEntryEntity adjustment) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                Expanded(
                  child: Text(
                    adjustment.referenceNumber,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildStatusChip(adjustment.status),
              ],
            ),
            const SizedBox(height: 4),
            _buildTypeChip(adjustment.adjustmentType),
            const SizedBox(height: 12),
            
            // Description
            Text(
              adjustment.description,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            
            // Details grid
            Row(
              children: [
                Expanded(
                  child: _buildDetailItem(
                    l10n.amount,
                    currencyFormat.format(adjustment.amount),
                    adjustment.amount >= 0 
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.error,
                  ),
                ),
                Expanded(
                  child: _buildDetailItem(
                    l10n.date,
                    dateFormat.format(adjustment.adjustmentDate),
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
                    l10n.account,
                    adjustment.accountId,
                    null,
                  ),
                ),
                Expanded(
                  child: _buildDetailItem(
                    l10n.contraAccount,
                    adjustment.contraAccountId,
                    null,
                  ),
                ),
              ],
            ),
            
            // Notes if available
            if (adjustment.notes != null && adjustment.notes!.isNotEmpty) ...[
              const SizedBox(height: 8),
              _buildDetailItem(
                l10n.notes,
                adjustment.notes!,
                null,
              ),
            ],
            
            // Approval info
            if (adjustment.approvedBy != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${l10n.approvedBy}: ${adjustment.approvedBy}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
            
            // Action buttons
            if (widget.canManage) ...[
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (adjustment.status == AdjustmentStatus.draft)
                    TextButton.icon(
                      onPressed: () => _submitAdjustment(adjustment),
                      icon: const Icon(Icons.send, size: 16),
                      label: Text(l10n.submit),
                    ),
                  if (adjustment.status == AdjustmentStatus.pending)
                    TextButton.icon(
                      onPressed: () => _approveAdjustment(adjustment),
                      icon: const Icon(Icons.check_circle, size: 16),
                      label: Text(l10n.approve),
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                      ),
                    ),
                  if (adjustment.status != AdjustmentStatus.posted)
                    TextButton.icon(
                      onPressed: () => _editAdjustment(adjustment),
                      icon: const Icon(Icons.edit, size: 16),
                      label: Text(l10n.edit),
                    ),
                  if (adjustment.status == AdjustmentStatus.draft)
                    TextButton.icon(
                      onPressed: () => _deleteAdjustment(adjustment),
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

  Widget _buildStatusChip(AdjustmentStatus status) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    
    Color backgroundColor;
    Color foregroundColor;
    String statusText;
    
    switch (status) {
      case AdjustmentStatus.draft:
        backgroundColor = theme.colorScheme.surfaceVariant;
        foregroundColor = theme.colorScheme.onSurfaceVariant;
        statusText = l10n.draft;
        break;
      case AdjustmentStatus.pending:
        backgroundColor = theme.colorScheme.tertiaryContainer;
        foregroundColor = theme.colorScheme.onTertiaryContainer;
        statusText = l10n.pending;
        break;
      case AdjustmentStatus.posted:
        backgroundColor = theme.colorScheme.primaryContainer;
        foregroundColor = theme.colorScheme.onPrimaryContainer;
        statusText = l10n.posted;
        break;
      case AdjustmentStatus.rejected:
        backgroundColor = theme.colorScheme.errorContainer;
        foregroundColor = theme.colorScheme.onErrorContainer;
        statusText = l10n.rejected;
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

  Widget _buildTypeChip(AdjustmentType type) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    
    String typeText;
    IconData icon;
    
    switch (type) {
      case AdjustmentType.bankCharges:
        typeText = l10n.bankCharges;
        icon = Icons.money_off;
        break;
      case AdjustmentType.interestEarned:
        typeText = l10n.interestEarned;
        icon = Icons.trending_up;
        break;
      case AdjustmentType.errorCorrection:
        typeText = l10n.errorCorrection;
        icon = Icons.edit;
        break;
      case AdjustmentType.other:
        typeText = l10n.other;
        icon = Icons.more_horiz;
        break;
    }
    
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(
        typeText,
        style: theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: theme.colorScheme.secondaryContainer.withOpacity(0.5),
      side: BorderSide.none,
    );
  }

  List<AdjustmentEntryEntity> _getFilteredAdjustments() {
    if (_selectedType == 'All') {
      return _adjustments;
    }
    
    AdjustmentType? filterType;
    switch (_selectedType) {
      case 'BankCharges':
        filterType = AdjustmentType.bankCharges;
        break;
      case 'InterestEarned':
        filterType = AdjustmentType.interestEarned;
        break;
      case 'ErrorCorrection':
        filterType = AdjustmentType.errorCorrection;
        break;
      case 'Other':
        filterType = AdjustmentType.other;
        break;
    }
    
    return _adjustments.where((adj) => adj.adjustmentType == filterType).toList();
  }

  void _createNewAdjustment() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.newAdjustment),
        content: const Text('Adjustment form will be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add new adjustment logic
              final newAdjustment = AdjustmentEntryEntity(
                adjustmentId: 'ADJ${DateTime.now().millisecondsSinceEpoch}',
                branchId: 'BR001',
                adjustmentDate: DateTime.now(),
                adjustmentType: AdjustmentType.other,
                description: 'New adjustment entry',
                amount: 100.0,
                accountId: 'ACC001',
                contraAccountId: 'EXP001',
                status: AdjustmentStatus.draft,
                referenceNumber: 'ADJ-${DateTime.now().millisecondsSinceEpoch}',
                approvedBy: null,
                approvalDate: null,
                createdBy: 'CURRENT_USER',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                journalVoucherId: null,
                bankStatementId: null,
                notes: null,
              );
              
              setState(() {
                _adjustments.insert(0, newAdjustment);
              });
            },
            child: Text(AppLocalizations.of(context)!.create),
          ),
        ],
      ),
    );
  }

  void _submitAdjustment(AdjustmentEntryEntity adjustment) {
    setState(() {
      adjustment.status = AdjustmentStatus.pending;
      adjustment.updatedAt = DateTime.now();
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.adjustmentSubmittedSuccessfully),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _approveAdjustment(AdjustmentEntryEntity adjustment) {
    setState(() {
      adjustment.status = AdjustmentStatus.posted;
      adjustment.approvedBy = 'CURRENT_USER';
      adjustment.approvalDate = DateTime.now();
      adjustment.updatedAt = DateTime.now();
      adjustment.journalVoucherId = 'JV${DateTime.now().millisecondsSinceEpoch}';
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.adjustmentApprovedSuccessfully),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _editAdjustment(AdjustmentEntryEntity adjustment) {
    // TODO: Implement edit adjustment dialog
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.editAdjustmentNotImplemented),
      ),
    );
  }

  void _deleteAdjustment(AdjustmentEntryEntity adjustment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.confirmDelete),
        content: Text(AppLocalizations.of(context)!.confirmDeleteAdjustment),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _adjustments.remove(adjustment);
              });
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppLocalizations.of(context)!.adjustmentDeletedSuccessfully),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(AppLocalizations.of(context)!.delete),
          ),
        ],
      ),
    );
  }
}