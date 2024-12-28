import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/domain/model/auth/auth_state.dart';
import 'package:refugee_care_mobile/feature/entry_point/entry_point.dart';
import 'package:refugee_care_mobile/feature/splash/provider/splah_screen_provider.dart';
import 'package:refugee_care_mobile/feature/start/start_screen.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "/";

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Access your provider here
      ref.read(splashScreenViewModelProvider.notifier).initAuthState();
      // Do something with authState
    });
  }

  @override
  Widget build(BuildContext context) {
    // final provider = ref.watch(splashScreenProvider.notifier);
    // final state = ref.watch(splashScreenProvider);
    ref.listen(
      splashScreenViewModelProvider.select((value) => value.authState),
      ((previous, next) {
        if (next is Failure) {
          context.go(StartScreen.routeName);
        } else if (next is Success) {
          context.go(EntryPoint.routeName);
        }
      }),
    );
    return Scaffold(
        backgroundColor: AppColors.primaryExtraLight,
        body: Center(
            child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/bg/start_bg.png'), // Replace with your image asset path
                    fit: BoxFit
                        .cover, // Ensures the image fills the entire screen
                  ),
                ),
                child: const Text("Refugee Care "))));
  }
}
