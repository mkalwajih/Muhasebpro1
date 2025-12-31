import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/presentation/widgets/empty_state_widget.dart';

class ItemsScreen extends ConsumerWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.items),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.search_normal),
            onPressed: () {
              // Search functionality to be implemented
            },
          ),
        ],
      ),
      body: EmptyStateWidget(
        icon: Iconsax.box,
        title: l10n.noItemsFound,
        subtitle: l10n.addItemToGetStarted,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add item functionality to be implemented
        },
        icon: const Icon(Iconsax.add),
        label: Text(l10n.addItem),
      ),
    );
  }
}
