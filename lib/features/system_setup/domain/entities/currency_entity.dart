import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final String currencyCode;
  final String nameAr;
  final String nameEn;
  final String symbol;
  final String fractionNameAr;
  final String fractionNameEn;
  final double exchangeRate;
  final bool isBaseCurrency;
  final int decimalPlaces;
  final double? minRateLimit;
  final double? maxRateLimit;
  final bool isActive;
  final List<CurrencyDenominationEntity> denominations;

  const CurrencyEntity({
    required this.currencyCode,
    required this.nameAr,
    required this.nameEn,
    required this.symbol,
    required this.fractionNameAr,
    required this.fractionNameEn,
    required this.exchangeRate,
    required this.isBaseCurrency,
    required this.decimalPlaces,
    this.minRateLimit,
    this.maxRateLimit,
    required this.isActive,
    this.denominations = const [],
  });

  CurrencyEntity copyWith({
    String? currencyCode,
    String? nameAr,
    String? nameEn,
    String? symbol,
    String? fractionNameAr,
    String? fractionNameEn,
    double? exchangeRate,
    bool? isBaseCurrency,
    int? decimalPlaces,
    double? minRateLimit,
    double? maxRateLimit,
    bool? isActive,
    List<CurrencyDenominationEntity>? denominations,
  }) {
    return CurrencyEntity(
      currencyCode: currencyCode ?? this.currencyCode,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      symbol: symbol ?? this.symbol,
      fractionNameAr: fractionNameAr ?? this.fractionNameAr,
      fractionNameEn: fractionNameEn ?? this.fractionNameEn,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      isBaseCurrency: isBaseCurrency ?? this.isBaseCurrency,
      decimalPlaces: decimalPlaces ?? this.decimalPlaces,
      minRateLimit: minRateLimit ?? this.minRateLimit,
      maxRateLimit: maxRateLimit ?? this.maxRateLimit,
      isActive: isActive ?? this.isActive,
      denominations: denominations ?? this.denominations,
    );
  }

  @override
  List<Object?> get props => [
        currencyCode,
        nameAr,
        nameEn,
        symbol,
        fractionNameAr,
        fractionNameEn,
        exchangeRate,
        isBaseCurrency,
        decimalPlaces,
        minRateLimit,
        maxRateLimit,
        isActive,
        denominations,
      ];
}

class CurrencyDenominationEntity extends Equatable {
  final int id;
  final String currencyCode;
  final double denominationValue;
  final String denominationNameAr;
  final String denominationNameEn;
  final String denominationType;

  const CurrencyDenominationEntity({
    required this.id,
    required this.currencyCode,
    required this.denominationValue,
    required this.denominationNameAr,
    required this.denominationNameEn,
    required this.denominationType,
  });

  @override
  List<Object?> get props => [
        id,
        currencyCode,
        denominationValue,
        denominationNameAr,
        denominationNameEn,
        denominationType,
      ];
}
