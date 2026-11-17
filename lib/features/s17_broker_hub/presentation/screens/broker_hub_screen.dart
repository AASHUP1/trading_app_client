import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';
import '../../../../core/widgets/status_badge.dart';

/// S17 — Broker Connection Hub (Read-only Sync)
class BrokerHubScreen extends StatelessWidget {
  const BrokerHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brokers = [
      {'name': 'Zerodha Kite', 'status': 'Connected', 'lastSync': '12s ago', 'active': true},
      {'name': 'Upstox Pro', 'status': 'Available', 'lastSync': '-', 'active': false},
      {'name': 'Angel One (SmartAPI)', 'status': 'Available', 'lastSync': '-', 'active': false},
      {'name': 'Dhan', 'status': 'Available', 'lastSync': '-', 'active': false},
      {'name': 'Groww', 'status': 'Available', 'lastSync': '-', 'active': false},
      {'name': 'ICICI Direct', 'status': 'Available', 'lastSync': '-', 'active': false},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Broker Connection Hub')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.accentBlue, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Read-only portfolio sync. BOLD never routes or places live orders to broker accounts.',
                    style: AppTypography.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          ...brokers.map((b) {
            final active = b['active'] as bool;
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: BoldCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(b['name'] as String, style: AppTypography.titleMedium),
                        const SizedBox(height: 2),
                        Text('Last Sync: ${b['lastSync']}', style: AppTypography.labelSmall),
                      ],
                    ),
                    if (active)
                      StatusBadge.bullish('Connected')
                    else
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.border),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        child: const Text('Connect', style: TextStyle(color: AppColors.primaryText, fontSize: 12)),
                      ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
