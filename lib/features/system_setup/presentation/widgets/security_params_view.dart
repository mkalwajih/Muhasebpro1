import 'package:flutter/material.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class SecurityParamsView extends StatelessWidget {
  final GeneralParametersEntity params;
  final ValueChanged<GeneralParametersEntity> onChanged;

  const SecurityParamsView(
      {super.key, required this.params, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextFormField(
          initialValue: params.passwordMinLength.toString(),
          decoration: InputDecoration(labelText: l10n.passwordMinLength),
          keyboardType: TextInputType.number,
          onChanged: (value) => onChanged(params.copyWith(
              passwordMinLength: int.tryParse(value) ?? 0)),
          validator: (v) {
            if (v == null || v.isEmpty) return l10n.requiredField;
            final length = int.tryParse(v);
            if (length == null || length < 6 || length > 32) {
              return l10n.invalidLengthRange(min: 6, max: 32);
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: params.autoLockTimeout.toString(),
          decoration: InputDecoration(labelText: l10n.autoLockTimeout),
          keyboardType: TextInputType.number,
          onChanged: (value) => onChanged(params.copyWith(
              autoLockTimeout: int.tryParse(value) ?? 0)),
          validator: (v) {
            if (v == null || v.isEmpty) return l10n.requiredField;
            final timeout = int.tryParse(v);
            if (timeout == null || timeout < 1 || timeout > 60) {
              return l10n.invalidRange(min: 1, max: 60);
            }
            return null;
          },
        ),
      ],
    );
  }
}
