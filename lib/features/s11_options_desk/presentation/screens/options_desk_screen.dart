import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';

/// S11 — F&O Options Trade Desk & Chain
class OptionsDeskScreen extends StatelessWidget {
  const OptionsDeskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIFTY Option Chain', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('PCR: 1.15 · Max Pain: 24,300', style: TextStyle(fontSize: 12, color: AppColors.secondaryText)),
          ],
        ),
      ),
      body: Column(
        children: [
          // Header Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CALLS (CE)', style: AppTypography.labelSmall.copyWith(color: AppColors.primaryBullish)),
                Text('STRIKE', style: AppTypography.labelSmall.copyWith(color: AppColors.primaryText)),
                Text('PUTS (PE)', style: AppTypography.labelSmall.copyWith(color: AppColors.bearishLoss)),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                _buildStrikeRow('₹145.20', '24,200', '₹42.50'),
                _buildStrikeRow('₹98.40', '24,250', '₹65.10'),
                _buildStrikeRow('₹62.00', '24,300 (ATM)', '₹96.80', isAtm: true),
                _buildStrikeRow('₹35.20', '24,350', '₹138.40'),
                _buildStrikeRow('₹18.90', '24,400', '₹192.00'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStrikeRow(String cePrice, String strike, String pePrice, {bool isAtm = false}) {
    return Container(
      color: isAtm ? AppColors.elevatedSurface : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(cePrice, style: AppTypography.tabularFigures.copyWith(color: AppColors.primaryBullish)),
          BoldCard(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(strike, style: AppTypography.titleMedium.copyWith(fontSize: 13)),
          ),
          Text(pePrice, style: AppTypography.tabularFigures.copyWith(color: AppColors.bearishLoss)),
        ],
      ),
    );
  }
}
