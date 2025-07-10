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
        // UI Theme
        SwitchListTile(
          title: Text(l10n.uiTheme),
          subtitle: Text(params.uiTheme == UIThemeOption.dark ? l10n.dark : l10n.light),
          value: params.uiTheme == UIThemeOption.dark,
          onChanged: (isDark) {
            onChanged(params.copyWith(uiTheme: isDark ? UIThemeOption.dark : UIThemeOption.light));
          },
        ),
        const SizedBox(height: 16),

        // Font Size
        DropdownButtonFormField<FontSizeOption>(
          value: params.fontSize,
          decoration: InputDecoration(
            labelText: l10n.fontSize,
            border: const OutlineInputBorder(),
          ),
          items: FontSizeOption.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(params.copyWith(fontSize: value));
            }
          },
        ),
      ],
    );
  }
}
