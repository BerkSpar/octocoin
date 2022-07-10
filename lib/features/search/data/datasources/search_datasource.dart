import 'package:octocoin/features/search/data/models/market_model.dart';

abstract class SearchDatasource {
  Future<List<MarketModel>> search({
    required String vsCurrency,
    int? page,
    int? itensPerPage,
    bool? sparkline,
    List<String>? priceChangePercentages,
    String? order,
    List<String>? marketIds,
  });
}
