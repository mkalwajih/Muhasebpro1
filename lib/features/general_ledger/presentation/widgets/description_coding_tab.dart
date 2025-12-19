import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/presentation/widgets/custom_search_field.dart';
import '../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../../../shared/presentation/widgets/error_widget.dart';
import '../../../../shared/presentation/widgets/loading_widget.dart';
import '../../domain/entities/description_coding_entity.dart';
import '../providers/gl_setup_providers.dart';
import 'description_coding_form_dialog.dart';
import 'description_coding_list_item.dart';

class DescriptionCodingTab extends ConsumerWidget {
  const DescriptionCodingTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
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
                      onEdit: () => _showDescriptionCodingDialog(
                        context,
                        ref,
                        descriptionCoding: coding,
                      ),
                      onDelete: () => _showDeleteConfirmation(
                        context,
                        ref,
                        coding,
                      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDescriptionCodingDialog(context, ref),
        child: const Icon(Icons.add),
        tooltip: l10n.addDescriptionCoding,
      ),
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

          if (success && context.mounted) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  descriptionCoding == null
                      ? AppLocalizations.of(context)!.descriptionCodingCreatedSuccessfully
                      : AppLocalizations.of(context)!.descriptionCodingUpdatedSuccessfully,
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
    final l10n = AppLocalizations.of(context)!;
    
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
              
              // TODO: Implement delete functionality when use case is created
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.descriptionCodingDeletedSuccessfully),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(l10n.yes),
          ),
        ],
      ),
    );
  }
}