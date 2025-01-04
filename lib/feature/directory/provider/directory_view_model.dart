import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/domain/provider/customer/customer_repository_provider.dart';
import 'package:refugee_care_mobile/feature/directory/provider/state/directory_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'directory_view_model.g.dart';

@riverpod
class DirectoryViewModel extends _$DirectoryViewModel {
  @override
  Directoryscreenstate build() {
    return const Directoryscreenstate();
  }

  Future<void> fetchDirectories() async {
    setLoading(true);
    final result =
        await ref.read(customerDataSourceProvider).fetchDirectories(state.tags);
    return result.fold((error) {
      debugPrint(error.toString());
    }, (data) {
      state = state.copyWith(directories: data, isLoading: false);
    });
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
