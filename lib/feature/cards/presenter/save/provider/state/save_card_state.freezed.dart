// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaveCardScreenState {
  bool get loading => throw _privateConstructorUsedError;
  int get currentScreen => throw _privateConstructorUsedError;
  CommunityCard get card => throw _privateConstructorUsedError;
  List<CommunityCard> get cards => throw _privateConstructorUsedError;
  List<Community> get communities => throw _privateConstructorUsedError;
  AppException? get error => throw _privateConstructorUsedError;
  Community? get selectedCommunity => throw _privateConstructorUsedError;
  bool get enabledNextButton => throw _privateConstructorUsedError;

  /// Create a copy of SaveCardScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveCardScreenStateCopyWith<SaveCardScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveCardScreenStateCopyWith<$Res> {
  factory $SaveCardScreenStateCopyWith(
          SaveCardScreenState value, $Res Function(SaveCardScreenState) then) =
      _$SaveCardScreenStateCopyWithImpl<$Res, SaveCardScreenState>;
  @useResult
  $Res call(
      {bool loading,
      int currentScreen,
      CommunityCard card,
      List<CommunityCard> cards,
      List<Community> communities,
      AppException? error,
      Community? selectedCommunity,
      bool enabledNextButton});

  $CommunityCardCopyWith<$Res> get card;
  $CommunityCopyWith<$Res>? get selectedCommunity;
}

/// @nodoc
class _$SaveCardScreenStateCopyWithImpl<$Res, $Val extends SaveCardScreenState>
    implements $SaveCardScreenStateCopyWith<$Res> {
  _$SaveCardScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveCardScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? currentScreen = null,
    Object? card = null,
    Object? cards = null,
    Object? communities = null,
    Object? error = freezed,
    Object? selectedCommunity = freezed,
    Object? enabledNextButton = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentScreen: null == currentScreen
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as int,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CommunityCard,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CommunityCard>,
      communities: null == communities
          ? _value.communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppException?,
      selectedCommunity: freezed == selectedCommunity
          ? _value.selectedCommunity
          : selectedCommunity // ignore: cast_nullable_to_non_nullable
              as Community?,
      enabledNextButton: null == enabledNextButton
          ? _value.enabledNextButton
          : enabledNextButton // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of SaveCardScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCardCopyWith<$Res> get card {
    return $CommunityCardCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }

  /// Create a copy of SaveCardScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get selectedCommunity {
    if (_value.selectedCommunity == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.selectedCommunity!, (value) {
      return _then(_value.copyWith(selectedCommunity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SaveCardScreenStateImplCopyWith<$Res>
    implements $SaveCardScreenStateCopyWith<$Res> {
  factory _$$SaveCardScreenStateImplCopyWith(_$SaveCardScreenStateImpl value,
          $Res Function(_$SaveCardScreenStateImpl) then) =
      __$$SaveCardScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      int currentScreen,
      CommunityCard card,
      List<CommunityCard> cards,
      List<Community> communities,
      AppException? error,
      Community? selectedCommunity,
      bool enabledNextButton});

  @override
  $CommunityCardCopyWith<$Res> get card;
  @override
  $CommunityCopyWith<$Res>? get selectedCommunity;
}

/// @nodoc
class __$$SaveCardScreenStateImplCopyWithImpl<$Res>
    extends _$SaveCardScreenStateCopyWithImpl<$Res, _$SaveCardScreenStateImpl>
    implements _$$SaveCardScreenStateImplCopyWith<$Res> {
  __$$SaveCardScreenStateImplCopyWithImpl(_$SaveCardScreenStateImpl _value,
      $Res Function(_$SaveCardScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveCardScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? currentScreen = null,
    Object? card = null,
    Object? cards = null,
    Object? communities = null,
    Object? error = freezed,
    Object? selectedCommunity = freezed,
    Object? enabledNextButton = null,
  }) {
    return _then(_$SaveCardScreenStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentScreen: null == currentScreen
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as int,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CommunityCard,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CommunityCard>,
      communities: null == communities
          ? _value._communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppException?,
      selectedCommunity: freezed == selectedCommunity
          ? _value.selectedCommunity
          : selectedCommunity // ignore: cast_nullable_to_non_nullable
              as Community?,
      enabledNextButton: null == enabledNextButton
          ? _value.enabledNextButton
          : enabledNextButton // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SaveCardScreenStateImpl implements _SaveCardScreenState {
  _$SaveCardScreenStateImpl(
      {this.loading = false,
      this.currentScreen = 1,
      this.card = const CommunityCard(),
      final List<CommunityCard> cards = const [],
      final List<Community> communities = const [],
      this.error,
      this.selectedCommunity = null,
      this.enabledNextButton = true})
      : _cards = cards,
        _communities = communities;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final int currentScreen;
  @override
  @JsonKey()
  final CommunityCard card;
  final List<CommunityCard> _cards;
  @override
  @JsonKey()
  List<CommunityCard> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  final List<Community> _communities;
  @override
  @JsonKey()
  List<Community> get communities {
    if (_communities is EqualUnmodifiableListView) return _communities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_communities);
  }

  @override
  final AppException? error;
  @override
  @JsonKey()
  final Community? selectedCommunity;
  @override
  @JsonKey()
  final bool enabledNextButton;

  @override
  String toString() {
    return 'SaveCardScreenState(loading: $loading, currentScreen: $currentScreen, card: $card, cards: $cards, communities: $communities, error: $error, selectedCommunity: $selectedCommunity, enabledNextButton: $enabledNextButton)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveCardScreenStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.currentScreen, currentScreen) ||
                other.currentScreen == currentScreen) &&
            (identical(other.card, card) || other.card == card) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality()
                .equals(other._communities, _communities) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.selectedCommunity, selectedCommunity) ||
                other.selectedCommunity == selectedCommunity) &&
            (identical(other.enabledNextButton, enabledNextButton) ||
                other.enabledNextButton == enabledNextButton));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      currentScreen,
      card,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_communities),
      error,
      selectedCommunity,
      enabledNextButton);

  /// Create a copy of SaveCardScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveCardScreenStateImplCopyWith<_$SaveCardScreenStateImpl> get copyWith =>
      __$$SaveCardScreenStateImplCopyWithImpl<_$SaveCardScreenStateImpl>(
          this, _$identity);
}

abstract class _SaveCardScreenState implements SaveCardScreenState {
  factory _SaveCardScreenState(
      {final bool loading,
      final int currentScreen,
      final CommunityCard card,
      final List<CommunityCard> cards,
      final List<Community> communities,
      final AppException? error,
      final Community? selectedCommunity,
      final bool enabledNextButton}) = _$SaveCardScreenStateImpl;

  @override
  bool get loading;
  @override
  int get currentScreen;
  @override
  CommunityCard get card;
  @override
  List<CommunityCard> get cards;
  @override
  List<Community> get communities;
  @override
  AppException? get error;
  @override
  Community? get selectedCommunity;
  @override
  bool get enabledNextButton;

  /// Create a copy of SaveCardScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveCardScreenStateImplCopyWith<_$SaveCardScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
