import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/feature/cards/domain/cards/community_card.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';

class SaveCardScreenState {
  bool loading;
  var currentScreen = 1;
  var card = CommunityCard.empty();
  var cards = List<CommunityCard>.empty();
  var communities = List<Community>.empty();
  var selectedCommunity =
      Community(name: '', id: '', shortName: '', logo: '', description: '');
  final formKey = GlobalKey<FormState>();
  bool enabledNextButton;
  SaveCardScreenState({this.loading = false, this.enabledNextButton = true});
}
