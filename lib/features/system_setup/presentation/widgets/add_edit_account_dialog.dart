import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/account_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/coa_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class AddEditAccountDialog extends ConsumerStatefulWidget {
  final AccountEntity? accountToEdit;
  const AddEditAccountDialog({super.key, this.accountToEdit});

  @override
  ConsumerState<AddEditAccountDialog> createState() => _AddEditAccountDialogState();
}

class _AddEditAccountDialogState extends ConsumerState<AddEditAccountDialog> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _codeController;
  late TextEditingController _nameArController;
  late TextEditingController _nameEnController;
  
  int? _parentId;
  String _accountType = 'Transactional';

  @override
  void initState() {
    super.initState();
    final acc = widget.accountToEdit;
    _codeController = TextEditingController(text: acc?.accountCode ?? '');
    _nameArController = TextEditingController(text: acc?.nameAr ?? '');
    _nameEnController = TextEditingController(text: acc?.nameEn ?? '');
    _parentId = acc?.parentId;
    _accountType = acc?.type ?? 'Transactional';
  }
  
  @override
  void dispose() {
    _codeController.dispose();
    _nameArController.dispose();
    _nameEnController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(coaProvider.notifier);
      final account = AccountEntity(
        id: widget.accountToEdit?.id ?? 0,
        accountCode: _codeController.text,
        nameAr: _nameArController.text,
        nameEn: _nameEnController.text,
        parentId: _parentId,
        type: _accountType,
        level: 0, // Level will be calculated on backend/repo in a real app
        isActive: widget.accountToEdit?.isActive ?? true,
      );

      if (widget.accountToEdit == null) {
        notifier.addAccount(account);
      } else {
        notifier.updateAccount(account);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final coaAsync = ref.watch(coaProvider);

    return AlertDialog(
      title: Text(widget.accountToEdit == null ? l10n.addNewAccount : l10n.editAccount),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(labelText: l10n.accountCode),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _nameArController,
                decoration: InputDecoration(labelText: l10n.accountNameAr),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _nameEnController,
                decoration: InputDecoration(labelText: l10n.accountNameEn),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              coaAsync.when(
                data: (accounts) {
                  List<AccountEntity> flatList = [];
                  void flatten(List<AccountEntity> accs) {
                    for (var acc in accs) {
                      flatList.add(acc);
                      flatten(acc.children);
                    }
                  }
                  flatten(accounts);

                  return DropdownButtonFormField<int?>(
                    value: _parentId,
                    onChanged: (val) => setState(() => _parentId = val),
                    items: [
                      DropdownMenuItem<int?>(
                        value: null,
                        child: Text(l10n.noParent), 
                      ),
                      ...flatList.map((acc) => DropdownMenuItem<int?>(
                        value: acc.id,
                        child: Text('${'--' * acc.level} ${acc.accountCode} - ${acc.getLocalizedName(l10n.localeName)}'),
                      )),
                    ],
                    decoration: InputDecoration(labelText: l10n.parentAccount),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => const Text('Error loading accounts'), 
              ),
              DropdownButtonFormField<String>(
                value: _accountType,
                onChanged: (val) => setState(() => _accountType = val!),
                items: [
                  DropdownMenuItem(value: 'Header', child: Text(l10n.header)),
                  DropdownMenuItem(value: 'Transactional', child: Text(l10n.transactional)),
                ],
                decoration: InputDecoration(labelText: l10n.accountType),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
        ElevatedButton(onPressed: _onSave, child: Text(l10n.save)),
      ],
    );
  }
}
