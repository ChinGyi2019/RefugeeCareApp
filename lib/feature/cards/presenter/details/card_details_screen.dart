import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/widgets/community_card.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/provider/save_card_provider.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class CardDetailsScreen extends ConsumerStatefulWidget {
  const CardDetailsScreen({super.key, required this.title, required this.card});
  static const String routeName = '/card-details';
  final String title;
  final CommunityCard card;

  @override
  ConsumerState<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends ConsumerState<CardDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(saveCardProvider);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
          shadowColor: null,
          centerTitle: false,
          backgroundColor: AppColors.primaryLight,
          leading: context.canPop()
              ? IconButton(
                  icon: const Icon(Icons.chevron_left_sharp),
                  color: AppColors.primary,
                  iconSize: 32, // Customize your icon here
                  onPressed: () {
                    if (provider.state.currentScreen == 2) {
                      provider.updateCurrentScreen(1);
                      return;
                    }
                    Navigator.pop(context);
                  },
                )
              : null,
          title: Text(
            'Save your card',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontSize: 18),
          ),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            width: double.infinity,
            height: double.infinity,
            child: ListView(children: [
              CommunityCardItem(card: widget.card, onTap: (card) {}),
              SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                        color: AppColors.textGrey, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    elevation: 0,
                    color: AppColors.bgLight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Registered with UNHCR",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16)),
                          gapH8,
                          Text(
                              "Pemegang Kad ini adalah seorang etnik Chin dari Myanmar.Beliau adalah seorang percari suaka yang berdaftar denganJawatankuasa Pelarian Chin Malaysia. Beliau sedang menunggu proses pendaftaran dengan UNHCR untuk permohonan status pelarian dibawahMandat UNHCR (Konvensi Pelarian, 1951).Segala pertolongan yang boleh di beri kepadanya amat dihargai. Bagi sebarang pertanyaan berhubung pencari suaka ini,sila hubungi pejabat CRC atau UNHCR:\nUNHCR main office\nTel: 03-2118 4800Fax: 03-2141 1780\nEmail: mislu@unhcr.org",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.titleLight)),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                        color: AppColors.textGrey, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    elevation: 0,
                    color: AppColors.bgLight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Verified by ${widget.card.type}",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16)),
                          gapH8,
                          Text(
                              "${widget.card.type} is community-based volunteer organization working to provide social services to promote the protection of Chin Refugees in Malaysia who have escaped human right violations and religious persecution from Myanmar. ${widget.card.type} works to assist and facilitate the work of the United Nations High Commissioner for Refugee(UNHCR) office in Kuala Lumpur.",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.titleLight)),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                        color: AppColors.textGrey, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    elevation: 0,
                    color: AppColors.bgLight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contact Us",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16)),
                          gapH8,
                          Text(
                              "If there is any urgent case, you can directly reach out to us."
                              "\n\nCRC main officeTel: 03-21184800\nEmail: crcmalaysia2011@yahoo.com",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.titleLight)),
                          gapH16,
                          Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
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
                                                  color: AppColors.white,
                                                  fontSize: 16))
                                    ],
                                  )),
                              gapW16,
                              ElevatedButton(
                                  onPressed: () {},
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
                                                  color: AppColors.white,
                                                  fontSize: 16))
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ])));
  }
}
