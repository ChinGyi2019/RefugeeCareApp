import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/domain/model/directory/directory.dart';
import 'package:refugee_care_mobile/shared/constants/Default.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectoryCard extends HookConsumerWidget {
  DirectoryCard({super.key, required this.directory, required this.onTap});
  Directory directory;
  final Function(Directory) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isExpended = useState(false);
    return GestureDetector(
        onTap: () {
          isExpended.value = !isExpended.value;
        },
        child: Card(
            elevation: 2,
            color: AppColors.white,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: AppColors.primaryLight,
                              backgroundImage: NetworkImage(
                                  directory.image.firstOrNull ?? ""),
                              child: directory.image.isEmpty &&
                                      directory.name.isNotEmpty
                                  ? Text(
                                      directory.name[0].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primary),
                                    )
                                  : null,
                            ),
                            gapW8,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    directory.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    directory.job,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            isExpended.value
                                ? IconButton(
                                    icon: Icon(Icons.keyboard_arrow_up),
                                    onPressed: () {
                                      isExpended.value = false;
                                    })
                                : IconButton(
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    onPressed: () {
                                      isExpended.value = true;
                                    })
                          ]),
                      gapH16,
                      if (isExpended.value)
                        Column(
                          children: [
                            Text(
                              directory.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                            ),
                            gapH16,
                          ],
                        ),
                      Row(
                        children: [
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDefaults.largeBorderRadius)),
                              ),
                              onPressed: () {
                                if (directory.email.isNotEmpty) {
                                  launchUrl(Uri.parse(
                                      'mailto:${directory.email.firstOrNull}'));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Email address not available')),
                                  );
                                }
                              },
                              child: Row(
                                children: [
                                  const Icon(Icons.email_outlined),
                                  gapW8,
                                  Text("Email",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primary,
                                              fontSize: 14))
                                ],
                              )),
                          gapW16,
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDefaults.largeBorderRadius)),
                              ),
                              onPressed: () {
                                if (directory.phone.isNotEmpty) {
                                  launchUrl(Uri.parse(
                                      'tel:${directory.phone.firstOrNull}'));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Phone number not available')),
                                  );
                                }
                              },
                              child: Row(
                                children: [
                                  const Icon(Icons.phone),
                                  gapW8,
                                  Text("Call",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primary,
                                              fontSize: 14))
                                ],
                              )),
                        ],
                      )
                    ]))));
  }
}
