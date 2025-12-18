import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class SecurityParamsView extends StatelessWidget {
  final GeneralParametersEntity params;
  final ValueChanged<GeneralParametersEntity> onChanged;

  const SecurityParamsView({
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
        // Password Min Length
        TextFormField(
          initialValue: params.passwordMinLength.toString(),
          decoration: InputDecoration(
            labelText: l10n.passwordMinLength,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            final length = int.tryParse(value);
            if (length != null && length >= 6 && length <= 32) {
              onChanged(params.copyWith(passwordMinLength: length));
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) return 'Value required';
            final val = int.tryParse(value);
            if (val == null || val < 6 || val > 32) return 'Must be between 6-32';
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Auto-Lock Timeout
        TextFormField(
          initialValue: params.autoLockTimeout.toString(),
          decoration: InputDecoration(
            labelText: l10n.autoLockTimeout,
            helperText: l10n.inMinutes,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            final timeout = int.tryParse(value);
            if (timeout != null && timeout >= 1 && timeout <= 60) {
              onChanged(params.copyWith(autoLockTimeout: timeout));
            }
          },
           validator: (value) {
            if (value == null || value.isEmpty) return 'Value required';
            final val = int.tryParse(value);
            if (val == null || val < 1 || val > 60) return 'Must be between 1-60';
            return null;
          },
        ),
        const SizedBox(height: 16),
        const Divider(),
        
        CheckboxListTile(
          title: Text(l10n.useVAT),
          value: params.useVAT,
          onChanged: (value) => onChanged(params.copyWith(useVAT: value)),
        ),
        CheckboxListTile(
          title: Text(l10n.useTDS),
          value: params.useTDS,
          onChanged: (value) => onChanged(params.copyWith(useTDS: value)),
        ),
        CheckboxListTile(
          title: Text(l10n.useEInvoice),
          value: params.useEInvoice,
          onChanged: (value) => onChanged(params.copyWith(useEInvoice: value)),
        ),
        if (params.useVAT)
          CheckboxListTile(
            title: Text(l10n.priceIncludesTax),
            value: params.priceIncludesTax,
            onChanged: (value) => onChanged(params.copyWith(priceIncludesTax: value)),
          ),
      ],
    );
  }
}
