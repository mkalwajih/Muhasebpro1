import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/presentation/widgets/custom_text_field.dart';
import '../../../domain/entities/payment_voucher_entity.dart';
import '../../../domain/entities/voucher_base_entity.dart';

class PaymentVoucherForm extends ConsumerStatefulWidget {
  const PaymentVoucherForm({
    super.key,
    this.voucher,
    required this.canEdit,
    required this.canPost,
    required this.onSaved,
    required this.onCancelled,
  });

  final PaymentVoucherEntity? voucher;
  final bool canEdit;
  final bool canPost;
  final Function(PaymentVoucherEntity) onSaved;
  final VoidCallback onCancelled;

  @override
  ConsumerState<PaymentVoucherForm> createState() => _PaymentVoucherFormState();
}

class _PaymentVoucherFormState extends ConsumerState<PaymentVoucherForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _refCodeController = TextEditingController();
  final _checkNumberController = TextEditingController();
  final _beneficiaryController = TextEditingController();
  
  late DateTime _selectedDate;
  late String _selectedDocType;
  late String _selectedBranch;
  late String _selectedPaymentAccount;
  late PaymentMethod _selectedPaymentMethod;
  late List<PaymentVoucherLineEntity> _lines;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    if (widget.voucher != null) {
      final voucher = widget.voucher!;
      _descriptionController.text = voucher.description;
      _refCodeController.text = voucher.refCode ?? '';
      _checkNumberController.text = voucher.checkNo ?? '';
      _beneficiaryController.text = voucher.payeeName;
      _selectedDate = voucher.date;
      _selectedDocType = voucher.docTypeCode;
      _selectedBranch = voucher.branchId;
      _selectedPaymentAccount = voucher.paymentFromAccountId;
      _selectedPaymentMethod = voucher.paymentMethod;
      _lines = List.from(voucher.lines);
    } else {
      _descriptionController.clear();
      _refCodeController.clear();
      _checkNumberController.clear();
      _beneficiaryController.clear();
      _selectedDate = DateTime.now();
      _selectedDocType = 'PV';
      _selectedBranch = 'BR001';
      _selectedPaymentAccount = 'ACC001';
      _selectedPaymentMethod = PaymentMethod.cash;
      _lines = [];
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _refCodeController.dispose();
    _checkNumberController.dispose();
    _beneficiaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                border: Border(
                  bottom: BorderSide(
                    color: theme.colorScheme.outline.withOpacity(0.2),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: _selectedDocType,
                          decoration: InputDecoration(
                            labelText: l10n.documentType,
                            border: const OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'PV', child: Text('Payment Voucher')),
                            DropdownMenuItem(value: 'EXP', child: Text('Expense Payment')),
                            DropdownMenuItem(value: 'SUP', child: Text('Supplier Payment')),
                          ],
                          onChanged: widget.canEdit ? (value) {
                            setState(() {
                              _selectedDocType = value ?? 'PV';
                            });
                          } : null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.pleaseSelectDocumentType;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: widget.canEdit ? () => _selectDate(context) : null,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: l10n.date,
                              border: const OutlineInputBorder(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                ),
                                const Icon(Icons.calendar_today),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: _selectedBranch,
                          decoration: InputDecoration(
                            labelText: l10n.branch,
                            border: const OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'BR001', child: Text('Main Branch')),
                            DropdownMenuItem(value: 'BR002', child: Text('Secondary Branch')),
                          ],
                          onChanged: widget.canEdit ? (value) {
                            setState(() {
                              _selectedBranch = value ?? 'BR001';
                            });
                          } : null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.pleaseSelectBranch;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _descriptionController,
                    labelText: l10n.description,
                    maxLines: 2,
                    enabled: widget.canEdit,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return l10n.pleaseEnterDescription;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: DropdownButtonFormField<String>(
                          initialValue: _selectedPaymentAccount,
                          decoration: InputDecoration(
                            labelText: l10n.paymentFromAccount,
                            border: const OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'ACC001', child: Text('Cash Account')),
                            DropdownMenuItem(value: 'ACC002', child: Text('Bank Account 1')),
                            DropdownMenuItem(value: 'ACC003', child: Text('Bank Account 2')),
                          ],
                          onChanged: widget.canEdit ? (value) {
                            setState(() {
                              _selectedPaymentAccount = value ?? 'ACC001';
                            });
                          } : null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.pleaseSelectPaymentAccount;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<PaymentMethod>(
                          initialValue: _selectedPaymentMethod,
                          decoration: InputDecoration(
                            labelText: l10n.paymentMethod,
                            border: const OutlineInputBorder(),
                          ),
                          items: [
                            DropdownMenuItem(
                              value: PaymentMethod.cash,
                              child: Text(l10n.cash),
                            ),
                            DropdownMenuItem(
                              value: PaymentMethod.check,
                              child: Text(l10n.check),
                            ),
                            DropdownMenuItem(
                              value: PaymentMethod.transfer, // Fixed enum
                              child: Text(l10n.bankTransfer),
                            ),
                          ],
                          onChanged: widget.canEdit ? (value) {
                            setState(() {
                              _selectedPaymentMethod = value ?? PaymentMethod.cash;
                            });
                          } : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          controller: _refCodeController,
                          labelText: l10n.referenceCode,
                          enabled: widget.canEdit,
                        ),
                      ),
                    ],
                  ),
                  if (_selectedPaymentMethod == PaymentMethod.check) ...[
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: _checkNumberController,
                            labelText: l10n.checkNumber,
                            enabled: widget.canEdit,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            controller: _beneficiaryController,
                            labelText: l10n.beneficiary,
                            enabled: widget.canEdit,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          l10n.paymentLines,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        if (widget.canEdit)
                          ElevatedButton.icon(
                            onPressed: _addLine,
                            icon: const Icon(Icons.add),
                            label: Text(l10n.addLine),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildLinesList(),
                  ),
                  _buildTotalFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildActionButtons(),
    );
  }

  Widget _buildLinesList() {
    final l10n = AppLocalizations.of(context)!;
    
    if (_lines.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.payment,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noPaymentLinesAdded,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.addFirstPaymentLine,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: _lines.length,
      itemBuilder: (context, index) {
        final line = _lines[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            title: Text('Account: ${line.accountId}'),
            subtitle: Text(line.description ?? ''),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$${line.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.canEdit) ...[
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeLine(index),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTotalFooter() {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    
    final totalAmount = _lines.fold<double>(0.0, (sum, line) => sum + line.amount);
    
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            '${l10n.totalAmount}: ',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$${totalAmount.toStringAsFixed(2)}',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: widget.onCancelled,
              child: Text(l10n.cancel),
            ),
          ),
          const SizedBox(width: 16),
          if (widget.canEdit)
            Expanded(
              child: ElevatedButton(
                onPressed: _saveVoucher,
                child: Text(l10n.save),
              ),
            ),
          if (widget.canPost && widget.voucher?.canPost == true) ...[
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: _postVoucher,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(l10n.post),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addLine() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.addPaymentLine),
        content: const Text('Payment line form will be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _lines.add(PaymentVoucherLineEntity(
                  lineId: 'PVL${_lines.length + 1}',
                  voucherId: widget.voucher?.voucherId ?? 'NEW',
                  lineNumber: _lines.length + 1,
                  accountId: '5001',
                  amount: 500.0,
                  description: 'Sample expense',
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ));
              });
            },
            child: Text(AppLocalizations.of(context)!.add),
          ),
        ],
      ),
    );
  }

  void _removeLine(int index) {
    setState(() {
      _lines.removeAt(index);
    });
  }

  void _saveVoucher() {
    if (_formKey.currentState?.validate() ?? false) {
      final voucher = PaymentVoucherEntity(
        voucherId: widget.voucher?.voucherId ?? 'NEW_${DateTime.now().millisecondsSinceEpoch}',
        branchId: _selectedBranch,
        docTypeCode: _selectedDocType,
        docNo: widget.voucher?.docNo ?? 'AUTO',
        date: _selectedDate,
        description: _descriptionController.text.trim(),
        refCode: _refCodeController.text.trim().isEmpty ? null : _refCodeController.text.trim(),
        paymentFromAccountId: _selectedPaymentAccount,
        paymentMethod: _selectedPaymentMethod,
        checkNo: _checkNumberController.text.trim().isEmpty ? null : _checkNumberController.text.trim(),
        payeeName: _beneficiaryController.text.trim().isEmpty ? 'Unknown' : _beneficiaryController.text.trim(),
        status: VoucherStatus.draft,
        createdBy: 'CURRENT_USER',
        createdAt: widget.voucher?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
        totalAmount: _lines.fold<double>(0.0, (sum, line) => sum + line.amount),
        lines: _lines,
      );
      
      widget.onSaved(voucher);
    }
  }

  void _postVoucher() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.voucherPostedSuccessfully),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
