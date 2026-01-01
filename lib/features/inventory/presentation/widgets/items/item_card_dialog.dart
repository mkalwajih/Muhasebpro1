import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../domain/entities/item_entity.dart';

class ItemCardDialog extends ConsumerWidget {
  final ItemEntity? item;

  const ItemCardDialog({super.key, this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = Translations.of(context);
    return AlertDialog(
      title: Text(item == null ? l10n.addItem : l10n.editItem),
      content: const Text("This functionality is not implemented yet."),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
      ],
    );
  }
}
