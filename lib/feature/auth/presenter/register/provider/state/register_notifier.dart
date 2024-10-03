import 'package:flutter/foundation.dart';
import 'package:refugee_care_mobile/feature/auth/domain/model/user/user.dart';
import 'package:refugee_care_mobile/domain/model/auth/auth_state.dart';
import 'package:refugee_care_mobile/feature/auth/domain/repository/auth_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/register/provider/state/register_screen_state.dart';

class RegisterNotifier extends StateNotifier<RegisterScreenState> {
  final AuthenticationRepository authRepository;
  RegisterNotifier({required this.authRepository})
      : super(RegisterScreenState());

  void updatePhoneNo(String value) {
    state.phoneNo = value;
    // state = state.copyWith(phoneNo: value);
  }

  void updateFullName(String value) {
    state.name = value;
    // state = state.copyWith(name: value);
    //notifyListeners();
  }

  void updateEmail(String value) {
    state.email = value;
  }

  void updatePassword(String value) {
    state.password = value;
    // state = state.copyWith(password: value);
    // notifyListeners();
  }

  void updateObsurePassword(bool value) {
    // state.obscurePassword = value;
    state = state.copyWith(obscurePassword: value);
  }

  void updateObsureConfirmPassword(bool value) {
    // state.obscureConfirmPassword = value;
    state = state.copyWith(obscureConfirmPassword: value);
    // notifyListeners();
  }

  void updateConfiremdPassword(String value) {
    state.confirmedPassword = value;
    // state = state.copyWith(confirmedPassword: value);
    //notifyListeners();
  }

  Future<void> register() async {
    state.loading = true;
    final response = await authRepository.register(
        user: User(
            id: "",
            email: state.email,
            phoneNumber: state.phoneNo,
            name: state.name,
            password: state.password,
            token: ""));

    state = state.copyWith(loading: true);
    // await Future.delayed(Duration(seconds: 2));
    final authState = await response.asyncFold((failure) async {
      debugPrint(failure.identifier);
      state.loading = false;
      return AuthState.failure(failure);
    }, (user) async {
      await authRepository.saveUser(user: user);
      state.loading = false;
      return const AuthState.success();
    });

    state = state.copyWith(authState: authState, loading: false);
  }
}

// class RegisterNotifier extends AutoDisposeAsyncNotifier<AuthState> {
//   late final AuthenticationRepository authRepository;

//   @override
//   Future<AuthState> build() async {
//     authRepository = ref.read(authRepositoryProvider);
//     return const AuthState.initial();
//   }

//   Future<void> loginUser(
//       String name, String phoneNumber, String password, String email) async {
//     final response = await authRepository.register(
//         user: User(
//       email: email,
//       phoneNumber: phoneNumber,
//       name: name,
//       password: password,
//     ));

//     state = await response.fold(
//       (failure) => AsyncData(AuthState.failure(failure)),
//       (user) async {
//         return AsyncData(AuthState.success());
//         // final hasSavedUser = await authRepository.saveUser(user: user);
//         // if (hasSavedUser) {
//         //   return const AuthState.success();
//         // }
//         //  return AuthState.failure(CacheFailureException());
//       },
//     );
//   }
// }
