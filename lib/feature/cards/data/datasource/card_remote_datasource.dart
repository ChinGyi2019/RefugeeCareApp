import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';

abstract class CardRemoteDatasource {
  Future<List<CommunityCard>> getContactList();
  Future<CommunityCard> getCardById(String id);
  Future<Either<AppException, List<CommunityCard>>> submitCard({
    required CommunityCard card,
  });
  Future<void> editCard(CommunityCard card);
  Future<void> deleteCard(CommunityCard card);

  Future<Either<AppException, List<Community>>> getCommunities();
}
