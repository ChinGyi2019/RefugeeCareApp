import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:refugee_care_mobile/shared/navigation/routers.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';
import 'package:refugee_care_mobile/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryLight,
    statusBarIconBrightness:
        Brightness.light, // For light icons on dark status bar
    statusBarBrightness: Brightness.dark, // For dark icons on light status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.light(context),
      routerConfig: routerConfig,
    );
  }
}
