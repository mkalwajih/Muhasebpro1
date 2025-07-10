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

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.currencies),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: l10n.addNewCurrency,
            onPressed: () {
              // TODO: Implement 'add new currency' dialog
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Master list
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
          // Detail view
          Expanded(
            flex: 2,
            child: _selectedCurrency == null
                ? Center(child: Text(l10n.selectCurrencyPrompt))
                : CurrencyDetailView(
                    key: ValueKey(_selectedCurrency!.currencyCode), // Important for state reset
                    currency: _selectedCurrency!,
                    onSave: (updatedCurrency) {
                      ref.read(currenciesProvider.notifier).updateCurrency(updatedCurrency);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
