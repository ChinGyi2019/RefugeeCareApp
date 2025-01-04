import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/domain/model/directory/directory.dart';

part 'directory_screen_state.freezed.dart';

@freezed
class Directoryscreenstate with _$Directoryscreenstate {
  const factory Directoryscreenstate({
    @Default(false) bool isLoading,
    @Default(null) AppException? error,
    @Default([]) List<String> tags,
    @Default([]) List<Directory> directories,
  }) = _Directoryscreenstate;
}
