import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _fullNameArController = TextEditingController();
  final _fullNameEnController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _fullNameArController.dispose();
    _fullNameEnController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final loc = AppLocalizations.of(context)!;
    final username = _usernameController.text.trim();
    final fullNameAr = _fullNameArController.text.trim();
    final fullNameEn = _fullNameEnController.text.trim();
    final password = _passwordController.text;

    final user = UserEntity(
      userId: 0,
      username: username,
      fullNameAr: fullNameAr,
      fullNameEn: fullNameEn,
      isActive: true,
    );

    final created = await ref.read(registerNotifierProvider.notifier).register(user, password);

    final state = ref.read(registerNotifierProvider);

    if (created != null) {
      ref.read(authStateProvider.notifier).state = created;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.saveSuccess)));
        context.go('/dashboard');
      }
    } else {
      final error = state.error ?? loc.saveFailed;
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(registerNotifierProvider);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: loc.username),
                      validator: (v) => (v == null || v.isEmpty) ? loc.usernameRequired : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _fullNameArController,
                      decoration: InputDecoration(labelText: loc.fullNameAr),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _fullNameEnController,
                      decoration: InputDecoration(labelText: loc.fullNameEn),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: loc.password),
                      obscureText: _obscure,
                      validator: (v) {
                        if (v == null || v.isEmpty) return loc.passwordRequired;
                        if (v.length < 6) return loc.passwordLengthError;
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(labelText: loc.confirmPassword),
                      obscureText: _obscure,
                      validator: (v) {
                        if (v == null || v.isEmpty) return loc.passwordRequired;
                        if (v != _passwordController.text) return loc.passwordMismatch;
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: state.isLoading ? null : _submit,
                      child: state.isLoading ? const CircularProgressIndicator() : Text(loc.addNewUser),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
