import 'package:octocoin/features/search/domain/entities/market.dart';

class MarketModel extends Market {
  const MarketModel({
    required super.id,
    required super.name,
    required super.code,
    required super.currentPrice,
    required super.marketCap,
    required super.pricePercentageChange24h,
    super.imageUrl,
  });
}
