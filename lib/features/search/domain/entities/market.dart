import 'package:equatable/equatable.dart';

class Market extends Equatable {
  final String id;
  final String name;
  final String code;
  final num marketCap;
  final num currentPrice;
  final num pricePercentageChange24h;
  final String? imageUrl;

  const Market({
    required this.id,
    required this.name,
    required this.code,
    required this.currentPrice,
    required this.marketCap,
    required this.pricePercentageChange24h,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        marketCap,
        currentPrice,
        imageUrl,
        pricePercentageChange24h
      ];
}
