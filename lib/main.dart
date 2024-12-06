import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/di/locator.dart';
import 'package:refugee_care_mobile/feature/notification/notification_screen.dart';
import 'package:refugee_care_mobile/firebase_options.dart';
import 'package:refugee_care_mobile/l10n/app_localizations.dart';
import 'package:refugee_care_mobile/shared/navigation/routers.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';
import 'package:refugee_care_mobile/theme/app_theme.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  debugPrint("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  // await dotenv.load(fileName: ".env");
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryLight,
    statusBarIconBrightness:
        Brightness.light, // For light icons on dark status bar
    statusBarBrightness: Brightness.dark, // For dark icons on light status bar
  ));
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  String? token = await FirebaseMessaging.instance.getToken();
  debugPrint("FCM token :$token");
  String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
  debugPrint("APNs token: $apnsToken");

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // print('User granted permission: ${settings.authorizationStatus}');
  // await FirebaseMessaging.instance.setAutoInitEnabled(true);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent, // Set the status bar to transparent
  //   systemNavigationBarColor:
  //       Colors.transparent, // Set the navigation bar to transparent
  //   statusBarIconBrightness: Brightness.light, // Light icons for the status bar
  //   systemNavigationBarIconBrightness:
  //       Brightness.light, // Light icons for the navigation bar
  // ));

  // Hides the status bar and navigation bar
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // await HiveHelper().init();

  runApp(const ProviderScope(
      child:
          //     child: MultiProvider(providers: [
          //   ChangeNotifierProvider(create: (_) {
          //     final provider = RegisterProvider();
          //     provider.init();
          //     return provider;
          //   }),
          //   ChangeNotifierProvider(create: (_) {
          //     final provider = LoginProvider();
          //     provider.init();
          //     return provider;
          //   }),
          //   ChangeNotifierProvider(create: (_) {
          //     final provider = SaveCardProvider();
          //     provider.init();
          //     return provider;
          //   }),
          //   ChangeNotifierProvider(create: (_) {
          //     final provider = EmergencySetupProvider(
          //         contactRepository: locator<ContactRepository>());
          //     provider.init();
          //     return provider;
          //   }),
          // ], child:
          MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

// This widget is the root of your application.
class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'message') {
      context.go(NotificationPage.routeName);
    }
  }

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    // 1 setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
        Locale('zu', ''), // Hakha Chinpanish
      ],
      locale: _locale,
      theme: AppTheme.light(context),
      routerConfig: routerConfig,
    );
  }
}
