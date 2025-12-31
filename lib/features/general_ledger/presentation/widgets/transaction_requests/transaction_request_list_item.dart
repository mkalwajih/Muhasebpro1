import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/transaction_request_entity.dart';

class TransactionRequestListItem extends StatelessWidget {
  final TransactionRequestEntity request;
  final VoidCallback? onTap;

  const TransactionRequestListItem({
    super.key,
    required this.request,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(request.status),
          child: Icon(
            _getTypeIcon(request.type),
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          request.requestNumber,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(request.description),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 14,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 4),
                Text(
                  request.requesterName,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 4),
                Text(
                  _formatDate(request.requestDate),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(request.status),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _getStatusDisplayName(context, request.status),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '\$${request.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  IconData _getTypeIcon(TransactionRequestType type) {
    switch (type) {
      case TransactionRequestType.journalVoucher:
        return Icons.book;
      case TransactionRequestType.paymentVoucher:
        return Icons.payment;
      case TransactionRequestType.receiptVoucher:
        return Icons.receipt;
      case TransactionRequestType.adjustmentEntry:
        return Icons.tune;
    }
  }

  Color _getStatusColor(TransactionRequestStatus status) {
    switch (status) {
      case TransactionRequestStatus.draft:
        return Colors.grey;
      case TransactionRequestStatus.pendingApproval:
        return Colors.orange;
      case TransactionRequestStatus.approved:
        return Colors.green;
      case TransactionRequestStatus.rejected:
        return Colors.red;
      case TransactionRequestStatus.cancelled:
        return Colors.grey[700]!;
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