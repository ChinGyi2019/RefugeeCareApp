import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/auth/domain/provider/auth_repository_provider.dart';
import 'package:refugee_care_mobile/feature/splash/provider/state/splash_screen_notifier.dart';
import 'package:refugee_care_mobile/feature/splash/provider/state/splash_scrren_state.dart';

final splashScreenProvider =
    StateNotifierProvider<SplashScreenNotifier, SplashScreenState>((ref) {
  var authRepository = ref.watch(authRepositoryProvider);
  return SplashScreenNotifier(authRepository: authRepository);
});
