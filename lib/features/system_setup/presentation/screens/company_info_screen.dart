import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/system_setup/domain/entities/company_info_entity.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/providers/company_info_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class CompanyInfoScreen extends ConsumerStatefulWidget {
  const CompanyInfoScreen({super.key});

  @override
  ConsumerState<CompanyInfoScreen> createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends ConsumerState<CompanyInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Controllers for the new entity structure
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
  // Placeholder for logo and country
  Uint8List? _logo;
  String? _countryId;
  int _companyId = 1; // Defaulting to 1 for now as per old logic

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
        _countryId = info.countryId;
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
          countryId: _countryId,
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
              // TODO: Add logo picker widget
              TextFormField(
                controller: _companyCodeController,
                decoration: InputDecoration(labelText: 'Company Code'), // Add to l10n
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameArController,
                decoration: InputDecoration(labelText: l10n.companyNameAr),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameEnController,
                decoration: InputDecoration(labelText: l10n.companyNameEn),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
               const SizedBox(height: 16),
              // TODO: Add country dropdown
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'), // Add to l10n
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
                controller: _taxController,
                decoration: InputDecoration(labelText: l10n.taxNumber),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _regController,
                decoration: InputDecoration(labelText: l10n.commercialRegNo),
              ),
              const SizedBox(height: 16),
               TextFormField(
                controller: _remarksController,
                decoration: InputDecoration(labelText: 'Remarks'), // Add to l10n
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: Text('Is Main Company'), // Add to l10n
                value: _isMainCompany,
                onChanged: (bool? value) {
                  setState(() {
                    _isMainCompany = value ?? false;
                  });
                },
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
