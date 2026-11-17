import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_button.dart';
import '../../../../core/widgets/bold_card.dart';
import '../../../../core/widgets/status_badge.dart';

/// S19 — Subscription & Billing (100% Free Launch Mandate)
class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subscriptions & Access')),
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
                      Text('CURRENT TIER', style: AppTypography.labelSmall),
                      StatusBadge.bullish('100% Free at Launch'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('BOLD Pro Beta Access', style: AppTypography.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    'All institutional features—including unlimited backtests, F&O trade desk, real-time candles, and paper trading—are completely free.',
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Included Features', style: AppTypography.titleMedium),
            const SizedBox(height: 12),
            BoldCard(
              child: Column(
                children: [
                  _buildFeatureRow('₹10,00,000 Starting Virtual Capital', true),
                  const Divider(),
                  _buildFeatureRow('NSE/BSE Cash & F&O Market Quotes', true),
                  const Divider(),
                  _buildFeatureRow('Algorithmic Rule Builder & Backtesting', true),
                  const Divider(),
                  _buildFeatureRow('Institutional Dark UI & Option Analytics', true),
                  const Divider(),
                  _buildFeatureRow('Zero Live Order Risk Policy', true),
                ],
              ),
            ),
            const SizedBox(height: 24),
            BoldButton(
              text: 'Active Plan · No Payment Required',
              variant: BoldButtonVariant.secondary,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String feature, bool included) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.primaryBullish, size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text(feature, style: AppTypography.bodyMedium)),
        ],
      ),
    );
  }
}
