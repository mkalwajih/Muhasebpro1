import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/currency_entity.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class CurrencyDetailView extends StatefulWidget {
  final CurrencyEntity currency;
  final Function(CurrencyEntity) onSave;

  const CurrencyDetailView({
    super.key,
    required this.currency,
    required this.onSave,
  });

  @override
  State<CurrencyDetailView> createState() => _CurrencyDetailViewState();
}

class _CurrencyDetailViewState extends State<CurrencyDetailView> {
  late CurrencyEntity _editedCurrency;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _editedCurrency = widget.currency;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            initialValue: _editedCurrency.currencyCode,
            decoration: InputDecoration(labelText: l10n.currencyCode),
            enabled: false, // Code is not editable
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: _editedCurrency.nameEn,
            decoration: InputDecoration(labelText: l10n.nameEn),
            onChanged: (value) => setState(() => _editedCurrency = _editedCurrency.copyWith(nameEn: value)),
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: _editedCurrency.nameAr,
            decoration: InputDecoration(labelText: l10n.nameAr),
            onChanged: (value) => setState(() => _editedCurrency = _editedCurrency.copyWith(nameAr: value)),
          ),
          // Add other currency fields similarly...
          const SizedBox(height: 16),
          const Divider(),
          Text(l10n.denominations, style: Theme.of(context).textTheme.titleLarge),
          _buildDenominationsTable(l10n),
          const SizedBox(height: 72), // Space for the FAB
        ],
      ),
    );
  }

  Widget _buildDenominationsTable(AppLocalizations l10n) {
    return DataTable(
      columns: [
        DataColumn(label: Text(l10n.value)),
        DataColumn(label: Text(l10n.nameEn)),
        DataColumn(label: Text(l10n.type)),
        DataColumn(label: Text(l10n.actions)),
      ],
      rows: _editedCurrency.denominations.map((denom) {
        return DataRow(cells: [
          DataCell(Text(denom.denominationValue.toString())),
          DataCell(Text(denom.denominationNameEn)),
          DataCell(Text(denom.denominationType)),
          DataCell(Row(
            children: [
              IconButton(icon: const Icon(Icons.edit), onPressed: () { /* TODO */ }),
              IconButton(icon: const Icon(Icons.delete), onPressed: () { /* TODO */ }),
            ],
          )),
        ]);
      }).toList(),
    );
  }
}

extension on CurrencyEntity {
  CurrencyEntity copyWith({
    String? nameEn,
    String? nameAr,
    // Add other fields...
  }) {
    return CurrencyEntity(
      currencyCode: currencyCode,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      fractionNameEn: fractionNameEn,
      fractionNameAr: fractionNameAr,
      exchangeRate: exchangeRate,
      isBaseCurrency: isBaseCurrency,
      decimalPlaces: decimalPlaces,
      isActive: isActive,
      denominations: denominations,
    );
  }
}
