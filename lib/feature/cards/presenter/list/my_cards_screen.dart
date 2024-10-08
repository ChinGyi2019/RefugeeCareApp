import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/list/card_list.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/provider/save_card_provider.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_loading.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class MyCardsPage extends ConsumerStatefulWidget {
  const MyCardsPage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyCardsPage> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends ConsumerState<MyCardsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = ref.watch(saveCardProvider.notifier);
      await provider.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(saveCardProvider);
    return Container(
        color: AppColors.bgLight,
        child: Column(children: [
          AppBar(
            elevation: 0,
            toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
            shadowColor: null,
            centerTitle: false,
            backgroundColor: AppColors.primaryLight,
            title: Text(
              'My Cards',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 18),
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              RefugeeCardList(cards: provider.state.cards),
              if (provider.state.loading)
                const Align(
                  alignment: Alignment.center,
                  child: RefugeeLoading(),
                )
            ],
          ))
        ]));
  }
}
