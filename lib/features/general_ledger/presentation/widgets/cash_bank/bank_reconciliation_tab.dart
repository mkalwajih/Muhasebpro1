import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/bank_reconciliation_entity.dart';

class BankReconciliationTab extends ConsumerStatefulWidget {
  const BankReconciliationTab({
    super.key,
    required this.canManage,
  });

  final bool canManage;

  @override
  ConsumerState<BankReconciliationTab> createState() => _BankReconciliationTabState();
}

class _BankReconciliationTabState extends ConsumerState<BankReconciliationTab> {
  String _selectedAccount = 'ACC001';
  DateTime _selectedDate = DateTime.now();
  double _bankStatementBalance = 0.0;
  double _bookBalance = 0.0;
  final List<BankReconciliationItemEntity> _outstandingDeposits = [];
  final List<BankReconciliationItemEntity> _outstandingChecks = [];
  // ignore: unused_field
  final List<BankReconciliationItemEntity> _adjustments = [];

  final _bankBalanceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSampleData();
  }

  @override
  void dispose() {
    _bankBalanceController.dispose();
    super.dispose();
  }

  void _loadSampleData() {
    // Load sample data for demonstration
    _bankStatementBalance = 25000.0;
    _bookBalance = 23500.0;
    _bankBalanceController.text = _bankStatementBalance.toStringAsFixed(2);

    // Sample outstanding deposits
    _outstandingDeposits.addAll([
      BankReconciliationItemEntity(
        itemId: 'DEP001',
        reconciliationId: 'REC001',
        itemType: ReconciliationItemType.deposit,
        description: 'Customer payment - Invoice #1001',
        amount: 2500.0,
        date: DateTime.now().subtract(const Duration(days: 2)),
        referenceNumber: 'DEP-001',
        isCleared: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      BankReconciliationItemEntity(
        itemId: 'DEP002',
        reconciliationId: 'REC001',
        itemType: ReconciliationItemType.deposit,
        description: 'Cash sales deposit',
        amount: 1200.0,
        date: DateTime.now().subtract(const Duration(days: 1)),
        referenceNumber: 'DEP-002',
        isCleared: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ]);

    // Sample outstanding checks
    _outstandingChecks.addAll([
      BankReconciliationItemEntity(
        itemId: 'CHK001',
        reconciliationId: 'REC001',
        itemType: ReconciliationItemType.check,
        description: 'Office supplies payment',
        amount: -800.0,
        date: DateTime.now().subtract(const Duration(days: 3)),
        referenceNumber: 'CHK-1001',
        isCleared: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      BankReconciliationItemEntity(
        itemId: 'CHK002',
        reconciliationId: 'REC001',
        itemType: ReconciliationItemType.check,
        description: 'Utility bill payment',
        amount: -400.0,
        date: DateTime.now().subtract(const Duration(days: 1)),
        referenceNumber: 'CHK-1002',
        isCleared: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: 'l10n.symbol');

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Header section with account selection and date
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                child: DropdownButtonFormField<String>(
                  initialValue: _selectedAccount,
                          decoration: InputDecoration(
                            labelText: l10n.bankAccount,
                            border: const OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'ACC001', child: Text('Main Bank Account')),
                            DropdownMenuItem(value: 'ACC002', child: Text('Savings Account')),
                            DropdownMenuItem(value: 'ACC003', child: Text('Petty Cash Account')),
                          ],
                          onChanged: widget.canManage ? (value) {
                            setState(() {
                              _selectedAccount = value ?? 'ACC001';
                            });
                          } : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: widget.canManage ? () => _selectDate(context) : null,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: l10n.reconciliationDate,
                              border: const OutlineInputBorder(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat('dd/MM/yyyy').format(_selectedDate)),
                                const Icon(Icons.calendar_today),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _bankBalanceController,
                          decoration: InputDecoration(
                            labelText: l10n.bankStatementBalance,
                            border: const OutlineInputBorder(),
                            prefixText: 'l10n.symbol ',
                          ),
                          keyboardType: TextInputType.number,
                          enabled: widget.canManage,
                          onChanged: (value) {
                            _bankStatementBalance = double.tryParse(value) ?? 0.0;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Balance summary
                  _buildBalanceSummary(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Reconciliation items
          Expanded(
            child: Row(
              children: [
                // Outstanding deposits
                Expanded(
                  child: _buildReconciliationSection(
                    title: l10n.outstandingDeposits,
                    items: _outstandingDeposits,
                    color: theme.colorScheme.secondary,
                    icon: Icons.add_circle,
                  ),
                ),
                const SizedBox(width: 16),
                // Outstanding checks
                Expanded(
                  child: _buildReconciliationSection(
                    title: l10n.outstandingChecks,
                    items: _outstandingChecks,
                    color: theme.colorScheme.error,
                    icon: Icons.remove_circle,
                  ),
                ),
              ],
            ),
          ),
          
          // Action buttons
          if (widget.canManage) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _addAdjustment,
                    icon: const Icon(Icons.edit_note),
                    label: Text(l10n.addAdjustment),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isReconciled() ? _saveReconciliation : null,
                    icon: const Icon(Icons.save),
                    label: Text(l10n.saveReconciliation),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isReconciled() 
                          ? theme.colorScheme.primary 
                          : theme.colorScheme.surfaceContainerHighest,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBalanceSummary() {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: 'l10n.symbol');
    
    final adjustedBankBalance = _calculateAdjustedBankBalance();
    final difference = adjustedBankBalance - _bookBalance;
    final isReconciled = difference.abs() < 0.01;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isReconciled 
            ? theme.colorScheme.primaryContainer.withOpacity(0.3)
            : theme.colorScheme.errorContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isReconciled 
              ? theme.colorScheme.primary
              : theme.colorScheme.error,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.bankStatementBalance),
              Text(
                currencyFormat.format(_bankStatementBalance),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.bookBalance),
              Text(
                currencyFormat.format(_bookBalance),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                             Text(l10n.addAdjustment),
                Text(
                currencyFormat.format(adjustedBankBalance),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.difference,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                currencyFormat.format(difference),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isReconciled 
                      ? theme.colorScheme.primary
                      : theme.colorScheme.error,
                ),
              ),
            ],
          ),
          if (isReconciled) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.reconciled,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildReconciliationSection({
    required String title,
    required List<BankReconciliationItemEntity> items,
    required Color color,
    required IconData icon,
  }) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: 'l10n.symbol');

    return Card(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const Spacer(),
                if (widget.canManage)
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _addReconciliationItem(
                      items == _outstandingDeposits 
                          ? ReconciliationItemType.deposit
                          : ReconciliationItemType.check,
                    ),
                    tooltip: l10n.add,
                  ),
              ],
            ),
          ),
          Expanded(
            child: items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          size: 48,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          items == _outstandingDeposits 
                              ? l10n.noOutstandingDeposits
                              : l10n.noOutstandingChecks,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          leading: Checkbox(
                            value: item.isCleared,
                            onChanged: widget.canManage ? (value) {
                              setState(() {
                                items[index] = item.copyWith(isCleared: value ?? false);
                              });
                            } : null,
                          ),
                          title: Text(item.description),
                          subtitle: Text(
                            '${l10n.reference}: ${item.referenceNumber} • ${DateFormat('dd/MM/yyyy').format(item.date)}',
                          ),
                          trailing: Text(
                            currencyFormat.format(item.amount.abs()),
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  double _calculateAdjustedBankBalance() {
    double adjustedBalance = _bankStatementBalance;
    
    // Add outstanding deposits
    for (final deposit in _outstandingDeposits) {
      if (!deposit.isCleared) {
        adjustedBalance += deposit.amount;
      }
    }
    
    // Subtract outstanding checks
    for (final check in _outstandingChecks) {
      if (!check.isCleared) {
        adjustedBalance += check.amount; // amount is already negative
      }
    }
    
    return adjustedBalance;
  }

  bool _isReconciled() {
    final adjustedBankBalance = _calculateAdjustedBankBalance();
    final difference = (adjustedBankBalance - _bookBalance).abs();
    return difference < 0.01;
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addReconciliationItem(ReconciliationItemType type) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          type == ReconciliationItemType.deposit 
              ? AppLocalizations.of(context)!.addOutstandingDeposit
              : AppLocalizations.of(context)!.addOutstandingCheck,
        ),
        content: const Text('Item form will be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add sample item for demonstration
              final newItem = BankReconciliationItemEntity(
                itemId: 'ITEM${DateTime.now().millisecondsSinceEpoch}',
                reconciliationId: 'REC001',
                itemType: type,
                description: type == ReconciliationItemType.deposit 
                    ? 'New deposit' 
                    : 'New check',
                amount: type == ReconciliationItemType.deposit ? 1000.0 : -500.0,
                date: DateTime.now(),
                referenceNumber: 'REF${DateTime.now().millisecondsSinceEpoch}',
                isCleared: false,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              );
              
              setState(() {
                if (type == ReconciliationItemType.deposit) {
                  _outstandingDeposits.add(newItem);
                } else {
                  _outstandingChecks.add(newItem);
                }
              });
            },
            child: Text(AppLocalizations.of(context)!.add),
          ),
        ],
      ),
    );
  }

  void _addAdjustment() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.addAdjustment),
        content: const Text('Adjustment form will be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add adjustment logic here
            },
            child: Text(AppLocalizations.of(context)!.add),
          ),
        ],
      ),
    );
  }

  void _saveReconciliation() {
    if (!_isReconciled()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.reconciliationNotBalanced),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    // TODO: Implement save logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.reconciliationSavedSuccessfully),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
