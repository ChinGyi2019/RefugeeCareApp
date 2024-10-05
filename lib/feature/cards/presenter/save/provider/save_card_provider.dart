import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/cards/domain/provider/card_repository_provider.dart';
import 'package:refugee_care_mobile/feature/cards/presenter/save/provider/state/save_card_notifier.dart';

final saveCardProvider = ChangeNotifierProvider<SaveCardNotifier>((ref) {
  final repository = ref.watch(cardRepositoryProvider);
  return SaveCardNotifier(repository: repository);
});
