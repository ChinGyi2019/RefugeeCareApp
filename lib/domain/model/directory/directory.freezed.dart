// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Directory _$DirectoryFromJson(Map<String, dynamic> json) {
  return _Directory.fromJson(json);
}

/// @nodoc
mixin _$Directory {
  String get name => throw _privateConstructorUsedError;
  String get job => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  List<String> get image => throw _privateConstructorUsedError;
  List<String> get tag => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get phone => throw _privateConstructorUsedError;
  List<String> get email => throw _privateConstructorUsedError;

  /// Serializes this Directory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Directory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectoryCopyWith<Directory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectoryCopyWith<$Res> {
  factory $DirectoryCopyWith(Directory value, $Res Function(Directory) then) =
      _$DirectoryCopyWithImpl<$Res, Directory>;
  @useResult
  $Res call(
      {String name,
      String job,
      String id,
      List<String> image,
      List<String> tag,
      String description,
      List<String> phone,
      List<String> email});
}

/// @nodoc
class _$DirectoryCopyWithImpl<$Res, $Val extends Directory>
    implements $DirectoryCopyWith<$Res> {
  _$DirectoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Directory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? job = null,
    Object? id = null,
    Object? image = null,
    Object? tag = null,
    Object? description = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as List<String>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectoryImplCopyWith<$Res>
    implements $DirectoryCopyWith<$Res> {
  factory _$$DirectoryImplCopyWith(
          _$DirectoryImpl value, $Res Function(_$DirectoryImpl) then) =
      __$$DirectoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String job,
      String id,
      List<String> image,
      List<String> tag,
      String description,
      List<String> phone,
      List<String> email});
}

/// @nodoc
class __$$DirectoryImplCopyWithImpl<$Res>
    extends _$DirectoryCopyWithImpl<$Res, _$DirectoryImpl>
    implements _$$DirectoryImplCopyWith<$Res> {
  __$$DirectoryImplCopyWithImpl(
      _$DirectoryImpl _value, $Res Function(_$DirectoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Directory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? job = null,
    Object? id = null,
    Object? image = null,
    Object? tag = null,
    Object? description = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_$DirectoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tag: null == tag
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value._phone
          : phone // ignore: cast_nullable_to_non_nullable
              as List<String>,
      email: null == email
          ? _value._email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectoryImpl implements _Directory {
  const _$DirectoryImpl(
      {this.name = '',
      this.job = '',
      this.id = '',
      final List<String> image = const [],
      final List<String> tag = const [],
      required this.description,
      final List<String> phone = const [],
      final List<String> email = const []})
      : _image = image,
        _tag = tag,
        _phone = phone,
        _email = email;

  factory _$DirectoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectoryImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String job;
  @override
  @JsonKey()
  final String id;
  final List<String> _image;
  @override
  @JsonKey()
  List<String> get image {
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_image);
  }

  final List<String> _tag;
  @override
  @JsonKey()
  List<String> get tag {
    if (_tag is EqualUnmodifiableListView) return _tag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tag);
  }

  @override
  final String description;
  final List<String> _phone;
  @override
  @JsonKey()
  List<String> get phone {
    if (_phone is EqualUnmodifiableListView) return _phone;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phone);
  }

  final List<String> _email;
  @override
  @JsonKey()
  List<String> get email {
    if (_email is EqualUnmodifiableListView) return _email;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_email);
  }

  @override
  String toString() {
    return 'Directory(name: $name, job: $job, id: $id, image: $image, tag: $tag, description: $description, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectoryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            const DeepCollectionEquality().equals(other._tag, _tag) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._phone, _phone) &&
            const DeepCollectionEquality().equals(other._email, _email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      job,
      id,
      const DeepCollectionEquality().hash(_image),
      const DeepCollectionEquality().hash(_tag),
      description,
      const DeepCollectionEquality().hash(_phone),
      const DeepCollectionEquality().hash(_email));

  /// Create a copy of Directory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectoryImplCopyWith<_$DirectoryImpl> get copyWith =>
      __$$DirectoryImplCopyWithImpl<_$DirectoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectoryImplToJson(
      this,
    );
  }
}

abstract class _Directory implements Directory {
  const factory _Directory(
      {final String name,
      final String job,
      final String id,
      final List<String> image,
      final List<String> tag,
      required final String description,
      final List<String> phone,
      final List<String> email}) = _$DirectoryImpl;

  factory _Directory.fromJson(Map<String, dynamic> json) =
      _$DirectoryImpl.fromJson;

  @override
  String get name;
  @override
  String get job;
  @override
  String get id;
  @override
  List<String> get image;
  @override
  List<String> get tag;
  @override
  String get description;
  @override
  List<String> get phone;
  @override
  List<String> get email;

  /// Create a copy of Directory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectoryImplCopyWith<_$DirectoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
