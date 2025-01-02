// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advertisement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Advertisement _$AdvertisementFromJson(Map<String, dynamic> json) {
  return _Advertisement.fromJson(json);
}

/// @nodoc
mixin _$Advertisement {
  String get title => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  String get backDrop => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get dateOfExpiry => throw _privateConstructorUsedError;
  String get owner => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Advertisement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Advertisement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdvertisementCopyWith<Advertisement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertisementCopyWith<$Res> {
  factory $AdvertisementCopyWith(
          Advertisement value, $Res Function(Advertisement) then) =
      _$AdvertisementCopyWithImpl<$Res, Advertisement>;
  @useResult
  $Res call(
      {String title,
      String id,
      String tag,
      String backDrop,
      String date,
      String dateOfExpiry,
      String owner,
      String description});
}

/// @nodoc
class _$AdvertisementCopyWithImpl<$Res, $Val extends Advertisement>
    implements $AdvertisementCopyWith<$Res> {
  _$AdvertisementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Advertisement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? tag = null,
    Object? backDrop = null,
    Object? date = null,
    Object? dateOfExpiry = null,
    Object? owner = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      backDrop: null == backDrop
          ? _value.backDrop
          : backDrop // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfExpiry: null == dateOfExpiry
          ? _value.dateOfExpiry
          : dateOfExpiry // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdvertisementImplCopyWith<$Res>
    implements $AdvertisementCopyWith<$Res> {
  factory _$$AdvertisementImplCopyWith(
          _$AdvertisementImpl value, $Res Function(_$AdvertisementImpl) then) =
      __$$AdvertisementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String id,
      String tag,
      String backDrop,
      String date,
      String dateOfExpiry,
      String owner,
      String description});
}

/// @nodoc
class __$$AdvertisementImplCopyWithImpl<$Res>
    extends _$AdvertisementCopyWithImpl<$Res, _$AdvertisementImpl>
    implements _$$AdvertisementImplCopyWith<$Res> {
  __$$AdvertisementImplCopyWithImpl(
      _$AdvertisementImpl _value, $Res Function(_$AdvertisementImpl) _then)
      : super(_value, _then);

  /// Create a copy of Advertisement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? tag = null,
    Object? backDrop = null,
    Object? date = null,
    Object? dateOfExpiry = null,
    Object? owner = null,
    Object? description = null,
  }) {
    return _then(_$AdvertisementImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      backDrop: null == backDrop
          ? _value.backDrop
          : backDrop // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfExpiry: null == dateOfExpiry
          ? _value.dateOfExpiry
          : dateOfExpiry // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvertisementImpl implements _Advertisement {
  const _$AdvertisementImpl(
      {required this.title,
      required this.id,
      required this.tag,
      required this.backDrop,
      required this.date,
      required this.dateOfExpiry,
      required this.owner,
      required this.description});

  factory _$AdvertisementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvertisementImplFromJson(json);

  @override
  final String title;
  @override
  final String id;
  @override
  final String tag;
  @override
  final String backDrop;
  @override
  final String date;
  @override
  final String dateOfExpiry;
  @override
  final String owner;
  @override
  final String description;

  @override
  String toString() {
    return 'Advertisement(title: $title, id: $id, tag: $tag, backDrop: $backDrop, date: $date, dateOfExpiry: $dateOfExpiry, owner: $owner, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvertisementImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.backDrop, backDrop) ||
                other.backDrop == backDrop) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateOfExpiry, dateOfExpiry) ||
                other.dateOfExpiry == dateOfExpiry) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, id, tag, backDrop, date,
      dateOfExpiry, owner, description);

  /// Create a copy of Advertisement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvertisementImplCopyWith<_$AdvertisementImpl> get copyWith =>
      __$$AdvertisementImplCopyWithImpl<_$AdvertisementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvertisementImplToJson(
      this,
    );
  }
}

abstract class _Advertisement implements Advertisement {
  const factory _Advertisement(
      {required final String title,
      required final String id,
      required final String tag,
      required final String backDrop,
      required final String date,
      required final String dateOfExpiry,
      required final String owner,
      required final String description}) = _$AdvertisementImpl;

  factory _Advertisement.fromJson(Map<String, dynamic> json) =
      _$AdvertisementImpl.fromJson;

  @override
  String get title;
  @override
  String get id;
  @override
  String get tag;
  @override
  String get backDrop;
  @override
  String get date;
  @override
  String get dateOfExpiry;
  @override
  String get owner;
  @override
  String get description;

  /// Create a copy of Advertisement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdvertisementImplCopyWith<_$AdvertisementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
