import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/feature/cards/domain/cards/community_card.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_card_state.freezed.dart';

@freezed
class SaveCardScreenState with _$SaveCardScreenState {
  factory SaveCardScreenState({
    @Default(false) bool loading,
    @Default(1) int currentScreen,
    @Default(CommunityCard()) CommunityCard card,
    @Default([]) List<CommunityCard> cards,
    @Default([]) List<Community> communities,
    AppException? error,
    @Default(null) Community? selectedCommunity,
    @Default(true) bool enabledNextButton,
  }) = _SaveCardScreenState;
}
