import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';

abstract class CardRemoteDatasource {
  Future<List<CommunityCard>> getContactList();
  Future<CommunityCard> getCardById(String id);
  Future<void> submitCard(CommunityCard card);
  Future<void> editCard(CommunityCard card);
  Future<void> deleteCard(CommunityCard card);
}
