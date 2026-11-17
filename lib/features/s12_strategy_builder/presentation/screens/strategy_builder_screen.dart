import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_button.dart';
import '../../../../core/widgets/bold_card.dart';

/// S12 — Strategy Builder (Algo Lab)
class StrategyBuilderScreen extends StatelessWidget {
  const StrategyBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Strategy Builder')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BoldCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Strategy Identity', style: AppTypography.titleMedium),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Strategy Name',
                      hintText: 'e.g., NIFTY 15m VWAP Pullback',
                      filled: true,
                      fillColor: AppColors.elevatedSurface,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            BoldCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Entry Rules', style: AppTypography.titleMedium),
                  const SizedBox(height: 8),
                  Text('• EMA(9) crosses above EMA(21)', style: AppTypography.bodySmall),
                  Text('• Close > VWAP and RSI(14) > 55', style: AppTypography.bodySmall),
                ],
              ),
            ),
            const SizedBox(height: 16),
            BoldCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Risk & Position Sizing', style: AppTypography.titleMedium),
                  const SizedBox(height: 8),
                  Text('• Stop Loss: 0.5% of Trade Capital', style: AppTypography.bodySmall),
                  Text('• Target: 1.5% (1:3 Risk Reward)', style: AppTypography.bodySmall),
                  Text('• Trailing Stop: Active above 1.0%', style: AppTypography.bodySmall),
                ],
              ),
            ),
            const SizedBox(height: 24),
            BoldButton(
              text: 'Run Backtest Simulation',
              onPressed: () => Navigator.pushNamed(context, '/backtest_results'),
            ),
          ],
        ),
      ),
    );
  }
}
