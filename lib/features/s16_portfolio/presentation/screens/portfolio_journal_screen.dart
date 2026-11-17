import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';

/// S16 — Paper Portfolio and Trade Journal
class PortfolioJournalScreen extends StatelessWidget {
  const PortfolioJournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paper Portfolio & Journal')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BoldCard(
              elevated: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SIMULATED TOTAL P&L', style: AppTypography.labelSmall),
                  const SizedBox(height: 8),
                  Text('+₹24,850.00', style: AppTypography.displayLarge.copyWith(color: AppColors.primaryBullish)),
                  const SizedBox(height: 4),
                  Text('Overall Return: +2.48% on ₹10,00,000 Capital', style: AppTypography.bodySmall),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Open Simulated Positions (2)', style: AppTypography.titleMedium),
            const SizedBox(height: 12),
            _buildPositionCard('RELIANCE', 'BUY · 50 Qty · Avg ₹2,950.00', '+₹1,525.00 (+1.03%)', true),
            _buildPositionCard('NIFTY 24350 CE', 'BUY · 75 Qty · Avg ₹92.00', '+₹840.00 (+12.17%)', true),
            const SizedBox(height: 20),
            Text('Trade Journal & Attribution', style: AppTypography.titleMedium),
            const SizedBox(height: 12),
            BoldCard(
              child: Column(
                children: [
                  _buildJournalRow('17 Nov 2026', 'TCS Intraday Scalp', '+₹3,200', true),
                  const Divider(),
                  _buildJournalRow('16 Nov 2026', 'BANKNIFTY 52000 PE', '-₹1,150', false),
                  const Divider(),
                  _buildJournalRow('15 Nov 2026', 'INFY Momentum Breakout', '+₹4,800', true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPositionCard(String symbol, String sub, String pnl, bool isProfit) {
    final color = isProfit ? AppColors.primaryBullish : AppColors.bearishLoss;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: BoldCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(symbol, style: AppTypography.titleMedium),
                Text(sub, style: AppTypography.bodySmall),
              ],
            ),
            Text(pnl, style: AppTypography.tabularFigures.copyWith(color: color, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildJournalRow(String date, String desc, String pnl, bool isProfit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(desc, style: AppTypography.bodyMedium),
              Text(date, style: AppTypography.labelSmall),
            ],
          ),
          Text(
            pnl,
            style: TextStyle(
              color: isProfit ? AppColors.primaryBullish : AppColors.bearishLoss,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
