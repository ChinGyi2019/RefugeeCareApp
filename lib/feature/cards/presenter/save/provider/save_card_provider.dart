import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/provider/state/save_card_notifier.dart';

final saveCardProvider = ChangeNotifierProvider<SaveCardNotifier>((ref) {
  // final repository = ref.watch(contactRepositoryProvider);
  return SaveCardNotifier();
});
