import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';

/// S20 — Profile, Preferences & Security
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account & Security')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          BoldCard(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.primaryBullish.withOpacity(0.2),
                  child: const Text('AP', style: TextStyle(color: AppColors.primaryBullish, fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Aashu Pandey', style: AppTypography.titleMedium),
                    Text('+91 98765 43210 · Verified', style: AppTypography.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('Preferences & System', style: AppTypography.titleMedium),
          const SizedBox(height: 10),
          BoldCard(
            child: Column(
              children: [
                _buildRow(context, Icons.account_balance, 'Broker Accounts', '/broker_hub'),
                const Divider(),
                _buildRow(context, Icons.card_membership, 'Subscription Tier', '/subscription'),
                const Divider(),
                _buildRow(context, Icons.tune, 'Workspace Settings', '/personalization'),
                const Divider(),
                _buildRow(context, Icons.admin_panel_settings, 'Admin & Compliance Console', '/admin'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, IconData icon, String title, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: AppColors.primaryBullish),
                const SizedBox(width: 12),
                Text(title, style: AppTypography.bodyMedium),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.secondaryText),
          ],
        ),
      ),
    );
  }
}
