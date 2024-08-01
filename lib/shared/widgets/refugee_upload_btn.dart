import 'dart:io';

import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class RefugeeUploadBtn extends StatelessWidget {
  const RefugeeUploadBtn(
      {super.key,
      required this.title,
      this.isSelected = false,
      this.onTap,
      this.imageURL = ""});
  final String title;
  final bool isSelected;
  final String imageURL;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Stack(alignment: AlignmentDirectional.center, children: [
          if (imageURL.isNotEmpty)
            Container(
                width: 150,
                height: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.bgLight,
                    border: Border.all(
                      color: AppColors.textGrey, // Border color
                      width: 1.5, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                            File(imageURL))) // Optional: for rounded corners
                    )),
          if (imageURL.isEmpty)
            Container(
              width: 160,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: AppColors.textGrey, // Border color
                  width: 1, // Border width
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: AppColors.textGrey,
                    iconSize: 24, // Customize your icon here
                    onPressed: () {},
                  ),
                  Text(title,
                      maxLines: 2,
                      style: TextStyle(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textGrey,
                          fontWeight: FontWeight.w700,
                          fontSize: 12)),
                ],
              ),
            )
        ]));

    //     width: 150,
    //     height: 70,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(8)),
    //         border: Border.all(
    //           color: isSelected ? AppColors.primary : AppColors.textGrey,
    //           width: 1.0,
    //         )),
    //     child: Row(
    //       children: [
    //         IconButton(
    //           icon: const Icon(Icons.add),
    //           color: AppColors.textGrey,
    //           iconSize: 24, // Customize your icon here
    //           onPressed: () {},
    //         ),
    //         Text(title,
    //             style: TextStyle(
    //                 color: isSelected ? AppColors.primary : AppColors.textGrey,
    //                 fontWeight: FontWeight.w700)),
    //       ],
    //     ));
  }
}
