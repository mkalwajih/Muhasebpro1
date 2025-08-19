import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../shared/presentation/widgets/placeholder_screen.dart';
import '../providers/financial_periods_providers.dart';
import '../widgets/add_edit_financial_period_dialog.dart';

class FinancialPeriodsScreen extends ConsumerWidget {
  const FinancialPeriodsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final financialPeriodsAsync = ref.watch(financialPeriodsProvider);
    final appLocalizations = AppLocalizations.of(context);

    return PlaceholderScreen(
      title: appLocalizations.financialPeriodsTitle,
      body: financialPeriodsAsync.when(
        data: (periods) {
          if (periods.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(appLocalizations.noFinancialPeriodsYet),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _showAddEditFinancialPeriodDialog(context, appLocalizations);
                    },
                    child: Text(appLocalizations.addFinancialPeriodButton),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showGenerateFinancialPeriodsDialog(context, appLocalizations);
                    },
                    child: Text(appLocalizations.generateFinancialPeriodsButton),
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      _showAddEditFinancialPeriodDialog(context, appLocalizations);
                    },
                    child: Text(appLocalizations.addFinancialPeriodButton),
                  ),
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
                        title: Text('${period.periodName} (${period.startDate.toLocal().toString().split(' ')[0]} - ${period.endDate.toLocal().toString().split(' ')[0]})'),
                        subtitle: Text(period.isLocked ? appLocalizations.locked : appLocalizations.unlocked),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _showAddEditFinancialPeriodDialog(context, appLocalizations, period: period);
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
                                ref.read(financialPeriodsProvider.notifier).deleteFinancialPeriod(period.id!);
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

  void _showAddEditFinancialPeriodDialog(BuildContext context, AppLocalizations appLocalizations, {FinancialPeriodEntity? period}) {
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

  void _showGenerateFinancialPeriodsDialog(BuildContext context, AppLocalizations appLocalizations) {
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

class AddEditFinancialPeriodDialog extends ConsumerStatefulWidget {
  final AppLocalizations appLocalizations;
  final FinancialPeriodEntity? period;

  const AddEditFinancialPeriodDialog({
    super.key,
    required this.appLocalizations,
    this.period,
  });

  @override
  ConsumerState<AddEditFinancialPeriodDialog> createState() => _AddEditFinancialPeriodDialogState();
}

class _AddEditFinancialPeriodDialogState extends ConsumerState<AddEditFinancialPeriodDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _periodNameController;
  late DateTime _startDate;
  late DateTime _endDate;
  late bool _isLocked;

  @override
  void initState() {
    super.initState();
    _periodNameController = TextEditingController(text: widget.period?.periodName ?? '');
    _startDate = widget.period?.startDate ?? DateTime.now();
    _endDate = widget.period?.endDate ?? DateTime.now();
    _isLocked = widget.period?.isLocked ?? false;
  }

  @override
  void dispose() {
    _periodNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _saveFinancialPeriod() {
    if (_formKey.currentState!.validate()) {
      final period = FinancialPeriodEntity(
        id: widget.period?.id,
        periodName: _periodNameController.text,
        startDate: _startDate,
        endDate: _endDate,
        isLocked: _isLocked,
      );

      if (widget.period == null) {
        ref.read(financialPeriodsProvider.notifier).addFinancialPeriod(period);
      } else {
        ref.read(financialPeriodsProvider.notifier).updateFinancialPeriod(period);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.period == null ? widget.appLocalizations.addFinancialPeriod : widget.appLocalizations.editFinancialPeriod),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _periodNameController,
                decoration: InputDecoration(labelText: widget.appLocalizations.periodName),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return widget.appLocalizations.periodNameRequired;
                  }
                  return null;
                },
              ),
              ListTile(
                title: Text('${widget.appLocalizations.startDate}: ${_startDate.toLocal().toString().split(' ')[0]}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),
              ListTile(
                title: Text('${widget.appLocalizations.endDate}: ${_endDate.toLocal().toString().split(' ')[0]}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, false),
              ),
              Row(
                children: [
                  Text(widget.appLocalizations.isLocked),
                  Switch(
                    value: _isLocked,
                    onChanged: (value) {
                      setState(() {
                        _isLocked = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(widget.appLocalizations.cancel),
        ),
        ElevatedButton(
          onPressed: _saveFinancialPeriod,
          child: Text(widget.appLocalizations.save),
        ),
      ],
    );
  }
}

class GenerateFinancialPeriodsDialog extends ConsumerStatefulWidget {
  final AppLocalizations appLocalizations;

  const GenerateFinancialPeriodsDialog({
    super.key,
    required this.appLocalizations,
  });

  @override
  ConsumerState<GenerateFinancialPeriodsDialog> createState() => _GenerateFinancialPeriodsDialogState();
}

class _GenerateFinancialPeriodsDialogState extends ConsumerState<GenerateFinancialPeriodsDialog> {
  final _formKey = GlobalKey<FormState>();
  late int _startYear;
  late int _numberOfYears;

  @override
  void initState() {
    super.initState();
    _startYear = DateTime.now().year;
    _numberOfYears = 1;
  }

  void _generatePeriods() {
    if (_formKey.currentState!.validate()) {
      ref.read(financialPeriodsProvider.notifier).generateFinancialPeriods(_startYear, _numberOfYears);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.appLocalizations.generateFinancialPeriods),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _startYear.toString(),
              decoration: InputDecoration(labelText: widget.appLocalizations.startYear),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || int.tryParse(value) == null) {
                  return widget.appLocalizations.invalidYear;
                }
                _startYear = int.parse(value);
                return null;
              },
            ),
            TextFormField(
              initialValue: _numberOfYears.toString(),
              decoration: InputDecoration(labelText: widget.appLocalizations.numberOfYears),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || int.tryParse(value) == null || int.parse(value) <= 0) {
                  return widget.appLocalizations.invalidNumberOfYears;
                }
                _numberOfYears = int.parse(value);
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(widget.appLocalizations.cancel),
        ),
        ElevatedButton(
          onPressed: _generatePeriods,
          child: Text(widget.appLocalizations.generate),
        ),
      ],
    );
  }
}
