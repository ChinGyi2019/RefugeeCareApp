import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/auth/domain/provider/auth_repository_provider.dart';

class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final bool isLoggedIn;

  LoginState(
      {this.isLoading = false, this.errorMessage, this.isLoggedIn = false});
}

class LoginNotifier extends Notifier<LoginState> {
  @override
  LoginState build() {
    return LoginState();
  }

  Future<void> login(String phoneNumber, String password) async {
    final authRepository = ref.read(authRepositoryProvider);
    if (phoneNumber.isEmpty || password.isEmpty) {
      state = LoginState(errorMessage: 'Email and Password cannot be empty');
      return;
    }

    state = LoginState(isLoading: true);
    final response = await authRepository.login(
        phoneNumber: phoneNumber, password: password);
    await response.fold((failure) {
      state = LoginState(errorMessage: failure.message, isLoading: false);
    }, (user) async {
      await authRepository.saveUser(user: user);
      state = LoginState(isLoggedIn: true, isLoading: false);
    });
  }
}
