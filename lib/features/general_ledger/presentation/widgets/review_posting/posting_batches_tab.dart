import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../../domain/entities/posting_batch_entity.dart';

class PostingBatchesTab extends ConsumerWidget {
  const PostingBatchesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    // Sample data for demonstration
    final batches = _getSampleBatches();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _showCreateBatchDialog(context),
                  icon: const Icon(Icons.add),
                  label: Text(l10n.createBatch),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _showBatchPostingDialog(context),
                  icon: const Icon(Icons.play_arrow),
                  label: Text(l10n.startPosting),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: batches.isEmpty
              ? EmptyStateWidget(
                  icon: Icons.batch_prediction,
                  title: l10n.noPostingBatches,
                  subtitle: l10n.createBatchToStartPosting,
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: batches.length,
                  itemBuilder: (context, index) {
                    final batch = batches[index];
                    return _buildBatchCard(context, batch);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildBatchCard(BuildContext context, PostingBatchEntity batch) {
    final l10n = AppLocalizations.of(context)!;

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
                        batch.batchNumber,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        batch.description,
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
                    color: _getStatusColor(batch.status),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    _getStatusDisplayName(context, batch.status),
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
                    l10n.totalVouchers,
                    batch.totalVouchers.toString(),
                    Icons.receipt_long,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    l10n.processed,
                    batch.processedVouchers.toString(),
                    Icons.check_circle,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    l10n.failed,
                    batch.failedVouchers.toString(),
                    Icons.error,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    l10n.amount,
                    '\$${batch.totalAmount.toStringAsFixed(2)}',
                    Icons.attach_money,
                  ),
                ),
              ],
            ),
            if (batch.isInProgress) ...[
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: batch.progressPercentage / 100,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  batch.hasFailed ? Colors.red : Colors.green,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${batch.progressPercentage.toStringAsFixed(1)}% ${l10n.complete}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
            if (batch.errorMessage != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.red[700], size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        batch.errorMessage!,
                        style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                if (batch.canBeStarted)
                  ElevatedButton.icon(
                    onPressed: () => _startBatch(context, batch),
                    icon: const Icon(Icons.play_arrow, size: 16),
                    label: Text(l10n.start),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 32),
                    ),
                  ),
                if (batch.canBeCancelled)
                  ElevatedButton.icon(
                    onPressed: () => _cancelBatch(context, batch),
                    icon: const Icon(Icons.cancel, size: 16),
                    label: Text(l10n.cancel),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 32),
                    ),
                  ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => _showBatchDetails(context, batch),
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

  Color _getStatusColor(PostingBatchStatus status) {
    switch (status) {
      case PostingBatchStatus.draft:
        return Colors.grey;
      case PostingBatchStatus.inProgress:
        return Colors.blue;
      case PostingBatchStatus.completed:
        return Colors.green;
      case PostingBatchStatus.failed:
        return Colors.red;
      case PostingBatchStatus.cancelled:
        return Colors.orange;
    }
  }

  String _getStatusDisplayName(BuildContext context, PostingBatchStatus status) {
    final l10n = AppLocalizations.of(context)!;
    switch (status) {
      case PostingBatchStatus.draft:
        return l10n.draft;
      case PostingBatchStatus.inProgress:
        return l10n.inProgress;
      case PostingBatchStatus.completed:
        return l10n.completed;
      case PostingBatchStatus.failed:
        return l10n.failed;
      case PostingBatchStatus.cancelled:
        return l10n.cancelled;
    }
  }

  void _showCreateBatchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.createPostingBatch),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.description,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.selectVouchersToInclude),
            // Add voucher selection logic here
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppLocalizations.of(context)!.batchCreatedSuccessfully),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(AppLocalizations.of(context)!.create),
          ),
        ],
      ),
    );
  }

  void _showBatchPostingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.startBatchPosting),
        content: Text(AppLocalizations.of(context)!.confirmStartBatchPosting),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppLocalizations.of(context)!.batchPostingStarted),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text(AppLocalizations.of(context)!.start),
          ),
        ],
      ),
    );
  }

  void _startBatch(BuildContext context, PostingBatchEntity batch) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${AppLocalizations.of(context)!.startingBatch} ${batch.batchNumber}'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _cancelBatch(BuildContext context, PostingBatchEntity batch) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${AppLocalizations.of(context)!.cancellingBatch} ${batch.batchNumber}'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _showBatchDetails(BuildContext context, PostingBatchEntity batch) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${AppLocalizations.of(context)!.batchDetails} - ${batch.batchNumber}'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow(AppLocalizations.of(context)!.status, _getStatusDisplayName(context, batch.status)),
              _buildDetailRow(AppLocalizations.of(context)!.description, batch.description),
              _buildDetailRow(AppLocalizations.of(context)!.createdBy, batch.createdByName),
              _buildDetailRow(AppLocalizations.of(context)!.createdAt, _formatDateTime(batch.createdAt)),
              if (batch.startedAt != null)
                _buildDetailRow(AppLocalizations.of(context)!.startedAt, _formatDateTime(batch.startedAt!)),
              if (batch.completedAt != null)
                _buildDetailRow(AppLocalizations.of(context)!.completedAt, _formatDateTime(batch.completedAt!)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.close),
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

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  List<PostingBatchEntity> _getSampleBatches() {
    return [
      PostingBatchEntity(
        id: '1',
        batchNumber: 'BATCH-001',
        status: PostingBatchStatus.completed,
        batchDate: DateTime.now().subtract(const Duration(days: 1)),
        description: 'Monthly journal entries posting',
        voucherIds: ['JV001', 'JV002', 'JV003'],
        totalVouchers: 3,
        processedVouchers: 3,
        failedVouchers: 0,
        totalAmount: 15000.00,
        createdBy: 'user1',
        createdByName: 'John Doe',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        startedAt: DateTime.now().subtract(const Duration(days: 1)),
        completedAt: DateTime.now().subtract(const Duration(hours: 23)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 23)),
      ),
      PostingBatchEntity(
        id: '2',
        batchNumber: 'BATCH-002',
        status: PostingBatchStatus.inProgress,
        batchDate: DateTime.now(),
        description: 'Payment vouchers batch posting',
        voucherIds: ['PV001', 'PV002', 'PV003', 'PV004', 'PV005'],
        totalVouchers: 5,
        processedVouchers: 3,
        failedVouchers: 0,
        totalAmount: 25000.00,
        createdBy: 'user2',
        createdByName: 'Jane Smith',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        startedAt: DateTime.now().subtract(const Duration(hours: 1)),
        updatedAt: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
      PostingBatchEntity(
        id: '3',
        batchNumber: 'BATCH-003',
        status: PostingBatchStatus.draft,
        batchDate: DateTime.now(),
        description: 'Receipt vouchers for customer payments',
        voucherIds: ['RV001', 'RV002'],
        totalVouchers: 2,
        processedVouchers: 0,
        failedVouchers: 0,
        totalAmount: 8000.00,
        createdBy: 'user3',
        createdByName: 'Bob Johnson',
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
        updatedAt: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
    ];
  }
}