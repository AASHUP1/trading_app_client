import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';

/// S09 — Instrument Research & Fundamentals
class InstrumentResearchScreen extends StatelessWidget {
  const InstrumentResearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RELIANCE · Research')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BoldCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reliance Industries Ltd', style: AppTypography.titleLarge),
                  const SizedBox(height: 4),
                  Text('Oil, Gas & Consumable Fuels / Conglomerate', style: AppTypography.bodySmall),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMetric('Market Cap', '₹20.15T'),
                      _buildMetric('P/E Ratio', '28.4'),
                      _buildMetric('ROCE', '12.8%'),
                      _buildMetric('Debt/Equity', '0.42'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Quarterly Revenue & Profit (₹ Cr)', style: AppTypography.titleMedium),
            const SizedBox(height: 12),
            BoldCard(
              child: Column(
                children: [
                  _buildQuarterRow('Q1 FY26', '₹2,36,450 Cr', '₹19,250 Cr'),
                  const Divider(),
                  _buildQuarterRow('Q4 FY25', '₹2,28,100 Cr', '₹18,900 Cr'),
                  const Divider(),
                  _buildQuarterRow('Q3 FY25', '₹2,22,500 Cr', '₹17,800 Cr'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.labelSmall),
        const SizedBox(height: 4),
        Text(value, style: AppTypography.tabularFigures.copyWith(fontSize: 14)),
      ],
    );
  }

  Widget _buildQuarterRow(String qtr, String rev, String pat) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(qtr, style: AppTypography.bodyMedium),
          Text('Rev: $rev', style: AppTypography.bodySmall),
          Text('PAT: $pat', style: TextStyle(color: AppColors.primaryBullish, fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
