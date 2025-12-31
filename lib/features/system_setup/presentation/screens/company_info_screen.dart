import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/company_info_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/geographical_data_providers.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';

class CompanyInfoScreen extends ConsumerStatefulWidget {
  const CompanyInfoScreen({super.key});

  @override
  ConsumerState<CompanyInfoScreen> createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends ConsumerState<CompanyInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  bool _isLoading = false;

  // Selected company for editing (null means creating new)
  CompanyInfoEntity? _selectedCompany;

  late final TextEditingController _companyCodeController;
  late final TextEditingController _nameArController;
  late final TextEditingController _nameEnController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _taxController;
  late final TextEditingController _regController;
  late final TextEditingController _remarksController;
  
  bool _isMainCompany = false;
  Uint8List? _logo;
  int? _countryId; 

  @override
  void initState() {
    super.initState();
    _companyCodeController = TextEditingController();
    _nameArController = TextEditingController();
    _nameEnController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _taxController = TextEditingController();
    _regController = TextEditingController();
    _remarksController = TextEditingController();
  }

  @override
  void dispose() {
    _companyCodeController.dispose();
    _nameArController.dispose();
    _nameEnController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _taxController.dispose();
    _regController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  // Select a company from the list to populate the form
  void _selectCompany(CompanyEntity company) {
    setState(() {
      _selectedCompany = CompanyInfoEntity(
        id: company.id,
        companyCode: company.companyCode,
        nameAr: company.nameAr,
        nameEn: company.nameEn,
        countryId: company.countryId,
        taxNumber: company.taxNumber,
        commercialRegNo: company.commercialRegNo,
        address: company.address,
        phone: company.phone,
        email: company.email,
        logo: null, // Logo not in CompanyEntity listing, usually fetched separately if heavy
        isMainCompany: company.isMainCompany,
        remarks: company.remarks,
      );
      _updateControllers(_selectedCompany);
    });
  }

  void _updateControllers(CompanyInfoEntity? info) {
    if (info != null) {
      _companyCodeController.text = info.companyCode;
      _nameArController.text = info.nameAr;
      _nameEnController.text = info.nameEn;
      _addressController.text = info.address ?? '';
      _phoneController.text = info.phone ?? '';
      _emailController.text = info.email ?? '';
      _taxController.text = info.taxNumber ?? '';
      _regController.text = info.commercialRegNo ?? '';
      _remarksController.text = info.remarks ?? '';
      setState(() {
        _isMainCompany = info.isMainCompany;
        // In a real scenario, you might fetch the logo by ID here if it wasn't loaded in the list
        _logo = info.logo;
        _countryId = int.tryParse(info.countryId ?? '');
      });
    } else {
      _clearForm();
    }
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    _companyCodeController.clear();
    _nameArController.clear();
    _nameEnController.clear();
    _addressController.clear();
    _phoneController.clear();
    _emailController.clear();
    _taxController.clear();
    _regController.clear();
    _remarksController.clear();
    setState(() {
      _selectedCompany = null; // Clear selection to indicate creation mode
      _isMainCompany = false;
      _logo = null;
      _countryId = null;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, 
      imageQuality: 50, 
      maxWidth: 512
    );
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _logo = bytes;
      });
    }
  }

  Future<void> _onSave() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final t = Translations.of(context);
      try {
        final companyToSave = CompanyInfoEntity(
          id: _selectedCompany?.id ?? 0, // 0 for new
          companyCode: _companyCodeController.text.trim(),
          nameAr: _nameArController.text.trim(),
          nameEn: _nameEnController.text.trim(),
          countryId: _countryId?.toString(),
          taxNumber: _taxController.text.trim(),
          commercialRegNo: _regController.text.trim(),
          address: _addressController.text.trim(),
          phone: _phoneController.text.trim(),
          email: _emailController.text.trim(),
          logo: _logo,
          isMainCompany: _isMainCompany,
          remarks: _remarksController.text.trim(),
        );

        if (_selectedCompany == null || _selectedCompany!.id == 0) {
          // Add new company
          final result = await ref.read(companiesProvider.notifier).addCompany(companyToSave);
          result.fold(
            (failure) => _showErrorSnackbar(failure.properties.first.toString()),
            (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(t.common.saveSuccess), backgroundColor: Colors.green)
              );
              _clearForm();
            },
          );
        } else {
          // Update existing company
          final result = await ref.read(companiesProvider.notifier).updateCompany(companyToSave);
          result.fold(
            (failure) => _showErrorSnackbar(failure.properties.first.toString()),
            (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(t.common.saveSuccess), backgroundColor: Colors.green)
              );
            }
          );
        }
      } catch (e) {
        _showErrorSnackbar('${t.common.saveFailed}: $e');
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _onDelete(CompanyInfoEntity company) async {
    final t = Translations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.common.confirmDeletion),
        content: Text(t.common.confirmDeleteMessage),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(t.common.cancel)),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
            child: Text(t.common.delete),
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => _isLoading = true);
      try {
        final result = await ref.read(companiesProvider.notifier).deleteCompany(company.id);
        result.fold(
          (failure) => _showErrorSnackbar(failure.properties.first.toString()),
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(t.common.deleteSuccess), backgroundColor: Colors.green)
            );
            _clearForm();
          },
        );
      } catch (e) {
        _showErrorSnackbar('${t.common.deleteFailed}: $e');
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  void _showErrorSnackbar(String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Theme.of(context).colorScheme.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final companiesAsync = ref.watch(companiesProvider);
    final allCountriesAsync = ref.watch(allCountriesProvider); 
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.setup.company.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_business),
            tooltip: t.setup.company.addNew,
            onPressed: () => _clearForm(),
          ),
          if (_selectedCompany != null && _selectedCompany!.id != 0) 
            IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
              tooltip: t.common.delete, 
              onPressed: _isLoading ? null : () => _onDelete(_selectedCompany!),
            ),
        ],
      ),
      body: Row(
        children: [
          // Left Panel: List of Companies (Master)
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: isRtl ? BorderSide.none : BorderSide(color: Theme.of(context).dividerColor),
                  left: isRtl ? BorderSide(color: Theme.of(context).dividerColor) : BorderSide.none,
                )
              ),
              child: companiesAsync.when(
                data: (companies) {
                  if (companies.isEmpty) {
                    return Center(child: Text(t.setup.company.empty, textAlign: TextAlign.center));
                  }
                  return ListView.separated(
                    itemCount: companies.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final company = companies[index];
                      final isSelected = _selectedCompany?.id == company.id;
                      return ListTile(
                        selected: isSelected,
                        selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
                        title: Text(
                          isRtl ? company.nameAr : company.nameEn,
                          style: const TextStyle(fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text(company.companyCode),
                        leading: CircleAvatar(
                           backgroundColor: isSelected 
                              ? Theme.of(context).colorScheme.primary 
                              : Theme.of(context).colorScheme.surfaceContainerHighest,
                           child: Icon(
                             company.isMainCompany ? Icons.star : Icons.business,
                             color: isSelected ? Colors.white : null,
                             size: 20
                           ),
                        ),
                        onTap: () => _selectCompany(company),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, st) => Center(child: Text('Error: $err')),
              ),
            ),
          ),
          
          // Right Panel: Form (Detail)
          Expanded(
            flex: 2,
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(24.0),
                children: [
                  // Header Title
                  Text(
                    _selectedCompany == null ? t.setup.company.addNew : '${t.common.edit}: ${_selectedCompany!.companyCode}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 24),

                  // Logo and Main Info Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Theme.of(context).dividerColor),
                              image: _logo != null 
                                ? DecorationImage(image: MemoryImage(_logo!), fit: BoxFit.cover)
                                : null,
                            ),
                            child: _logo == null 
                              ? const Icon(Iconsax.image, size: 40, color: Colors.grey)
                              : null,
                          ),
                          const SizedBox(height: 8),
                          TextButton.icon(
                            onPressed: _pickImage,
                            icon: const Icon(Icons.upload, size: 16),
                            label: Text(t.setup.company.uploadLogo),
                          ),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _companyCodeController,
                              decoration: InputDecoration(
                                labelText: t.setup.company.code,
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(Icons.code),
                              ),
                              validator: (val) => val!.isEmpty ? t.common.requiredField : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _nameEnController,
                              decoration: InputDecoration(
                                labelText: t.setup.company.nameEn,
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(Icons.language),
                              ),
                              validator: (val) => val!.isEmpty ? t.common.requiredField : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Arabic Name
                  TextFormField(
                    controller: _nameArController,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      labelText: t.setup.company.nameAr,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.translate),
                    ),
                    validator: (val) => val!.isEmpty ? t.common.requiredField : null,
                  ),
                  const SizedBox(height: 16),

                  // Country & Tax ID Row
                  Row(
                    children: [
                      Expanded(
                        child: allCountriesAsync.when(
                          data: (countries) => DropdownButtonFormField<int>(
                            value: _countryId,
                            decoration: InputDecoration(
                              labelText: t.setup.geo.country,
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.flag),
                            ),
                            items: countries.map((country) => DropdownMenuItem(
                              value: country.id,
                              child: Text(isRtl ? country.nameAr : country.nameEn),
                            )).toList(),
                            onChanged: (value) => setState(() => _countryId = value),
                            validator: (value) => value == null ? t.common.requiredField : null,
                          ),
                          loading: () => const LinearProgressIndicator(),
                          error: (e, st) => Text('${t.common.error}: $e'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _taxController,
                          decoration: InputDecoration(
                            labelText: t.setup.company.taxNumber,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.numbers),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) return t.common.requiredField;
                            // Basic Regex for generic Tax ID (example: 10-15 digits)
                            if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                               return t.common.invalidFormat;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Reg No & Phone Row
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _regController,
                          decoration: InputDecoration(
                            labelText: t.setup.company.commercialReg,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.app_registration),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: t.common.phone,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.phone),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Email & Address
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: t.common.email,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.email),
                    ),
                    validator: (val) {
                      if (val != null && val.isNotEmpty) {
                        if (!val.contains('@')) return t.common.invalidEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _addressController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: t.common.address,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _remarksController,
                    decoration: InputDecoration(
                      labelText: t.common.remarks,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.note),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Flags
                  SwitchListTile(
                    title: Text(t.setup.company.mainCompany),
                    subtitle: Text(t.setup.company.mainCompanyHint),
                    value: _isMainCompany,
                    onChanged: (bool value) => setState(() => _isMainCompany = value),
                    secondary: const Icon(Icons.star),
                    contentPadding: EdgeInsets.zero,
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Save Button
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _onSave,
                      icon: _isLoading 
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.save),
                      label: Text(t.common.save),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
