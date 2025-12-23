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
import 'package:muhaseb_pro/features/system_setup/presentation/screens/financial_periods_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/general_parameters_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/geographical_data_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/role_management_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/role_permissions_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/system_setup_menu_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/tax_screen.dart';
import 'package:muhaseb_pro/features/system_setup/presentation/screens/user_management_screen.dart';
import 'package:muhaseb_pro/shared/presentation/widgets/placeholder_screen.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/register_screen.dart';
import 'package:muhaseb_pro/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:muhaseb_pro/features/general_ledger/presentation/pages/gl_setup_screen.dart';
import 'package:muhaseb_pro/features/general_ledger/presentation/pages/journal_vouchers_screen.dart';
import 'package:muhaseb_pro/features/general_ledger/presentation/pages/payment_vouchers_screen.dart';
import 'package:muhaseb_pro/features/general_ledger/presentation/pages/receipt_vouchers_screen.dart';
import 'package:muhaseb_pro/features/general_ledger/presentation/pages/cash_bank_management_screen.dart';
import 'package:muhaseb_pro/features/general_ledger/presentation/pages/financial_reports_screen.dart';
import 'package:muhaseb_pro/features/general_ledger/presentation/pages/transaction_requests_screen.dart';
import 'package:muhaseb_pro/features/general_ledger/presentation/pages/review_posting_screen.dart';
import 'package:muhaseb_pro/features/general_ledger/presentation/pages/general_ledger_menu_screen.dart';
import 'package:muhaseb_pro/features/inventory/presentation/pages/inventory_setup_screen.dart';
import 'package:muhaseb_pro/features/inventory/presentation/pages/items_screen.dart';
import 'package:muhaseb_pro/features/inventory/presentation/pages/opening_stock_screen.dart';
import 'package:muhaseb_pro/features/inventory/presentation/pages/stock_operations_screen.dart';
import 'package:muhaseb_pro/features/inventory/presentation/pages/inventory_control_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isAuthenticated = authState != null;
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
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
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
              GoRoute(
                path: 'financial_periods',
                builder: (context, state) => const FinancialPeriodsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'general_ledger',
            builder: (context, state) =>
                const GeneralLedgerMenuScreen(),
            routes: [
              GoRoute(
                path: 'setup',
                builder: (context, state) => const GLSetupScreen(),
              ),
              GoRoute(
                path: 'journal_vouchers',
                builder: (context, state) => const JournalVouchersScreen(),
              ),
              GoRoute(
                path: 'payment_vouchers',
                builder: (context, state) => const PaymentVouchersScreen(),
              ),
              GoRoute(
                path: 'receipt_vouchers',
                builder: (context, state) => const ReceiptVouchersScreen(),
              ),
              GoRoute(
                path: 'cash_bank_management',
                builder: (context, state) => const CashBankManagementScreen(),
              ),
              GoRoute(
                path: 'financial_reports',
                builder: (context, state) => const FinancialReportsScreen(),
              ),
              GoRoute(
                path: 'transaction_requests',
                builder: (context, state) => const TransactionRequestsScreen(),
              ),
              GoRoute(
                path: 'review_posting',
                builder: (context, state) => const ReviewPostingScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'inventory',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'Inventory'),
            routes: [
              GoRoute(
                path: 'setup',
                builder: (context, state) => const InventorySetupScreen(),
              ),
              GoRoute(
                path: 'items',
                builder: (context, state) => const ItemsScreen(),
              ),
              GoRoute(
                path: 'opening_stock',
                builder: (context, state) => const OpeningStockScreen(),
              ),
              GoRoute(
                path: 'operations',
                builder: (context, state) => const StockOperationsScreen(),
              ),
              GoRoute(
                path: 'control',
                builder: (context, state) => const InventoryControlScreen(),
              ),
            ],
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
