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
  
  // New state fields for the required financial properties
  String _nature = 'Debit';
  String _reportType = 'Balance Sheet';
  String _detailAccountType = 'General';
  String? _cashFlowType;
  bool _isActive = true;


  @override
  void initState() {
    super.initState();
    final acc = widget.accountToEdit;
    _codeController = TextEditingController(text: acc?.accountCode ?? '');
    _nameArController = TextEditingController(text: acc?.nameAr ?? '');
    _nameEnController = TextEditingController(text: acc?.nameEn ?? '');
    
    if (acc != null) {
      _parentId = acc.parentId;
      _nature = acc.nature;
      _reportType = acc.reportType;
      _detailAccountType = acc.detailAccountType;
      _cashFlowType = acc.cashFlowType;
      _isActive = acc.isActive;
    } else {
      // Set default values for new accounts if no accountToEdit is provided
      _nature = 'Debit'; // Default as per requirements, assuming common use
      _reportType = 'Balance Sheet'; // Default
      _detailAccountType = 'General'; // Default
      _cashFlowType = null; // Default
      _isActive = true;
    }
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
        level: widget.accountToEdit?.level ?? 1, // Preserve existing level or set default for new accounts
        isActive: _isActive,
        isParent: widget.accountToEdit?.isParent ?? false,
        // Add new properties
        nature: _nature,
        reportType: _reportType,
        detailAccountType: _detailAccountType,
        cashFlowType: _cashFlowType,
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
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              TextFormField(
                controller: _nameArController,
                decoration: InputDecoration(labelText: l10n.accountNameAr),
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              TextFormField(
                controller: _nameEnController,
                decoration: InputDecoration(labelText: l10n.accountNameEn),
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              coaAsync.when(
                data: (accounts) {
                  List<AccountEntity> flatList = [];
                  void flatten(List<AccountEntity> accs) {
                    for (var acc in accs) {
                      // Prevent selecting the account itself or its children as parent
                      if (widget.accountToEdit == null || (acc.id != widget.accountToEdit!.id && !acc.children.contains(widget.accountToEdit)))
                      {
                         flatList.add(acc);
                      }
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
                      // Filter out the account being edited and its descendants
                      ...flatList.where((acc) =>
                          (widget.accountToEdit == null ||
                              (acc.id != widget.accountToEdit!.id &&
                                  !_isDescendant(acc, widget.accountToEdit)))).map((acc) => DropdownMenuItem<int?>(
                        value: acc.id,
                        child: Text('${'--' * acc.level} ${acc.getLocalizedName(l10n.localeName)}'),
                      )),
                    ],
                    decoration: InputDecoration(labelText: l10n.parentAccount),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Text('Error loading accounts: ${e.toString()}'), // Localize error
              ),
              DropdownButtonFormField<String>(
                value: _nature,
                onChanged: (val) => setState(() => _nature = val!),
                items: const [
                  DropdownMenuItem(value: 'Debit', child: Text('Debit')),
                  DropdownMenuItem(value: 'Credit', child: Text('Credit')),
                ],
                decoration: InputDecoration(labelText: l10n.nature),
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              DropdownButtonFormField<String>(
                value: _reportType,
                onChanged: (val) => setState(() => _reportType = val!),
                items: const [
                  DropdownMenuItem(value: 'Balance Sheet', child: Text('Balance Sheet')),
                  DropdownMenuItem(value: 'Income Statement', child: Text('Income Statement')),
                ],
                decoration: InputDecoration(labelText: l10n.reportType),
                validator: (v) => v!.isEmpty ? l10n.requiredField : null,
              ),
              DropdownButtonFormField<String>(
                value: _detailAccountType,
                onChanged: (val) => setState(() => _detailAccountType = val!),
                items: const [
                  DropdownMenuItem(value: 'General', child: Text('General')),
                  DropdownMenuItem(value: 'Cash', child: Text('Cash')),
                  DropdownMenuItem(value: 'Bank', child: Text('Bank')),
                  DropdownMenuItem(value: 'Customer', child: Text('Customer')),
                  DropdownMenuItem(value: 'Vendor', child: Text('Vendor')),
                  DropdownMenuItem(value: 'Employee', child: Text('Employee')),
                  DropdownMenuItem(value: 'OtherDebit', child: Text('Other Debit')),
                  DropdownMenuItem(value: 'OtherCredit', child: Text('Other Credit')),
                ],
                decoration: InputDecoration(labelText: l10n.detailAccountType),
                 validator: (v) => v == null || v.isEmpty ? l10n.requiredField : null,
              ),
              DropdownButtonFormField<String?>(
                value: _cashFlowType,
                onChanged: (val) => setState(() => _cashFlowType = val),
                items: const [
                   DropdownMenuItem(value: null, child: Text('None')),
                  DropdownMenuItem(value: 'Operating', child: Text('Operating')),
                  DropdownMenuItem(value: 'Investing', child: Text('Investing')),
                  DropdownMenuItem(value: 'Financing', child: Text('Financing')),
                ],
                decoration: InputDecoration(labelText: l10n.cashFlowType),
              ),
               SwitchListTile(
                title: Text(l10n.active),
                value: _isActive,
                onChanged: (value) => setState(() => _isActive = value),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')), // Added const
        ElevatedButton(onPressed: _onSave, child: Text(l10n.save)),
      ],
    );
  }

  // Helper to prevent an account from being its own parent or a descendant's parent
  bool _isDescendant(AccountEntity possibleDescendant, AccountEntity? ancestor) {
    if (ancestor == null) return false;
    if (possibleDescendant.parentId == null) return false;
    if (possibleDescendant.parentId == ancestor.id) return true;
    
    // Find the parent account in the fetched list and recursively check
    final parent = ref.read(coaProvider).value?.firstWhere((acc) => acc.id == possibleDescendant.parentId); 
    if(parent == null) return false;
    return _isDescendant(parent, ancestor);
  }
}
