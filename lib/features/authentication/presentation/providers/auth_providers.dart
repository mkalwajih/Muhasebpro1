import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/core/di/database_provider.dart';
import 'package:muhaseb_pro/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:muhaseb_pro/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/authentication/domain/repositories/auth_repository.dart';
import 'package:muhaseb_pro/features/authentication/domain/usecases/login_usecase.dart';
import 'package:muhaseb_pro/features/authentication/domain/usecases/seed_user_usecase.dart';

// State for the login process
class LoginState {
  final bool isLoading;
  final String? error;

  LoginState({this.isLoading = false, this.error});
}

// Notifier for the login screen
class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginNotifier(this._loginUseCase) : super(LoginState());

  Future<UserEntity?> login(String username, String password) async {
    state = LoginState(isLoading: true);
    final (user, error) = await _loginUseCase(username, password);
    if (error != null) {
      state = LoginState(isLoading: false, error: error);
      return null;
    } else {
      state = LoginState(isLoading: false);
      return user;
    }
  }
}

// Provider for Auth session (logged in user)
final authStateProvider = StateProvider<UserEntity?>((ref) => null);

// --- DI Providers ---

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>(
  (ref) => AuthLocalDataSourceImpl(ref.watch(appDatabaseProvider)),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authLocalDataSourceProvider)),
);

final loginUseCaseProvider = Provider<LoginUseCase>(
  (ref) => LoginUseCase(ref.watch(authRepositoryProvider)),
);

final seedUserUseCaseProvider = Provider<SeedUserUseCase>(
  (ref) => SeedUserUseCase(ref.watch(authRepositoryProvider)),
);

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(ref.watch(loginUseCaseProvider)),
);
