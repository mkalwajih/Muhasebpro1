import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/financial_period_entity.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/financial_periods_providers.dart';

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
  late TextEditingController _periodCodeController;
  late TextEditingController _fiscalYearController;
  late String _periodType;
  late TextEditingController _periodNumberController;
  late DateTime _startDate;
  late DateTime _endDate;
  late bool _isLocked;

  @override
  void initState() {
    super.initState();
    _periodCodeController = TextEditingController(text: widget.period?.periodCode ?? '');
    _fiscalYearController = TextEditingController(text: widget.period?.fiscalYear.toString() ?? DateTime.now().year.toString());
    _periodType = widget.period?.periodType ?? 'Monthly';
    _periodNumberController = TextEditingController(text: widget.period?.periodNumber?.toString() ?? '1');
    _startDate = widget.period?.startDate ?? DateTime.now();
    _endDate = widget.period?.endDate ?? DateTime.now();
    _isLocked = widget.period?.isLocked ?? false;
  }

  @override
  void dispose() {
    _periodCodeController.dispose();
    _fiscalYearController.dispose();
    _periodNumberController.dispose();
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
        periodCode: _periodCodeController.text,
        fiscalYear: int.parse(_fiscalYearController.text),
        periodType: _periodType,
        periodNumber: int.tryParse(_periodNumberController.text),
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
      title: Text(widget.period == null ? widget.appLocalizations.addNew : widget.appLocalizations.save),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _periodCodeController,
                decoration: InputDecoration(labelText: widget.appLocalizations.periodCode),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return widget.appLocalizations.requiredField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fiscalYearController,
                decoration: InputDecoration(labelText: widget.appLocalizations.fiscalYear),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return widget.appLocalizations.requiredField;
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _periodType,
                decoration: InputDecoration(labelText: widget.appLocalizations.periodsType),
                items: [
                  DropdownMenuItem(value: 'Monthly', child: Text(widget.appLocalizations.monthly)),
                  DropdownMenuItem(value: 'Quarterly', child: Text(widget.appLocalizations.quarterly)),
                  DropdownMenuItem(value: 'Custom', child: Text(widget.appLocalizations.custom)),
                ],
                onChanged: (value) {
                  setState(() {
                    _periodType = value ?? 'Monthly';
                  });
                },
              ),
              TextFormField(
                controller: _periodNumberController,
                decoration: InputDecoration(labelText: widget.appLocalizations.numberOfPeriods),
                keyboardType: TextInputType.number,
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
                  Text(widget.appLocalizations.locked),
                  Switch(
                    initialValue: _isLocked,
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
      title: Text(widget.appLocalizations.generatePeriods),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _startYear.toString(),
              decoration: InputDecoration(labelText: widget.appLocalizations.fiscalYear),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || int.tryParse(value) == null) {
                  return widget.appLocalizations.requiredField;
                }
                _startYear = int.parse(value);
                return null;
              },
            ),
            TextFormField(
              initialValue: _numberOfYears.toString(),
              decoration: InputDecoration(labelText: widget.appLocalizations.numberOfPeriods),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || int.tryParse(value) == null || int.parse(value) <= 0) {
                  return widget.appLocalizations.requiredField;
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
          child: Text(widget.appLocalizations.save),
        ),
      ],
    );
  }
}
