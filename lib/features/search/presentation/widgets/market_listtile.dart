import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octocoin/features/search/domain/entities/market.dart';

class MarketListTile extends StatelessWidget {
  final Market market;

  const MarketListTile({
    super.key,
    required this.market,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          if (market.imageUrl != null)
            Image.network(
              market.imageUrl!,
              height: 56,
              width: 56,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          if (market.imageUrl != null) const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                market.name,
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                market.code,
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${market.currentPrice.toStringAsFixed(2)}',
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '${market.pricePercentageChange24h.toStringAsFixed(2)}%',
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: market.pricePercentageChange24h < 0
                      ? Colors.redAccent
                      : Colors.greenAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
