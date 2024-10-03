import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';

class SaveCardScreenState {
  final bool loading;
  var currentScreen = 1;
  var card = CommunityCard.empty();
  var selectedCommunity =
      Community(name: '', id: '', shortName: '', logo: '', description: '');
  final formKey = GlobalKey<FormState>();
  bool enabledNextButton;
  SaveCardScreenState({this.loading = false, this.enabledNextButton = true});
}
