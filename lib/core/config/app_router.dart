import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/authentication/presentation/providers/auth_providers.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/login_screen.dart';
import 'package:muhaseb_pro/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/branch_groups_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/branches_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/coa_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/company_info_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/currencies_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/general_parameters_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/geographical_data_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/role_management_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/role_permissions_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/system_setup_menu_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/tax_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/user_management_screen.dart';
import 'package:muhaseb_pro/shared/presentation/widgets/placeholder_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isAuthenticated = authState.asData?.value != null;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }
      if (isAuthenticated && isLoggingIn) {
        return '/dashboard';
      }
      return null;
    },
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
                path: 'branches',
                builder: (context, state) => const BranchesScreen(),
              ),
              GoRoute(
                path: 'branch_groups',
                builder: (context, state) => const BranchGroupsScreen(),
              ),
              GoRoute(
                path: 'coa',
                builder: (context, state) => const CoaScreen(),
              ),
              GoRoute(
                path: 'user_management',
                builder: (context, state) => const UserManagementScreen(),
              ),
              GoRoute(
                path: 'role_management',
                builder: (context, state) => const RoleManagementScreen(),
              ),
              GoRoute(
                path: 'role_permissions',
                builder: (context, state) =>
                    RolePermissionsScreen(role: state.extra! as dynamic),
              ),
              GoRoute(
                path: 'geographical_data',
                builder: (context, state) => const GeographicalDataScreen(),
              ),
              GoRoute(
                path: 'general_parameters',
                builder: (context, state) => const GeneralParametersScreen(),
              ),
              GoRoute(
                path: 'currencies',
                builder: (context, state) => const CurrenciesScreen(),
              ),
              GoRoute(
                path: 'tax',
                builder: (context, state) => const TaxScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'general_ledger',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'General Ledger'),
          ),
          GoRoute(
            path: 'inventory',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'Inventory'),
          ),
          GoRoute(
            path: 'vendors',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'Vendors'),
          ),
          GoRoute(
            path: 'customers',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'Customers'),
          ),
          GoRoute(
            path: 'reports',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'Reports'),
          ),
        ],
      ),
    ],
  );
});
