import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/presentation/widgets/loading_widget.dart';
import '../../../../../shared/presentation/widgets/error_widget.dart';
import '../../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../../domain/entities/transaction_request_entity.dart';
import '../../providers/transaction_request_providers.dart';
import 'transaction_request_list_item.dart';

class PendingApprovalsTab extends ConsumerWidget {
  const PendingApprovalsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final pendingRequestsAsync = ref.watch(pendingApprovalsProvider);

    return pendingRequestsAsync.when(
      data: (requests) {
        if (requests.isEmpty) {
          return EmptyStateWidget(
            icon: Icons.pending_actions,
            title: l10n.noPendingApprovals,
            subtitle: l10n.allRequestsHaveBeenProcessed,
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(pendingApprovalsProvider);
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(
                  children: [
                    TransactionRequestListItem(
                      request: request,
                      onTap: () => _showApprovalDialog(context, ref, request),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () => _approveRequest(context, ref, request),
                              icon: const Icon(Icons.check, color: Colors.white),
                              label: Text(l10n.approve),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () => _showRejectDialog(context, ref, request),
                              icon: const Icon(Icons.close, color: Colors.white),
                              label: Text(l10n.reject),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, stack) => CustomErrorWidget(
        message: l10n.failedToLoadPendingApprovals,
        onRetry: () => ref.invalidate(pendingApprovalsProvider),
      ),
    );
  }

  void _showApprovalDialog(BuildContext context, WidgetRef ref, TransactionRequestEntity request) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${AppLocalizations.of(context)!.requestDetails} - ${request.requestNumber}'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow(AppLocalizations.of(context)!.type, _getTypeDisplayName(context, request.type)),
              _buildDetailRow(AppLocalizations.of(context)!.requester, request.requesterName),
              _buildDetailRow(AppLocalizations.of(context)!.requestDate, _formatDate(request.requestDate)),
              _buildDetailRow(AppLocalizations.of(context)!.description, request.description),
              _buildDetailRow(AppLocalizations.of(context)!.amount, '\$${request.totalAmount.toStringAsFixed(2)}'),
              if (request.notes != null)
                _buildDetailRow(AppLocalizations.of(context)!.notes, request.notes!),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.close),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _approveRequest(context, ref, request);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text(AppLocalizations.of(context)!.approve),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showRejectDialog(context, ref, request);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(AppLocalizations.of(context)!.reject),
          ),
        ],
      ),
    );
  }

  Future<void> _approveRequest(BuildContext context, WidgetRef ref, TransactionRequestEntity request) async {
    try {
      await ref.read(approveTransactionRequestUseCaseProvider).call(
        requestId: request.id,
        approverId: 'current_approver', // In real app, get from auth
        approverName: 'Current Approver', // In real app, get from auth
      );

      ref.invalidate(pendingApprovalsProvider);
      ref.invalidate(transactionRequestsProvider);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.requestApprovedSuccessfully),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)!.error}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showRejectDialog(BuildContext context, WidgetRef ref, TransactionRequestEntity request) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.rejectRequest),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.pleaseProvideRejectionReason),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.rejectionReason,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(AppLocalizations.of(context)!.pleaseProvideRejectionReason),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              Navigator.of(context).pop();
              await _rejectRequest(context, ref, request, reasonController.text.trim());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(AppLocalizations.of(context)!.reject),
          ),
        ],
      ),
    );
  }

  Future<void> _rejectRequest(BuildContext context, WidgetRef ref, TransactionRequestEntity request, String reason) async {
    try {
      await ref.read(rejectTransactionRequestUseCaseProvider).call(
        requestId: request.id,
        approverId: 'current_approver', // In real app, get from auth
        approverName: 'Current Approver', // In real app, get from auth
        reason: reason,
      );

      ref.invalidate(pendingApprovalsProvider);
      ref.invalidate(transactionRequestsProvider);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.requestRejectedSuccessfully),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)!.error}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
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

  String _getTypeDisplayName(BuildContext context, TransactionRequestType type) {
    final l10n = AppLocalizations.of(context)!;
    switch (type) {
      case TransactionRequestType.journalVoucher:
        return l10n.journalVoucher;
      case TransactionRequestType.paymentVoucher:
        return l10n.paymentVoucher;
      case TransactionRequestType.receiptVoucher:
        return l10n.receiptVoucher;
      case TransactionRequestType.adjustmentEntry:
        return l10n.adjustmentEntry;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}