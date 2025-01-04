import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_care_mobile/domain/model/advertisement/advertisement.dart';
import 'package:refugee_care_mobile/domain/model/notification/refugee_notification.dart';
import 'package:refugee_care_mobile/feature/cards/domain/cards/community_card.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default(false) bool isLoading,
    @Default([]) List<CommunityCard> cards,
    @Default([]) List<Advertisement> advertisements,
    @Default([]) List<RefugeeNotification> notifications,
  }) = _HomeScreenState;
}
