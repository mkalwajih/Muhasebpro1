import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/financial_period_entity.dart';
import '../providers/financial_periods_providers.dart';
import '../widgets/add_edit_financial_period_dialog.dart';

class FinancialPeriodsScreen extends ConsumerWidget {
  const FinancialPeriodsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final financialPeriodsAsync = ref.watch(financialPeriodsProvider);
    final appLocalizations = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.systemPeriods),
      ),
      body: financialPeriodsAsync.when(
        data: (periods) {
          if (periods.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(appLocalizations.systemPeriods),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _showAddEditFinancialPeriodDialog(context, ref, appLocalizations);
                    },
                    child: Text(appLocalizations.addNew),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      _showGenerateFinancialPeriodsDialog(context, ref, appLocalizations);
                    },
                    child: Text(appLocalizations.generatePeriods),
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showAddEditFinancialPeriodDialog(context, ref, appLocalizations);
                      },
                      child: Text(appLocalizations.addNew),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        _showGenerateFinancialPeriodsDialog(context, ref, appLocalizations);
                      },
                      child: Text(appLocalizations.generatePeriods),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: periods.length,
                  itemBuilder: (context, index) {
                    final period = periods[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Text('${period.periodCode} (${period.startDate.toLocal().toString().split(' ')[0]} - ${period.endDate.toLocal().toString().split(' ')[0]})'),
                        subtitle: Text('${appLocalizations.fiscalYear}: ${period.fiscalYear} - ${period.isLocked ? appLocalizations.locked : appLocalizations.active}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _showAddEditFinancialPeriodDialog(context, ref, appLocalizations, period: period);
                              },
                            ),
                            IconButton(
                              icon: Icon(period.isLocked ? Icons.lock_open : Icons.lock),
                              onPressed: () {
                                ref.read(financialPeriodsProvider.notifier).toggleLockFinancialPeriod(period.id!, !period.isLocked);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                ref.read(financialPeriodsProvider.notifier).deleteFinancialPeriod(period.periodCode);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  void _showAddEditFinancialPeriodDialog(BuildContext context, WidgetRef ref, AppLocalizations appLocalizations, {FinancialPeriodEntity? period}) {
    showDialog(
      context: context,
      builder: (context) {
        return AddEditFinancialPeriodDialog(
          appLocalizations: appLocalizations,
          period: period,
        );
      },
    );
  }

  void _showGenerateFinancialPeriodsDialog(BuildContext context, WidgetRef ref, AppLocalizations appLocalizations) {
    showDialog(
      context: context,
      builder: (context) {
        return GenerateFinancialPeriodsDialog(
          appLocalizations: appLocalizations,
        );
      },
    );
  }
}
