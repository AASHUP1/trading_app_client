import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';
import '../../../../core/widgets/status_badge.dart';

/// S08 — Advanced Market Scanner
class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final presets = [
      {'title': 'VWAP Reclaim', 'desc': 'Price crosses above VWAP with 2x volume', 'matches': 14, 'type': 'Bullish'},
      {'title': '52-Week High Breakout', 'desc': 'New 52W high with RSI > 60', 'matches': 8, 'type': 'Bullish'},
      {'title': 'Volume Spike (3x Avg)', 'desc': 'Unusual high volume detected in cash equities', 'matches': 22, 'type': 'Neutral'},
      {'title': 'Intraday Breakdown', 'desc': 'Price breaks below Day Low support', 'matches': 6, 'type': 'Bearish'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Scanner'),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Algorithmic Presets', style: AppTypography.titleMedium),
          const SizedBox(height: 12),
          ...presets.map((p) {
            final isBull = p['type'] == 'Bullish';
            final isBear = p['type'] == 'Bearish';
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: BoldCard(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(p['title'] as String, style: AppTypography.titleMedium),
                        if (isBull)
                          StatusBadge.bullish('${p['matches']} Hits')
                        else if (isBear)
                          StatusBadge.bearish('${p['matches']} Hits')
                        else
                          StatusBadge.neutral('${p['matches']} Hits'),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(p['desc'] as String, style: AppTypography.bodySmall),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
