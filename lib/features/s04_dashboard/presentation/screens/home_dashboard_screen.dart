import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';
import '../../../../core/widgets/status_badge.dart';

/// S04 — Home Dashboard
class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryBullish.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text('LIVE SIM', style: TextStyle(color: AppColors.primaryBullish, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 8),
            const Text('BOLD Terminal'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () => Navigator.pushNamed(context, '/alerts'),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Indian Market Indices
            Row(
              children: [
                Expanded(child: _buildIndexCard('NIFTY 50', '24,350.20', '+128.40', '+0.53%')),
                const SizedBox(width: 12),
                Expanded(child: _buildIndexCard('BANK NIFTY', '52,180.90', '-85.20', '-0.16%')),
              ],
            ),
            const SizedBox(height: 16),
            // Paper Equity Overview Card
            BoldCard(
              elevated: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('VIRTUAL PAPER EQUITY', style: AppTypography.labelSmall),
                      StatusBadge.bullish('+₹4,250.00 Today'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('₹10,04,250.00', style: AppTypography.displayLarge.copyWith(fontSize: 26)),
                  const SizedBox(height: 4),
                  Text('Available Margin: ₹8,45,000.00', style: AppTypography.bodySmall),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Quick Actions (Scan, Research, Algo, Paper Trade)
            Text('Quick Launch', style: AppTypography.titleMedium),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickAction(context, Icons.radar, 'Scanner', '/scanner'),
                _buildQuickAction(context, Icons.search, 'Research', '/research'),
                _buildQuickAction(context, Icons.auto_awesome, 'Algo Lab', '/strategy_builder'),
                _buildQuickAction(context, Icons.terminal, 'Paper Desk', '/paper_terminal'),
              ],
            ),
            const SizedBox(height: 24),
            // Watchlist Movers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top Watchlist Movers', style: AppTypography.titleMedium),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/watchlist'),
                  child: const Text('View All', style: TextStyle(color: AppColors.primaryBullish)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildMoversList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIndexCard(String symbol, String price, String change, String pct) {
    final isBull = change.startsWith('+');
    return BoldCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(symbol, style: AppTypography.labelSmall),
          const SizedBox(height: 4),
          Text(price, style: AppTypography.tabularFigures.copyWith(fontSize: 16)),
          const SizedBox(height: 2),
          Text(
            '$change ($pct)',
            style: TextStyle(
              color: isBull ? AppColors.primaryBullish : AppColors.bearishLoss,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(BuildContext context, IconData icon, String label, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Icon(icon, color: AppColors.primaryBullish, size: 24),
          ),
          const SizedBox(height: 6),
          Text(label, style: AppTypography.bodySmall),
        ],
      ),
    );
  }

  Widget _buildMoversList(BuildContext context) {
    final items = [
      {'symbol': 'RELIANCE', 'name': 'Reliance Industries', 'price': '₹2,980.50', 'pct': '+1.85%'},
      {'symbol': 'TCS', 'name': 'Tata Consultancy', 'price': '₹4,120.00', 'pct': '-0.45%'},
      {'symbol': 'HDFCBANK', 'name': 'HDFC Bank Ltd', 'price': '₹1,645.20', 'pct': '+0.92%'},
    ];

    return Column(
      children: items.map((i) {
        final isBull = i['pct']!.startsWith('+');
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: BoldCard(
            onTap: () => Navigator.pushNamed(context, '/chart'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(i['symbol']!, style: AppTypography.titleMedium.copyWith(fontSize: 14)),
                    Text(i['name']!, style: AppTypography.bodySmall),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(i['price']!, style: AppTypography.tabularFigures),
                    Text(
                      i['pct']!,
                      style: TextStyle(
                        color: isBull ? AppColors.primaryBullish : AppColors.bearishLoss,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
