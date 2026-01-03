///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsCoa extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsCoa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.coa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <coa>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsCoa _root = this; // ignore: unused_field

	@override 
	TranslationsCoa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsCoa(meta: meta ?? this.$meta);

	// Translations
	@override String get accountCode => 'Account Code';
	@override String get accountNameAr => 'Account Name (Arabic)';
	@override String get accountNameEn => 'Account Name (English)';
	@override String get parentAccount => 'Parent Account';
	@override String get accountNature => 'Account Nature';
	@override String get reportType => 'Report Type';
	@override String get selectAccountPrompt => 'Select an account to view details';
	@override String get coaTitle => 'Chart of Accounts';
}

/// The flat map containing all translations for locale <coa>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsCoa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'accountCode' => 'Account Code',
			'accountNameAr' => 'Account Name (Arabic)',
			'accountNameEn' => 'Account Name (English)',
			'parentAccount' => 'Parent Account',
			'accountNature' => 'Account Nature',
			'reportType' => 'Report Type',
			'selectAccountPrompt' => 'Select an account to view details',
			'coaTitle' => 'Chart of Accounts',
			_ => null,
		};
	}
}
