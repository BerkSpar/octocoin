import 'package:dio/dio.dart';
import 'package:octocoin/env.dart';
import 'package:octocoin/features/search/data/datasources/search_datasource.dart';
import 'package:octocoin/features/search/data/models/market_model.dart';

class CoinMarketCapDatasource extends SearchDatasource {
  final Dio dio;

  final Options _options = Options(
    headers: {
      'X-CMC_PRO_API_KEY': Env.coinMarketCapApiKey,
    },
  );

  CoinMarketCapDatasource(this.dio);

  Future<List<MarketModel>> _listingLatest({
    required String vsCurrency,
    int? page,
    int? itensPerPage,
    String? order,
  }) async {
    final result = await dio.get(
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest',
      queryParameters: {
        'convert': vsCurrency.toUpperCase(),
        if (itensPerPage != null && page != null)
          'start': page == 1 ? 1 : (itensPerPage * page - 1),
        if (itensPerPage != null) 'limit': itensPerPage,
        if (order != null) 'sort': order,
      },
      options: _options,
    );

    if (result.statusCode == 200) {
      final jsonList = result.data["data"] as List;

      final list = jsonList
          .map((e) => MarketModel(
              id: e['id']!.toString(),
              name: e['name'],
              code: e['symbol'],
              currentPrice: e['quote'][vsCurrency.toUpperCase()]['price'],
              marketCap: e['quote'][vsCurrency.toUpperCase()]['market_cap'],
              pricePercentageChange24h: e['quote'][vsCurrency.toUpperCase()]
                  ['percent_change_24h'],
              imageUrl:
                  'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/${e['symbol'].toString().toLowerCase()}.png'))
          .toList();

      return list;
    } else {
      throw Exception('');
    }
  }

  Future<List<MarketModel>> _quotesLatest({
    required String vsCurrency,
    required List<String> marketIds,
  }) async {
    final result = await dio.get(
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest',
      queryParameters: {
        'slug': marketIds.map((e) => e.toLowerCase()).join(','),
        'convert': vsCurrency.toUpperCase(),
      },
      options: _options,
    );

    if (result.statusCode == 200) {
      List jsonList = [];

      for (var market in (result.data["data"] as Map).values) {
        jsonList.add(market);
      }

      final list = jsonList
          .map((e) => MarketModel(
              id: e['id']!.toString(),
              name: e['name'],
              code: e['symbol'],
              currentPrice: e['quote'][vsCurrency.toUpperCase()]['price'],
              marketCap: e['quote'][vsCurrency.toUpperCase()]['market_cap'],
              pricePercentageChange24h: e['quote'][vsCurrency.toUpperCase()]
                  ['percent_change_24h'],
              imageUrl:
                  'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/${e['symbol'].toString().toLowerCase()}.png'))
          .toList();

      return list;
    } else {
      throw Exception('');
    }
  }

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
    if (marketIds != null) {
      return _quotesLatest(
        vsCurrency: vsCurrency,
        marketIds: marketIds,
      );
    }

    return _listingLatest(
      vsCurrency: vsCurrency,
      page: page,
      itensPerPage: itensPerPage,
      order: order,
    );
  }
}
