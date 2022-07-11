import 'package:equatable/equatable.dart';

class Market extends Equatable {
  String name;
  String code;
  num marketCap;
  num currentPrice;
  String? imageUrl;

  Market({
    required this.name,
    required this.code,
    required this.currentPrice,
    required this.marketCap,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [name, code, marketCap, currentPrice, imageUrl];
}
