import 'package:flutter/material.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import '../../../../shared/presentation/widgets/custom_text_field.dart';
import '../../domain/entities/document_type_entity.dart';

class DocumentTypeFormDialog extends StatefulWidget {
  final DocumentTypeEntity? documentType;
  final Function(DocumentTypeEntity) onSave;

  const DocumentTypeFormDialog({
    super.key,
    this.documentType,
    required this.onSave,
  });

  @override
  State<DocumentTypeFormDialog> createState() => _DocumentTypeFormDialogState();
}

class _DocumentTypeFormDialogState extends State<DocumentTypeFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _docTypeCodeController = TextEditingController();
  final _nameArController = TextEditingController();
  final _nameEnController = TextEditingController();
  
  SequenceMethod _sequenceMethod = SequenceMethod.general;
  SequenceBehavior _sequenceBehavior = SequenceBehavior.autoUnchangeable;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    if (widget.documentType != null) {
      _docTypeCodeController.text = widget.documentType!.docTypeCode;
      _nameArController.text = widget.documentType!.nameAr;
      _nameEnController.text = widget.documentType!.nameEn;
      _sequenceMethod = widget.documentType!.sequenceMethod;
      _sequenceBehavior = widget.documentType!.sequenceBehavior;
      _isActive = widget.documentType!.isActive;
    }
  }

  @override
  void dispose() {
    _docTypeCodeController.dispose();
    _nameArController.dispose();
    _nameEnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Translations.of(context);
    final theme = Theme.of(context);
    final isEditing = widget.documentType != null;

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
                isEditing ? l10n.editDocumentType : l10n.addDocumentType,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // Document Type Code
              CustomTextField(
                controller: _docTypeCodeController,
                labelText: l10n.docTypeCode,
                enabled: !isEditing, // Code cannot be changed when editing
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.documentTypeCodeRequired;
                  }
                  if (value.trim().length > 10) {
                    return l10n.documentTypeCodeTooLong;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Arabic Name
              CustomTextField(
                controller: _nameArController,
                labelText: l10n.nameArabic,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.nameArabicRequired;
                  }
                  if (value.trim().length > 50) {
                    return l10n.nameArabicTooLong;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // English Name
              CustomTextField(
                controller: _nameEnController,
                labelText: l10n.nameEnglish,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.nameEnglishRequired;
                  }
                  if (value.trim().length > 50) {
                    return l10n.nameEnglishTooLong;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Sequence Method
              DropdownButtonFormField<SequenceMethod>(
                initialValue: _sequenceMethod,
                decoration: InputDecoration(
                  labelText: l10n.sequenceMethod,
                  border: const OutlineInputBorder(),
                ),
                items: SequenceMethod.values.map((method) {
                  return DropdownMenuItem(
                    value: method,
                    child: Text(_getSequenceMethodText(l10n, method)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _sequenceMethod = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),

              // Sequence Behavior
              DropdownButtonFormField<SequenceBehavior>(
                initialValue: _sequenceBehavior,
                decoration: InputDecoration(
                  labelText: l10n.sequenceBehavior,
                  border: const OutlineInputBorder(),
                ),
                items: SequenceBehavior.values.map((behavior) {
                  return DropdownMenuItem(
                    value: behavior,
                    child: Text(_getSequenceBehaviorText(l10n, behavior)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _sequenceBehavior = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),

              // Active Switch
              SwitchListTile(
                title: Text(l10n.active),
                value: _isActive,
                onChanged: (value) {
                  setState(() {
                    _isActive = value;
                  });
                },
                contentPadding: EdgeInsets.zero,
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
                    onPressed: _saveDocumentType,
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

  void _saveDocumentType() {
    if (_formKey.currentState!.validate()) {
      final documentType = DocumentTypeEntity(
        docTypeCode: _docTypeCodeController.text.trim(),
        nameAr: _nameArController.text.trim(),
        nameEn: _nameEnController.text.trim(),
        sequenceMethod: _sequenceMethod,
        sequenceBehavior: _sequenceBehavior,
        isActive: _isActive,
        createdAt: widget.documentType?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      widget.onSave(documentType);
    }
  }

  String _getSequenceMethodText(Translations l10n, SequenceMethod method) {
    switch (method) {
      case SequenceMethod.general:
        return l10n.general;
      case SequenceMethod.specific:
        return l10n.specific;
    }
  }

  String _getSequenceBehaviorText(Translations l10n, SequenceBehavior behavior) {
    switch (behavior) {
      case SequenceBehavior.autoUnchangeable:
        return l10n.autoUnchangeable;
      case SequenceBehavior.autoChangeable:
        return l10n.autoChangeable;
      case SequenceBehavior.manual:
        return l10n.manual;
    }
  }
}