import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octocoin/features/search/domain/entities/market.dart';

class MarketCard extends StatelessWidget {
  final Market market;

  const MarketCard({
    Key? key,
    required this.market,
  }) : super(key: key);

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
                  '3.45',
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_upward,
                  color: Colors.greenAccent,
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