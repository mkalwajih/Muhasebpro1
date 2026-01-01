import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/currency_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/currencies_providers.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';

class AddEditCurrencyDialog extends ConsumerStatefulWidget {
  final CurrencyEntity? currencyToEdit;

  const AddEditCurrencyDialog({super.key, this.currencyToEdit});

  @override
  ConsumerState<AddEditCurrencyDialog> createState() => _AddEditCurrencyDialogState();
}

class _AddEditCurrencyDialogState extends ConsumerState<AddEditCurrencyDialog> {
  final _formKey = GlobalKey<FormState>();
  
  late final TextEditingController _codeController;
  late final TextEditingController _nameEnController;
  late final TextEditingController _nameArController;
  late final TextEditingController _symbolController; // Added controller for symbol
  late final TextEditingController _fractionEnController;
  late final TextEditingController _fractionArController;
  late final TextEditingController _exchangeRateController;
  late final TextEditingController _decimalPlacesController;
  
  late bool _isBaseCurrency;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    final currency = widget.currencyToEdit;

    _codeController = TextEditingController(text: currency?.currencyCode ?? '');
    _nameEnController = TextEditingController(text: currency?.nameEn ?? '');
    _nameArController = TextEditingController(text: currency?.nameAr ?? '');
    _symbolController = TextEditingController(text: currency?.symbol ?? ''); // Initialize symbol controller
    _fractionEnController = TextEditingController(text: currency?.fractionNameEn ?? '');
    _fractionArController = TextEditingController(text: currency?.fractionNameAr ?? '');
    _exchangeRateController = TextEditingController(text: currency?.exchangeRate.toString() ?? '1.0');
    _decimalPlacesController = TextEditingController(text: currency?.decimalPlaces.toString() ?? '2');
    
    _isBaseCurrency = currency?.isBaseCurrency ?? false;
    _isActive = currency?.isActive ?? true;
  }

  @override
  void dispose() {
    _codeController.dispose();
    _nameEnController.dispose();
    _nameArController.dispose();
    _symbolController.dispose(); // Dispose symbol controller
    _fractionEnController.dispose();
    _fractionArController.dispose();
    _exchangeRateController.dispose();
    _decimalPlacesController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final newCurrency = CurrencyEntity(
      currencyCode: _codeController.text.toUpperCase(),
      nameEn: _nameEnController.text,
      nameAr: _nameArController.text,
      symbol: _symbolController.text, // Pass symbol to constructor
      fractionNameEn: _fractionEnController.text,
      fractionNameAr: _fractionArController.text,
      exchangeRate: double.tryParse(_exchangeRateController.text) ?? 1.0,
      decimalPlaces: int.tryParse(_decimalPlacesController.text) ?? 2,
      isBaseCurrency: _isBaseCurrency,
      isActive: _isActive,
      denominations: widget.currencyToEdit?.denominations ?? [],
    );

    final notifier = ref.read(currenciesProvider.notifier);
    final context = this.context;

    try {
      if (widget.currencyToEdit == null) {
        await notifier.addCurrency(newCurrency);
      } else {
        await notifier.updateCurrency(newCurrency);
      }
      if(context.mounted) Navigator.of(context).pop();
    } catch (e) {
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: Theme.of(context).colorScheme.error)
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    if (l10n == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final isEditing = widget.currencyToEdit != null;

    return AlertDialog(
      title: Text(isEditing ? l10n.editCurrency : l10n.addNewCurrency),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _codeController,
                enabled: !isEditing,
                decoration: InputDecoration(labelText: l10n.currencyCode, border: const OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nameEnController,
                decoration: InputDecoration(labelText: l10n.nameEn, border: const OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nameArController,
                decoration: InputDecoration(labelText: l10n.nameAr, border: const OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _symbolController, // Add TextFormField for symbol
                decoration: InputDecoration(labelText: l10n.symbol, border: const OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _fractionEnController,
                decoration: InputDecoration(labelText: l10n.fractionNameEn, border: const OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _fractionArController,
                decoration: InputDecoration(labelText: l10n.fractionNameAr, border: const OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _exchangeRateController,
                decoration: InputDecoration(labelText: l10n.exchangeRate, border: const OutlineInputBorder()),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,6}'))],
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _decimalPlacesController,
                decoration: InputDecoration(labelText: l10n.decimalPlaces, border: const OutlineInputBorder()),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              SwitchListTile(
                title: Text(l10n.baseCurrency),
                value: _isBaseCurrency,
                onChanged: (value) => setState(() => _isBaseCurrency = value),
                contentPadding: EdgeInsets.zero,
              ),
              SwitchListTile(
                title: Text(l10n.active),
                value: _isActive,
                onChanged: (value) => setState(() => _isActive = value),
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
        ElevatedButton(onPressed: _onSave, child: Text(l10n.save)),
      ],
    );
  }
}
