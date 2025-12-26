import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/journal_voucher_entity.dart';
import '../../../domain/entities/voucher_base_entity.dart';

class JournalVoucherListItem extends StatelessWidget {
  const JournalVoucherListItem({
    super.key,
    required this.voucher,
    required this.onTap,
    this.onEdit,
    this.onPost,
    this.onDelete,
  });

  final JournalVoucherEntity voucher;
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
              Text(
                voucher.description,
                style: theme.textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
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
                  const Spacer(),
                  Text(
                    '${l10n.debit}: ${currencyFormat.format(voucher.totalDebit)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${l10n.credit}: ${currencyFormat.format(voucher.totalCredit)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
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
              if (voucher.isReversing || voucher.isPeriodic) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (voucher.isReversing)
                      Chip(
                        label: Text(
                          l10n.reversing,
                          style: theme.textTheme.bodySmall,
                        ),
                        backgroundColor: theme.colorScheme.errorContainer,
                        side: BorderSide.none,
                      ),
                    if (voucher.isReversing && voucher.isPeriodic)
                      const SizedBox(width: 8),
                    if (voucher.isPeriodic)
                      Chip(
                        label: Text(
                          l10n.periodic,
                          style: theme.textTheme.bodySmall,
                        ),
                        backgroundColor: theme.colorScheme.secondaryContainer,
                        side: BorderSide.none,
                      ),
                  ],
                ),
              ],
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
        backgroundColor = theme.colorScheme.surfaceContainerHighest;
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
}