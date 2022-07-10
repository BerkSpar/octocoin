import 'package:dartz/dartz.dart';
import 'package:octocoin/features/search/domain/entities/market.dart';

abstract class SearchRepository {
  Future<Either<Exception, List<Market>>> getMarkets({
    required String vsCurrency,
    int page = 1,
    int itensPerPage = 20,
    bool sparkline = false,
    List<String>? priceChangePercentages,
    String? order,
    List<String>? marketIds,
  });
}
