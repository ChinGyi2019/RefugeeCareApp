import 'package:equatable/equatable.dart';
import 'package:refugee_care_mobile/domain/model/auth/auth_state.dart';

class SplashScreenState extends Equatable {
  final bool loading;
  final String name;
  final AuthState authState;

  SplashScreenState({
    this.loading = false,
    this.name = "",
    this.authState = const AuthState.initial(),
  });

  SplashScreenState copyWith({
    bool? loading,
    String? name,
    AuthState? authState,
  }) {
    return SplashScreenState(
      loading: loading ?? this.loading,
      name: name ?? this.name,
      authState: authState ?? this.authState,
    );
  }

  @override
  List<Object?> get props => [loading, name, authState];

  @override
  String toString() {
    return 'SplashScreenState(loading: $loading, name: $name, authState: $authState)';
  }
}
