import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:refugee_care_mobile/di/locator.dart';
import 'package:refugee_care_mobile/domain/model/contacts/contact.dart';
import 'package:refugee_care_mobile/domain/repositroy/contact_repository.dart';
import 'package:refugee_care_mobile/feature/cards/save/save_card_provider.dart';
import 'package:refugee_care_mobile/feature/emergency/setup/emergency_setup_provider.dart';
import 'package:refugee_care_mobile/l10n/app_localizations.dart';
import 'package:refugee_care_mobile/shared/navigation/routers.dart';
import 'package:refugee_care_mobile/shared/storage/hive_helper.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';
import 'package:refugee_care_mobile/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryLight,
    statusBarIconBrightness:
        Brightness.light, // For light icons on dark status bar
    statusBarBrightness: Brightness.dark, // For dark icons on light status bar
  ));
  // await HiveHelper().init();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

// This widget is the root of your application.
class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en');
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            final provider = SaveCardProvider();
            provider.init();
            return provider;
          }),
          ChangeNotifierProvider(create: (_) {
            final provider = EmergencySetupProvider(
                contactRepository: locator<ContactRepository>());
            provider.init();
            return provider;
          }),
        ],
        child: MaterialApp.router(
          title: 'Flutter Demo',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''), // English
            Locale('es', ''), // Spanish
            Locale('zu', ''), // Hakha Chinpanish
          ],
          locale: _locale,
          theme: AppTheme.light(context),
          routerConfig: routerConfig,
        ));
  }
}
