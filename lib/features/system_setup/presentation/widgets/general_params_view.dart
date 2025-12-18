import 'package:flutter/material.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class GeneralParamsView extends StatelessWidget {
  final GeneralParametersEntity params;
  final ValueChanged<GeneralParametersEntity> onChanged;

  const GeneralParamsView(
      {super.key, required this.params, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DropdownButtonFormField<LanguageOption>(
          decoration: InputDecoration(labelText: l10n.language),
          items: LanguageOption.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString().split('.').last),
                  ))
              .toList(),
          onChanged: (value) =>
              onChanged(params.copyWith(language: value)),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<DateFormatOption>(
          decoration: InputDecoration(labelText: l10n.dateFormat),
          items: DateFormatOption.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString().split('.').last),
                  ))
              .toList(),
          onChanged: (value) =>
              onChanged(params.copyWith(dateFormat: value)),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<CalendarTypeOption>(
          decoration: InputDecoration(labelText: l10n.calendarType),
          items: CalendarTypeOption.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString().split('.').last),
                  ))
              .toList(),
          onChanged: (value) =>
              onChanged(params.copyWith(calendarType: value)),
        ),
      ],
    );
  }
}
