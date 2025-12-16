import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';

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
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _fullNameArController.dispose();
    _fullNameEnController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final loc = AppLocalizations.of(context)!;

    final success = await ref.read(registerNotifierProvider.notifier).register(
          UserEntity(
            userId: 0,
            username: _usernameController.text.trim(),
            fullNameAr: _fullNameArController.text.trim(),
            fullNameEn: _fullNameEnController.text.trim(),
            isActive: true,
          ),
          _passwordController.text,
        );

    if (success != null) {
      if (mounted) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text(loc.registrationSuccess)),
          );
        context.go('/'); // Redirect to login page
      }
    } else {
      final error = ref.read(registerNotifierProvider).error;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error ?? loc.error)),
        );
      }
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
          constraints: const BoxConstraints(maxWidth: 450),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      key: const Key('username_field'),
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: loc.username,
                        hintText: loc.username,
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return loc.usernameRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      key: const Key('full_name_ar_field'),
                      controller: _fullNameArController,
                      decoration: InputDecoration(
                        labelText: loc.fullNameAr,
                        hintText: loc.fullNameAr,
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return loc.fullNameArRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
      key: const Key('full_name_en_field'),
                      controller: _fullNameEnController,
                      decoration: InputDecoration(
                        labelText: loc.fullNameEn,
                        hintText: loc.fullNameEn,
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return loc.fullNameEnRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      key: const Key('password_field'),
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: loc.password,
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submit(),
                      validator: (value) {
                        if (value == null || value.isEmpty) return loc.passwordRequired;
                        if (value.length < 6) return loc.passwordLengthError;
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.isLoading ? null : _submit,
                        child: state.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text(loc.addNewUser),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => context.go('/'),
                      child: Text(loc.alreadyHaveAccount),
                    ),
                    if (state.error != null) ...[
                      const SizedBox(height: 12),
                      Text(state.error!, style: const TextStyle(color: Colors.red)),
                    ]
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
