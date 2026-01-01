import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../shared/presentation/widgets/empty_state_widget.dart';

class OpeningStockScreen extends ConsumerWidget {
  const OpeningStockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.openingStock),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: EmptyStateWidget(
        icon: Iconsax.box,
        title: l10n.noOpeningStockEntries,
        subtitle: l10n.clickAddToStart,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add opening stock functionality to be implemented
        },
        icon: const Icon(Iconsax.add),
        label: Text(l10n.addEntry),
      ),
    );
  }
}
