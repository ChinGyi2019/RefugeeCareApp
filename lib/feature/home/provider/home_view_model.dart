import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/domain/provider/customer/customer_repository_provider.dart';
import 'package:refugee_care_mobile/feature/cards/domain/provider/card_repository_provider.dart';
import 'package:refugee_care_mobile/feature/home/provider/state/home_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_view_model.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenViewModel extends _$HomeScreenViewModel {
  @override
  HomeScreenState build() {
    return const HomeScreenState();
  }

  Future<void> loadData() async {
    if (state.notifications.isEmpty) await fetchNotifications();
    if (state.advertisements.isEmpty) await fetchAdvertisements();
    if (state.cards.isEmpty) await fetchCards();
  }

  Future<void> fetchNotifications() async {
    setLoading(true);
    final result =
        await ref.read(customerRepositoryProvider).fetchRefugeeNotifications();
    return result.fold((error) {
      debugPrint(error.toString());
    }, (data) {
      state = state.copyWith(notifications: data, isLoading: false);
    });
  }

  Future<void> fetchAdvertisements() async {
    setLoading(true);
    final result =
        await ref.read(customerRepositoryProvider).fetchAdvertisements();
    return result.fold((error) {
      debugPrint(error.toString());
    }, (data) {
      state = state.copyWith(advertisements: data, isLoading: false);
    });
  }

  Future<void> fetchCards() async {
    setLoading(true);
    final result = await ref.read(cardRepositoryProvider).getCards();
    return result.fold((error) {
      debugPrint(error.toString());
    }, (data) {
      state = state.copyWith(cards: data, isLoading: false);
    });
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
