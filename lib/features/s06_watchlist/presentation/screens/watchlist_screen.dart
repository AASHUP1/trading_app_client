import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/bold_card.dart';

/// S06 — Watchlist and Instrument Details
class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  int _selectedTab = 0;
  final List<String> _watchlists = ['NIFTY 50', 'F&O Movers', 'Tech & AI', 'High Beta'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlists'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Watchlist Selector Tabs
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _watchlists.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedTab == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(_watchlists[index]),
                    selected: isSelected,
                    selectedColor: AppColors.primaryBullish.withOpacity(0.2),
                    backgroundColor: AppColors.surface,
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.primaryBullish : AppColors.secondaryText,
                      fontWeight: FontWeight.w600,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: isSelected ? AppColors.primaryBullish : AppColors.border,
                      ),
                    ),
                    onSelected: (val) => setState(() => _selectedTab = index),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          // Watchlist Instruments List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildWatchlistItem('RELIANCE', 'Reliance Industries', '₹2,980.50', '+₹54.20 (+1.85%)', true),
                _buildWatchlistItem('TCS', 'Tata Consultancy Services', '₹4,120.00', '-₹18.50 (-0.45%)', false),
                _buildWatchlistItem('INFY', 'Infosys Ltd', '₹1,580.40', '+₹22.10 (+1.42%)', true),
                _buildWatchlistItem('HDFCBANK', 'HDFC Bank Ltd', '₹1,645.20', '+₹15.00 (+0.92%)', true),
                _buildWatchlistItem('ICICIBANK', 'ICICI Bank Ltd', '₹1,118.90', '-₹4.30 (-0.38%)', false),
                _buildWatchlistItem('TATAMOTORS', 'Tata Motors Ltd', '₹975.60', '+₹28.40 (+3.00%)', true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWatchlistItem(String symbol, String name, String price, String change, bool isBull) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: BoldCard(
        onTap: () => Navigator.pushNamed(context, '/chart'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(symbol, style: AppTypography.titleMedium),
                Text(name, style: AppTypography.bodySmall),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price, style: AppTypography.tabularFigures.copyWith(fontSize: 16)),
                Text(
                  change,
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
  }
}
