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
class TranslationsOps extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsOps({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ops,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ops>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsOps _root = this; // ignore: unused_field

	@override 
	TranslationsOps $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsOps(meta: meta ?? this.$meta);

	// Translations
	@override String get incoming => 'Incoming Stock';
	@override String get outgoing => 'Outgoing Stock';
	@override String get transfer => 'Transfer';
	@override String get opening => 'Opening Stock';
	@override String get quantity => 'Quantity';
	@override String get unitCost => 'Unit Cost';
	@override String get totalCost => 'Total Cost';
	@override String get manageIncomingStock => 'Manage incoming stock orders';
	@override String get manageOutgoingStock => 'Manage outgoing stock orders';
	@override String get addOpeningStock => 'Add Opening Stock';
	@override String get manageWarehouseTransfers => 'Manage warehouse transfers';
	@override String get createIncomingOrder => 'Create Incoming Order';
	@override String get createOutgoingOrder => 'Create Outgoing Order';
	@override String get createTransfer => 'Create Transfer';
	@override String get incomingStockOrders => 'Incoming Stock Orders';
	@override String get outgoingStockOrders => 'Outgoing Stock Orders';
	@override String get warehouseTransfers => 'Warehouse Transfers';
	@override String get transfers => 'Transfers';
	@override String get opsTitle => 'Stock Operations';
}

/// The flat map containing all translations for locale <ops>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsOps {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'incoming' => 'Incoming Stock',
			'outgoing' => 'Outgoing Stock',
			'transfer' => 'Transfer',
			'opening' => 'Opening Stock',
			'quantity' => 'Quantity',
			'unitCost' => 'Unit Cost',
			'totalCost' => 'Total Cost',
			'manageIncomingStock' => 'Manage incoming stock orders',
			'manageOutgoingStock' => 'Manage outgoing stock orders',
			'addOpeningStock' => 'Add Opening Stock',
			'manageWarehouseTransfers' => 'Manage warehouse transfers',
			'createIncomingOrder' => 'Create Incoming Order',
			'createOutgoingOrder' => 'Create Outgoing Order',
			'createTransfer' => 'Create Transfer',
			'incomingStockOrders' => 'Incoming Stock Orders',
			'outgoingStockOrders' => 'Outgoing Stock Orders',
			'warehouseTransfers' => 'Warehouse Transfers',
			'transfers' => 'Transfers',
			'opsTitle' => 'Stock Operations',
			_ => null,
		};
	}
}
