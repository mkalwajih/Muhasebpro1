import 'package:flutter/material.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/currency_entity.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class CurrencyDetailView extends StatelessWidget {
  final CurrencyEntity currency;
  final VoidCallback onAddDenomination;
  final Function(CurrencyDenominationEntity) onEditDenomination;
  final Function(int) onDeleteDenomination;

  const CurrencyDetailView({
    super.key,
    required this.currency,
    required this.onAddDenomination,
    required this.onEditDenomination,
    required this.onDeleteDenomination,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDetailRow(l10n.currencyCode, currency.currencyCode, context),
          _buildDetailRow(l10n.nameEn, currency.nameEn, context),
          _buildDetailRow(l10n.nameAr, currency.nameAr, context),
          _buildDetailRow(l10n.fractionNameEn, currency.fractionNameEn, context),
          _buildDetailRow(l10n.fractionNameAr, currency.fractionNameAr, context),
          _buildDetailRow(l10n.exchangeRate, currency.exchangeRate.toString(), context),
          _buildDetailRow(l10n.decimalPlaces, currency.decimalPlaces.toString(), context),
          _buildDetailRow(l10n.baseCurrency, currency.isBaseCurrency ? l10n.yes : l10n.no, context),
          _buildDetailRow(l10n.active, currency.isActive ? l10n.yes : l10n.no, context),
          
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
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: Theme.of(context).textTheme.titleSmall)
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(value, style: Theme.of(context).textTheme.bodyLarge)),
        ],
      ),
    );
  }

  Widget _buildDenominationsTable(BuildContext context, AppLocalizations l10n, List<CurrencyDenominationEntity> denominations) {
    if (denominations.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(l10n.noDenominations),
        ),
      );
    }
    
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
