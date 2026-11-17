import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';
import '../../../../core/widgets/status_badge.dart';

/// S21 — Admin & Compliance Console (Screen S21)
class AdminConsoleScreen extends StatelessWidget {
  const AdminConsoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin & Compliance Console')),
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
                      Text('SYSTEM OPERATIONAL HEALTH', style: AppTypography.labelSmall),
                      StatusBadge.bullish('All Systems 100% Operational'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHealthStat('NSE Feed Latency', '14 ms'),
                      _buildHealthStat('BSE Feed Latency', '18 ms'),
                      _buildHealthStat('Active WebSockets', '1,248'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Regulatory & Compliance Controls', style: AppTypography.titleMedium),
            const SizedBox(height: 12),
            BoldCard(
              child: Column(
                children: [
                  _buildControlRow('Live Order Lock', 'ENFORCED (Simulated Mode Only)', AppColors.primaryBullish),
                  const Divider(),
                  _buildControlRow('SEBI Algo Review Queue', '0 Pending Violations', AppColors.primaryBullish),
                  const Divider(),
                  _buildControlRow('Audit Log Integrity', 'SHA-256 Tamper Evident (EVT 10482)', AppColors.accentBlue),
                  const Divider(),
                  _buildControlRow('Global Kill Switch', 'STANDBY (Disarmed)', AppColors.secondaryText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.labelSmall),
        const SizedBox(height: 4),
        Text(value, style: AppTypography.tabularFigures.copyWith(fontSize: 14, color: AppColors.primaryBullish)),
      ],
    );
  }

  Widget _buildControlRow(String title, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTypography.bodySmall),
          Text(status, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
