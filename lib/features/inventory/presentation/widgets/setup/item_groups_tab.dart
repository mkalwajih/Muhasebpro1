import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/presentation/widgets/loading_widget.dart';
import '../../../../../shared/presentation/widgets/empty_state_widget.dart';
import '../../providers/inventory_setup_providers.dart';

class ItemGroupsTab extends ConsumerWidget {
  const ItemGroupsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final itemGroupsAsync = ref.watch(itemGroupsProvider);

    return Scaffold(
      body: itemGroupsAsync.when(
        data: (itemGroups) {
          if (itemGroups.isEmpty) {
            return EmptyStateWidget(
              icon: Iconsax.category,
              title: l10n.noItemGroupsFound,
              subtitle: l10n.addItemGroupToGetStarted,
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: itemGroups.length,
            itemBuilder: (context, index) {
              final group = itemGroups[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Iconsax.category, color: Colors.blue),
                  ),
                  title: Text(
                    Localizations.localeOf(context).languageCode == 'ar'
                        ? group.nameAr
                        : group.nameEn,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${l10n.code}: ${group.groupCode}'),
                  trailing: IconButton(
                    icon: const Icon(Iconsax.trash, color: Colors.red),
                    onPressed: () {},
                  ),
                ),
              );
            },
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Iconsax.add),
        label: Text(l10n.addItemGroup),
      ),
    );
  }
}
