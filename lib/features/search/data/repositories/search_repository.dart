import 'package:dartz/dartz.dart';
import 'package:octocoin/features/search/data/datasources/search_datasource.dart';
import 'package:octocoin/features/search/data/models/market_model.dart';
import 'package:octocoin/features/search/domain/entities/market.dart';
import 'package:octocoin/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, List<Market>>> getMarkets({
    required String vsCurrency,
    int page = 1,
    int itensPerPage = 20,
    bool sparkline = false,
    List<String>? priceChangePercentages,
    String? order,
    List<String>? marketIds,
  }) async {
    List<MarketModel> markets = <MarketModel>[];

    try {
      markets = await datasource.search(
        vsCurrency: vsCurrency,
        page: page,
        itensPerPage: itensPerPage,
        sparkline: sparkline,
        priceChangePercentages: priceChangePercentages,
        order: order,
        marketIds: marketIds,
      );
    } catch (e) {
      return left(Exception('Error when search'));
    }

    return right(markets);
  }
}
