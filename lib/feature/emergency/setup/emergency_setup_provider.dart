import 'dart:core';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:refugee_care_mobile/domain/model/contacts/contact.dart';
import 'package:refugee_care_mobile/domain/repositroy/contact_repository.dart';
import 'package:url_launcher/url_launcher_string.dart';

final emptyContacts = [
  Contact(name: "", id: "1", phoneNumber: "", logo: "", description: ""),
  Contact(name: "", id: "2", phoneNumber: "", logo: "", description: ""),
  Contact(name: "", id: "3", phoneNumber: "", logo: "", description: "")
];

class EmergencySetupState {
  final bool loading;
  var contactNumber = 3;
  var selectedIndex = 0;
  double lat = 0.0;
  double long = 0.0;
  var hasSetup = false;

  String message = "";
  List<Contact> contacts = emptyContacts;

  final formKey = GlobalKey<FormState>();
  bool enabledNextButton;
  EmergencySetupState({this.loading = false, this.enabledNextButton = true});
}

class EmergencySetupProvider extends ChangeNotifier {
  EmergencySetupProvider({required this.contactRepository});
  final ContactRepository contactRepository;

  var state = EmergencySetupState();
  // EmergencySetupState get sstate => state;
  void init() async {
    state.formKey.currentState?.reset();

    var listFromDb = contactRepository.getContactList();
    var message = contactRepository.getMessage();
    state.message = message;

    for (var i = 0; i < listFromDb.length; i++) {
      state.contacts[i] = listFromDb[i];
    }
    state.hasSetup = state.contacts
        .where(
          (element) => element.phoneNumber.isNotEmpty,
        )
        .isNotEmpty;
    if (listFromDb.isNotEmpty) {
      state.selectedIndex = listFromDb.length - 1;
    }

    await getCurrentLocation();
    notifyListeners();
  }

  Future<Position?> getCurrentLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        print("Location permissions are denied");
        return null;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    state.lat = position.latitude;
    state.long = position.longitude;

    return position;
  }

  void sendSMS() async {
    // Request SMS permission
    // PermissionStatus permission = await Permission.sms.request();
    if (Platform.isAndroid || Platform.isIOS) {
      Position? position = await getCurrentLocation();
      // if (permission.isGranted || Platform.isIOS) {
      String recipients = state.contacts
          .where(
            (element) => element.phoneNumber.isNotEmpty,
          )
          .map((item) => item.phoneNumber)
          .toList()
          .join(',');
      String googleMapsUrl =
          'Please copy and paste the following coordinates into the Google Maps app:\n[${position?.latitude}, ${position?.longitude}].';
      String fullMessage = '${state.message} $googleMapsUrl';
      String smsUrl = 'sms:$recipients?body=$fullMessage';

      await launchUrlString(smsUrl);
    } else {
      print('unsupported platform');
    }
  }

  void updateFullName(int index, String value) {
    state.contacts[index].name = value;
    notifyListeners();
  }

  void updatePhoneNumber(int index, String value) {
    state.contacts[index].phoneNumber = value;
    notifyListeners();
  }

  void updateSelectedNumber(int value) {
    state.selectedIndex = value;
    notifyListeners();
  }

  void updateMessage(String message) {
    state.message = message;
    notifyListeners();
  }

  bool validate() {
    return state.formKey.currentState?.validate() ?? false;
  }

  void sumbit(Function() onSuccess) async {
    if (validate()) {
      state.formKey.currentState?.save();
      contactRepository.saveMessage(state.message);
      if (state.contacts.length <= 3) {
        final list = state.contacts.sublist(0, state.selectedIndex + 1);
        state.hasSetup = list
            .where(
              (element) => element.phoneNumber.isNotEmpty,
            )
            .isNotEmpty;
        contactRepository.addContact(list);
      }

      onSuccess();
    }
    notifyListeners();
  }

  void clear() {
    // _state = EmergencySetupState();
    for (var i = 0; i < state.contacts.length; i++) {
      updateFullName(i, '');
      updatePhoneNumber(i, '');
    }
    state.formKey.currentState?.reset();
    notifyListeners();
  }
}
