import 'package:refugee_care_mobile/domain/model/contacts/contact.dart';

abstract class ContactRepository {
  List<Contact> getContactList();
  String getMessage();
  Future<void> saveMessage(String message);
  Future<void> addContact(List<Contact> contacts);
}
