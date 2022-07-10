import 'package:octocoin/features/search/domain/entities/market.dart';

class MarketModel extends Market {
  String name;
  String code;
  num marketCap;
  num currentPrice;
  String? imageUrl;

  MarketModel({
    required this.name,
    required this.code,
    required this.currentPrice,
    required this.marketCap,
    this.imageUrl,
  }) : super(
          code: code,
          marketCap: marketCap,
          name: name,
          currentPrice: currentPrice,
          imageUrl: imageUrl,
        );
}
