import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';

/// S05 — Market Overview and Heatmap
class MarketOverviewScreen extends StatelessWidget {
  const MarketOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Market Overview & Sectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Market Breadth (Advances / Declines)
            BoldCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Market Breadth (NSE)', style: AppTypography.titleMedium),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStat('Advances', '1,420', AppColors.primaryBullish),
                      _buildStat('Declines', '890', AppColors.bearishLoss),
                      _buildStat('Unchanged', '112', AppColors.secondaryText),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Sectoral Heatmap', style: AppTypography.titleMedium),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.2,
              children: [
                _buildSectorTile('NIFTY AUTO', '+1.8%', true),
                _buildSectorTile('NIFTY IT', '+1.2%', true),
                _buildSectorTile('NIFTY BANK', '-0.3%', false),
                _buildSectorTile('NIFTY PHARMA', '+0.7%', true),
                _buildSectorTile('NIFTY FMCG', '-0.5%', false),
                _buildSectorTile('NIFTY METAL', '+2.4%', true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String title, String val, Color color) {
    return Column(
      children: [
        Text(title, style: AppTypography.bodySmall),
        const SizedBox(height: 4),
        Text(val, style: AppTypography.titleMedium.copyWith(color: color)),
      ],
    );
  }

  Widget _buildSectorTile(String name, String change, bool isPositive) {
    final color = isPositive ? AppColors.primaryBullish : AppColors.bearishLoss;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: AppTypography.labelSmall.copyWith(color: AppColors.primaryText)),
          Text(change, style: AppTypography.titleMedium.copyWith(color: color)),
        ],
      ),
    );
  }
}
