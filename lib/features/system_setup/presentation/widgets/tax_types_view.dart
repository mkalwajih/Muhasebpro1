import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/tax_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/coa_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/tax_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class TaxTypesView extends ConsumerWidget {
  const TaxTypesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taxTypesAsync = ref.watch(taxTypesProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: taxTypesAsync.when(
        data: (types) => ListView.builder(
          itemCount: types.length,
          itemBuilder: (context, index) {
            final type = types[index];
            return ListTile(
              title: Text(type.nameEn),
              subtitle: Text(type.typeCode),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _showAddEditTypeDialog(context, ref, typeToEdit: type),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEditTypeDialog(context, ref),
        tooltip: l10n.addNewTaxType,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddEditTypeDialog(BuildContext context, WidgetRef ref, {TaxTypeEntity? typeToEdit}) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final codeController = TextEditingController(text: typeToEdit?.typeCode ?? '');
    final nameEnController = TextEditingController(text: typeToEdit?.nameEn ?? '');
    final nameArController = TextEditingController(text: typeToEdit?.nameAr ?? '');
    String calcMethod = typeToEdit?.calcMethod ?? 'Sales';
    String? salesAccountId = typeToEdit?.salesAccountId;
    String? purchasesAccountId = typeToEdit?.purchasesAccountId;

    final accounts = ref.watch(coaProvider).asData?.value ?? [];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            bool showSales = calcMethod == 'Sales' || calcMethod == 'All';
            bool showPurchases = calcMethod == 'Purchases' || calcMethod == 'All';
            
            return AlertDialog(
              title: Text(typeToEdit == null ? l10n.addNewTaxType : l10n.editTaxType),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(controller: codeController, decoration: InputDecoration(labelText: l10n.code), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      const SizedBox(height: 8),
                      TextFormField(controller: nameEnController, decoration: InputDecoration(labelText: l10n.nameEn), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      const SizedBox(height: 8),
                      TextFormField(controller: nameArController, decoration: InputDecoration(labelText: l10n.nameAr), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: calcMethod,
                        decoration: InputDecoration(labelText: l10n.calculationMethod),
                        items: ['Sales', 'Purchases', 'All'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setDialogState(() {
                              calcMethod = value;
                            });
                          }
                        },
                      ),
                      if (showSales) ...[
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: salesAccountId,
                          decoration: InputDecoration(labelText: l10n.salesAccount),
                          items: accounts.map((e) => DropdownMenuItem(value: e.accountCode, child: Text(e.nameEn))).toList(),
                          onChanged: (value) => setDialogState(() => salesAccountId = value),
                           validator: (v) => v == null ? l10n.requiredField : null,
                        ),
                      ],
                      if (showPurchases) ...[
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: purchasesAccountId,
                          decoration: InputDecoration(labelText: l10n.purchasesAccount),
                          items: accounts.map((e) => DropdownMenuItem(value: e.accountCode, child: Text(e.nameEn))).toList(),
                          onChanged: (value) => setDialogState(() => purchasesAccountId = value),
                          validator: (v) => v == null ? l10n.requiredField : null,
                        ),
                      ]
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final newType = TaxTypeEntity(
                        typeCode: codeController.text,
                        nameEn: nameEnController.text,
                        nameAr: nameArController.text,
                        calcMethod: calcMethod,
                        salesAccountId: showSales ? salesAccountId : null,
                        purchasesAccountId: showPurchases ? purchasesAccountId : null,
                      );
                      if (typeToEdit == null) {
                        ref.read(taxTypesProvider.notifier).addTaxType(newType);
                      } else {
                        ref.read(taxTypesProvider.notifier).updateTaxType(newType);
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(l10n.save),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
