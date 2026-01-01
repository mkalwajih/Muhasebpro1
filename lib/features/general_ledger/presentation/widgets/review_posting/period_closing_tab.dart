import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../../domain/entities/period_closing_entity.dart';

class PeriodClosingTab extends ConsumerWidget {
  const PeriodClosingTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = Translations.of(context);

    // Sample data for demonstration
    final periods = _getSamplePeriods();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _showCreatePeriodDialog(context),
                  icon: const Icon(Icons.add),
                  label: Text(l10n.createPeriod),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _showClosingChecksDialog(context),
                  icon: const Icon(Icons.checklist),
                  label: Text(l10n.runChecks),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: periods.isEmpty
              ? EmptyStateWidget(
                  icon: Icons.event_busy,
                  title: l10n.noPeriods,
                  subtitle: l10n.createPeriodToStartClosing,
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: periods.length,
                  itemBuilder: (context, index) {
                    final period = periods[index];
                    return _buildPeriodCard(context, period);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildPeriodCard(BuildContext context, PeriodClosingEntity period) {
    final l10n = Translations.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        period.periodName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${_formatDate(period.periodStart)} - ${_formatDate(period.periodEnd)}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getStatusColor(period.status),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    _getStatusDisplayName(context, period.status),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildInfoItem(
                    l10n.type,
                    _getTypeDisplayName(context, period.periodType),
                    Icons.calendar_view_month,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    l10n.checks,
                    '${period.completedChecks.length}/${period.preClosingChecks.length}',
                    Icons.checklist,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    l10n.failed,
                    period.failedChecks.length.toString(),
                    Icons.error,
                  ),
                ),
                if (period.closingDate != null)
                  Expanded(
                    child: _buildInfoItem(
                      l10n.closedDate,
                      _formatDate(period.closingDate!),
                      Icons.event_available,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: period.checksProgress / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                period.failedChecks.isNotEmpty ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${period.checksProgress.toStringAsFixed(1)}% ${l10n.checksCompleted}',
              style: const TextStyle(fontSize: 12),
            ),
            if (period.failedChecks.isNotEmpty) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.error, color: Colors.red[700], size: 16),
                        const SizedBox(width: 8),
                        Text(
                          l10n.failedChecks,
                          style: TextStyle(
                            color: Colors.red[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ...period.failedChecks.map((check) => Text(
                          '• $check',
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 12,
                          ),
                        )),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                if (period.canBeClosed)
                  ElevatedButton.icon(
                    onPressed: () => _closePeriod(context, period),
                    icon: const Icon(Icons.lock, size: 16),
                    label: Text(l10n.closePeriod),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 32),
                    ),
                  ),
                if (period.canBeReopened)
                  ElevatedButton.icon(
                    onPressed: () => _reopenPeriod(context, period),
                    icon: const Icon(Icons.lock_open, size: 16),
                    label: Text(l10n.reopenPeriod),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 32),
                    ),
                  ),
                if (!period.allChecksCompleted && period.isOpen)
                  ElevatedButton.icon(
                    onPressed: () => _runChecks(context, period),
                    icon: const Icon(Icons.play_arrow, size: 16),
                    label: Text(l10n.runChecks),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 32),
                    ),
                  ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => _showPeriodDetails(context, period),
                  icon: const Icon(Icons.info, size: 16),
                  label: Text(l10n.details),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(PeriodClosingStatus status) {
    switch (status) {
      case PeriodClosingStatus.open:
        return Colors.green;
      case PeriodClosingStatus.inProgress:
        return Colors.blue;
      case PeriodClosingStatus.closed:
        return Colors.red;
      case PeriodClosingStatus.failed:
        return Colors.orange;
    }
  }

  String _getStatusDisplayName(BuildContext context, PeriodClosingStatus status) {
    final l10n = Translations.of(context);
    switch (status) {
      case PeriodClosingStatus.open:
        return l10n.open;
      case PeriodClosingStatus.inProgress:
        return l10n.inProgress;
      case PeriodClosingStatus.closed:
        return l10n.closed;
      case PeriodClosingStatus.failed:
        return l10n.failed;
    }
  }

  String _getTypeDisplayName(BuildContext context, PeriodType type) {
    final l10n = Translations.of(context);
    switch (type) {
      case PeriodType.monthly:
        return l10n.monthly;
      case PeriodType.quarterly:
        return l10n.quarterly;
      case PeriodType.yearly:
        return l10n.yearly;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showCreatePeriodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).createPeriod),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: Translations.of(context).periodName,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<PeriodType>(
              decoration: InputDecoration(
                labelText: Translations.of(context).periodType,
                border: const OutlineInputBorder(),
              ),
              items: PeriodType.values.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(_getTypeDisplayName(context, type)),
                );
              }).toList(),
              onChanged: (value) {},
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(Translations.of(context).periodCreatedSuccessfully),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(Translations.of(context).create),
          ),
        ],
      ),
    );
  }

  void _showClosingChecksDialog(BuildContext context) {
    final checks = [
      'All vouchers are posted',
      'Bank reconciliation completed',
      'Inventory count verified',
      'Accruals and deferrals recorded',
      'Fixed assets depreciation calculated',
      'Trial balance balanced',
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).preClosingChecks),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: ListView.builder(
            itemCount: checks.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(checks[index]),
                value: index < 4, // Simulate some completed checks
                onChanged: (value) {},
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).close),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(Translations.of(context).checksRunSuccessfully),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(Translations.of(context).runChecks),
          ),
        ],
      ),
    );
  }

  void _closePeriod(BuildContext context, PeriodClosingEntity period) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).closePeriod),
        content: Text(Translations.of(context).confirmClosePeriod),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${Translations.of(context).periodClosed} ${period.periodName}'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(Translations.of(context).close),
          ),
        ],
      ),
    );
  }

  void _reopenPeriod(BuildContext context, PeriodClosingEntity period) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${Translations.of(context).periodReopened} ${period.periodName}'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _runChecks(BuildContext context, PeriodClosingEntity period) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${Translations.of(context).runningChecksFor} ${period.periodName}'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _showPeriodDetails(BuildContext context, PeriodClosingEntity period) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${Translations.of(context).periodDetails} - ${period.periodName}'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow(Translations.of(context).status, _getStatusDisplayName(context, period.status)),
              _buildDetailRow(Translations.of(context).type, _getTypeDisplayName(context, period.periodType)),
              _buildDetailRow(Translations.of(context).startDate, _formatDate(period.periodStart)),
              _buildDetailRow(Translations.of(context).endDate, _formatDate(period.periodEnd)),
              if (period.closedBy != null)
                _buildDetailRow(Translations.of(context).closedBy, period.closedByName!),
              if (period.closingDate != null)
                _buildDetailRow(Translations.of(context).closingDate, _formatDate(period.closingDate!)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).close),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  List<PeriodClosingEntity> _getSamplePeriods() {
    return [
      PeriodClosingEntity(
        id: '1',
        periodName: 'December 2024',
        periodType: PeriodType.monthly,
        periodStart: DateTime(2024, 12, 1),
        periodEnd: DateTime(2024, 12, 31),
        status: PeriodClosingStatus.open,
        preClosingChecks: [
          'All vouchers posted',
          'Bank reconciliation completed',
          'Inventory count verified',
          'Accruals recorded',
          'Depreciation calculated',
          'Trial balance balanced',
        ],
        completedChecks: [
          'All vouchers posted',
          'Bank reconciliation completed',
          'Inventory count verified',
          'Accruals recorded',
        ],
        failedChecks: [],
        closingData: {},
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      PeriodClosingEntity(
        id: '2',
        periodName: 'November 2024',
        periodType: PeriodType.monthly,
        periodStart: DateTime(2024, 11, 1),
        periodEnd: DateTime(2024, 11, 30),
        status: PeriodClosingStatus.closed,
        closingDate: DateTime(2024, 12, 5),
        closedBy: 'manager1',
        closedByName: 'Finance Manager',
        preClosingChecks: [
          'All vouchers posted',
          'Bank reconciliation completed',
          'Inventory count verified',
          'Accruals recorded',
          'Depreciation calculated',
          'Trial balance balanced',
        ],
        completedChecks: [
          'All vouchers posted',
          'Bank reconciliation completed',
          'Inventory count verified',
          'Accruals recorded',
          'Depreciation calculated',
          'Trial balance balanced',
        ],
        failedChecks: [],
        closingData: {},
        createdAt: DateTime.now().subtract(const Duration(days: 60)),
        updatedAt: DateTime(2024, 12, 5),
      ),
      PeriodClosingEntity(
        id: '3',
        periodName: 'Q4 2024',
        periodType: PeriodType.quarterly,
        periodStart: DateTime(2024, 10, 1),
        periodEnd: DateTime(2024, 12, 31),
        status: PeriodClosingStatus.inProgress,
        preClosingChecks: [
          'All monthly periods closed',
          'Quarterly adjustments made',
          'Tax calculations completed',
          'Financial statements prepared',
        ],
        completedChecks: [
          'All monthly periods closed',
          'Quarterly adjustments made',
        ],
        failedChecks: ['Tax calculations completed'],
        closingData: {},
        createdAt: DateTime.now().subtract(const Duration(days: 90)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ];
  }
}