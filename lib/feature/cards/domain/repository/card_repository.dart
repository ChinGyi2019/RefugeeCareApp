import 'package:geolocator/geolocator.dart';
import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/feature/cards/domain/cards/community_card.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';

abstract class CardRepository {
  Future<Either<AppException, List<CommunityCard>>> getCards();
  Future<CommunityCard> getCardById(String id);
  Future<Either<AppException, List<CommunityCard>>> submitCard({
    required CommunityCard card,
  });
  Future<Either<AppException, String>> report(
      String offficerType, String city, Position? position,
      {required CommunityCard card});
  Future<void> editCard(CommunityCard card);
  Future<void> deleteCard(CommunityCard card);
  // community
  Future<Either<AppException, List<Community>>> getCommunities();
}
