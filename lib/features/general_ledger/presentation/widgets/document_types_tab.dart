import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/presentation/widgets/custom_search_field.dart';
import '../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../../../shared/presentation/widgets/error_widget.dart';
import '../../../../shared/presentation/widgets/loading_widget.dart';
import '../../domain/entities/document_type_entity.dart';
import '../providers/gl_setup_providers.dart';
import 'document_type_form_dialog.dart';
import 'document_type_list_item.dart';

class DocumentTypesTab extends ConsumerWidget {
  const DocumentTypesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final documentTypesAsync = ref.watch(filteredDocumentTypesProvider);
    final searchQuery = ref.watch(documentTypesSearchProvider);

    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchField(
              hintText: l10n.searchDocumentTypes,
              value: searchQuery,
              onChanged: (value) {
                ref.read(documentTypesSearchProvider.notifier).state = value;
              },
            ),
          ),
          // Content
          Expanded(
            child: documentTypesAsync.when(
              data: (documentTypes) {
                if (documentTypes.isEmpty) {
                  return EmptyStateWidget(
                    icon: Icons.description_outlined,
                    title: l10n.noDocumentTypesYet,
                    subtitle: l10n.noDocumentTypesYet,
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: documentTypes.length,
                  itemBuilder: (context, index) {
                    final documentType = documentTypes[index];
                    return DocumentTypeListItem(
                      documentType: documentType,
                      onEdit: () => _showDocumentTypeDialog(
                        context,
                        ref,
                        documentType: documentType,
                      ),
                      onDelete: () => _showDeleteConfirmation(
                        context,
                        ref,
                        documentType,
                      ),
                    );
                  },
                );
              },
              loading: () => const LoadingWidget(),
              error: (error, stack) => CustomErrorWidget(
                error: error.toString(),
                onRetry: () => ref.refresh(documentTypesProvider),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDocumentTypeDialog(context, ref),
        child: const Icon(Icons.add),
        tooltip: l10n.addDocumentType,
      ),
    );
  }

  void _showDocumentTypeDialog(
    BuildContext context,
    WidgetRef ref, {
    DocumentTypeEntity? documentType,
  }) {
    showDialog(
      context: context,
      builder: (context) => DocumentTypeFormDialog(
        documentType: documentType,
        onSave: (docType) async {
          final notifier = ref.read(documentTypesProvider.notifier);
          bool success;
          
          if (documentType == null) {
            success = await notifier.createDocumentType(docType);
          } else {
            success = await notifier.updateDocumentType(docType);
          }

          if (success && context.mounted) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  documentType == null
                      ? AppLocalizations.of(context)!.documentTypeCreatedSuccessfully
                      : AppLocalizations.of(context)!.documentTypeUpdatedSuccessfully,
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
      ),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
    DocumentTypeEntity documentType,
  ) {
    final l10n = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.areYouSureYouWantToDelete),
        content: Text(
          '${l10n.docTypeCode}: ${documentType.docTypeCode}\n'
          '${l10n.nameArabic}: ${documentType.nameAr}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.no),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              
              final notifier = ref.read(documentTypesProvider.notifier);
              final success = await notifier.deleteDocumentType(documentType.docTypeCode);
              
              if (success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.documentTypeDeletedSuccessfully),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: Text(l10n.yes),
          ),
        ],
      ),
    );
  }
}