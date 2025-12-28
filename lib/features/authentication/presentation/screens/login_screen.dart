import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:muhaseb_pro/core/theme/app_theme.dart';
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
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Access the auth provider (Ensure your authProvider exposes a login method)
    // Adjust 'authNotifierProvider' to match the exact name in your auth_providers.dart
    final result = await ref.read(authStateProvider.notifier).login(
      _usernameController.text.trim(),
      _passwordController.text,
    );

    setState(() => _isLoading = false);

    result.fold(
      (failure) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.message), // Display localized error from Failure
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      (user) {
        // Navigation is handled by AppRouter listener, but we can force it if needed
        if (mounted) {
          context.go('/dashboard'); 
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop = MediaQuery.of(context).size.width > 600;

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
                      // --- Logo & Header ---
                      const Icon(Iconsax.briefcase, size: 64, color: Color(0xFF005B96)),
                      const SizedBox(height: 24),
                      Text(
                        l10n.loginTitle, // 'MuhasebPro'
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF005B96),
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.loginSubtitle, // 'Sign in to your account'
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      const SizedBox(height: 32),

                      // --- Username Field ---
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: l10n.username,
                          prefixIcon: const Icon(Iconsax.user),
                          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.usernameRequired; // Ensure this key exists in ARB
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // --- Password Field ---
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: l10n.password,
                          prefixIcon: const Icon(Iconsax.lock),
                          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _submitLogin(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.passwordRequired; // Ensure this key exists in ARB
                          }
                          return null;
                        },
                      ),
                      
                      // --- Forgot Password Link ---
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () => context.push('/forgot-password'),
                          child: Text(l10n.forgotPassword),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // --- Login Button ---
                      FilledButton(
                        onPressed: _isLoading ? null : _submitLogin,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          backgroundColor: const Color(0xFF005B96),
                        ),
                        child: _isLoading
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
