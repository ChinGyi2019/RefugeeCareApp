import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/domain/model/advertisement/advertisement.dart';
import 'package:refugee_care_mobile/feature/advertisement/advertisement_list_content.dart';
import 'package:refugee_care_mobile/feature/directory/directory_list_content.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class AdvertisementDetailScreen extends StatefulWidget {
  AdvertisementDetailScreen(
      {super.key, required this.title, required this.advertisement});
  static const String routeName = '/advertisement-detail';
  final String title;
  Advertisement advertisement;
  @override
  State<AdvertisementDetailScreen> createState() =>
      _AdvertisementDetailScreenState();
}

class _AdvertisementDetailScreenState extends State<AdvertisementDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
        shadowColor: null,
        centerTitle: false,
        backgroundColor: AppColors.primaryLight,
        title: Text(
          'Advertisement Detail',
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
      body: ListView(children: [
        // Expanded(
        //     child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        ClipRRect(
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(16.0),
          //   topRight: Radius.circular(16.0),
          // ),
          child: Image.asset(
            'assets/bg/bg_for_promotion.png',
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.advertisement.title,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 16)),
                  gapH8,
                  Row(
                    children: [
                      Text(widget.advertisement.date,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                      gapW8,
                      Text("posed by ${widget.advertisement.owner}",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 12))
                    ],
                  ),
                  gapH8,
                  Text(widget.advertisement.description,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleLight)),
                ]))

        //     )
      ]),
    );
  }
}
