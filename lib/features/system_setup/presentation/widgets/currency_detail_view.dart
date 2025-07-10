import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/currency_entity.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class CurrencyDetailView extends StatelessWidget {
  final CurrencyEntity currency;
  final Function(CurrencyEntity) onSave;
  final VoidCallback onAddDenomination;
  final Function(CurrencyDenominationEntity) onEditDenomination;
  final Function(int) onDeleteDenomination;

  const CurrencyDetailView({
    super.key,
    required this.currency,
    required this.onSave,
    required this.onAddDenomination,
    required this.onEditDenomination,
    required this.onDeleteDenomination,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    
    // Create local copies for editing
    final nameEnController = TextEditingController(text: currency.nameEn);
    final nameArController = TextEditingController(text: currency.nameAr);
    final fractionEnController = TextEditingController(text: currency.fractionNameEn);
    final fractionArController = TextEditingController(text: currency.fractionNameAr);
    final exchangeRateController = TextEditingController(text: currency.exchangeRate.toString());
    final decimalPlacesController = TextEditingController(text: currency.decimalPlaces.toString());

    void handleSave() {
      if (formKey.currentState!.validate()) {
        final updatedCurrency = currency.copyWith(
          nameEn: nameEnController.text,
          nameAr: nameArController.text,
          fractionNameEn: fractionEnController.text,
          fractionNameAr: fractionArController.text,
          exchangeRate: double.tryParse(exchangeRateController.text) ?? 0.0,
          decimalPlaces: int.tryParse(decimalPlacesController.text) ?? 2,
        );
        onSave(updatedCurrency);
      }
    }

    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              initialValue: currency.currencyCode,
              decoration: InputDecoration(labelText: l10n.currencyCode, border: const OutlineInputBorder()),
              enabled: false,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: nameEnController,
              decoration: InputDecoration(labelText: l10n.nameEn, border: const OutlineInputBorder()),
              validator: (v) => v!.isEmpty ? l10n.requiredField : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: nameArController,
              decoration: InputDecoration(labelText: l10n.nameAr, border: const OutlineInputBorder()),
               validator: (v) => v!.isEmpty ? l10n.requiredField : null,
            ),
            const SizedBox(height: 16),
             TextFormField(
              controller: fractionEnController,
              decoration: InputDecoration(labelText: l10n.fractionNameEn, border: const OutlineInputBorder()),
               validator: (v) => v!.isEmpty ? l10n.requiredField : null,
            ),
            const SizedBox(height: 16),
             TextFormField(
              controller: fractionArController,
              decoration: InputDecoration(labelText: l10n.fractionNameAr, border: const OutlineInputBorder()),
               validator: (v) => v!.isEmpty ? l10n.requiredField : null,
            ),
            const SizedBox(height: 16),
             TextFormField(
              controller: exchangeRateController,
              decoration: InputDecoration(labelText: l10n.exchangeRate, border: const OutlineInputBorder()),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,6}'))],
               validator: (v) => v!.isEmpty ? l10n.requiredField : null,
            ),
             const SizedBox(height: 16),
             TextFormField(
              controller: decimalPlacesController,
              decoration: InputDecoration(labelText: l10n.decimalPlaces, border: const OutlineInputBorder()),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
               validator: (v) => v!.isEmpty ? l10n.requiredField : null,
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: Text(l10n.baseCurrency),
              value: currency.isBaseCurrency,
              onChanged: (value) {
                // TODO: Add logic to ensure only one base currency
              },
            ),
            SwitchListTile(
              title: Text(l10n.active),
              value: currency.isActive,
              onChanged: (value) {
                onSave(currency.copyWith(isActive: value));
              },
            ),

            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.denominations, style: Theme.of(context).textTheme.titleLarge),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: onAddDenomination,
                  tooltip: l10n.addNewDenomination,
                )
              ],
            ),
            _buildDenominationsTable(context, l10n, currency.denominations),
            const SizedBox(height: 72),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: handleSave,
        label: Text(l10n.save),
        icon: const Icon(Icons.save),
      ),
    );
  }

  Widget _buildDenominationsTable(BuildContext context, AppLocalizations l10n, List<CurrencyDenominationEntity> denominations) {
    return DataTable(
      columns: [
        DataColumn(label: Text(l10n.value)),
        DataColumn(label: Text(l10n.nameEn)),
        DataColumn(label: Text(l10n.type)),
        DataColumn(label: Text(l10n.actions, textAlign: TextAlign.end)),
      ],
      rows: denominations.map((denom) {
        return DataRow(cells: [
          DataCell(Text(denom.denominationValue.toString())),
          DataCell(Text(denom.denominationNameEn)),
          DataCell(Text(denom.denominationType)),
          DataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: const Icon(Icons.edit, size: 18), onPressed: () => onEditDenomination(denom)),
                IconButton(icon: const Icon(Icons.delete, size: 18), onPressed: () => onDeleteDenomination(denom.id)),
              ],
            ),
          ),
        ]);
      }).toList(),
    );
  }
}
