
import 'package:equatable/equatable.dart';

class TaxBracketEntity extends Equatable {
  final String bracketCode;
  final String nameAr;
  final String nameEn;
  final double taxRate;
  final bool isCompound;
  final bool isDefault;

  const TaxBracketEntity({
    required this.bracketCode,
    required this.nameAr,
    required this.nameEn,
    required this.taxRate,
    required this.isCompound,
    required this.isDefault,
  });

  @override
  List<Object?> get props => [bracketCode, nameAr, nameEn, taxRate, isCompound, isDefault];
}

class TaxTypeEntity extends Equatable {
  final String typeCode;
  final String nameAr;
  final String nameEn;
  final String calcMethod;
  final String? salesAccountId;
  final String? purchasesAccountId;

  const TaxTypeEntity({
    required this.typeCode,
    required this.nameAr,
    required this.nameEn,
    required this.calcMethod,
    this.salesAccountId,
    this.purchasesAccountId,
  });

  @override
  List<Object?> get props => [
        typeCode,
        nameAr,
        nameEn,
        calcMethod,
        salesAccountId,
        purchasesAccountId,
      ];
}

class TaxCalcMethodEntity extends Equatable {
  final String methodCode;
  final String nameAr;
  final String nameEn;
  final String category;

  const TaxCalcMethodEntity({
    required this.methodCode,
    required this.nameAr,
    required this.nameEn,
    required this.category,
  });

  @override
  List<Object?> get props => [methodCode, nameAr, nameEn, category];
}
