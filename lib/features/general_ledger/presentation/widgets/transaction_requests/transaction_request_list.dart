import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../../shared/presentation/widgets/loading_widget.dart';
import '../../../../../shared/presentation/widgets/error_widget.dart';
import '../../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../../domain/entities/transaction_request_entity.dart';
import '../../providers/transaction_request_providers.dart';
import 'transaction_request_list_item.dart';

class TransactionRequestList extends ConsumerWidget {
  final bool showOnlyMyRequests;

  const TransactionRequestList({
    super.key,
    this.showOnlyMyRequests = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = Translations.of(context);
    final requestsAsync = ref.watch(transactionRequestsProvider);

    return requestsAsync.when(
      data: (requests) {
        List<TransactionRequestEntity> filteredRequests = requests;
        
        if (showOnlyMyRequests) {
          // In a real app, you'd filter by current user ID
          filteredRequests = requests.where((r) => r.requesterId == 'current_user').toList();
        }

        if (filteredRequests.isEmpty) {
          return EmptyStateWidget(
            icon: Icons.request_page,
            title: showOnlyMyRequests ? l10n.noRequestsFound : l10n.noRequestsFound,
            subtitle: showOnlyMyRequests 
                ? l10n.youHaveNotCreatedAnyRequests 
                : l10n.noTransactionRequestsFound,
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(transactionRequestsProvider);
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filteredRequests.length,
            itemBuilder: (context, index) {
              final request = filteredRequests[index];
              return TransactionRequestListItem(
                request: request,
                onTap: () => _showRequestDetails(context, request),
              );
            },
          ),
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, stack) => CustomErrorWidget(
        error: l10n.failedToLoadRequests, // Fixed parameter name from message to error
        onRetry: () => ref.invalidate(transactionRequestsProvider),
      ),
    );
  }

  void _showRequestDetails(BuildContext context, TransactionRequestEntity request) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${Translations.of(context).requestDetails} - ${request.requestNumber}'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow(Translations.of(context).type, _getTypeDisplayName(context, request.type)),
              _buildDetailRow(Translations.of(context).status, _getStatusDisplayName(context, request.status)),
              _buildDetailRow(Translations.of(context).requester, request.requesterName),
              _buildDetailRow(Translations.of(context).requestDate, _formatDate(request.requestDate)),
              _buildDetailRow(Translations.of(context).description, request.description),
              _buildDetailRow(Translations.of(context).amount, '\$${request.totalAmount.toStringAsFixed(2)}'),
              if (request.approverName != null)
                _buildDetailRow(Translations.of(context).approver, request.approverName!),
              if (request.approvalDate != null)
                _buildDetailRow(Translations.of(context).approvalDate, _formatDate(request.approvalDate!)),
              if (request.rejectionReason != null)
                _buildDetailRow(Translations.of(context).rejectionReason, request.rejectionReason!),
              if (request.notes != null)
                _buildDetailRow(Translations.of(context).notes, request.notes!),
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

  String _getTypeDisplayName(BuildContext context, TransactionRequestType type) {
    final l10n = Translations.of(context);
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

  String _getStatusDisplayName(BuildContext context, TransactionRequestStatus status) {
    final l10n = Translations.of(context);
    switch (status) {
      case TransactionRequestStatus.draft:
        return l10n.draft;
      case TransactionRequestStatus.pendingApproval:
        return l10n.pendingApproval;
      case TransactionRequestStatus.approved:
        return l10n.approved;
      case TransactionRequestStatus.rejected:
        return l10n.rejected;
      case TransactionRequestStatus.cancelled:
        return l10n.cancelled;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
