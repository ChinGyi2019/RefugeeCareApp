import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/domain/model/contacts/contact.dart';
import 'package:refugee_care_mobile/feature/emergency/presenter/provider/emergency_setup_provider.dart';

final emptyContacts = [
  Contact(name: "", id: "1", phoneNumber: "", logo: "", description: ""),
  Contact(name: "", id: "2", phoneNumber: "", logo: "", description: ""),
  Contact(name: "", id: "3", phoneNumber: "", logo: "", description: "")
];

class EmergencySetupState extends Equatable {
  bool loading;
  int contactNumber;
  int selectedIndex;
  double lat;
  double long;
  bool hasSetup;
  String message;
  List<Contact> contacts;
  GlobalKey<FormState> formKey;
  bool enabledNextButton;

  EmergencySetupState({
    this.loading = false,
    this.contactNumber = 3,
    this.selectedIndex = 0,
    this.lat = 0.0,
    this.long = 0.0,
    this.hasSetup = false,
    this.message = "",
    List<Contact>? contacts,
    GlobalKey<FormState>? formKey,
    this.enabledNextButton = true,
  })  : contacts = contacts ?? emptyContacts,
        formKey = formKey ?? GlobalKey<FormState>();

  EmergencySetupState copyWith({
    bool? loading,
    int? contactNumber,
    int? selectedIndex,
    double? lat,
    double? long,
    bool? hasSetup,
    String? message,
    List<Contact>? contacts,
    GlobalKey<FormState>? formKey,
    bool? enabledNextButton,
  }) {
    return EmergencySetupState(
      loading: loading ?? this.loading,
      contactNumber: contactNumber ?? this.contactNumber,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      hasSetup: hasSetup ?? this.hasSetup,
      message: message ?? this.message,
      contacts: contacts ?? this.contacts,
      formKey: formKey ?? this.formKey,
      enabledNextButton: enabledNextButton ?? this.enabledNextButton,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        contactNumber,
        selectedIndex,
        lat,
        long,
        hasSetup,
        message,
        contacts,
        formKey,
        enabledNextButton,
      ];
}
