import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';
import '../../../../core/widgets/status_badge.dart';

/// S15 — Signals Feed
class SignalsFeedScreen extends StatelessWidget {
  const SignalsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Signals Feed')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSignalCard(
            context,
            symbol: 'NIFTY 24350 CE',
            type: 'LONG BREAKOUT',
            entry: '₹95.00',
            sl: '₹75.00',
            target: '₹140.00',
            time: '2 mins ago',
            isBull: true,
          ),
          _buildSignalCard(
            context,
            symbol: 'BANKNIFTY 52200 PE',
            type: 'MOMENTUM SHORT',
            entry: '₹120.00',
            sl: '₹145.00',
            target: '₹70.00',
            time: '14 mins ago',
            isBull: false,
          ),
          _buildSignalCard(
            context,
            symbol: 'TATAMOTORS',
            type: 'VWAP RECLAIM',
            entry: '₹972.00',
            sl: '₹964.00',
            target: '₹995.00',
            time: '28 mins ago',
            isBull: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSignalCard(
    BuildContext context, {
    required String symbol,
    required String type,
    required String entry,
    required String sl,
    required String target,
    required String time,
    required bool isBull,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: BoldCard(
        onTap: () => Navigator.pushNamed(context, '/chart'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(symbol, style: AppTypography.titleMedium),
                if (isBull) StatusBadge.bullish(type) else StatusBadge.bearish(type),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildField('Entry', entry),
                _buildField('Stop Loss', sl, color: AppColors.bearishLoss),
                _buildField('Target', target, color: AppColors.primaryBullish),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(time, style: AppTypography.labelSmall),
                Text('Simulate Trade →', style: TextStyle(color: AppColors.primaryBullish, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String title, String val, {Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.bodySmall),
        const SizedBox(height: 2),
        Text(val, style: AppTypography.tabularFigures.copyWith(color: color, fontSize: 13)),
      ],
    );
  }
}
