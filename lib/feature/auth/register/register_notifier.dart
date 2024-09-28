import 'package:refugee_care_mobile/data/datasource/model/user/user_data.dart';
import 'package:refugee_care_mobile/domain/model/auth/auth_state.dart';
import 'package:refugee_care_mobile/domain/repositroy/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refugee_care_mobile/feature/auth/register/register_screen_state.dart';

// class RegisterScreenState {
//   final bool loading;
//   String name = "";
//   String password = "";
//   bool obscurePasswod = true;
//   String confirmedPassword = "";
//   bool obscureConfirmPasswod = true;
//   String email = "";
//   String phoneNo = "";
//   AuthState authState = const AuthState.initial();
//   bool enabledNextButton;
//   RegisterScreenState({this.loading = false, this.enabledNextButton = true});
//   // factory RegisterScreenState.fromJson(Map<String, Object?> json) =>
//   //     _$RegisterScreenState(json);
// }

class RegisterNotifier extends StateNotifier<RegisterScreenState> {
  final AuthenticationRepository authRepository;
  RegisterNotifier({required this.authRepository})
      : super(RegisterScreenState());
  // @override
  // Future<RegisterScreenState> build() async {
  //   return RegisterScreenState();
  // }

  void updatePhoneNo(String value) {
    state.phoneNo = value;
    // state = state.copyWith(phoneNo: value);
  }

  void updateFullName(String value) {
    state = state.copyWith(name: value);
    //notifyListeners();
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
    // notifyListeners();
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
    // notifyListeners();
  }

  void updateObsurePassword(bool value) {
    state = state.copyWith(obscurePassword: value);
  }

  void updateObsureConfirmPassword(bool value) {
    state = state.copyWith(obscureConfirmPassword: value);
    // notifyListeners();
  }

  void updateConfiremdPassword(String value) {
    state = state.copyWith(confirmedPassword: value);
    //notifyListeners();
  }

  // bool validate() {
  //   //return state.value.formKey.currentState?.validate() ?? false;
  // }

  void sumbit(Function() onSuccess) {
    // if (validate()) {
    //   // state.value.formKey.currentState?.save();
    //   onSuccess();
    // }
  }

  // void clear() {
  //   state = RegisterScreenState();
  // }

  Future<void> register() async {
    final response = await authRepository.register(
        user: User(
      email: state.email,
      phoneNumber: state.phoneNo,
      name: state.name,
      password: state.password,
    ));

    state = state.copyWith(
        authState: response.fold((failure) {
      return AuthState.failure(failure);
    }, (user) {
      return const AuthState.success();
      // final hasSavedUser = await authRepository.saveUser(user: user);
      // if (hasSavedUser) {
      //   return const AuthState.success();
      // }
      //  return AuthState.failure(CacheFailureException());
    }));
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
