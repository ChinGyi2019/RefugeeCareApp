import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/di/locator.dart';
import 'package:refugee_care_mobile/l10n/app_localizations.dart';
import 'package:refugee_care_mobile/shared/navigation/routers.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';
import 'package:refugee_care_mobile/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  // await dotenv.load(fileName: ".env");
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryLight,
    statusBarIconBrightness:
        Brightness.light, // For light icons on dark status bar
    statusBarBrightness: Brightness.dark, // For dark icons on light status bar
  ));
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
