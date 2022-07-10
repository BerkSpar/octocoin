import 'package:dartz/dartz.dart';
import 'package:octocoin/features/search/domain/entities/market.dart';
import 'package:octocoin/features/search/domain/repositories/search_repository.dart';

abstract class MarketSearch {
  Future<Either<Exception, List<Market>>> call({
    required List<String> priceChangePercentages,
    required String vsCurrency,
    int page = 1,
    int itensPerPage = 20,
    bool sparkline = false,
    String? order,
    List<String>? marketIds,
  });
}

class MarketSearchImpl implements MarketSearch {
  final SearchRepository repository;

  MarketSearchImpl(this.repository);

  @override
  Future<Either<Exception, List<Market>>> call({
    required String vsCurrency,
    int page = 1,
    int itensPerPage = 20,
    bool sparkline = false,
    List<String>? priceChangePercentages,
    String? order,
    List<String>? marketIds,
  }) async {
    if (page < 0) {
      return Left(Exception('Page needs to be positive'));
    }

    if (itensPerPage < 0 || itensPerPage > 250) {
      return Left(Exception('Itens per page needs to be between 0 and 250'));
    }

    return await repository.getMarkets(
      priceChangePercentages: priceChangePercentages,
      vsCurrency: vsCurrency,
      page: page,
      itensPerPage: itensPerPage,
      sparkline: sparkline,
      order: order,
      marketIds: marketIds,
    );
  }
}
