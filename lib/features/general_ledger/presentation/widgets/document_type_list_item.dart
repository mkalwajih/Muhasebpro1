import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/document_type_entity.dart';

class DocumentTypeListItem extends StatelessWidget {
  final DocumentTypeEntity documentType;
  final bool canModify;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const DocumentTypeListItem({
    super.key,
    required this.documentType,
    required this.canModify,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: documentType.isActive 
              ? theme.colorScheme.primary.withAlpha(26)
              : theme.colorScheme.error.withAlpha(26),
          child: Icon(
            Icons.description,
            color: documentType.isActive 
                ? theme.colorScheme.primary
                : theme.colorScheme.error,
          ),
        ),
        title: Text(
          isRTL ? documentType.nameAr : documentType.nameEn,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${l10n.docTypeCode}: ${documentType.docTypeCode}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              isRTL ? documentType.nameEn : documentType.nameAr,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(179),
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  '${l10n.sequenceMethod}: ',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(153),
                  ),
                ),
                Text(
                  _getSequenceMethodText(l10n, documentType.sequenceMethod),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(204),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  '${l10n.sequenceBehavior}: ',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(153),
                  ),
                ),
                Text(
                  _getSequenceBehaviorText(l10n, documentType.sequenceBehavior),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(204),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Active/Inactive indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: documentType.isActive 
                    ? Colors.green.withAlpha(26)
                    : Colors.red.withAlpha(26),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: documentType.isActive 
                      ? Colors.green.withAlpha(77)
                      : Colors.red.withAlpha(77),
                ),
              ),
              child: Text(
                documentType.isActive ? l10n.active : l10n.inactive,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: documentType.isActive ? Colors.green[700] : Colors.red[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Actions
            if (canModify)
              PopupMenuButton<String>(
                onSelected: (value) {
                  switch (value) {
                    case 'edit':
                      onEdit?.call();
                      break;
                    case 'delete':
                      onDelete?.call();
                      break;
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        const Icon(Icons.edit, size: 20),
                        const SizedBox(width: 8),
                        Text(l10n.edit),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        const Icon(Icons.delete, size: 20, color: Colors.red),
                        const SizedBox(width: 8),
                        Text(l10n.delete, style: const TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  String _getSequenceMethodText(AppLocalizations l10n, SequenceMethod method) {
    switch (method) {
      case SequenceMethod.general:
        return l10n.general;
      case SequenceMethod.specific:
        return l10n.specific;
    }
  }

  String _getSequenceBehaviorText(AppLocalizations l10n, SequenceBehavior behavior) {
    switch (behavior) {
      case SequenceBehavior.autoUnchangeable:
        return l10n.autoUnchangeable;
      case SequenceBehavior.autoChangeable:
        return l10n.autoChangeable;
      case SequenceBehavior.manual:
        return l10n.manual;
    }
  }
}