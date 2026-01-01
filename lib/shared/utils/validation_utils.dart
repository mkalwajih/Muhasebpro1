import 'package:muhaseb_pro/l10n/translations.g.dart';

// Change Translations to Translations
String? validatePhoneNumber(String? value, Translations t) {
  if (value == null || value.isEmpty) {
    return null;
  }
  final phoneRegex = RegExp(r'^\+?[0-9]{10,13}$');
  if (!phoneRegex.hasMatch(value)) {
    // Access via 'common' namespace
    return t.common.invalidPhoneNumberFormat; 
  }
  return null;
}