import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/feature/cards/details/card_details_screen.dart';
import 'package:refugee_care_mobile/feature/cards/my_cards_screen.dart';
import 'package:refugee_care_mobile/feature/cards/save/save_card_screen.dart';
import 'package:refugee_care_mobile/feature/emergency/setup/emergency_setup_screen.dart';
import 'package:refugee_care_mobile/feature/entry_point/entry_point.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const EntryPoint(title: ''),
    ),
    GoRoute(
      path: '/my-cards',
      builder: (context, state) => const MyCardsPage(title: ''),
    ),

    GoRoute(
        path: SaveCardScreen.routeName,
        builder: (context, state) => const SaveCardScreen(
              title: '',
            )),
    GoRoute(
        path: CardDetailsScreen.routeName,
        builder: (context, state) {
          final CommunityCard card = state.extra as CommunityCard;
          return CardDetailsScreen(title: '', card: card);
        }),
    GoRoute(
        path: EmergencySetupScreen.routeName,
        builder: (context, state) {
          // final CommunityCard card = state.extra as CommunityCard;
          return EmergencySetupScreen(title: '');
        }),

    // GoRoute(
    //   path: '/forgot-password',
    //   builder: (context, state) => const ForgotPasswordScreen(),
    // ),
    // GoRoute(
    //   path: '/password-confirmation/:email',
    //   builder: (context, state) {
    //     final email = state.pathParameters['email'];
    //     if (email == null) {
    //       throw Exception('Recipe ID is missing');
    //     }
    //     return PasswordConfirmationForm(email: email);
    //   },
    // ),
    // GoRoute(
    //   path: '/resend-email-verification',
    //   builder: (context, state) => const EmailResendScreen(),
    // ),
    // GoRoute(
    //   path: '/user-confirmation/:email',
    //   builder: (context, state) {
    //     final email = state.pathParameters['email'];
    //     if (email == null) {
    //       throw Exception('Recipe ID is missing');
    //     }
    //     return UserConfirmationForm(email: email);
    //   },
    // ),
    // GoRoute(
    //   path: '/favorite',
    //   builder: (context, state) => const FavoriteScreen(),
    // ),
    // GoRoute(
    //   path: '/recipe/:id',
    //   builder: (context, state) {
    //     final id = state.pathParameters['id'];
    //     if (id == null) {
    //       throw Exception('Recipe ID or Favorite state is missing');
    //     }
    //     return RecipeDetailsScreen(
    //       id: id,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: '/profile',
    //   builder: (context, state) => const ProfileScreen(),
    // ),
    // GoRoute(
    //   path: '/edit-profile',
    //   builder: (context, state) => const EditProfileScreen(),
    // ),
    // GoRoute(
    //   path: '/all-recipes',
    //   builder: (context, state) => const AllRecipesScreen(),
    // ),
    // GoRoute(
    //   path: '/search-recipes',
    //   builder: (context, state) => const SearchScreen(),
    // ),
    // GoRoute(
    //   path: '/notifications',
    //   builder: (context, state) => const NotificationsScreen(),
    // ),
  ],
);
