import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/tax_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/tax_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class TaxCalcMethodsView extends ConsumerWidget {
  const TaxCalcMethodsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taxCalcMethodsAsync = ref.watch(taxCalcMethodsProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: taxCalcMethodsAsync.when(
        data: (methods) => ListView.builder(
          itemCount: methods.length,
          itemBuilder: (context, index) {
            final method = methods[index];
            return ListTile(
              title: Text(method.nameEn),
              subtitle: Text('${method.methodCode} - ${method.category}'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _showAddEditMethodDialog(context, ref, methodToEdit: method),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEditMethodDialog(context, ref),
        tooltip: l10n.addNewTaxCalculationMethod,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddEditMethodDialog(BuildContext context, WidgetRef ref, {TaxCalcMethodEntity? methodToEdit}) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final codeController = TextEditingController(text: methodToEdit?.methodCode ?? '');
    final nameEnController = TextEditingController(text: methodToEdit?.nameEn ?? '');
    final nameArController = TextEditingController(text: methodToEdit?.nameAr ?? '');
    String category = methodToEdit?.category ?? 'Taxable';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(methodToEdit == null ? l10n.addNewTaxCalculationMethod : l10n.editTaxCalculationMethod),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(controller: codeController, decoration: InputDecoration(labelText: l10n.code), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      TextFormField(controller: nameEnController, decoration: InputDecoration(labelText: l10n.nameEn), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      TextFormField(controller: nameArController, decoration: InputDecoration(labelText: l10n.nameAr), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: l10n.category),
                        items: ['Taxable', 'Exempted', 'ZeroTax'].map((e) => DropdownMenuItem(initialValue: e, child: Text(e))).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setDialogState(() {
                              category = value;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final newMethod = TaxCalcMethodEntity(
                        methodCode: codeController.text,
                        nameEn: nameEnController.text,
                        nameAr: nameArController.text,
                        category: category,
                      );
                      if (methodToEdit == null) {
                        ref.read(taxCalcMethodsProvider.notifier).addTaxCalcMethod(newMethod);
                      } else {
                        ref.read(taxCalcMethodsProvider.notifier).updateTaxCalcMethod(newMethod);
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
