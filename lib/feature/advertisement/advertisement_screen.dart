import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/feature/advertisement/advertisement_list_content.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class AdvertisementScreen extends StatefulWidget {
  const AdvertisementScreen({super.key, required this.title});
  static const String routeName = '/advertisement';
  final String title;

  @override
  State<AdvertisementScreen> createState() => _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementScreen> {
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
          const Expanded(child: AdvertisementListContent())
        ]));
  }
}
