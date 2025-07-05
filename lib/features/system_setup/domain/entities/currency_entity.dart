import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final String currencyCode;
  final String nameAr;
  final String nameEn;
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

  @override
  List<Object?> get props => [
        currencyCode,
        nameAr,
        nameEn,
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
