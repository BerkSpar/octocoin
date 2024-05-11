import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:octocoin/features/search/data/models/market_model.dart';
import 'package:octocoin/features/search/external/coinmarketcap/coinmarketcap_datasource.dart';

void main() {
  var datasource = CoinMarketCapDatasource(Dio());

  test('Needs to return a List of MarketModel', () async {
    final result = await datasource.search(vsCurrency: 'usd');

    expect(result, isA<List<MarketModel>>());
  });
}
