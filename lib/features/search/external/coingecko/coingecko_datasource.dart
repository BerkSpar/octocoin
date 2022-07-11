import 'package:dio/dio.dart';
import 'package:octocoin/features/search/data/datasources/search_datasource.dart';
import 'package:octocoin/features/search/data/models/market_model.dart';

class CoingeckoDatasource implements SearchDatasource {
  final Dio dio;

  CoingeckoDatasource(this.dio);

  @override
  Future<List<MarketModel>> search({
    required String vsCurrency,
    int? page,
    int? itensPerPage,
    bool? sparkline,
    List<String>? priceChangePercentages,
    String? order,
    List<String>? marketIds,
  }) async {
    final result = await dio.get(
      'https://api.coingecko.com/api/v3/coins/markets',
      queryParameters: {
        'vs_currency': vsCurrency,
        'page': page,
        'per_page': itensPerPage,
        'sparkline': sparkline,
        'price_change_percentage': priceChangePercentages?.join(","),
        'order': order,
        'ids': marketIds?.join(","),
      },
    );

    if (result.statusCode == 200) {
      final jsonList = result.data as List;

      final list = jsonList
          .map((e) => MarketModel(
                id: e['id'],
                name: e['name'],
                code: e['symbol'],
                currentPrice: e['current_price'],
                marketCap: e['market_cap'],
                imageUrl: e['image'],
                pricePercentageChange24h: e['price_change_percentage_24h'],
              ))
          .toList();

      return list;
    } else {
      throw Exception('');
    }
  }
}
