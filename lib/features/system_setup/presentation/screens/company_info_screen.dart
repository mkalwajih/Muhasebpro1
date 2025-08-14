import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_entity.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/company_info_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/geographical_data_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/shared/domain/entities/failures.dart';

class CompanyInfoScreen extends ConsumerStatefulWidget {
  const CompanyInfoScreen({super.key});

  @override
  ConsumerState<CompanyInfoScreen> createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends ConsumerState<CompanyInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  bool _isLoading = false;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Listen to companies list and select the first one if none is selected
    ref.listen<AsyncValue<List<CompanyEntity>>>(companiesProvider, (previous, next) {
      next.whenData((companies) {
        if (companies.isNotEmpty && _selectedCompany == null) {
          _selectCompany(companies.first);
        } else if (companies.isEmpty) {
          _clearForm();
          setState(() => _selectedCompany = null);
        } else if (_selectedCompany != null) {
          // Update selected company if it changed in the list (e.g., after save)
          final updatedCompany = companies.firstWhere(
            (c) => c.id == _selectedCompany!.id,
            orElse: () => companies.first, // Fallback if selected company was deleted
          );
          if (updatedCompany != _selectedCompany) {
            _selectCompany(updatedCompany);
          }
        }
      });
    });
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
        logo: null, // Logo not in CompanyEntity, will fetch or set separately
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
        _logo = info.logo;
        _countryId = int.tryParse(info.countryId ?? '');
      });
    } else {
      _clearForm();
    }
  }

  void _clearForm() {
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
      _isMainCompany = false;
      _logo = null;
      _countryId = null;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxWidth: 512);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _logo = bytes;
      });
    }
  }

  Future<void> _onSave(AppLocalizations l10n) async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        final companyToSave = CompanyInfoEntity(
          id: _selectedCompany?.id ?? 0, // Use 0 for new company, actual ID for existing
          companyCode: _companyCodeController.text,
          nameAr: _nameArController.text,
          nameEn: _nameEnController.text,
          countryId: _countryId?.toString(),
          taxNumber: _taxController.text,
          commercialRegNo: _regController.text,
          address: _addressController.text,
          phone: _phoneController.text,
          email: _emailController.text,
          logo: _logo,
          isMainCompany: _isMainCompany,
          remarks: _remarksController.text,
        );

        if (_selectedCompany == null || _selectedCompany!.id == 0) {
          // Add new company
          await ref.read(companiesProvider.notifier).addCompany(companyToSave).then((result) {
            result.fold(
              (failure) => _showErrorSnackbar(l10n, failure.message ?? l10n.saveFailed),
              (_) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.saveSuccess), backgroundColor: Colors.green)),
            );
          });
        } else {
          // Update existing company
          await ref.read(companiesProvider.notifier).updateCompany(companyToSave).then((result) {
            result.fold(
              (failure) => _showErrorSnackbar(l10n, failure.message ?? l10n.saveFailed),
              (_) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.saveSuccess), backgroundColor: Colors.green)),
            );
          });
        }
      } catch (e) {
        _showErrorSnackbar(l10n, '${l10n.saveFailed}: ${e.toString()}');
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _onDelete(AppLocalizations l10n, CompanyEntity company) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmDeletion),
        content: Text(l10n.confirmDeleteMessage),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => _isLoading = true);
      try {
        await ref.read(companiesProvider.notifier).deleteCompany(company.id!).then((result) {
          result.fold(
            (failure) => _showErrorSnackbar(l10n, failure.message ?? l10n.deleteFailed),
            (_) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${company.nameEn} ${l10n.delete} ${l10n.saveSuccess}'), backgroundColor: Colors.green));
              _clearForm();
            },
          );
        });
      } catch (e) {
        _showErrorSnackbar(l10n, '${l10n.deleteFailed}: ${e.toString()}');
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  void _showErrorSnackbar(AppLocalizations l10n, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Theme.of(context).colorScheme.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final companiesAsync = ref.watch(companiesProvider);
    final allCountriesAsync = ref.watch(countriesProvider(0)); // Dummy parent ID to get all countries

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.companyInfo),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_business),
            tooltip: l10n.addNewCompany, // New localization key needed
            onPressed: () => setState(() {
              _selectedCompany = null; // Clear selection to add new
              _clearForm();
            }),
          ),
          if (_selectedCompany != null && _selectedCompany!.id != 0) // Only show delete for existing companies
            IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
              tooltip: l10n.delete, // Re-use existing localization key
              onPressed: _isLoading ? null : () => _onDelete(l10n, _selectedCompany! as CompanyEntity),
            ),
        ],
      ),
      body: Row(
        children: [
          // Left Panel: List of Companies
          Expanded(
            flex: 1,
            child: companiesAsync.when(
              data: (companies) {
                if (companies.isEmpty) {
                  return Center(child: Text(l10n.noCompaniesYet)); // New localization key needed
                }
                return ListView.builder(
                  itemCount: companies.length,
                  itemBuilder: (context, index) {
                    final company = companies[index];
                    final isSelected = _selectedCompany?.id == company.id;
                    return ListTile(
                      title: Text(l10n.localeName == 'ar' ? company.nameAr : company.nameEn),
                      subtitle: Text(company.companyCode),
                      selected: isSelected,
                      leading: company.isMainCompany ? const Icon(Icons.star, color: Colors.amber) : null,
                      onTap: () => _selectCompany(company),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Error loading companies: $err')),
            ),
          ),
          const VerticalDivider(width: 1),
          // Right Panel: Company Details Form
          Expanded(
            flex: 2,
            child: _selectedCompany == null && companiesAsync.asData?.value.isNotEmpty == true
                ? Center(child: Text(l10n.selectCompanyPrompt)) // New localization key needed
                : Form(
                    key: _formKey,
                    child: ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                              backgroundImage: _logo != null ? MemoryImage(_logo!) : null,
                              child: _logo == null ? const Icon(Iconsax.building, size: 40) : null,
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton.icon(
                              onPressed: _pickImage,
                              icon: const Icon(Iconsax.image),
                              label: Text(l10n.uploadLogo),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _companyCodeController,
                          decoration: InputDecoration(labelText: l10n.companyCode),
                          validator: (val) => val!.isEmpty ? l10n.requiredField : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _nameArController,
                          decoration: InputDecoration(labelText: l10n.companyNameAr),
                          validator: (val) => val!.isEmpty ? l10n.requiredField : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _nameEnController,
                          decoration: InputDecoration(labelText: l10n.companyNameEn),
                          validator: (val) => val!.isEmpty ? l10n.requiredField : null,
                        ),
                        const SizedBox(height: 16),
                        allCountriesAsync.when(
                          data: (countries) => DropdownButtonFormField<int>(
                            value: _countryId,
                            decoration: InputDecoration(labelText: l10n.country),
                            items: countries.map((country) => DropdownMenuItem(
                              value: country.id,
                              child: Text(l10n.localeName == 'ar' ? country.nameAr : country.nameEn),
                            )).toList(),
                            onChanged: (value) => setState(() => _countryId = value),
                            validator: (value) => value == null ? l10n.requiredField : null,
                          ),
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (e, st) => Text('Could not load countries: $e'),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _taxController,
                          decoration: InputDecoration(labelText: l10n.taxNumber),
                          validator: (value) {
                            if (value == null || value.isEmpty) return l10n.requiredField;
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _regController,
                          decoration: InputDecoration(labelText: l10n.commercialRegNo),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(labelText: l10n.address),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(labelText: l10n.phone),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: l10n.email),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _remarksController,
                          decoration: InputDecoration(labelText: l10n.remarks),
                        ),
                        const SizedBox(height: 16),
                        CheckboxListTile(
                          title: Text(l10n.mainCompany),
                          value: _isMainCompany,
                          onChanged: (bool? value) => setState(() => _isMainCompany = value ?? false),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: _isLoading ? null : () => _onSave(l10n),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: _isLoading ? const CircularProgressIndicator() : Text(l10n.save),
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
