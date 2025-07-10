import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/currency_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/currencies_providers.dart';
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
          final newSelected = currencies.firstWhere((c) => c.currencyCode == _selectedCurrency!.currencyCode, orElse: () => _selectedCurrency!);
          if (newSelected != _selectedCurrency) {
            setState(() {
              _selectedCurrency = newSelected;
            });
          }
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
            onPressed: () => _showAddCurrencyDialog(context, ref),
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
                    onSave: (updatedCurrency) {
                      ref.read(currenciesProvider.notifier).updateCurrency(updatedCurrency);
                    },
                    onAddDenomination: () => _showAddEditDenominationDialog(context, ref, _selectedCurrency!),
                    onEditDenomination: (denom) => _showAddEditDenominationDialog(context, ref, _selectedCurrency!, denominationToEdit: denom),
                    onDeleteDenomination: (denomId) => ref.read(currenciesProvider.notifier).deleteDenomination(denomId),
                  ),
          ),
        ],
      ),
    );
  }

  void _showAddCurrencyDialog(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final codeController = TextEditingController();
    final nameEnController = TextEditingController();
    final nameArController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.addNewCurrency),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(controller: codeController, decoration: InputDecoration(labelText: l10n.currencyCode), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                TextFormField(controller: nameEnController, decoration: InputDecoration(labelText: l10n.nameEn), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                TextFormField(controller: nameArController, decoration: InputDecoration(labelText: l10n.nameAr), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newCurrency = CurrencyEntity(
                    currencyCode: codeController.text,
                    nameEn: nameEnController.text,
                    nameAr: nameArController.text,
                    fractionNameEn: '',
                    fractionNameAr: '',
                    exchangeRate: 1.0,
                    isBaseCurrency: false,
                    decimalPlaces: 2,
                    isActive: true,
                  );
                  ref.read(currenciesProvider.notifier).addCurrency(newCurrency);
                  Navigator.of(context).pop();
                }
              },
              child: Text(l10n.add),
            ),
          ],
        );
      },
    );
  }

  void _showAddEditDenominationDialog(BuildContext context, WidgetRef ref, CurrencyEntity currency, {CurrencyDenominationEntity? denominationToEdit}) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final valueController = TextEditingController(text: denominationToEdit?.denominationValue.toString() ?? '');
    final nameEnController = TextEditingController(text: denominationToEdit?.denominationNameEn ?? '');
    final nameArController = TextEditingController(text: denominationToEdit?.denominationNameAr ?? '');
    String type = denominationToEdit?.denominationType ?? 'Banknote';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(denominationToEdit == null ? l10n.addNewDenomination : l10n.editDenomination),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(controller: valueController, decoration: InputDecoration(labelText: l10n.value), keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                TextFormField(controller: nameEnController, decoration: InputDecoration(labelText: l10n.nameEn), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                TextFormField(controller: nameArController, decoration: InputDecoration(labelText: l10n.nameAr), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                DropdownButtonFormField<String>(
                  value: type,
                  decoration: InputDecoration(labelText: l10n.type),
                  items: ['Banknote', 'Coin'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      type = value;
                    }
                  },
                ),
              ],
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
      },
    );
  }
}
