import 'package:flutter/material.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class UiParamsView extends StatelessWidget {
  final GeneralParametersEntity params;
  final ValueChanged<GeneralParametersEntity> onChanged;

  const UiParamsView({
    super.key,
    required this.params,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DropdownButtonFormField<UIThemeOption>(
          value: params.uiTheme,
          decoration: InputDecoration(labelText: l10n.uiTheme),
          items: UIThemeOption.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString().split('.').last),
                  ))
              .toList(),
          onChanged: (value) => onChanged(params.copyWith(uiTheme: value)),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<FontSizeOption>(
          value: params.fontSize,
          decoration: InputDecoration(labelText: l10n.fontSize),
          items: FontSizeOption.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString().split('.').last),
                  ))
              .toList(),
          onChanged: (value) => onChanged(params.copyWith(fontSize: value)),
        ),
      ],
    );
  }
}
