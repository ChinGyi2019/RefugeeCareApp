import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/domain/model/advertisement/advertisement.dart';
import 'package:refugee_care_mobile/feature/advertisement/presenter/advertisement_item.dart';
import 'package:refugee_care_mobile/feature/advertisement/presenter/detail/advertisement_detail_screen.dart';

List<Advertisement> getDummyAdvertisements() {
  return [
    Advertisement(
      title: 'Crusade Sawm nak',
      id: '1',
      tag: 'Crusade',
      backDrop: 'https://example.com/images/super_sale.jpg',
      date: '2023-01-01',
      dateOfExpiry: '2023-01-10',
      owner: 'Bual',
      description:
          'A ni 28.7.2024 in 4.8.2024 tiang Bual Biakinn ah crusde tuah a si lai. Rev. Tuan Peng Thang nih zarh khat chung a kn cawng piak te lai.\nContact : +60111 2634097',
    ),
    Advertisement(
      title: 'New Collection',
      id: '2',
      tag: 'Fashion',
      backDrop: 'https://example.com/images/new_collection.jpg',
      date: '2023-02-01',
      dateOfExpiry: '2023-02-28',
      owner: 'Store2',
      description:
          'Check out our brand new fashion collection for this season.',
    ),
    Advertisement(
      title: 'Tech Expo',
      id: '3',
      tag: 'Technology',
      backDrop: 'https://example.com/images/tech_expo.jpg',
      date: '2023-03-15',
      dateOfExpiry: '2023-03-20',
      owner: 'TechCorp',
      description:
          'Join us at the annual tech expo showcasing the latest innovations.',
    ),
    Advertisement(
      title: 'Holiday Deals',
      id: '4',
      tag: 'Travel',
      backDrop: 'https://example.com/images/holiday_deals.jpg',
      date: '2023-04-01',
      dateOfExpiry: '2023-04-15',
      owner: 'TravelAgency',
      description: 'Exclusive holiday packages at unbeatable prices.',
    ),
    Advertisement(
      title: 'Healthy Living',
      id: '5',
      tag: 'Health',
      backDrop: 'https://example.com/images/healthy_living.jpg',
      date: '2023-05-10',
      dateOfExpiry: '2023-05-20',
      owner: 'HealthStore',
      description: 'Discover our range of health and wellness products.',
    ),
    Advertisement(
      title: 'Car Show',
      id: '6',
      tag: 'Automobile',
      backDrop: 'https://example.com/images/car_show.jpg',
      date: '2023-06-05',
      dateOfExpiry: '2023-06-10',
      owner: 'AutoExpo',
      description: 'Experience the latest models from top car manufacturers.',
    ),
    Advertisement(
      title: 'Book Fair',
      id: '7',
      tag: 'Books',
      backDrop: 'https://example.com/images/book_fair.jpg',
      date: '2023-07-01',
      dateOfExpiry: '2023-07-05',
      owner: 'BookStore',
      description: 'Explore a wide variety of books from different genres.',
    ),
    Advertisement(
      title: 'Gadget Launch',
      id: '8',
      tag: 'Gadgets',
      backDrop: 'https://example.com/images/gadget_launch.jpg',
      date: '2023-08-15',
      dateOfExpiry: '2023-08-20',
      owner: 'GadgetHub',
      description: 'Be the first to get your hands on the latest gadgets.',
    ),
    Advertisement(
      title: 'Music Festival',
      id: '9',
      tag: 'Entertainment',
      backDrop: 'https://example.com/images/music_festival.jpg',
      date: '2023-09-10',
      dateOfExpiry: '2023-09-12',
      owner: 'MusicFest',
      description:
          'Enjoy live performances from top artists at our annual music festival.',
    ),
    Advertisement(
      title: 'Art Exhibition',
      id: '10',
      tag: 'Art',
      backDrop: 'https://example.com/images/art_exhibition.jpg',
      date: '2023-10-05',
      dateOfExpiry: '2023-10-10',
      owner: 'ArtGallery',
      description:
          'Explore the works of renowned artists at our art exhibition.',
    ),
  ];
}

class AdvertisementListContent extends StatelessWidget {
  const AdvertisementListContent({super.key, required this.advertisements});
  final List<Advertisement> advertisements;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: advertisements.length,
      shrinkWrap: false,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      itemBuilder: (context, index) {
        final data = advertisements[index];
        return AdvertisementItem(
          advertisement: data,
          onTap: (card) {
            context.push(AdvertisementDetailScreen.routeName, extra: data);
          },
        );
      },
    );
  }
}
