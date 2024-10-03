import 'package:refugee_care_mobile/domain/model/contacts/contact.dart';
import 'package:refugee_care_mobile/feature/emergency/domain/repository/contact_repository.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';

class ContactRepositoryImpl implements ContactRepository {
  // final Box<Contact> contacts;
  ContactRepositoryImpl({required this.hiveHelper});
  HiveHelper hiveHelper;
  @override
  List<Contact> getContactList() {
    return hiveHelper.getContactList();
  }

  @override
  Future<void> addContact(List<Contact> contacts) async {
    hiveHelper.addContact(contacts);
  }

  @override
  Future<void> saveMessage(String message) async {
    hiveHelper.saveMessage(message);
  }

  @override
  String getMessage() {
    return hiveHelper.getMessage() ??
        "Hey, I am having problem! Please contact to me.";
  }
}
