import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/data/services/app_write_client_provider.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/domain/model/auth/auth_state.dart';
import 'package:refugee_care_mobile/feature/auth/domain/provider/auth_repository_provider.dart';
import 'package:refugee_care_mobile/feature/auth/domain/repository/auth_repository.dart';
import 'package:refugee_care_mobile/feature/splash/provider/state/splash_screen_notifier.dart';
import 'package:refugee_care_mobile/feature/splash/provider/state/splash_scrren_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'splah_screen_provider.g.dart';

// final splashScreenProvider =
//     StateNotifierProvider<SplashScreenNotifier, SplashScreenState>((ref) {
//   var authRepository = ref.watch(authRepositoryProvider);
//   return SplashScreenNotifier(authRepository: authRepository);
// });

@riverpod
class SplashScreenViewModel extends _$SplashScreenViewModel {
  //
  @override
  SplashScreenState build() {
    return SplashScreenState();
  }

  void initAuthState() async {
    try {
      final authRepository = ref.read(authRepositoryProvider);
      final account = ref.watch(accountProvider);
      state = state.copyWith(authState: const AuthState.loading());
      final session = await account
          .getSession(sessionId: 'current')
          .onError((error, stackTrace) {
        debugPrint("error:$error");
        debugPrint("trace:$stackTrace");
        throw Exception("Error occurred during account registration");
      });
      if (session.current) {
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
    } catch (e, stackTrace) {
      debugPrint("Exception caught: $e");
      debugPrint("Stack trace: $stackTrace");
      state = state.copyWith(
          authState: AuthState.failure(AppException(
              title: "Error",
              message: e.toString(),
              identifier: "",
              statusCode: 500)));
    }
  }
}
