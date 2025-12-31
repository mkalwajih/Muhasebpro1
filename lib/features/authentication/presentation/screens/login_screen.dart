import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/l10n/translations.g.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitLogin() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    final result = await ref.read(loginNotifierProvider.notifier).login(
          _usernameController.text.trim(),
          _passwordController.text,
        );

    if (mounted && result != null) {
      ref.read(authStateProvider.notifier).state = result;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final loginState = ref.watch(loginNotifierProvider);
    final isDesktop = MediaQuery.of(context).size.width > 600;

    ref.listen(loginNotifierProvider, (previous, next) {
      if (next.error != null && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isDesktop ? 450 : double.infinity),
            child: Card(
              elevation: isDesktop ? 8 : 0,
              color: isDesktop ? null : Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(isDesktop ? 32.0 : 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Iconsax.briefcase, size: 64, color: Color(0xFF005B96)),
                      const SizedBox(height: 24),
                      Text(
                        t.auth.title,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF005B96),
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(t.auth.subtitle),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: t.auth.username,
                          prefixIcon: const Icon(Iconsax.user),
                        ),
                        validator: (value) => (value == null || value.trim().isEmpty)
                            ? t.common.requiredField
                            : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: t.auth.password,
                          prefixIcon: const Icon(Iconsax.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
                            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                          ),
                        ),
                        onFieldSubmitted: (_) => _submitLogin(),
                        validator: (value) => (value == null || value.isEmpty)
                            ? t.common.requiredField
                            : null,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: loginState.isLoading
                              ? null
                              : () => context.push('/forgot-password'),
                          child: Text(t.auth.forgotPassword),
                        ),
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: loginState.isLoading ? null : _submitLogin,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: loginState.isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(t.auth.login),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
