import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/login/login_screen.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/register/register_screen.dart';
import 'package:refugee_care_mobile/feature/splash/provider/splah_screen_provider.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});
  static const String routeName = "/start";

  @override
  ConsumerState<StartScreen> createState() => StartScreenState();
}

class StartScreenState extends ConsumerState<StartScreen> {
  @override
  Widget build(BuildContext context) {
    double appBarHeight = Theme.of(context).appBarTheme.toolbarHeight ?? 70;

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
        backgroundColor: AppColors.primaryExtraLight,
        body: Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryLight,
            image: DecorationImage(
              image: AssetImage(
                  'assets/bg/start_bg.png'), // Replace with your image asset path
              fit: BoxFit.cover, // Ensures the image fills the entire screen
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Display the title
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: appBarHeight),
                  child: const Text(
                    'RefugeeCare App',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    ElevatedButton(
                      onPressed: () {
                        context.push(LoginScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text('Login'),
                    ),
                    gapH16,
                    OutlinedButton(
                      onPressed: () {
                        context.push(RegisterScreen.routeName);
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text('Register'),
                    ),
                    gapH32,
                  ]))
            ],
          ),
        ));
  }
}
