class Market {
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
}
