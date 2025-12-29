import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/l10n/app_localizations.dart';
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
    // 1. Unfocus to prevent Flutter Web RangeError
    FocusScope.of(context).unfocus();

    final l10n = AppLocalizations.of(context);
    if (l10n == null) return; // Guard against null l10n

    if (!_formKey.currentState!.validate()) return;

    // 2. Trigger Login
    final result = await ref.read(loginNotifierProvider.notifier).login(
          _usernameController.text.trim(),
          _passwordController.text,
        );

    // 3. Update Auth State and Navigate
    if (mounted && result != null) {
      // FIX: Update the global auth state provider so the router knows we are logged in
      ref.read(authStateProvider.notifier).state = result;

      context.go('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final loginState = ref.watch(loginNotifierProvider);
    final isDesktop = MediaQuery.of(context).size.width > 600;

    // Listen for errors to show SnackBars
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

    if (l10n == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 450 : double.infinity,
            ),
            child: Card(
              elevation: isDesktop ? 8 : 0,
              color: isDesktop ? null : Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(isDesktop ? 32.0 : 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(Iconsax.briefcase, size: 64, color: Color(0xFF005B96)),
                      const SizedBox(height: 24),
                      Text(
                        l10n.loginTitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF005B96),
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.loginSubtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      const SizedBox(height: 32),

                      // Username
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: l10n.username,
                          prefixIcon: const Icon(Iconsax.user),
                          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                        ),
                        textInputAction: TextInputAction.next,
                        enabled: !loginState.isLoading,
                        validator: (value) => (value == null || value.trim().isEmpty)
                            ? l10n.usernameRequired
                            : null,
                      ),
                      const SizedBox(height: 16),

                      // Password
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        enabled: !loginState.isLoading,
                        decoration: InputDecoration(
                          labelText: l10n.password,
                          prefixIcon: const Icon(Iconsax.lock),
                          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
                            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _submitLogin(),
                        validator: (value) => (value == null || value.isEmpty)
                            ? l10n.passwordRequired
                            : null,
                      ),

                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: loginState.isLoading
                              ? null
                              : () => context.push('/forgot-password'),
                          child: Text(l10n.forgotPassword),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Login Button
                      FilledButton(
                        onPressed: loginState.isLoading ? null : _submitLogin,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          backgroundColor: const Color(0xFF005B96),
                        ),
                        child: loginState.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : Text(
                                l10n.login,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
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
