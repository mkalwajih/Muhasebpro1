import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muhaseb_pro/di/modules/auth_module.dart';
import 'package:muhaseb_pro/features/authentication/domain/entities/user_entity.dart';
import 'package:muhaseb_pro/features/authentication/domain/usecases/login_usecase.dart';
import 'package:muhaseb_pro/features/authentication/domain/usecases/seed_user_usecase.dart';
import 'package:muhaseb_pro/features/authentication/domain/usecases/register_usecase.dart';
import 'package:muhaseb_pro/features/authentication/domain/usecases/reset_password_usecase.dart';

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

final loginUseCaseProvider = Provider<LoginUseCase>(
  (ref) => LoginUseCase(ref.watch(authRepositoryProvider)),
);

final seedUserUseCaseProvider = Provider<SeedUserUseCase>(
  (ref) => SeedUserUseCase(ref.watch(authRepositoryProvider)),
);

final registerUseCaseProvider = Provider<RegisterUseCase>(
  (ref) => RegisterUseCase(ref.watch(authRepositoryProvider)),
);

final resetPasswordUseCaseProvider = Provider<ResetPasswordUseCase>(
  (ref) => ResetPasswordUseCase(ref.watch(authRepositoryProvider)),
);

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(ref.watch(loginUseCaseProvider)),
);

class RegisterState {
  final bool isLoading;
  final String? error;

  RegisterState({this.isLoading = false, this.error});
}

class RegisterNotifier extends StateNotifier<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterNotifier(this._registerUseCase) : super(RegisterState());

  Future<UserEntity?> register(UserEntity user, String password) async {
    state = RegisterState(isLoading: true);
    final (created, error) = await _registerUseCase(user, password);
    if (error != null) {
      state = RegisterState(isLoading: false, error: error);
      return null;
    }
    state = RegisterState(isLoading: false);
    return created;
  }
}

final registerNotifierProvider = StateNotifierProvider<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(ref.watch(registerUseCaseProvider)),
);

class ResetPasswordState {
  final bool isLoading;
  final String? error;
  final bool success;

  ResetPasswordState({this.isLoading = false, this.error, this.success = false});
}

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final ResetPasswordUseCase _resetUseCase;

  ResetPasswordNotifier(this._resetUseCase) : super(ResetPasswordState());

  Future<bool> reset(String username, String newPassword) async {
    state = ResetPasswordState(isLoading: true);
    final (ok, error) = await _resetUseCase(username, newPassword);
    if (error != null) {
      state = ResetPasswordState(isLoading: false, error: error);
      return false;
    }
    state = ResetPasswordState(isLoading: false, success: ok);
    return ok;
  }
}

final resetPasswordNotifierProvider = StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>(
  (ref) => ResetPasswordNotifier(ref.watch(resetPasswordUseCaseProvider)),
);
