import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/company_info_providers.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/geographical_data_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class CompanyInfoScreen extends ConsumerStatefulWidget {
  const CompanyInfoScreen({super.key});

  @override
  ConsumerState<CompanyInfoScreen> createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends ConsumerState<CompanyInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  bool _isLoading = false;

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
  int _companyId = 1;

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

    // Initial load
    final initialData = ref.read(companyInfoProvider).asData?.value;
    if (initialData != null) {
      _updateControllers(initialData);
    }
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

  void _updateControllers(CompanyInfoEntity? info) {
    if (info != null) {
      _companyId = info.id;
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
    }
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

  Future<void> _onSave() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final l10n = AppLocalizations.of(context)!;
      try {
        final newInfo = CompanyInfoEntity(
          id: _companyId,
          companyCode: _companyCodeController.text,
          nameAr: _nameArController.text,
          nameEn: _nameEnController.text,
          address: _addressController.text,
          phone: _phoneController.text,
          email: _emailController.text,
          taxNumber: _taxController.text,
          commercialRegNo: _regController.text,
          remarks: _remarksController.text,
          isMainCompany: _isMainCompany,
          logo: _logo,
          countryId: _countryId?.toString(),
        );
        await ref.read(companyInfoProvider.notifier).saveCompanyInfo(newInfo);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.saveSuccess), backgroundColor: Colors.green),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${l10n.saveFailed}: ${e.toString()}'), backgroundColor: Theme.of(context).colorScheme.error),
          );
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final companyInfoAsync = ref.watch(companyInfoProvider);
    final allCountriesAsync = ref.watch(countriesProvider(0)); // Dummy parent ID to get all countries

    ref.listen<AsyncValue<CompanyInfoEntity?>>(companyInfoProvider, (_, state) {
      state.whenData((info) => _updateControllers(info));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.companyInfo),
      ),
      body: companyInfoAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Error: $err')),
        data: (info) => Form(
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
                onPressed: _isLoading ? null : _onSave,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading ? const CircularProgressIndicator() : Text(l10n.save),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
