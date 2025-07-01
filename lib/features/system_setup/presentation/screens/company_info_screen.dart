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

  late final TextEditingController _nameArController;
  late final TextEditingController _nameEnController;
  late final TextEditingController _addressArController;
  late final TextEditingController _addressEnController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _websiteController;
  late final TextEditingController _taxController;
  late final TextEditingController _regController;

  @override
  void initState() {
    super.initState();
    _nameArController = TextEditingController();
    _nameEnController = TextEditingController();
    _addressArController = TextEditingController();
    _addressEnController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _websiteController = TextEditingController();
    _taxController = TextEditingController();
    _regController = TextEditingController();
  }

  @override
  void dispose() {
    _nameArController.dispose();
    _nameEnController.dispose();
    _addressArController.dispose();
    _addressEnController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _websiteController.dispose();
    _taxController.dispose();
    _regController.dispose();
    super.dispose();
  }

  void _updateControllers(CompanyInfoEntity? info) {
      _nameArController.text = info?.nameAr ?? '';
      _nameEnController.text = info?.nameEn ?? '';
      _addressArController.text = info?.addressAr ?? '';
      _addressEnController.text = info?.addressEn ?? '';
      _phoneController.text = info?.phone ?? '';
      _emailController.text = info?.email ?? '';
      _websiteController.text = info?.website ?? '';
      _taxController.text = info?.taxNumber ?? '';
      _regController.text = info?.commercialRegNo ?? '';
  }

  Future<void> _onSave() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final l10n = AppLocalizations.of(context)!;
      try {
        final newInfo = CompanyInfoEntity(
          nameAr: _nameArController.text,
          nameEn: _nameEnController.text,
          addressAr: _addressArController.text,
          addressEn: _addressEnController.text,
          phone: _phoneController.text,
          email: _emailController.text,
          website: _websiteController.text,
          taxNumber: _taxController.text,
          commercialRegNo: _regController.text,
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
            SnackBar(content: Text(l10n.saveFailed), backgroundColor: Theme.of(context).colorScheme.error),
          );
        }
      } finally {
        if(mounted) setState(() => _isLoading = false);
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
              TextFormField(
                controller: _addressArController,
                decoration: InputDecoration(labelText: l10n.addressAr),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressEnController,
                decoration: InputDecoration(labelText: l10n.addressEn),
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
                controller: _websiteController,
                decoration: InputDecoration(labelText: l10n.website),
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
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isLoading ? null : _onSave,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : Text(l10n.save),
              ),
            ],
          ),
        ),
      ),
    );
  }
}