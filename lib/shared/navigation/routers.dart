import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/domain/model/advertisement/advertisement.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/feature/advertisement/advertisement_screen.dart';
import 'package:refugee_care_mobile/feature/advertisement/detail/advertisement_detail_screen.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/login/login_screen.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/otp/otp_screen.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/register/register_screen.dart';
import 'package:refugee_care_mobile/feature/splash/splash_screen.dart';
import 'package:refugee_care_mobile/feature/start/start_screen.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/details/card_details_screen.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/list/my_cards_screen.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/save_card_screen.dart';
import 'package:refugee_care_mobile/feature/emergency/presenter/setup/emergency_setup_screen.dart';
import 'package:refugee_care_mobile/feature/entry_point/entry_point.dart';
import 'package:refugee_care_mobile/feature/notification/notification_screen.dart';
import 'package:refugee_care_mobile/feature/profile/profile_screen.dart';

final routerConfig = GoRouter(
  initialLocation: SplashScreen.routeName,
  routes: [
    GoRoute(
        path: SplashScreen.routeName,
        builder: (context, state) =>
            const SplashScreen() // EntryPoint(title: ''),
        ),
    GoRoute(
        path: StartScreen.routeName,
        builder: (context, state) =>
            const StartScreen() // EntryPoint(title: ''),
        ),
    GoRoute(
      path: '/my-cards',
      builder: (context, state) => const MyCardsPage(title: ''),
    ),

    GoRoute(
      path: EntryPoint.routeName,
      builder: (context, state) => const EntryPoint(title: ''),
    ),

    GoRoute(
      path: ProfileScreen.routeName,
      builder: (context, state) => const ProfileScreen(title: ''),
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
          return const EmergencySetupScreen(title: '');
        }),
    GoRoute(
        path: NotificationPage.routeName,
        builder: (context, state) {
          // final CommunityCard card = state.extra as CommunityCard;
          return const NotificationPage(title: '');
        }),
    GoRoute(
        path: AdvertisementScreen.routeName,
        builder: (context, state) {
          return const AdvertisementScreen(title: '');
        }),
    GoRoute(
        path: OtpScreen.routeName,
        builder: (context, state) => const OtpScreen(
              title: '',
            )),
    GoRoute(
        path: RegisterScreen.routeName,
        builder: (context, state) {
          return const RegisterScreen(title: '');
        }),
    GoRoute(
        path: LoginScreen.routeName,
        builder: (context, state) {
          return const LoginScreen(title: '');
        }),
    GoRoute(
        path: AdvertisementDetailScreen.routeName,
        builder: (context, state) {
          final Advertisement ads = state.extra as Advertisement;
          return AdvertisementDetailScreen(
            title: '',
            advertisement: ads,
          );
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
