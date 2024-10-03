import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/list/card_list.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key, required this.title});

  final String title;

  @override
  State<MyCardsPage> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsPage> {
  @override
  Widget build(BuildContext context) {
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
          Expanded(child: RefugeeCardList())
        ]));
  }
}
