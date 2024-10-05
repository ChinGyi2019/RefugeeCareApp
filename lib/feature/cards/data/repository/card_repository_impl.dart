import 'package:refugee_care_mobile/data/uitls/either.dart';
import 'package:refugee_care_mobile/data/uitls/exception.dart';
import 'package:refugee_care_mobile/domain/model/cards/community_cart.dart';
import 'package:refugee_care_mobile/domain/model/community/community.dart';
import 'package:refugee_care_mobile/feature/cards/data/datasource/card_remote_datasource.dart';
import 'package:refugee_care_mobile/feature/cards/domain/repository/card_repository.dart';

class CardRepositoryImpl implements CardRepository {
  CardRepositoryImpl({required this.remote});
  CardRemoteDatasource remote;
  @override
  Future<void> deleteCard(CommunityCard card) {
    // TODO: implement deleteCard
    throw UnimplementedError();
  }

  @override
  Future<void> editCard(CommunityCard card) {
    // TODO: implement editCard
    throw UnimplementedError();
  }

  @override
  Future<CommunityCard> getCardById(String id) {
    // TODO: implement getCardById
    throw UnimplementedError();
  }

  @override
  Future<List<CommunityCard>> getContactList() {
    // TODO: implement getContactList
    throw UnimplementedError();
  }

  @override
  Future<Either<AppException, List<CommunityCard>>> submitCard({
    required CommunityCard card,
  }) {
    return remote.submitCard(card: card);
  }

  @override
  Future<Either<AppException, List<Community>>> getCommunities() {
    return remote.getCommunities();
  }
}
