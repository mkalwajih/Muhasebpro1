import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/currency_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/currencies_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/add_edit_currency_dialog.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/currency_detail_view.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class CurrenciesScreen extends ConsumerStatefulWidget {
  const CurrenciesScreen({super.key});

  @override
  ConsumerState<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends ConsumerState<CurrenciesScreen> {
  CurrencyEntity? _selectedCurrency;

  @override
  Widget build(BuildContext context) {
    final currenciesAsync = ref.watch(currenciesProvider);
    final l10n = AppLocalizations.of(context)!;

    ref.listen<AsyncValue<List<CurrencyEntity>>>(currenciesProvider, (previous, next) {
      next.whenData((currencies) {
        if (_selectedCurrency != null) {
          final newSelected = currencies.firstWhere((c) => c.currencyCode == _selectedCurrency!.currencyCode, orElse: () => currencies.isNotEmpty ? currencies.first : _selectedCurrency!);
          if (newSelected != _selectedCurrency) {
            setState(() {
              _selectedCurrency = newSelected;
            });
          }
        } else if(currencies.isNotEmpty) {
          setState(() {
            _selectedCurrency = currencies.first;
          });
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.currencies),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: l10n.addNewCurrency,
            onPressed: () => _showAddEditCurrencyDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: l10n.editCurrency,
            onPressed: _selectedCurrency == null ? null : () => _showAddEditCurrencyDialog(context, currencyToEdit: _selectedCurrency),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: currenciesAsync.when(
              data: (currencies) => ListView.builder(
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  final currency = currencies[index];
                  return ListTile(
                    title: Text(currency.nameEn),
                    subtitle: Text(currency.currencyCode),
                    leading: currency.isBaseCurrency ? const Icon(Icons.star, color: Colors.amber) : const SizedBox(width: 24),
                    selected: _selectedCurrency?.currencyCode == currency.currencyCode,
                    onTap: () => setState(() => _selectedCurrency = currency),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            flex: 2,
            child: _selectedCurrency == null
                ? Center(child: Text(l10n.selectCurrencyPrompt))
                : CurrencyDetailView(
                    key: ValueKey(_selectedCurrency!.currencyCode),
                    currency: _selectedCurrency!,
                    onAddDenomination: () => _showAddEditDenominationDialog(context, _selectedCurrency!),
                    onEditDenomination: (denom) => _showAddEditDenominationDialog(context, _selectedCurrency!, denominationToEdit: denom),
                    onDeleteDenomination: (denomId) => ref.read(currenciesProvider.notifier).deleteDenomination(denomId),
                  ),
          ),
        ],
      ),
    );
  }

  void _showAddEditCurrencyDialog(BuildContext context, {CurrencyEntity? currencyToEdit}) {
    showDialog(
      context: context,
      builder: (context) {
        return AddEditCurrencyDialog(currencyToEdit: currencyToEdit);
      },
    );
  }

  void _showAddEditDenominationDialog(BuildContext context, CurrencyEntity currency, {CurrencyDenominationEntity? denominationToEdit}) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final valueController = TextEditingController(text: denominationToEdit?.denominationValue.toString() ?? '');
    final nameEnController = TextEditingController(text: denominationToEdit?.denominationNameEn ?? '');
    final nameArController = TextEditingController(text: denominationToEdit?.denominationNameAr ?? '');
    String type = denominationToEdit?.denominationType ?? 'Banknote';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(denominationToEdit == null ? l10n.addNewDenomination : l10n.editDenomination),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(controller: valueController, decoration: InputDecoration(labelText: l10n.value), keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      const SizedBox(height: 8),
                      TextFormField(controller: nameEnController, decoration: InputDecoration(labelText: l10n.nameEn), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      const SizedBox(height: 8),
                      TextFormField(controller: nameArController, decoration: InputDecoration(labelText: l10n.nameAr), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        initialValue: type,
                        decoration: InputDecoration(labelText: l10n.type),
                        items: ['Banknote', 'Coin'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setDialogState(() => type = value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final denomination = CurrencyDenominationEntity(
                        id: denominationToEdit?.id ?? 0,
                        currencyCode: currency.currencyCode,
                        denominationValue: double.parse(valueController.text),
                        denominationNameEn: nameEnController.text,
                        denominationNameAr: nameArController.text,
                        denominationType: type,
                      );
                      if (denominationToEdit == null) {
                        ref.read(currenciesProvider.notifier).addDenomination(denomination);
                      } else {
                        ref.read(currenciesProvider.notifier).updateDenomination(denomination);
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(l10n.save),
                ),
              ],
            );
          }
        );
      },
    );
  }
}
