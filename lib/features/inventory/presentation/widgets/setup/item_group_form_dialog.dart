import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/inventory/domain/entities/item_group_entity.dart';
import 'package:muhaseb_pro/features/inventory/presentation/providers/inventory_setup_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class ItemGroupFormDialog extends ConsumerStatefulWidget {
  final ItemGroupEntity? itemGroup;

  const ItemGroupFormDialog({super.key, this.itemGroup});

  @override
  ConsumerState<ItemGroupFormDialog> createState() => _ItemGroupFormDialogState();
}

class _ItemGroupFormDialogState extends ConsumerState<ItemGroupFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameArController;
  late TextEditingController _nameEnController;
  late TextEditingController _groupCodeController;
  late TextEditingController _inventoryAccountIdController;
  late TextEditingController _salesRevenueAccountIdController;
  late TextEditingController _cogsAccountIdController;

  @override
  void initState() {
    super.initState();
    _nameArController = TextEditingController(text: widget.itemGroup?.nameAr ?? '');
    _nameEnController = TextEditingController(text: widget.itemGroup?.nameEn ?? '');
    _groupCodeController =
        TextEditingController(text: widget.itemGroup?.groupCode ?? '');
    _inventoryAccountIdController = TextEditingController(
        text: widget.itemGroup?.inventoryAccountId ?? '');
    _salesRevenueAccountIdController = TextEditingController(
        text: widget.itemGroup?.salesRevenueAccountId ?? '');
    _cogsAccountIdController = TextEditingController(
        text: widget.itemGroup?.cogsAccountId ?? '');
  }

  @override
  void dispose() {
    _nameArController.dispose();
    _nameEnController.dispose();
    _groupCodeController.dispose();
    _inventoryAccountIdController.dispose();
    _salesRevenueAccountIdController.dispose();
    _cogsAccountIdController.dispose();
    super.dispose();
  }

  Future<void> _saveItemGroup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final l10n = AppLocalizations.of(context)!;
    final messenger = ScaffoldMessenger.of(context);

    final newItemGroup = ItemGroupEntity(
      id: widget.itemGroup?.id,
      nameAr: _nameArController.text,
      nameEn: _nameEnController.text,
      groupCode: _groupCodeController.text,
      inventoryAccountId: _inventoryAccountIdController.text,
      salesRevenueAccountId: _salesRevenueAccountIdController.text,
      cogsAccountId: _cogsAccountIdController.text,
      createdAt: widget.itemGroup?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );

    try {
      if (widget.itemGroup == null) {
        await ref.read(createItemGroupProvider(newItemGroup).future);
      } else {
        await ref.read(updateItemGroupProvider(newItemGroup).future);
      }
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.saveSuccess)),
      );
      Navigator.pop(context);
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text('${l10n.saveFailed}: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(
          widget.itemGroup == null ? l10n.addItemGroup : l10n.editItemGroup),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameArController,
              decoration: InputDecoration(labelText: l10n.nameAr),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.nameArabicRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameEnController,
              decoration: InputDecoration(labelText: l10n.nameEn),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.nameEnglishRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _groupCodeController,
              decoration: InputDecoration(labelText: l10n.groupCode),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _inventoryAccountIdController,
              decoration: InputDecoration(labelText: l10n.inventoryAccount),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.requiredField;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _salesRevenueAccountIdController,
              decoration: InputDecoration(labelText: l10n.salesAccount),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.requiredField;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _cogsAccountIdController,
              decoration: InputDecoration(labelText: l10n.cogsAccount),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.requiredField;
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        ElevatedButton(
          onPressed: _saveItemGroup,
          child: Text(l10n.save),
        ),
      ],
    );
  }
}
