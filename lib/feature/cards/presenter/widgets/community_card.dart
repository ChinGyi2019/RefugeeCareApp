import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/data/services/app_write_client_provider.dart';
import 'package:refugee_care_mobile/feature/cards/domain/cards/community_card.dart';
import 'package:refugee_care_mobile/main/appConfig/app_env.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/shared/extensions/image_url_extensions.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_loading.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class CommunityCardItem extends HookConsumerWidget {
  CommunityCard card;

  CommunityCardItem({super.key, required this.card, required this.onTap});
  final Function(CommunityCard) onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.watch(storageProvider);
    return GestureDetector(
        onTap: () {
          onTap(card);
        },
        child: Card(
          elevation: 2,
          color: AppColors.white,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Stack(alignment: AlignmentDirectional.center, children: [
                Expanded(
                    child: Transform.rotate(
                        angle: -0.785398, // -45 degrees in radians
                        child: Text(card.community.shortName,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 80,
                                    letterSpacing: 8,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.bgLight)))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(
                                  getImageUrl(card.community.logo))),
                          // FutureBuilder(
                          //     future: storage.getFilePreview(
                          //       bucketId: EnvInfo.buckedId,
                          //       fileId: card.community.logo,

                          //       // optional
                          //     ), // Works for both public file and private file, for private files you need to be logged in
                          //     builder: (context, snapshot) {
                          //       return snapshot.hasData && snapshot.data != null
                          //           ? CircleAvatar(
                          //               radius: 28,
                          //               backgroundImage:
                          //                   MemoryImage(snapshot.data!),
                          //             )
                          //           : RefugeeLoading(
                          //               strokeWidth: 1,
                          //             );
                          //     }),
                          gapW8,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                card.community.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                              ),
                              Text(
                                card.isVerified ? 'verified' : 'processing',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                              )
                            ],
                          )
                        ]),
                    gapH8,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.bgLight,
                            borderRadius: BorderRadius.circular(
                                8), // Optional: for rounded corners
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(getImageUrl(card.passportPhoto)),
                            ),
                          ),
                        ),
                        gapW8,
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'ID',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      )),
                                  Text(
                                    ':',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  gapW4,
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        card.cardNumber,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      )),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      )),
                                  Text(
                                    ':',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  gapW4,
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        card.name,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      )),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Gender',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      )),
                                  Text(
                                    ':',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  gapW4,
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        card.gender,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      )),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Birth date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(fontSize: 14),
                                      )),
                                  Text(
                                    ':',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  gapW4,
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        card.dateOfBirth,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      )),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Nationality',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(fontSize: 14),
                                      )),
                                  Text(
                                    ':',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  gapW4,
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        card.nationality,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      )),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Issued date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(fontSize: 14),
                                      )),
                                  Text(
                                    ':',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  gapW4,
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        card.dateOfIssue,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      )),
                                ],
                              ),
                              if (card.dateOfExpiry.isNotEmpty)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Expiry date',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 14,
                                              ),
                                        )),
                                    Text(
                                      ':',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    gapW4,
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          card.dateOfExpiry,
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                        )),
                                  ],
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ])),
        ));
  }
}
