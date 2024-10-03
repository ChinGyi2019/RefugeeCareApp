import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_care_mobile/domain/model/auth/auth_state.dart';

class RegisterScreenState extends Equatable {
  bool loading;
  String name;
  String password;
  bool obscurePassword;
  String confirmedPassword;
  bool obscureConfirmPassword;
  String email;
  String phoneNo;
  AuthState authState;
  bool enabledNextButton;

  RegisterScreenState({
    this.loading = false,
    this.name = "",
    this.password = "",
    this.obscurePassword = true,
    this.confirmedPassword = "",
    this.obscureConfirmPassword = true,
    this.email = "",
    this.phoneNo = "",
    this.authState = const AuthState.initial(),
    this.enabledNextButton = true,
  });

  RegisterScreenState copyWith({
    bool? loading,
    String? name,
    String? password,
    bool? obscurePassword,
    String? confirmedPassword,
    bool? obscureConfirmPassword,
    String? email,
    String? phoneNo,
    AuthState? authState,
    bool? enabledNextButton,
  }) {
    return RegisterScreenState(
      loading: loading ?? this.loading,
      name: name ?? this.name,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      authState: authState ?? this.authState,
      enabledNextButton: enabledNextButton ?? this.enabledNextButton,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        name,
        password,
        obscurePassword,
        confirmedPassword,
        obscureConfirmPassword,
        email,
        phoneNo,
        authState,
        enabledNextButton,
      ];

  @override
  String toString() {
    return 'RegisterScreenState(loading: $loading, name: $name, password: $password, obscurePassword: $obscurePassword, confirmedPassword: $confirmedPassword, obscureConfirmPassword: $obscureConfirmPassword, email: $email, phoneNo: $phoneNo, authState: $authState, enabledNextButton: $enabledNextButton)';
  }
}
// }
// @freezed
// class RegisterScreenState with _$RegisterScreenState {
//   const factory RegisterScreenState({
//     @Default(false) bool loading,
//     @Default("") String name,
//     @Default("") String password,
//     @Default(true) bool obscurePassword,
//     @Default("") String confirmedPassword,
//     @Default(true) bool obscureConfirmPassword,
//     @Default("") String email,
//     @Default("") String phoneNo,
//     @JsonKey(ignore: true) @Default(AuthState.initial()) AuthState authState,
//     @Default(true) bool enabledNextButton,
//     // @Default(GlobalKey<FormState>) GlobalKey<FormState> formKey,
//   }) = _RegisterScreenState;

//   factory RegisterScreenState.fromJson(Map<String, dynamic> json) =>
//       _$RegisterScreenStateFromJson(json);
// }
