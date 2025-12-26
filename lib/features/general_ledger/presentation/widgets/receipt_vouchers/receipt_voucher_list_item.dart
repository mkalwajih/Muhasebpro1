import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/receipt_voucher_entity.dart';
import '../../../domain/entities/voucher_base_entity.dart'; // Required for PaymentMethod

class ReceiptVoucherListItem extends StatelessWidget {
  const ReceiptVoucherListItem({
    super.key,
    required this.voucher,
    required this.onTap,
    this.onEdit,
    this.onPost,
    this.onDelete,
  });

  final ReceiptVoucherEntity voucher;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onPost;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd/MM/yyyy');
    final currencyFormat = NumberFormat.currency(symbol: '\$');

    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with voucher number and status
              Row(
                children: [
                  Expanded(
                    child: Text(
                      voucher.displayName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildStatusChip(context),
                ],
              ),
              const SizedBox(height: 8),
              
              // Description
              Text(
                voucher.description,
                style: theme.textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              
              // Receipt details row
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    dateFormat.format(voucher.date),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    _getPaymentMethodIcon(voucher.paymentMethod), // Fixed: _getReceiptMethodIcon -> _getPaymentMethodIcon
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _getPaymentMethodText(context, voucher.paymentMethod), // Fixed: _getReceiptMethodText -> _getPaymentMethodText
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    currencyFormat.format(voucher.totalAmount),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              
              // Receipt account info
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.account_balance,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${l10n.receiptTo}: ${voucher.receiptToAccountId}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              
              // Reference code if available
              if (voucher.refCode != null && voucher.refCode!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.link,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${l10n.reference}: ${voucher.refCode}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
              
              // Number of lines indicator
              if (voucher.lines.isNotEmpty) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${voucher.lines.length} ${voucher.lines.length == 1 ? l10n.line : l10n.lines}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
              ],
              
              // Action buttons
              if (onEdit != null || onPost != null || onDelete != null) ...[
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (onEdit != null)
                      TextButton.icon(
                        onPressed: onEdit,
                        icon: const Icon(Icons.edit, size: 16),
                        label: Text(l10n.edit),
                      ),
                    if (onPost != null)
                      TextButton.icon(
                        onPressed: onPost,
                        icon: const Icon(Icons.publish, size: 16),
                        label: Text(l10n.post),
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.primary,
                        ),
                      ),
                    if (onDelete != null)
                      TextButton.icon(
                        onPressed: onDelete,
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
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    
    Color backgroundColor;
    Color foregroundColor;
    String statusText;
    
    switch (voucher.status) {
      case VoucherStatus.draft:
        backgroundColor = theme.colorScheme.surfaceContainerHighest; // Fixed deprecated surfaceVariant
        foregroundColor = theme.colorScheme.onSurfaceVariant;
        statusText = l10n.draft;
        break;
      case VoucherStatus.posted:
        backgroundColor = theme.colorScheme.primaryContainer;
        foregroundColor = theme.colorScheme.onPrimaryContainer;
        statusText = l10n.posted;
        break;
      case VoucherStatus.reversed:
        backgroundColor = theme.colorScheme.errorContainer;
        foregroundColor = theme.colorScheme.onErrorContainer;
        statusText = l10n.reversed;
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

  IconData _getPaymentMethodIcon(PaymentMethod method) { // Fixed: _getReceiptMethodIcon
    switch (method) {
      case PaymentMethod.cash:
        return Icons.money;
      case PaymentMethod.check:
        return Icons.receipt;
      case PaymentMethod.transfer:
        return Icons.account_balance;
    }
  }

  String _getPaymentMethodText(BuildContext context, PaymentMethod method) { // Fixed: _getReceiptMethodText
    final l10n = AppLocalizations.of(context)!;
    switch (method) {
      case PaymentMethod.cash:
        return l10n.cash;
      case PaymentMethod.check:
        return l10n.check;
      case PaymentMethod.transfer:
        return l10n.bankTransfer;
    }
  }
}
