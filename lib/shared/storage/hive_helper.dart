import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:refugee_care_mobile/domain/model/contacts/contact.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HiveHelper {
  // key
  static String CONTACT_KEY = "contact-key";
  static String MESSAGE_KEY = "message-key";
  static String PERSONAL_KEY = "personal-key";
  // boxes
  late Box<Contact> contactBox;
  // late Box<String> personalBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ContactAdapter());
    // personalBox = await Hive.openBox(PERSONAL_KEY);
    contactBox = await Hive.openBox<Contact>(CONTACT_KEY);
  }

  // Listenable getContacts() {
  //   return contactBox.listenable(keys: [CONTACT_KEY]).value.values.toList();
  // }

  List<Contact> getContactList() {
    // return contactBox.listenable(keys: [CONTACT_KEY]).value.values.toList();
    return contactBox.values.toList();
  }

  String? getMessage() {
    return ""; //  personalBox.get(MESSAGE_KEY);
  }

  Future<void> saveMessage(String message) async {
    // await personalBox.put(MESSAGE_KEY, message);
  }

  Future<void> addContact(List<Contact> contacts) async {
    await contactBox.clear();

    for (var i = 0; i < contacts.length; i++) {
      if (contacts[i].phoneNumber.isNotEmpty) {
        await contactBox.add(contacts[i]);
      }
    }
  }

  // Future<void> addTask(Task task) async {
  //   await taskBox.add(task);
  // }

  // Future<void> updateTask(int index, Task task) async {
  //   await taskBox.putAt(index, task);
  // }

  Future<void> deletetContact(int index) async {
    await contactBox.deleteAt(index);
  }
}
