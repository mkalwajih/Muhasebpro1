import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/warehouse_entity.dart';
import '../../providers/inventory_setup_providers.dart';

class WarehouseFormDialog extends ConsumerStatefulWidget {
  final WarehouseEntity? warehouse;

  const WarehouseFormDialog({super.key, this.warehouse});

  @override
  ConsumerState<WarehouseFormDialog> createState() =>
      _WarehouseFormDialogState();
}

class _WarehouseFormDialogState extends ConsumerState<WarehouseFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _codeController;
  late TextEditingController _nameArController;
  late TextEditingController _nameEnController;
  late TextEditingController _accountController;
  int _branchId = 1;
  bool _isActive = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.warehouse?.warehouseCode ?? '');
    _nameArController = TextEditingController(text: widget.warehouse?.nameAr ?? '');
    _nameEnController = TextEditingController(text: widget.warehouse?.nameEn ?? '');
    _accountController = TextEditingController(text: widget.warehouse?.inventoryAccountId ?? '');
    if (widget.warehouse != null) {
      _branchId = widget.warehouse!.branchId;
      _isActive = widget.warehouse!.isActive;
    }
  }

  @override
  void dispose() {
    _codeController.dispose();
    _nameArController.dispose();
    _nameEnController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);

    return AlertDialog(
      title: Text(widget.warehouse == null ? l10n.addWarehouse : l10n.editWarehouse),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(labelText: l10n.warehouseCode),
                validator: (value) => value?.isEmpty ?? true ? l10n.requiredField : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameArController,
                decoration: InputDecoration(labelText: l10n.nameAr),
                validator: (value) => value?.isEmpty ?? true ? l10n.requiredField : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameEnController,
                decoration: InputDecoration(labelText: l10n.nameEn),
                validator: (value) => value?.isEmpty ?? true ? l10n.requiredField : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _accountController,
                decoration: InputDecoration(labelText: l10n.inventoryAccount),
                validator: (value) => value?.isEmpty ?? true ? l10n.requiredField : null,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: Text(l10n.active),
                value: _isActive,
                onChanged: (value) => setState(() => _isActive = value),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _save,
          child: _isLoading
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
              : Text(l10n.save),
        ),
      ],
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final warehouse = WarehouseEntity(
        id: widget.warehouse?.id,
        warehouseCode: _codeController.text,
        nameAr: _nameArController.text,
        nameEn: _nameEnController.text,
        branchId: _branchId,
        inventoryAccountId: _accountController.text,
        isActive: _isActive,
        createdAt: widget.warehouse?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (widget.warehouse == null) {
        await ref.read(createWarehouseProvider(warehouse).future);
      } else {
        await ref.read(updateWarehouseProvider(warehouse).future);
      }

      if (mounted) {
        Navigator.pop(context);
        final l10n = Translations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.saveSuccess)),
        );
      }
    } catch (e) {
      if (mounted) {
        final l10n = Translations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.saveFailed}: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
