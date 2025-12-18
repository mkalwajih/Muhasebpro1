import 'package:flutter/material.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/general_parameters_entity.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class BackupParamsView extends StatelessWidget {
  final GeneralParametersEntity params;
  final ValueChanged<GeneralParametersEntity> onChanged;

  const BackupParamsView({
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
        // Backup Frequency
        DropdownButtonFormField<BackupFrequencyOption>(
          decoration: InputDecoration(
            labelText: l10n.backupFrequency,
            border: const OutlineInputBorder(),
          ),
          items: BackupFrequencyOption.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(params.copyWith(backupFrequency: value));
            }
          },
        ),
        const SizedBox(height: 16),
        
        // Cloud Backup
        CheckboxListTile(
          title: Text(l10n.cloudBackup),
          subtitle: Text(l10n.cloudBackupHint),
          value: params.cloudBackup,
          onChanged: (value) => onChanged(params.copyWith(cloudBackup: value)),
        ),
      ],
    );
  }
}
