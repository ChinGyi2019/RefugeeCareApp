import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/feature/directory/directory_list_content.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class DirectoryScreen extends StatefulWidget {
  const DirectoryScreen({super.key, required this.title});

  final String title;

  @override
  State<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
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
              'Directory',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 18),
            ),
          ),
          Expanded(child: DirectoryListContent())
        ]));
  }
}
