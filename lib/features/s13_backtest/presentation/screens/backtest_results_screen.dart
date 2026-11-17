import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';
import '../../../../core/widgets/status_badge.dart';

/// S13 — Backtest Results
class BacktestResultsScreen extends StatelessWidget {
  const BacktestResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Backtest Results')),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('NIFTY 15m VWAP Pullback', style: AppTypography.titleMedium),
                      StatusBadge.bullish('68.4% Win Rate'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMetric('Net P&L', '+₹1,84,500', AppColors.primaryBullish),
                      _buildMetric('Profit Factor', '2.14', AppColors.primaryText),
                      _buildMetric('Max Drawdown', '-4.2%', AppColors.bearishLoss),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Trade Summary (240 Trades)', style: AppTypography.titleMedium),
            const SizedBox(height: 12),
            BoldCard(
              child: Column(
                children: [
                  _buildSummaryRow('Total Trades', '240'),
                  const Divider(),
                  _buildSummaryRow('Winning Trades', '164 (68.4%)'),
                  const Divider(),
                  _buildSummaryRow('Losing Trades', '76 (31.6%)'),
                  const Divider(),
                  _buildSummaryRow('Avg Trade Duration', '45 mins'),
                  const Divider(),
                  _buildSummaryRow('Sharpe Ratio', '1.82'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String title, String val, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.labelSmall),
        const SizedBox(height: 4),
        Text(val, style: AppTypography.tabularFigures.copyWith(color: color, fontSize: 16)),
      ],
    );
  }

  Widget _buildSummaryRow(String title, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTypography.bodySmall),
          Text(val, style: AppTypography.bodyMedium),
        ],
      ),
    );
  }
}
