import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_button.dart';

/// S07 — Advanced Chart and Indicators
class AdvancedChartScreen extends StatelessWidget {
  const AdvancedChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('RELIANCE · NSE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('₹2,980.50 (+1.85%)', style: TextStyle(fontSize: 12, color: AppColors.primaryBullish)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.fullscreen), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Timeframe Bar
          Container(
            height: 40,
            color: AppColors.surface,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: ['1m', '5m', '15m', '1h', '1D', '1W'].map((tf) {
                final isSelected = tf == '15m';
                return Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.elevatedSurface : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      tf,
                      style: TextStyle(
                        color: isSelected ? AppColors.primaryBullish : AppColors.secondaryText,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Chart Canvas Simulation
          Expanded(
            child: Container(
              color: AppColors.appBackground,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.candlestick_chart, size: 80, color: AppColors.primaryBullish),
                    const SizedBox(height: 12),
                    Text('OHLCV Interactive Candle Feed', style: AppTypography.titleMedium),
                    const SizedBox(height: 4),
                    Text('EMA 20, VWAP & Supertrend active', style: AppTypography.bodySmall),
                  ],
                ),
              ),
            ),
          ),
          // Order Action Footer
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.surface,
            child: Row(
              children: [
                Expanded(
                  child: BoldButton(
                    text: 'BUY (Simulated)',
                    onPressed: () => Navigator.pushNamed(context, '/paper_terminal'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: BoldButton(
                    text: 'SELL (Simulated)',
                    variant: BoldButtonVariant.danger,
                    onPressed: () => Navigator.pushNamed(context, '/paper_terminal'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
