import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String id,
    required String email,
    required String name,
    required String phoneNumber,
    required String token,
  }) = _Data;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
