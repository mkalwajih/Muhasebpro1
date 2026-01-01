import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../shared/presentation/widgets/custom_search_field.dart';
import '../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../../../shared/presentation/widgets/error_widget.dart'; // Corrected import
import '../../../../shared/presentation/widgets/loading_widget.dart';
import '../../domain/entities/description_coding_entity.dart';
import '../providers/gl_setup_providers.dart';
import 'description_coding_form_dialog.dart';
import 'description_coding_list_item.dart';

class DescriptionCodingTab extends ConsumerWidget {
  final bool canModify;
  
  const DescriptionCodingTab({
    super.key,
    required this.canModify,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = Translations.of(context);
    // Removed unused theme variable
    final descriptionCodingAsync = ref.watch(filteredDescriptionCodingProvider);
    final searchQuery = ref.watch(descriptionCodingSearchProvider);

    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchField(
              hintText: l10n.searchDescriptionCoding,
              value: searchQuery,
              onChanged: (value) {
                ref.read(descriptionCodingSearchProvider.notifier).state = value;
              },
            ),
          ),
          // Content
          Expanded(
            child: descriptionCodingAsync.when(
              data: (descriptionCoding) {
                if (descriptionCoding.isEmpty) {
                  return EmptyStateWidget(
                    icon: Icons.code_outlined,
                    title: l10n.noDescriptionCodingYet,
                    subtitle: l10n.noDescriptionCodingYet,
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: descriptionCoding.length,
                  itemBuilder: (context, index) {
                    final coding = descriptionCoding[index];
                    return DescriptionCodingListItem(
                      descriptionCoding: coding,
                      canModify: canModify,
                      onEdit: canModify ? () => _showDescriptionCodingDialog(
                        context,
                        ref,
                        descriptionCoding: coding,
                      ) : null,
                      onDelete: canModify ? () => _showDeleteConfirmation(
                        context,
                        ref,
                        coding,
                      ) : null,
                    );
                  },
                );
              },
              loading: () => const LoadingWidget(),
              error: (error, stack) => CustomErrorWidget(
                error: error.toString(),
                onRetry: () => ref.refresh(descriptionCodingProvider),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: canModify ? FloatingActionButton(
        onPressed: () => _showDescriptionCodingDialog(context, ref),
        tooltip: l10n.addDescriptionCoding,
        // Fixed: 'child' argument should be last
        child: const Icon(Icons.add),
      ) : null,
    );
  }

  void _showDescriptionCodingDialog(
    BuildContext context,
    WidgetRef ref, {
    DescriptionCodingEntity? descriptionCoding,
  }) {
    showDialog(
      context: context,
      builder: (context) => DescriptionCodingFormDialog(
        descriptionCoding: descriptionCoding,
        onSave: (coding) async {
          final notifier = ref.read(descriptionCodingProvider.notifier);
          final success = await notifier.createDescriptionCoding(coding);

          // Fixed: Check mounted before using context across async gaps
          if (context.mounted && success) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  descriptionCoding == null
                      ? Translations.of(context).descriptionCodingCreatedSuccessfully
                      : Translations.of(context).descriptionCodingUpdatedSuccessfully,
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
    DescriptionCodingEntity descriptionCoding,
  ) {
    final l10n = Translations.of(context);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.areYouSureYouWantToDelete),
        content: Text(
          '${l10n.descCode}: ${descriptionCoding.descCode}\n'
          '${l10n.descriptionArabic}: ${descriptionCoding.descriptionAr}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.no),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              
              final success = await ref.read(descriptionCodingProvider.notifier)
                  .deleteDescriptionCoding(descriptionCoding.descCode);
              
              // Fixed: Check mounted before using context across async gaps
              if (!context.mounted) return;

              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.descriptionCodingDeletedSuccessfully),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.failedToDeleteDescriptionCoding),
                    backgroundColor: Colors.red,
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
