import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class AccountingParamsView extends StatelessWidget {
  final GeneralParametersEntity params;
  final ValueChanged<GeneralParametersEntity> onChanged;

  const AccountingParamsView({
    super.key,
    required this.params,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Account Number Type Radio Buttons
        Text(l10n.accountNumberType, style: theme.textTheme.titleSmall),
        // TODO: Fix this with a non-deprecated widget or proper logic
        // Column(
        //   children: AccountNumberTypeOption.values.map((option) {
        //     return RadioListTile<AccountNumberTypeOption>(
        //       title: Text(option.name),
        //       value: option,
        //       groupValue: params.accountNumberType,
        //       onChanged: (value) {
        //         if (value != null) {
        //           onChanged(params.copyWith(accountNumberType: value));
        //         }
        //       },
        //     );
        //   }).toList(),
        // ),
        const SizedBox(height: 16),

        // Account Number Length
        TextFormField(
          initialValue: params.accountNumberLength.toString(),
          decoration: InputDecoration(
            labelText: l10n.accountNumberLength,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            final length = int.tryParse(value);
            if (length != null && length >= 3 && length <= 20) {
              onChanged(params.copyWith(accountNumberLength: length));
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Value is required';
            }
            final length = int.tryParse(value);
            if (length == null || length < 3 || length > 20) {
              return 'Must be between 3 and 20';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Cost Center Policy
        DropdownButtonFormField<PolicyOption>(
          initialValue: params.costCenterPolicy, // Fixed: value -> initialValue
          decoration: InputDecoration(
            labelText: l10n.costCenterPolicy,
            border: const OutlineInputBorder(),
          ),
          items: PolicyOption.values
              .map((e) => DropdownMenuItem<PolicyOption>(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(params.copyWith(costCenterPolicy: value));
            }
          },
        ),
        const SizedBox(height: 16),

        // Project Policy
        DropdownButtonFormField<PolicyOption>(
          initialValue: params.projectPolicy, // Fixed: value -> initialValue
          decoration: InputDecoration(
            labelText: l10n.projectPolicy,
            border: const OutlineInputBorder(),
          ),
          items: PolicyOption.values
              .map((e) => DropdownMenuItem<PolicyOption>(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(params.copyWith(projectPolicy: value));
            }
          },
        ),
      ],
    );
  }
}
