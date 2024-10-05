import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/domain/model/auth/auth_state.dart';
import 'package:refugee_care_mobile/feature/auth/domain/repository/auth_repository.dart';
import 'package:refugee_care_mobile/feature/splash/provider/state/splash_scrren_state.dart';

class SplashScreenNotifier extends StateNotifier<SplashScreenState> {
  final AuthenticationRepository authRepository;
  SplashScreenNotifier({required this.authRepository})
      : super(SplashScreenState());

  void initAuthState() async {
    state = state.copyWith(authState: const AuthState.loading());
    if (authRepository.getUser()?.token != null &&
        authRepository.getUser()?.token != "") {
      debugPrint(authRepository.getUser()?.token);
      state = state.copyWith(authState: const Success());
    } else {
      state = state.copyWith(
          authState: AuthState.failure(AppException(
              title: "",
              message: "No access token",
              identifier: "",
              statusCode: 401)));
    }
  }
}
