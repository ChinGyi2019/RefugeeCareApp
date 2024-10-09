import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';
import 'package:refugee_care_mobile/feature/cards/domain/repository/card_repository.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/provider/state/save_card_state.dart';

class SaveCardNotifier with ChangeNotifier {
  CardRepository repository;
  SaveCardNotifier({required this.repository});
  final _state = SaveCardScreenState();
  SaveCardScreenState get state => _state;
  Future<void> init() async {
    // updateCommunity(Community.dummyCommunities.first);
    updateGender('Male');
    await loadCommuniy();
    await getCards();
  }

  void updateLoading(bool loading) {
    _state.loading = loading;
    notifyListeners();
  }

  Future<void> loadCommuniy() async {
    updateLoading(true);
    final result = await repository.getCommunities();
    result.fold((error) {
      debugPrint(error.message);
      updateLoading(false);
    }, (data) {
      _state.communities = data;
      updateLoading(false);
      notifyListeners();
    });
  }

  void updateFullName(String value) {
    _state.card.name = value;
    notifyListeners();
  }

  void updateCommunity(Community value) {
    _state.selectedCommunity = value;
    _state.card.communityId = value.id;
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

  Future<void> getCards() async {
    updateLoading(true);
    final result = await repository.getCards();
    result.fold((error) {
      debugPrint(error.message);
      updateLoading(false);
    }, (data) {
      _state.cards = data;
      updateLoading(false);
      notifyListeners();
    });
  }

  Future<void> sumbit(Function() onSuccess) async {
    updateLoading(true);
    final result = await repository.submitCard(card: _state.card);
    result.fold((failure) {
      debugPrint(failure.identifier.toString());
      updateLoading(false);
    }, (data) {
      updateLoading(false);
      state.cards = data;
      onSuccess();
      clear();
    });
    notifyListeners();
  }

  void clear() {
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
