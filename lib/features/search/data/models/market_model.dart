import 'package:octocoin/features/search/domain/entities/market.dart';

class MarketModel extends Market {
  const MarketModel({
    required String name,
    required String code,
    required num currentPrice,
    required num marketCap,
    String? imageUrl,
  }) : super(
          code: code,
          marketCap: marketCap,
          name: name,
          currentPrice: currentPrice,
          imageUrl: imageUrl,
        );
}
