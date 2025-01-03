import 'package:refugee_care_mobile/domain/model/advertisement/advertisement.dart';
import 'package:refugee_care_mobile/domain/provider/customer/customer_repository_provider.dart';
// import 'package:refugee_care_mobile/domain/provider/advertisement/advertisement_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'advertisement_view_model.g.dart';

@riverpod
class AdvertisementViewModel extends _$AdvertisementViewModel {
  @override
  Future<List<Advertisement>> build() async {
    return await fetchAdvertisements();
  }

  Future<List<Advertisement>> fetchAdvertisements() async {
    final result =
        await ref.read(customerRepositoryProvider).fetchAdvertisements();
    return result.fold((error) {
      throw error;
    }, (data) {
      return data;
    });
  }

  Future<void> setAsViewed(Advertisement advertisement) async {
    // if (advertisement.isViewed) {
    //   debugPrint("${advertisement.title} is already viewed");
    //   return;
    // }
    // state = await AsyncValue.guard(() async {
    //   final result = await ref
    //       .read(advertisementRepositoryProvider)
    //       .setAdAsViewed(advertisement.id);
    //   return result.fold((error) {
    //     throw error;
    //   }, (data) {
    //     return data.isNotEmpty ? data : state.requireValue;
    //   });
    // });
  }

  // Future<void> refreshAdvertisements() async {
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() => fetchAdvertisements());
  // }
}
