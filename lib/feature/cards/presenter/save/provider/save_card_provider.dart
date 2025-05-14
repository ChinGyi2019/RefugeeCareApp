import 'package:geolocator/geolocator.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';
import 'package:refugee_care_mobile/feature/cards/domain/provider/card_repository_provider.dart';
import 'package:refugee_care_mobile/feature/cards/domain/repository/card_repository.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/provider/state/save_card_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
part 'save_card_provider.g.dart';

@riverpod
class SaveCardViewModel extends _$SaveCardViewModel {
  late final CardRepository repository;

  @override
  SaveCardScreenState build() {
    repository = ref.watch(cardRepositoryProvider);
    return SaveCardScreenState();
  }

  Future<void> init() async {
    updateGender('Male');
    await loadCommunity();
    await getCards();
  }

  void updateLoading(bool loading) {
    state = state.copyWith(loading: loading);
  }

  Future<void> loadCommunity() async {
    updateLoading(true);
    final result = await repository.getCommunities();
    result.fold((error) {
      debugPrint(error.message);
      updateLoading(false);
    }, (data) {
      state = state.copyWith(communities: data);
      updateLoading(false);
    });
  }

  void updateFullName(String value) {
    state = state.copyWith(card: state.card.copyWith(name: value));
  }

  void updateCommunity(Community value) {
    state = state.copyWith(
      selectedCommunity: value,
      card: state.card.copyWith(communityId: value.id, community: value),
    );
  }

  void updateCardNumber(String value) {
    state = state.copyWith(card: state.card.copyWith(cardNumber: value));
  }

  void updateDob(String value) {
    state = state.copyWith(card: state.card.copyWith(dateOfBirth: value));
  }

  void updateDateOfIssue(String value) {
    state = state.copyWith(card: state.card.copyWith(dateOfIssue: value));
  }

  void updateNationality(String value) {
    state = state.copyWith(card: state.card.copyWith(nationality: value));
  }

  void updateCardType(String value) {
    state = state.copyWith(card: state.card.copyWith(type: value));
  }

  void updateGender(String value) {
    state = state.copyWith(card: state.card.copyWith(gender: value));
  }

  void updateFrontCard(String value) {
    state = state.copyWith(card: state.card.copyWith(frontSidePhoto: value));
  }

  void updatePassport(String value) {
    state = state.copyWith(card: state.card.copyWith(passportPhoto: value));
  }

  void updateBackCard(String value) {
    state = state.copyWith(card: state.card.copyWith(backSidePhoto: value));
  }

  void updateStudentNumber(String value) {
    state = state.copyWith(card: state.card.copyWith(studentNumber: value));
  }

  void updateCurrentScreen(int value) {
    state = state.copyWith(currentScreen: value);
  }

  bool validateStep2() {
    return state.card.passportPhoto.isNotEmpty == true &&
        state.card.frontSidePhoto.isNotEmpty == true &&
        state.card.backSidePhoto.isNotEmpty == true;
  }

  Future<void> getCards() async {
    updateLoading(true);
    final result = await repository.getCards();
    result.fold((error) {
      debugPrint(error.message);
      updateLoading(false);
    }, (data) {
      state = state.copyWith(cards: data);
      updateLoading(false);
    });
  }

  Future<void> report(String officerType, String city, Position? position,
      Function() onSuccess) async {
    debugPrint(position?.latitude.toString());
    updateLoading(true);
    final result =
        await repository.report(officerType, city, position, card: state.card);
    result.fold((failure) {
      debugPrint(failure.identifier.toString());
      state = state.copyWith(error: failure, loading: false);
    }, (data) {
      state = state.copyWith(loading: false);
      onSuccess();
    });
  }

  Future<void> submit(Function() onSuccess) async {
    updateLoading(true);
    final result = await repository.submitCard(card: state.card);
    result.fold((failure) {
      debugPrint(failure.identifier.toString());
      state = state.copyWith(error: failure, loading: false);
    }, (data) {
      state = state.copyWith(cards: data, loading: false);
      onSuccess();
    });
  }

  // void save() {
  //   if (validateStep1()) {
  //     //state.formKey.currentState?.save();
  //     state = state.copyWith(currentScreen: 2);
  //   }
  // }
}
