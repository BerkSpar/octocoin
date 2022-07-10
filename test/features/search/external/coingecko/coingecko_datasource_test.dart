import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:octocoin/features/search/data/models/market_model.dart';
import 'package:octocoin/features/search/external/coingecko/coingecko_datasource.dart';

void main() {
  var datasource = CoingeckoDatasource(Dio());

  test('Needs to return a ', () async {
    final result = await datasource.search(vsCurrency: 'usd');

    expect(result, isA<List<MarketModel>>());
  });
}
