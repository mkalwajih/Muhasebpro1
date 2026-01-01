import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../../shared/presentation/widgets/custom_text_field.dart';
import '../../../domain/entities/journal_voucher_entity.dart';
import '../../../domain/entities/voucher_base_entity.dart';

class JournalVoucherForm extends ConsumerStatefulWidget {
  const JournalVoucherForm({
    super.key,
    this.voucher,
    required this.canEdit,
    required this.canPost,
    required this.onSaved,
    required this.onCancelled,
  });

  final JournalVoucherEntity? voucher;
  final bool canEdit;
  final bool canPost;
  final Function(JournalVoucherEntity) onSaved;
  final VoidCallback onCancelled;

  @override
  ConsumerState<JournalVoucherForm> createState() => _JournalVoucherFormState();
}

class _JournalVoucherFormState extends ConsumerState<JournalVoucherForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _refCodeController = TextEditingController();
  
  late DateTime _selectedDate;
  late String _selectedDocType;
  late String _selectedBranch;
  late bool _isReversing;
  late bool _isPeriodic;
  late List<JournalVoucherLineEntity> _lines;

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
      _selectedDate = voucher.date;
      _selectedDocType = voucher.docTypeCode;
      _selectedBranch = voucher.branchId;
      _isReversing = voucher.isReversing;
      _isPeriodic = voucher.isPeriodic;
      _lines = List.from(voucher.lines);
    } else {
      _descriptionController.clear();
      _refCodeController.clear();
      _selectedDate = DateTime.now();
      _selectedDocType = 'JV';
      _selectedBranch = 'BR001';
      _isReversing = false;
      _isPeriodic = false;
      _lines = [];
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _refCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
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
                            DropdownMenuItem(value: 'JV', child: Text('Journal Voucher')),
                            DropdownMenuItem(value: 'ADJ', child: Text('Adjustment')),
                            DropdownMenuItem(value: 'OB', child: Text('Opening Balance')),
                          ],
                          onChanged: widget.canEdit ? (value) {
                            setState(() {
                              _selectedDocType = value ?? 'JV';
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
                        child: CustomTextField(
                          controller: _refCodeController,
                          labelText: l10n.referenceCode,
                          enabled: widget.canEdit,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CheckboxListTile(
                          title: Text(l10n.reversing),
                          value: _isReversing,
                          onChanged: widget.canEdit ? (value) {
                            setState(() {
                              _isReversing = value ?? false;
                            });
                          } : null,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          title: Text(l10n.periodic),
                          value: _isPeriodic,
                          onChanged: widget.canEdit ? (value) {
                            setState(() {
                              _isPeriodic = value ?? false;
                            });
                          } : null,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ],
                  ),
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
                          l10n.journalEntries,
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
                  _buildTotalsFooter(),
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
    final l10n = Translations.of(context);
    
    if (_lines.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noEntriesAdded,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.addFirstEntry,
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
                  'Dr: ${line.debit.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Cr: ${line.credit.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
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

  Widget _buildTotalsFooter() {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);
    
    final totalDebit = _lines.fold<double>(0.0, (sum, line) => sum + line.debit);
    final totalCredit = _lines.fold<double>(0.0, (sum, line) => sum + line.credit);
    final difference = totalDebit - totalCredit;
    
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
          Expanded(
            child: Text(
              '${l10n.totalDebit}: ${totalDebit.toStringAsFixed(2)}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${l10n.totalCredit}: ${totalCredit.toStringAsFixed(2)}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${l10n.difference}: ${difference.toStringAsFixed(2)}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: difference == 0 ? theme.colorScheme.primary : theme.colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    final l10n = Translations.of(context);
    
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
        title: Text(Translations.of(context).addJournalEntry),
        content: const Text('Journal entry form will be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _lines.add(JournalVoucherLineEntity(
                  lineId: 'JL${_lines.length + 1}',
                  voucherId: widget.voucher?.voucherId ?? 'NEW',
                  lineNumber: _lines.length + 1,
                  accountId: '1001',
                  debit: 1000.0,
                  credit: 0.0,
                  amount: 1000.0, // Fixed: Added required amount argument
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ));
              });
            },
            child: Text(Translations.of(context).add),
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
      final voucher = JournalVoucherEntity(
        voucherId: widget.voucher?.voucherId ?? 'NEW_${DateTime.now().millisecondsSinceEpoch}',
        branchId: _selectedBranch,
        docTypeCode: _selectedDocType,
        docNo: widget.voucher?.docNo ?? 'AUTO',
        date: _selectedDate,
        description: _descriptionController.text.trim(),
        refCode: _refCodeController.text.trim().isEmpty ? null : _refCodeController.text.trim(),
        status: VoucherStatus.draft,
        createdBy: 'CURRENT_USER',
        createdAt: widget.voucher?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
        totalDebit: _lines.fold<double>(0.0, (sum, line) => sum + line.debit),
        totalCredit: _lines.fold<double>(0.0, (sum, line) => sum + line.credit),
        isReversing: _isReversing,
        isPeriodic: _isPeriodic,
        lines: _lines,
      );
      
      widget.onSaved(voucher);
    }
  }

  void _postVoucher() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(Translations.of(context).voucherPostedSuccessfully),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
