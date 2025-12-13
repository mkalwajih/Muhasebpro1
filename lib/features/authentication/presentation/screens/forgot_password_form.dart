import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

class ForgotPasswordForm extends ConsumerStatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  ConsumerState<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends ConsumerState<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final username = _usernameController.text.trim();
    final newPassword = _newPasswordController.text;
    final state = ref.read(resetPasswordNotifierProvider);
    final success = await ref.read(resetPasswordNotifierProvider.notifier).reset(username, newPassword);

    final loc = AppLocalizations.of(context)!;

    if (success) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.saveSuccess)));
        context.go('/login');
      }
    } else {
      final err = state.error ?? loc.saveFailed;
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(resetPasswordNotifierProvider);

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
                      validator: (v) => v == null || v.isEmpty ? loc.usernameRequired : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _newPasswordController,
                      obscureText: _obscure,
                      decoration: InputDecoration(labelText: loc.password),
                      validator: (v) {
                        if (v == null || v.isEmpty) return loc.passwordRequired;
                        if (v.length < 6) return loc.passwordLengthError;
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscure,
                      decoration: InputDecoration(labelText: loc.confirmPassword),
                      validator: (v) {
                        if (v == null || v.isEmpty) return loc.passwordRequired;
                        if (v != _newPasswordController.text) return loc.passwordMismatch;
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(onPressed: state.isLoading ? null : _submit, child: state.isLoading ? const CircularProgressIndicator() : Text(loc.save)),
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
