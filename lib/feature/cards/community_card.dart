import 'package:flutter/material.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class CommunityCardItem extends StatelessWidget {
  CommunityCard card;

  CommunityCardItem({super.key, required this.card, required this.onTap});
  final Function(CommunityCard) onTap;
  @override
  Widget build(BuildContext context) {
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
                    flex: 1,
                    child: Transform.rotate(
                        angle: -0.785398, // -45 degrees in radians
                        child: Text("CRC",
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
                            backgroundImage: AssetImage(card.type),
                          ),
                          gapW8,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                card.type,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'verified',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 14,
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
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression"),
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
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
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
                                        card.id,
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
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
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
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
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
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
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
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
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
                                        'Date of Issue',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
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
                                              fontSize: 12,
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
                                        'Date of Expiry',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
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
                                              fontSize: 12,
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
