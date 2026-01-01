import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../shared/presentation/widgets/custom_text_field.dart';
import '../../../system_setup/domain/entities/account_entity.dart';
import '../../domain/entities/description_coding_entity.dart';
import 'account_selector_dialog.dart';

class DescriptionCodingFormDialog extends ConsumerStatefulWidget {
  final DescriptionCodingEntity? descriptionCoding;
  final Function(DescriptionCodingEntity) onSave;

  const DescriptionCodingFormDialog({
    super.key,
    this.descriptionCoding,
    required this.onSave,
  });

  @override
  ConsumerState<DescriptionCodingFormDialog> createState() => _DescriptionCodingFormDialogState();
}

class _DescriptionCodingFormDialogState extends ConsumerState<DescriptionCodingFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _descCodeController = TextEditingController();
  final _descriptionArController = TextEditingController();
  final _descriptionEnController = TextEditingController();
  final _linkedAccountController = TextEditingController();
  AccountEntity? _selectedAccount;

  @override
  void initState() {
    super.initState();
    if (widget.descriptionCoding != null) {
      _descCodeController.text = widget.descriptionCoding!.descCode;
      _descriptionArController.text = widget.descriptionCoding!.descriptionAr;
      _descriptionEnController.text = widget.descriptionCoding!.descriptionEn;
      if (widget.descriptionCoding!.linkedAccountId != null) {
        _linkedAccountController.text = 'Account ID: ${widget.descriptionCoding!.linkedAccountId}';
        // TODO: Fetch actual account details to display proper name
      }
    }
  }

  @override
  void dispose() {
    _descCodeController.dispose();
    _descriptionArController.dispose();
    _descriptionEnController.dispose();
    _linkedAccountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);
    final isEditing = widget.descriptionCoding != null;

    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                isEditing ? l10n.editDescriptionCoding : l10n.addDescriptionCoding,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // Description Code
              CustomTextField(
                controller: _descCodeController,
                labelText: l10n.descCode,
                enabled: !isEditing, // Code cannot be changed when editing
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.descriptionCodeRequired;
                  }
                  if (value.trim().length > 10) {
                    return l10n.descriptionCodeTooLong;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Arabic Description
              CustomTextField(
                controller: _descriptionArController,
                labelText: l10n.descriptionArabic,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.descriptionArabicRequired;
                  }
                  if (value.trim().length > 250) {
                    return l10n.descriptionArabicTooLong;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // English Description
              CustomTextField(
                controller: _descriptionEnController,
                labelText: l10n.descriptionEnglish,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.descriptionEnglishRequired;
                  }
                  if (value.trim().length > 250) {
                    return l10n.descriptionEnglishTooLong;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Linked Account (Optional)
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _linkedAccountController,
                      labelText: l10n.linkedAccount,
                      hintText: l10n.selectAccount,
                      readOnly: true,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: _selectAccount,
                      ),
                    ),
                  ),
                  if (_linkedAccountController.text.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _linkedAccountController.clear();
                          _selectedAccount = null;
                        });
                      },
                      tooltip: l10n.clear,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 24),

              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.cancel),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _saveDescriptionCoding,
                    child: Text(l10n.save),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectAccount() {
    showDialog(
      context: context,
      builder: (context) => AccountSelectorDialog(
        selectedAccountId: _selectedAccount?.id.toString(),
        onAccountSelected: (account) {
          setState(() {
            _selectedAccount = account;
            _linkedAccountController.text = 
                '${account.accountCode} - ${account.getLocalizedName(Localizations.localeOf(context).languageCode)}';
          });
        },
      ),
    );
  }

  void _saveDescriptionCoding() {
    if (_formKey.currentState!.validate()) {
      final descriptionCoding = DescriptionCodingEntity(
        descCode: _descCodeController.text.trim(),
        descriptionAr: _descriptionArController.text.trim(),
        descriptionEn: _descriptionEnController.text.trim(),
        linkedAccountId: _selectedAccount?.id.toString(),
        createdAt: widget.descriptionCoding?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      widget.onSave(descriptionCoding);
    }
  }
}