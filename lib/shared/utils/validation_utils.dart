import 'package:muhaseb_pro/l10n/app_localizations.dart';

String? validatePhoneNumber(String? value, AppLocalizations l10n) {
  if (value == null || value.isEmpty) {
    return null; // Not a required field
  }
  final phoneRegex = RegExp(r'^\+?[0-9]{10,13}$');
  if (!phoneRegex.hasMatch(value)) {
    return l10n.invalidPhoneNumberFormat;
  }
  return null;
}
