import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';
import 'package:refugee_care_mobile/domain/model/profile/profile.dart';

class RegisterScreenState {
  final bool loading;

  String name = "";
  String password = "";
  bool obscurePasswod = true;
  String confirmedPassword = "";
  bool obscureConfirmPasswod = true;
  String email = "";
  String phoneNo = "";

  final formKey = GlobalKey<FormState>();
  bool enabledNextButton;
  RegisterScreenState({this.loading = false, this.enabledNextButton = true});
}

class RegisterProvider with ChangeNotifier {
  var _state = RegisterScreenState();
  RegisterScreenState get state => _state;
  void init() {}

  void updateFullName(String value) {
    _state.name = value;
    notifyListeners();
  }

  void updatePhoneNo(String value) {
    _state.phoneNo = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    _state.email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _state.password = value;
    notifyListeners();
  }

  void updateObsurePassword(bool value) {
    _state.obscurePasswod = value;
    notifyListeners();
  }

  void updateObsureConfirmPassword(bool value) {
    _state.obscureConfirmPasswod = value;
    notifyListeners();
  }

  void updateConfiremdPassword(String value) {
    _state.confirmedPassword = value;
    notifyListeners();
  }

  // void updateNationality(String value) {
  //   _state.card.nationality = value;
  //   notifyListeners();
  // }

  // void updateCardType(String value) {
  //   _state.card.type = value;
  //   notifyListeners();
  // }

  // void updateGender(String value) {
  //   _state.card.gender = value;
  //   notifyListeners();
  // }

  // void updateFontCard(String value) {
  //   _state.card.frontSidePhoto = value;
  //   notifyListeners();
  // }

  // void updatePasspord(String value) {
  //   _state.card.passportPhoto = value;
  //   notifyListeners();
  // }

  // void updateBackCard(String value) {
  //   _state.card.backSidePhoto = value;
  //   notifyListeners();
  // }

  // void updateStudentNumber(String value) {
  //   _state.card.studentNumber = value;
  //   notifyListeners();
  // }

  // void updateCurrentScreen(int value) {
  //   _state.currentScreen = value;
  //   notifyListeners();
  // }

  bool validate() {
    return _state.formKey.currentState?.validate() ?? false;
  }

  void sumbit(Function() onSuccess) {
    if (validate()) {
      _state.formKey.currentState?.save();
      onSuccess();
    }
  }

  void clear() {
    _state = RegisterScreenState();
    notifyListeners();
  }
}
