import 'package:flutter/material.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/tax_brackets_view.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/tax_calc_methods_view.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/widgets/tax_types_view.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';

class TaxScreen extends StatelessWidget {
  const TaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.taxSettings),
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.taxBrackets),
              Tab(text: l10n.taxTypes),
              Tab(text: l10n.taxCalculationMethods),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TaxBracketsView(),
            TaxTypesView(),
            TaxCalcMethodsView(),
          ],
        ),
      ),
    );
  }
}
