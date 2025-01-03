import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/advertisement/presenter/advertisement_list_content.dart';
import 'package:refugee_care_mobile/feature/advertisement/provider/advertisement_view_model.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_loading.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class AdvertisementScreen extends StatefulHookConsumerWidget {
  const AdvertisementScreen({super.key, required this.title});
  static const String routeName = '/advertisement';
  final String title;

  @override
  ConsumerState<AdvertisementScreen> createState() =>
      _AdvertisementScreenState();
}

class _AdvertisementScreenState extends ConsumerState<AdvertisementScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(advertisementViewModelProvider);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
          shadowColor: null,
          centerTitle: false,
          backgroundColor: AppColors.primaryLight,
          title: Text(
            'Advertisement',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontSize: 18),
          ),
          leading: context.canPop()
              ? IconButton(
                  icon: const Icon(Icons.chevron_left_sharp),
                  color: AppColors.primary,
                  iconSize: 32, // Customize your icon here
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : null,
        ),
        body: state.when(
            data: (data) {
              return Column(children: [
                Expanded(
                    child: AdvertisementListContent(
                  advertisements: data,
                ))
              ]);
            },
            loading: () => const RefugeeLinearLoading(),
            error: (error, _) => Center(
                  child: Text(error.toString()),
                )));
  }
}
