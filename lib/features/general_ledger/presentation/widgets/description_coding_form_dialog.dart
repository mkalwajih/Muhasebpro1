import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/presentation/widgets/custom_text_field.dart';
import '../../domain/entities/description_coding_entity.dart';

class DescriptionCodingFormDialog extends StatefulWidget {
  final DescriptionCodingEntity? descriptionCoding;
  final Function(DescriptionCodingEntity) onSave;

  const DescriptionCodingFormDialog({
    super.key,
    this.descriptionCoding,
    required this.onSave,
  });

  @override
  State<DescriptionCodingFormDialog> createState() => _DescriptionCodingFormDialogState();
}

class _DescriptionCodingFormDialogState extends State<DescriptionCodingFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _descCodeController = TextEditingController();
  final _descriptionArController = TextEditingController();
  final _descriptionEnController = TextEditingController();
  final _linkedAccountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.descriptionCoding != null) {
      _descCodeController.text = widget.descriptionCoding!.descCode;
      _descriptionArController.text = widget.descriptionCoding!.descriptionAr;
      _descriptionEnController.text = widget.descriptionCoding!.descriptionEn;
      _linkedAccountController.text = widget.descriptionCoding!.linkedAccountId ?? '';
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
    final l10n = AppLocalizations.of(context)!;
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
    // TODO: Implement account selection dialog
    // For now, show a placeholder message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.selectAccount),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _saveDescriptionCoding() {
    if (_formKey.currentState!.validate()) {
      final descriptionCoding = DescriptionCodingEntity(
        descCode: _descCodeController.text.trim(),
        descriptionAr: _descriptionArController.text.trim(),
        descriptionEn: _descriptionEnController.text.trim(),
        linkedAccountId: _linkedAccountController.text.trim().isEmpty 
            ? null 
            : _linkedAccountController.text.trim(),
        createdAt: widget.descriptionCoding?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      widget.onSave(descriptionCoding);
    }
  }
}