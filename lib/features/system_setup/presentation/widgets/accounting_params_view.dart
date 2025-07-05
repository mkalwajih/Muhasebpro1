import 'package:flutter/material.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class AccountingParamsView extends StatelessWidget {
  final GeneralParametersEntity params;
  final ValueChanged<GeneralParametersEntity> onChanged;

  const AccountingParamsView(
      {super.key, required this.params, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Account Number Type
        Text(l10n.accountNumberType, style: Theme.of(context).textTheme.titleMedium),
        Column(
          children: AccountNumberTypeOption.values
              .map(
                (e) => RadioListTile<AccountNumberTypeOption>(
                  title: Text(e.toString().split('.').last),
                  value: e,
                  groupValue: params.accountNumberType,
                  onChanged: (value) =>
                      onChanged(params.copyWith(accountNumberType: value)),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: params.accountNumberLength.toString(),
          decoration: InputDecoration(labelText: l10n.accountNumberLength),
          keyboardType: TextInputType.number,
          onChanged: (value) => onChanged(params.copyWith(
              accountNumberLength: int.tryParse(value) ?? 0)),
          validator: (v) {
            if (v == null || v.isEmpty) return l10n.requiredField;
            final length = int.tryParse(v);
            if (length == null || length < 3 || length > 20) {
              return l10n.invalidLengthRange(min: 3, max: 20); // Localize
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Cost Center Policy
        DropdownButtonFormField<PolicyOption>(
          value: params.costCenterPolicy,
          decoration: InputDecoration(labelText: l10n.costCenterPolicy),
          items: PolicyOption.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString().split('.').last),
                  ))
              .toList(),
          onChanged: (value) =>
              onChanged(params.copyWith(costCenterPolicy: value)),
        ),
        const SizedBox(height: 16),

        // Project Policy
        DropdownButtonFormField<PolicyOption>(
          value: params.projectPolicy,
          decoration: InputDecoration(labelText: l10n.projectPolicy),
          items: PolicyOption.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString().split('.').last),
                  ))
              .toList(),
          onChanged: (value) =>
              onChanged(params.copyWith(projectPolicy: value)),
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          title: Text(l10n.useVAT),
          value: params.useVAT,
          onChanged: (value) => onChanged(params.copyWith(useVAT: value)),
        ),
        SwitchListTile(
          title: Text(l10n.useTDS),
          value: params.useTDS,
          onChanged: (value) => onChanged(params.copyWith(useTDS: value)),
        ),
        SwitchListTile(
          title: Text(l10n.useEInvoice),
          value: params.useEInvoice,
          onChanged: (value) => onChanged(params.copyWith(useEInvoice: value)),
        ),
        if (params.useVAT) // Only visible if useVAT is true
          SwitchListTile(
            title: Text(l10n.priceIncludesTax),
            value: params.priceIncludesTax,
            onChanged: (value) =>
                onChanged(params.copyWith(priceIncludesTax: value)),
          ),
      ],
    );
  }
}
