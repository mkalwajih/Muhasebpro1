import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/currencies_providers.dart';

class CurrenciesScreen extends ConsumerWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currenciesAsync = ref.watch(currenciesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currencies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Implement add currency dialog
            },
          ),
        ],
      ),
      body: currenciesAsync.when(
        data: (currencies) => ListView.builder(
          itemCount: currencies.length,
          itemBuilder: (context, index) {
            final currency = currencies[index];
            return ListTile(
              title: Text(currency.nameEn),
              subtitle: Text(currency.currencyCode),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // TODO: Implement edit currency dialog
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
