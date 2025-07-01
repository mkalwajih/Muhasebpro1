import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muhaseb_pro/core/widgets/placeholder_screen.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/login_screen.dart';
import 'package:muhaseb_pro/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/coa_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/company_info_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/system_setup_menu_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/dashboard',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: 'system_setup',
            builder: (context, state) => const SystemSetupMenuScreen(),
            routes: [
              GoRoute(
                path: 'company_info',
                builder: (context, state) => const CompanyInfoScreen(),
              ),
              GoRoute(
                path: 'coa',
                builder: (context, state) => const CoaScreen(),
              ),
            ]
          ),
          // ... other main module routes remain placeholders
          GoRoute(path: 'general_ledger', builder: (context, state) => const PlaceholderScreen(title: 'General Ledger')),
          GoRoute(path: 'inventory', builder: (context, state) => const PlaceholderScreen(title: 'Inventory')),
          GoRoute(path: 'vendors', builder: (context, state) => const PlaceholderScreen(title: 'Vendors')),
          GoRoute(path: 'customers', builder: (context, state) => const PlaceholderScreen(title: 'Customers')),
          GoRoute(path: 'reports', builder: (context, state) => const PlaceholderScreen(title: 'Reports')),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final isLoggedIn = authState != null;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }

      if (isLoggedIn && isLoggingIn) {
        return '/dashboard';
      }

      return null;
    },
  );
});
