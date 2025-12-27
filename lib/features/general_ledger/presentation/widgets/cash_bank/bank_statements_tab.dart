import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/bank_statement_entity.dart';
import '../../../../../l10n/app_localizations.dart';

class BankStatementsTab extends ConsumerStatefulWidget {
  const BankStatementsTab({
    super.key,
    required this.canManage,
  });

  final bool canManage;

  @override
  ConsumerState<BankStatementsTab> createState() => _BankStatementsTabState();
}

class _BankStatementsTabState extends ConsumerState<BankStatementsTab> {
  final List<BankStatementEntity> _statements = [];
  String _selectedAccount = 'ACC001';
  DateTime _fromDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime _toDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadSampleData();
  }

  void _loadSampleData() {
    _statements.addAll([
      BankStatementEntity(
        statementId: 'STMT001',
        branchId: 'BR001',
        accountId: 'ACC001',
        statementDate: DateTime.now().subtract(const Duration(days: 5)),
        openingBalance: 20000.0,
        closingBalance: 25000.0,
        totalDebits: 8000.0,
        totalCredits: 13000.0,
        statementPeriodFrom: DateTime.now().subtract(const Duration(days: 30)),
        statementPeriodTo: DateTime.now().subtract(const Duration(days: 1)),
        bankReference: 'STMT-2024-001',
        isReconciled: true,
        reconciledBy: 'USER001',
        reconciledDate: DateTime.now().subtract(const Duration(days: 2)),
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
        transactions: [
          BankTransactionEntity(
            transactionId: 'TXN001',
            statementId: 'STMT001',
            transactionDate: DateTime.now().subtract(const Duration(days: 10)),
            description: 'Customer payment received',
            debitAmount: 0.0,
            creditAmount: 5000.0,
            balance: 25000.0,
            referenceNumber: 'TXN-001',
            transactionType: BankTransactionType.credit,
            isMatched: true,
            matchedVoucherId: 'RV001',
            createdAt: DateTime.now().subtract(const Duration(days: 10)),
            updatedAt: DateTime.now().subtract(const Duration(days: 2)),
          ),
          BankTransactionEntity(
            transactionId: 'TXN002',
            statementId: 'STMT001',
            transactionDate: DateTime.now().subtract(const Duration(days: 8)),
            description: 'Office supplies payment',
            debitAmount: 800.0,
            creditAmount: 0.0,
            balance: 24200.0,
            referenceNumber: 'CHK-1001',
            transactionType: BankTransactionType.debit,
            isMatched: true,
            matchedVoucherId: 'PV001',
            createdAt: DateTime.now().subtract(const Duration(days: 8)),
            updatedAt: DateTime.now().subtract(const Duration(days: 2)),
          ),
        ],
        status: 'Active',
        createdBy: 'System',
      ),
      BankStatementEntity(
        statementId: 'STMT002',
        branchId: 'BR001',
        accountId: 'ACC001',
        statementDate: DateTime.now(),
        openingBalance: 25000.0,
        closingBalance: 27500.0,
        totalDebits: 1500.0,
        totalCredits: 4000.0,
        statementPeriodFrom: DateTime.now().subtract(const Duration(days: 1)),
        statementPeriodTo: DateTime.now(),
        bankReference: 'STMT-2024-002',
        isReconciled: false,
        reconciledBy: null,
        reconciledDate: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        transactions: [
          BankTransactionEntity(
            transactionId: 'TXN003',
            statementId: 'STMT002',
            transactionDate: DateTime.now().subtract(const Duration(hours: 6)),
            description: 'Service income received',
            debitAmount: 0.0,
            creditAmount: 3200.0,
            balance: 28200.0,
            referenceNumber: 'TXN-003',
            transactionType: BankTransactionType.credit,
            isMatched: false,
            matchedVoucherId: null,
            createdAt: DateTime.now().subtract(const Duration(hours: 6)),
            updatedAt: DateTime.now().subtract(const Duration(hours: 6)),
          ),
        ],
        status: 'Active',
        createdBy: 'System',
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Removed unused theme variable
    final filteredStatements = _getFilteredStatements();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: _selectedAccount,
                      decoration: InputDecoration(
                        labelText: l10n.bankAccount,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(value: 'ACC001', child: Text('Main Bank Account')),
                        DropdownMenuItem(value: 'ACC002', child: Text('Savings Account')),
                        DropdownMenuItem(value: 'ACC003', child: Text('Petty Cash Account')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedAccount = value ?? 'ACC001';
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  if (widget.canManage)
                    ElevatedButton.icon(
                      onPressed: _importStatement,
                      icon: const Icon(Icons.upload_file),
                      label: Text(l10n.importStatement),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectFromDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: l10n.fromDate,
                          border: const OutlineInputBorder(),
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
                  ElevatedButton.icon(
                    onPressed: _filterStatements,
                    icon: const Icon(Icons.filter_list),
                    label: Text(l10n.filter),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: filteredStatements.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: filteredStatements.length,
                  itemBuilder: (context, index) {
                    final statement = filteredStatements[index];
                    return _buildStatementCard(statement);
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
            Icons.receipt_long,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noStatementsFound,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.importFirstStatement,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatementCard(BankStatementEntity statement) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ExpansionTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                statement.bankReference,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildReconciliationChip(statement.isReconciled),
          ],
        ),
        subtitle: Text(
          '${dateFormat.format(statement.statementPeriodFrom)} - ${dateFormat.format(statement.statementPeriodTo)}',
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    // Corrected deprecated surfaceVariant to surfaceContainerHighest and kept withOpacity as requested for minimal change
                    color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l10n.openingBalance),
                          Text(
                            currencyFormat.format(statement.openingBalance),
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
                          Text(l10n.totalDebit),
                          Text(
                            currencyFormat.format(statement.totalDebits),
                            style: TextStyle(
                              color: theme.colorScheme.error,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l10n.totalCredit),
                          Text(
                            currencyFormat.format(statement.totalCredits),
                            style: TextStyle(
                              color: theme.colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.closingBalance,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            currencyFormat.format(statement.closingBalance),
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (statement.transactions.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      l10n.transactions,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...statement.transactions.map((transaction) => _buildTransactionItem(transaction)),
                ],
                if (widget.canManage) ...[
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (!statement.isReconciled)
                        TextButton.icon(
                          onPressed: () => _reconcileStatement(statement),
                          icon: const Icon(Icons.check_circle, size: 16),
                          label: Text(l10n.reconcile),
                          style: TextButton.styleFrom(
                            foregroundColor: theme.colorScheme.primary,
                          ),
                        ),
                      TextButton.icon(
                        onPressed: () => _viewStatementDetails(statement),
                        icon: const Icon(Icons.visibility, size: 16),
                        label: Text(l10n.viewDetails),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(BankTransactionEntity transaction) {
    final theme = Theme.of(context);
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Card(
      margin: const EdgeInsets.only(bottom: 4.0),
      child: ListTile(
        dense: true,
        leading: Icon(
          transaction.transactionType == BankTransactionType.credit
              ? Icons.add_circle
              : Icons.remove_circle,
          color: transaction.transactionType == BankTransactionType.credit
              ? theme.colorScheme.secondary
              : theme.colorScheme.error,
        ),
        title: Text(transaction.description),
        subtitle: Text(
          '${dateFormat.format(transaction.transactionDate)} • ${transaction.referenceNumber}',
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currencyFormat.format(
                transaction.transactionType == BankTransactionType.credit
                    ? transaction.creditAmount
                    : transaction.debitAmount,
              ),
              style: TextStyle(
                color: transaction.transactionType == BankTransactionType.credit
                    ? theme.colorScheme.secondary
                    : theme.colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (transaction.isMatched)
              Icon(
                Icons.link,
                size: 16,
                color: theme.colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildReconciliationChip(bool isReconciled) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Chip(
      label: Text(
        isReconciled ? l10n.reconciled : l10n.notReconciled,
        style: theme.textTheme.bodySmall?.copyWith(
          color: isReconciled
              ? theme.colorScheme.onPrimaryContainer
              : theme.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: isReconciled
          ? theme.colorScheme.primaryContainer
          : theme.colorScheme.surfaceContainerHighest, // Updated surfaceVariant
      side: BorderSide.none,
    );
  }

  List<BankStatementEntity> _getFilteredStatements() {
    return _statements.where((statement) {
      return statement.accountId == _selectedAccount &&
          statement.statementDate.isAfter(_fromDate.subtract(const Duration(days: 1))) &&
          statement.statementDate.isBefore(_toDate.add(const Duration(days: 1)));
    }).toList();
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
    }
  }

  void _filterStatements() {
    setState(() {
      // Filter logic is already applied in _getFilteredStatements
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.statementsFiltered),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _importStatement() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.importStatement),
        content: const Text('Statement import functionality will be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context)!.import),
          ),
        ],
      ),
    );
  }

  void _reconcileStatement(BankStatementEntity statement) {
    setState(() {
      final index = _statements.indexWhere((s) => s.statementId == statement.statementId);
      if (index != -1) {
        _statements[index] = statement.copyWith(
          isReconciled: true,
          reconciledBy: 'CURRENT_USER',
          reconciledDate: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.statementReconciledSuccessfully),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _viewStatementDetails(BankStatementEntity statement) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.statementDetailsNotImplemented),
      ),
    );
  }
}
