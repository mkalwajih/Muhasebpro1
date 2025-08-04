import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/tax_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/tax_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class TaxBracketsView extends ConsumerWidget {
  const TaxBracketsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taxBracketsAsync = ref.watch(taxBracketsProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: taxBracketsAsync.when(
        data: (brackets) => ListView.builder(
          itemCount: brackets.length,
          itemBuilder: (context, index) {
            final bracket = brackets[index];
            return ListTile(
              leading: bracket.isDefault ? const Icon(Icons.star, color: Colors.amber) : const SizedBox(width: 24),
              title: Text(bracket.nameEn),
              subtitle: Text('${bracket.taxRate}%'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _showAddEditBracketDialog(context, ref, bracketToEdit: bracket),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEditBracketDialog(context, ref),
        tooltip: l10n.addNewTaxBracket,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddEditBracketDialog(BuildContext context, WidgetRef ref, {TaxBracketEntity? bracketToEdit}) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final codeController = TextEditingController(text: bracketToEdit?.bracketCode ?? '');
    final nameEnController = TextEditingController(text: bracketToEdit?.nameEn ?? '');
    final nameArController = TextEditingController(text: bracketToEdit?.nameAr ?? '');
    final rateController = TextEditingController(text: bracketToEdit?.taxRate.toString() ?? '');
    bool isDefault = bracketToEdit?.isDefault ?? false;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(bracketToEdit == null ? l10n.addNewTaxBracket : l10n.editTaxBracket),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(controller: codeController, decoration: InputDecoration(labelText: l10n.code), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      TextFormField(controller: nameEnController, decoration: InputDecoration(labelText: l10n.nameEn), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      TextFormField(controller: nameArController, decoration: InputDecoration(labelText: l10n.nameAr), validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      TextFormField(controller: rateController, decoration: InputDecoration(labelText: l10n.taxRate), keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? l10n.requiredField : null),
                      SwitchListTile(
                        title: Text(l10n.isDefault),
                        value: isDefault,
                        onChanged: (val) => setDialogState(() => isDefault = val),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final newBracket = TaxBracketEntity(
                        bracketCode: codeController.text,
                        nameEn: nameEnController.text,
                        nameAr: nameArController.text,
                        taxRate: double.parse(rateController.text),
                        isDefault: isDefault,
                      );
                      if (bracketToEdit == null) {
                        ref.read(taxBracketsProvider.notifier).addTaxBracket(newBracket);
                      } else {
                        ref.read(taxBracketsProvider.notifier).updateTaxBracket(newBracket);
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
