import 'package:equatable/equatable.dart';

class Market extends Equatable {
  final String name;
  final String code;
  final num marketCap;
  final num currentPrice;
  final String? imageUrl;

  const Market({
    required this.name,
    required this.code,
    required this.currentPrice,
    required this.marketCap,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [name, code, marketCap, currentPrice, imageUrl];
}
