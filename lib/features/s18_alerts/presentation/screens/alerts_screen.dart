import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';

/// S18 — Alerts & Notifications
class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications & Alerts')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAlertItem(
            icon: Icons.check_circle_outline,
            iconColor: AppColors.primaryBullish,
            title: 'Paper Order Executed',
            desc: 'Bought 50 Qty of RELIANCE at ₹2,980.50 (Simulated Fill).',
            time: '5m ago',
          ),
          _buildAlertItem(
            icon: Icons.notifications_active_outlined,
            iconColor: AppColors.warning,
            title: 'VWAP Breakout Alert',
            desc: 'TATAMOTORS crossed above 15m VWAP (₹970.00).',
            time: '24m ago',
          ),
          _buildAlertItem(
            icon: Icons.shield_outlined,
            iconColor: AppColors.accentBlue,
            title: 'Risk Engine Checked',
            desc: 'Daily loss limit check passed. Maximum drawdown is within 2%.',
            time: '1h ago',
          ),
        ],
      ),
    );
  }

  Widget _buildAlertItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String desc,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: BoldCard(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: AppTypography.titleMedium.copyWith(fontSize: 14)),
                      Text(time, style: AppTypography.labelSmall),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(desc, style: AppTypography.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
