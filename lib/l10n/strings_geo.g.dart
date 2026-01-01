///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsGeo extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsGeo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.geo,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <geo>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsGeo _root = this; // ignore: unused_field

	@override 
	TranslationsGeo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsGeo(meta: meta ?? this.$meta);

	// Translations
	@override String get title => 'Geographical Data';
	@override String get zones => 'Zones';
	@override String get zoneAdd => 'Add New Zone';
	@override String get zoneEdit => 'Edit Zone';
	@override String get countries => 'Countries';
	@override String get countryAdd => 'Add New Country';
	@override String get countryEdit => 'Edit Country';
	@override String get governorates => 'Governorates';
	@override String get governorateAdd => 'Add New Governorate';
	@override String get governorateEdit => 'Edit Governorate';
	@override String get cities => 'Cities';
	@override String get cityAdd => 'Add New City';
	@override String get cityEdit => 'Edit City';
	@override String get regions => 'Regions';
	@override String get regionAdd => 'Add New Region';
	@override String get regionEdit => 'Edit Region';
	@override String get nationalityAr => 'Nationality (Arabic)';
	@override String get nationalityEn => 'Nationality (English)';
	@override String get selectParentPrompt => 'Select a parent item to add new record';
}

/// The flat map containing all translations for locale <geo>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsGeo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'title' => 'Geographical Data',
			'zones' => 'Zones',
			'zoneAdd' => 'Add New Zone',
			'zoneEdit' => 'Edit Zone',
			'countries' => 'Countries',
			'countryAdd' => 'Add New Country',
			'countryEdit' => 'Edit Country',
			'governorates' => 'Governorates',
			'governorateAdd' => 'Add New Governorate',
			'governorateEdit' => 'Edit Governorate',
			'cities' => 'Cities',
			'cityAdd' => 'Add New City',
			'cityEdit' => 'Edit City',
			'regions' => 'Regions',
			'regionAdd' => 'Add New Region',
			'regionEdit' => 'Edit Region',
			'nationalityAr' => 'Nationality (Arabic)',
			'nationalityEn' => 'Nationality (English)',
			'selectParentPrompt' => 'Select a parent item to add new record',
			_ => null,
		};
	}
}
