// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directory_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Directoryscreenstate {
  bool get isLoading => throw _privateConstructorUsedError;
  AppException? get error => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<Directory> get directories => throw _privateConstructorUsedError;

  /// Create a copy of Directoryscreenstate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectoryscreenstateCopyWith<Directoryscreenstate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectoryscreenstateCopyWith<$Res> {
  factory $DirectoryscreenstateCopyWith(Directoryscreenstate value,
          $Res Function(Directoryscreenstate) then) =
      _$DirectoryscreenstateCopyWithImpl<$Res, Directoryscreenstate>;
  @useResult
  $Res call(
      {bool isLoading,
      AppException? error,
      List<String> tags,
      List<Directory> directories});
}

/// @nodoc
class _$DirectoryscreenstateCopyWithImpl<$Res,
        $Val extends Directoryscreenstate>
    implements $DirectoryscreenstateCopyWith<$Res> {
  _$DirectoryscreenstateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Directoryscreenstate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? tags = null,
    Object? directories = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppException?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      directories: null == directories
          ? _value.directories
          : directories // ignore: cast_nullable_to_non_nullable
              as List<Directory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectoryscreenstateImplCopyWith<$Res>
    implements $DirectoryscreenstateCopyWith<$Res> {
  factory _$$DirectoryscreenstateImplCopyWith(_$DirectoryscreenstateImpl value,
          $Res Function(_$DirectoryscreenstateImpl) then) =
      __$$DirectoryscreenstateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      AppException? error,
      List<String> tags,
      List<Directory> directories});
}

/// @nodoc
class __$$DirectoryscreenstateImplCopyWithImpl<$Res>
    extends _$DirectoryscreenstateCopyWithImpl<$Res, _$DirectoryscreenstateImpl>
    implements _$$DirectoryscreenstateImplCopyWith<$Res> {
  __$$DirectoryscreenstateImplCopyWithImpl(_$DirectoryscreenstateImpl _value,
      $Res Function(_$DirectoryscreenstateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Directoryscreenstate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? tags = null,
    Object? directories = null,
  }) {
    return _then(_$DirectoryscreenstateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppException?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      directories: null == directories
          ? _value._directories
          : directories // ignore: cast_nullable_to_non_nullable
              as List<Directory>,
    ));
  }
}

/// @nodoc

class _$DirectoryscreenstateImpl implements _Directoryscreenstate {
  const _$DirectoryscreenstateImpl(
      {this.isLoading = false,
      this.error = null,
      final List<String> tags = const [],
      final List<Directory> directories = const []})
      : _tags = tags,
        _directories = directories;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final AppException? error;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<Directory> _directories;
  @override
  @JsonKey()
  List<Directory> get directories {
    if (_directories is EqualUnmodifiableListView) return _directories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_directories);
  }

  @override
  String toString() {
    return 'Directoryscreenstate(isLoading: $isLoading, error: $error, tags: $tags, directories: $directories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectoryscreenstateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._directories, _directories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_directories));

  /// Create a copy of Directoryscreenstate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectoryscreenstateImplCopyWith<_$DirectoryscreenstateImpl>
      get copyWith =>
          __$$DirectoryscreenstateImplCopyWithImpl<_$DirectoryscreenstateImpl>(
              this, _$identity);
}

abstract class _Directoryscreenstate implements Directoryscreenstate {
  const factory _Directoryscreenstate(
      {final bool isLoading,
      final AppException? error,
      final List<String> tags,
      final List<Directory> directories}) = _$DirectoryscreenstateImpl;

  @override
  bool get isLoading;
  @override
  AppException? get error;
  @override
  List<String> get tags;
  @override
  List<Directory> get directories;

  /// Create a copy of Directoryscreenstate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectoryscreenstateImplCopyWith<_$DirectoryscreenstateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
