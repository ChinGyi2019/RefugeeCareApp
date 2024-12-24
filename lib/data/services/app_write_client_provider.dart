import 'package:appwrite/appwrite.dart';
import 'package:riverpod/riverpod.dart';

// Define a provider for the Appwrite Client
final clientProvider = Provider<Client>((ref) {
  final client = Client();
  client
      .setEndpoint('https://cloud.appwrite.io/v1') // Set the Appwrite endpoint
      .setProject('6768e2a2002cc414437a'); // Set the project ID
  return client;
});

// Define a provider for the Appwrite Client
final databaseProvider = Provider<Databases>((ref) {
  final client = ref.watch(clientProvider);
  final databases = Databases(client);
  return databases;
});

final accountProvider = Provider<Account>((ref) {
  final client = ref.watch(clientProvider);
  final account = Account(client);
  return account;
});
