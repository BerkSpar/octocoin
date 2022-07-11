import 'package:octocoin/features/search/domain/entities/market.dart';

class MarketModel extends Market {
  const MarketModel({
    required String id,
    required String name,
    required String code,
    required num currentPrice,
    required num marketCap,
    required num pricePercentageChange24h,
    String? imageUrl,
  }) : super(
          id: id,
          code: code,
          marketCap: marketCap,
          name: name,
          currentPrice: currentPrice,
          imageUrl: imageUrl,
          pricePercentageChange24h: pricePercentageChange24h,
        );
}
