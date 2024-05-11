import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octocoin/features/search/domain/entities/market.dart';

class MarketCard extends StatelessWidget {
  final Market market;

  const MarketCard({
    super.key,
    required this.market,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              market.name,
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${market.currentPrice.toStringAsFixed(2)}',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${market.pricePercentageChange24h.toStringAsFixed(2)}%',
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.bold,
                    color: market.pricePercentageChange24h < 0
                        ? Colors.redAccent
                        : Colors.greenAccent,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  market.pricePercentageChange24h < 0
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                  color: market.pricePercentageChange24h < 0
                      ? Colors.redAccent
                      : Colors.greenAccent,
                  size: 18,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
