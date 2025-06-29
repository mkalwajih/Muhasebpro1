import 'package:go_router/go_router.dart'; // Keep go_router
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/features/dashboard/presentation/screens/dashboard_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/dashboard', // The first screen to show
    routes: [
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      // We will add more routes here, like '/login', '/system-setup', etc.
    ],
  );
});