import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/presentation/widgets/custom_text_field.dart';
import '../../../domain/entities/transaction_request_entity.dart';
import '../../providers/transaction_request_providers.dart';

class TransactionRequestForm extends ConsumerStatefulWidget {
  final TransactionRequestEntity? request;

  const TransactionRequestForm({
    super.key,
    this.request,
  });

  @override
  ConsumerState<TransactionRequestForm> createState() => _TransactionRequestFormState();
}

class _TransactionRequestFormState extends ConsumerState<TransactionRequestForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();

  TransactionRequestType _selectedType = TransactionRequestType.journalVoucher;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.request != null) {
      _initializeForm();
    }
  }

  void _initializeForm() {
    final request = widget.request!;
    _selectedType = request.type;
    _descriptionController.text = request.description;
    _amountController.text = request.totalAmount.toString();
    _notesController.text = request.notes ?? '';
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.request == null ? l10n.createRequest : l10n.editRequest),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<TransactionRequestType>(
                initialValue: _selectedType,
                decoration: InputDecoration(
                  labelText: l10n.requestType,
                  border: const OutlineInputBorder(),
                ),
                items: TransactionRequestType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(_getTypeDisplayName(context, type)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedType = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _descriptionController,
                labelText: l10n.description,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.pleaseEnterDescription;
                  }
                  return null;
                },
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _amountController,
                labelText: l10n.amount,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.pleaseEnterAmount;
                  }
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) {
                    return l10n.pleaseEnterValidAmount;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _notesController,
                labelText: l10n.notes,
                maxLines: 2,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
                      child: Text(l10n.cancel),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _saveRequest,
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(widget.request == null ? l10n.create : l10n.save), // Changed update to save if update is missing, or add update to arb
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveRequest() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final amount = double.parse(_amountController.text);
      
      if (widget.request == null) {
        // Create new request
        await ref.read(createTransactionRequestUseCaseProvider).call(
          type: _selectedType,
          requesterId: 'current_user', // In real app, get from auth
          requesterName: 'Current User', // In real app, get from auth
          description: _descriptionController.text.trim(),
          totalAmount: amount,
          requestData: {
            'type': _selectedType.toString(),
            'description': _descriptionController.text.trim(),
            'amount': amount,
          },
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        );
      } else {
        // Update existing request
        final updatedRequest = widget.request!.copyWith(
          type: _selectedType,
          description: _descriptionController.text.trim(),
          totalAmount: amount,
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
          updatedAt: DateTime.now(),
        );
        
        await ref.read(transactionRequestRepositoryProvider).updateRequest(updatedRequest);
      }

      // Refresh the list
      ref.invalidate(transactionRequestsProvider);

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.request == null 
                ? Translations.of(context).requestCreatedSuccessfully
                : Translations.of(context).requestUpdatedSuccessfully),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${Translations.of(context).error}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String _getTypeDisplayName(BuildContext context, TransactionRequestType type) {
    final l10n = Translations.of(context);
    switch (type) {
      case TransactionRequestType.journalVoucher:
        return l10n.journalVoucher;
      case TransactionRequestType.paymentVoucher:
        return l10n.paymentVoucher;
      case TransactionRequestType.receiptVoucher:
        return l10n.receiptVoucher;
      case TransactionRequestType.adjustmentEntry:
        return l10n.adjustmentEntry;
    }
  }
}