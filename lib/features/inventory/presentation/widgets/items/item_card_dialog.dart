import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/item_entity.dart';
import '../../providers/item_management_providers.dart';
import '../../providers/inventory_setup_providers.dart';

class ItemCardDialog extends ConsumerStatefulWidget {
  final ItemEntity? item;

  const ItemCardDialog({super.key, this.item});

  @override
  ConsumerState<ItemCardDialog> createState() => _ItemCardDialogState();
}

class _ItemCardDialogState extends ConsumerState<ItemCardDialog>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  
  late TextEditingController _codeController;
  late TextEditingController _nameArController;
  late TextEditingController _nameEnController;
  late TextEditingController _barcodeController;
  late TextEditingController _descriptionController;
  late TextEditingController _baseUnitController;
  late TextEditingController _costPriceController;
  
  ItemType _selectedItemType = ItemType.stockable;
  int? _selectedItemGroupId;
  bool _isActive = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    _codeController = TextEditingController(text: widget.item?.itemCode ?? '');
    _nameArController = TextEditingController(text: widget.item?.nameAr ?? '');
    _nameEnController = TextEditingController(text: widget.item?.nameEn ?? '');
    _barcodeController = TextEditingController(text: widget.item?.barcode ?? '');
    _descriptionController = TextEditingController(text: widget.item?.description ?? '');
    _baseUnitController = TextEditingController(text: widget.item?.baseUnit ?? 'Piece');
    _costPriceController = TextEditingController(text: widget.item?.costPrice.toString() ?? '0');
    
    if (widget.item != null) {
      _selectedItemType = widget.item!.itemType;
      _selectedItemGroupId = widget.item!.itemGroupId;
      _isActive = widget.item!.isActive;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _codeController.dispose();
    _nameArController.dispose();
    _nameEnController.dispose();
    _barcodeController.dispose();
    _descriptionController.dispose();
    _baseUnitController.dispose();
    _costPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final itemGroupsAsync = ref.watch(itemGroupsProvider);

    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.85,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.item == null ? l10n.addItem : l10n.editItem,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: l10n.basicData),
                Tab(text: l10n.classification),
                Tab(text: l10n.costAndPrices),
              ],
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildBasicDataTab(l10n),
                    _buildClassificationTab(l10n, itemGroupsAsync),
                    _buildCostAndPricesTab(l10n),
                  ],
                ),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.cancel),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _isLoading ? null : _save,
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.save),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicDataTab(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            controller: _codeController,
            decoration: InputDecoration(
              labelText: l10n.itemCode,
              border: const OutlineInputBorder(),
            ),
            validator: (value) => value?.isEmpty ?? true ? l10n.requiredField : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameArController,
            decoration: InputDecoration(
              labelText: l10n.nameAr,
              border: const OutlineInputBorder(),
            ),
            validator: (value) => value?.isEmpty ?? true ? l10n.requiredField : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameEnController,
            decoration: InputDecoration(
              labelText: l10n.nameEn,
              border: const OutlineInputBorder(),
            ),
            validator: (value) => value?.isEmpty ?? true ? l10n.requiredField : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _barcodeController,
            decoration: InputDecoration(
              labelText: l10n.barcode,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: l10n.description,
              border: const OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: Text(l10n.active),
            value: _isActive,
            onChanged: (value) => setState(() => _isActive = value),
          ),
        ],
      ),
    );
  }

  Widget _buildClassificationTab(AppLocalizations l10n, AsyncValue itemGroupsAsync) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DropdownButtonFormField<ItemType>(
            value: _selectedItemType,
            decoration: InputDecoration(
              labelText: l10n.itemType,
              border: const OutlineInputBorder(),
            ),
            items: ItemType.values.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(type.name),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedItemType = value);
              }
            },
          ),
          const SizedBox(height: 16),
          itemGroupsAsync.when(
            data: (itemGroups) {
              if (_selectedItemGroupId == null && itemGroups.isNotEmpty) {
                _selectedItemGroupId = itemGroups.first.id;
              }
              return DropdownButtonFormField<int>(
                value: _selectedItemGroupId,
                decoration: InputDecoration(
                  labelText: l10n.itemGroup,
                  border: const OutlineInputBorder(),
                ),
                items: itemGroups.map((group) {
                  return DropdownMenuItem(
                    value: group.id,
                    child: Text(
                      Localizations.localeOf(context).languageCode == 'ar'
                          ? group.nameAr
                          : group.nameEn,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => _selectedItemGroupId = value);
                },
                validator: (value) => value == null ? l10n.requiredField : null,
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _baseUnitController,
            decoration: InputDecoration(
              labelText: l10n.baseUnit,
              border: const OutlineInputBorder(),
            ),
            validator: (value) => value?.isEmpty ?? true ? l10n.requiredField : null,
          ),
        ],
      ),
    );
  }

  Widget _buildCostAndPricesTab(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            controller: _costPriceController,
            decoration: InputDecoration(
              labelText: l10n.costPrice,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value?.isEmpty ?? true) return l10n.requiredField;
              if (double.tryParse(value!) == null) return l10n.invalidNumber;
              return null;
            },
          ),
        ],
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedItemGroupId == null) return;

    setState(() => _isLoading = true);

    try {
      final item = ItemEntity(
        id: widget.item?.id,
        itemCode: _codeController.text,
        nameAr: _nameArController.text,
        nameEn: _nameEnController.text,
        barcode: _barcodeController.text.isEmpty ? null : _barcodeController.text,
        description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
        itemType: _selectedItemType,
        itemGroupId: _selectedItemGroupId!,
        baseUnit: _baseUnitController.text,
        costPrice: double.parse(_costPriceController.text),
        isActive: _isActive,
        createdAt: widget.item?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (widget.item == null) {
        final createItem = ref.read(createItemProvider);
        await createItem(item);
      } else {
        final updateItem = ref.read(updateItemProvider);
        await updateItem(item);
      }

      if (mounted) {
        Navigator.pop(context);
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.saveSuccess)),
        );
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.saveFailed}: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
