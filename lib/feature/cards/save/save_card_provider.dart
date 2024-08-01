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

class SaveCardProvider with ChangeNotifier {
  var _state = SaveCardScreenState();
  SaveCardScreenState get state => _state;
  void init() {
    updateCommunity(Community.dummyCommunities.first);
    updateGender('Male');
  }

  void updateFullName(String value) {
    _state.card.name = value;
    notifyListeners();
  }

  void updateCommunity(Community value) {
    _state.selectedCommunity = value;
    notifyListeners();
  }

  void updateCardNumber(String value) {
    _state.card.cardNumber = value;
    notifyListeners();
  }

  void updateDob(String value) {
    _state.card.dateOfBirth = value;
    notifyListeners();
  }

  void updateDateOfIssue(String value) {
    _state.card.dateOfIssue = value;
    notifyListeners();
  }

  void updateNationality(String value) {
    _state.card.nationality = value;
    notifyListeners();
  }

  void updateCardType(String value) {
    _state.card.type = value;
    notifyListeners();
  }

  void updateGender(String value) {
    _state.card.gender = value;
    notifyListeners();
  }

  void updateFontCard(String value) {
    _state.card.frontSidePhoto = value;
    notifyListeners();
  }

  void updatePasspord(String value) {
    _state.card.passportPhoto = value;
    notifyListeners();
  }

  void updateBackCard(String value) {
    _state.card.backSidePhoto = value;
    notifyListeners();
  }

  void updateStudentNumber(String value) {
    _state.card.studentNumber = value;
    notifyListeners();
  }

  void updateCurrentScreen(int value) {
    _state.currentScreen = value;
    notifyListeners();
  }

  bool validateSetp1() {
    return _state.formKey.currentState?.validate() ?? false;
  }

  bool validateSetp2() {
    return _state.card.passportPhoto.isNotEmpty &&
        _state.card.frontSidePhoto.isNotEmpty &&
        _state.card.backSidePhoto.isNotEmpty;
  }

  void sumbit(Function() onSuccess) {
    onSuccess();
    clear();
    updateCommunity(Community.dummyCommunities.first);
    updateGender('Male');
  }

  void clear() {
    _state = SaveCardScreenState();
    notifyListeners();
  }

  void save() {
    if (validateSetp1()) {
      _state.formKey.currentState?.save();
      _state.currentScreen = 2;
    }
    notifyListeners();
  }
}
